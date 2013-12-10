package
{
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.ErrorEvent;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	import flash.utils.getTimer;
	
	import org.hammerc.archer.pathfinding.astar.AStar;
	import org.hammerc.archer.pathfinding.astar.AStarGrid;
	import org.hammerc.archer.pathfinding.astar.AStarNode;
	import org.hammerc.archer.pathfinding.astar.SmoothAStar;
	
	public class MapView extends Sprite
	{
		public static const ROW:int = 128;
		public static const COL:int = 128;
		
		public static const NODE_SIZE:int = 6;
		
		public static const OBSTACLE_NUM:int = 1000;
		
		public static const BORDER_COLOR:uint = 0x999999;
		public static const WALKABLE_COLOR:uint = 0x00ff00;
		public static const UNWALKABLE_COLOR:uint = 0x000000;
		public static const START_END_COLOR:uint = 0xff0000;
		public static const PATH_COLOR:uint = 0x0000ff;
		
		protected var _astar:AStar;
		protected var _grid:AStarGrid;
		
		protected var _content:Shape;
		protected var _path:Shape;
		
		protected var _moveX:Number = 0;
		protected var _moveY:Number = 0;
		
		protected var _moving:Boolean = false;
		
		protected var _state:int = 0;
		
		public function MapView()
		{
			_astar = new SmoothAStar();
			_grid = new AStarGrid(COL, ROW);
			
			_content = new Shape();
			addChild(_content);
			
			_path = new Shape();
			addChild(_path);
			
			addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
		}
		
		public function reset():void
		{
			_state = 0;
			
			for(var i:int = 0; i < COL; i++)
			{
				for(var j:int = 0; j < ROW; j++)
				{
					_grid.setWalkable(i, j, true);
				}
			}
			
			for(i = 0; i < OBSTACLE_NUM; i++)
			{
				_grid.setWalkable(int(Math.random() * COL), int(Math.random() * ROW), false);
			}
			
			_grid.cacheAroundLinks();
			
			_content.graphics.clear();
			_content.graphics.lineStyle(0, BORDER_COLOR);
			for(i = 0; i < COL; i++)
			{
				for(j = 0; j < ROW; j++)
				{
					var node:AStarNode = _grid.getNode(i, j);
					_content.graphics.beginFill(node.walkable ? WALKABLE_COLOR : UNWALKABLE_COLOR);
					_content.graphics.drawRect(i * NODE_SIZE, j * NODE_SIZE, NODE_SIZE, NODE_SIZE);
					_content.graphics.endFill();
				}
			}
			
			_path.graphics.clear();
		}
		
		public function setViewport(width:Number, height:Number):void
		{
			_content.scrollRect = _path.scrollRect = new Rectangle(0, 0, width, height);
		}
		
		private function mouseDownHandler(event:MouseEvent):void
		{
			stage.addEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
			stage.addEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
			
			_moveX = mouseX;
			_moveY = mouseY;
			
			_moving = false;
		}
		
		private function mouseMoveHandler(event:MouseEvent):void
		{
			_moveX -= mouseX;
			_moveY -= mouseY;
			
			var rect:Rectangle = _content.scrollRect;
			rect.offset(_moveX, _moveY);
			_content.scrollRect = _path.scrollRect = rect;
			
			_moveX = mouseX;
			_moveY = mouseY;
			
			_moving = true;
		}
		
		private function mouseUpHandler(event:MouseEvent):void
		{
			stage.removeEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
			stage.removeEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
			
			if(!_moving)
			{
				click();
			}
		}
		
		private function click():void
		{
			var rect:Rectangle = _content.scrollRect;
			var x:Number = rect.x + mouseX;
			var y:Number = rect.y + mouseY;
			x = int(x / NODE_SIZE);
			y = int(y / NODE_SIZE);
			
			
			
			switch(_state)
			{
				case 0:
					_grid.setStartNode(x, y);
					
					_path.graphics.beginFill(START_END_COLOR);
					_path.graphics.drawRect(x * NODE_SIZE, y * NODE_SIZE, NODE_SIZE, NODE_SIZE);
					_path.graphics.endFill();
					
					_state = 1;
					break;
				case 1:
					_grid.setEndNode(x, y);
					
					_path.graphics.beginFill(START_END_COLOR);
					_path.graphics.drawRect(x * NODE_SIZE, y * NODE_SIZE, NODE_SIZE, NODE_SIZE);
					_path.graphics.endFill();
					
					var time:int = getTimer(), spend:int;
					
					if(_astar.findPath(_grid))
					{
						spend = getTimer() - time;
						
						var paths:Vector.<AStarNode> = _astar.path;
						var node:AStarNode = paths.shift();
						_path.graphics.lineStyle(0, PATH_COLOR);
						_path.graphics.moveTo(node.x * NODE_SIZE + NODE_SIZE / 2, node.y * NODE_SIZE + NODE_SIZE / 2);
						for each(node in paths)
						{
							_path.graphics.lineTo(node.x * NODE_SIZE + NODE_SIZE / 2, node.y * NODE_SIZE + NODE_SIZE / 2);
						}
						
						trace("找到路径，耗时：" + spend + "毫秒，经过：" + paths.length + "个节点！");
						
						var str:String = "找到路径，耗时：" + spend + "毫秒，经过：" + paths.length + "个节点！";
						
						time = getTimer();
						
						paths = (_astar as SmoothAStar).smoothPath;
						
						spend = getTimer() - time;
						
						node = paths.shift();
						_path.graphics.lineStyle(0, 0xff0000);
						_path.graphics.moveTo(node.x * NODE_SIZE + NODE_SIZE / 2, node.y * NODE_SIZE + NODE_SIZE / 2);
						for each(node in paths)
						{
							_path.graphics.lineTo(node.x * NODE_SIZE + NODE_SIZE / 2, node.y * NODE_SIZE + NODE_SIZE / 2);
						}
						
						trace("平滑耗时：" + spend + "毫秒");
						
						str += "平滑耗时：" + spend + "毫秒";
						
					}
					else
					{
						spend = getTimer() - time;
						
						trace("没有找到路径，耗时：" + spend + "毫秒！");
						
						str = "没有找到路径，耗时：" + spend + "毫秒！";
					}
					
					dispatchEvent(new ErrorEvent(ErrorEvent.ERROR, false, false, str));
					
					_state = 2;
					break;
				case 2:
					_path.graphics.clear();
					
					_state = 0;
					break;
			}
		}
	}
}
