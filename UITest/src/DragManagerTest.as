package
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.InteractiveObject;
	import flash.events.MouseEvent;
	
	import app.AppContainer;
	
	import org.hammerc.components.Button;
	import org.hammerc.components.Group;
	import org.hammerc.components.Label;
	import org.hammerc.components.Rect;
	import org.hammerc.events.DragEvent;
	import org.hammerc.layouts.TileLayout;
	import org.hammerc.managers.DragManager;
	import org.hammerc.managers.dragClasses.DragData;
	
	[SWF(width=800, height=600)]
	public class DragManagerTest extends AppContainer
	{
		private var _button:Button = new Button();
		private var _group:Group = new Group();
		private var _rect:Rect = new Rect();
		
		private var _count:int = 0;
		
		public function DragManagerTest()
		{
			super();
		}
		
		override protected function createChildren():void
		{
			super.createChildren();
			
			_button.label = "点击开始拖拽";
			_button.verticalCenter = 0;
			_button.x = 10;
			_button.addEventListener(MouseEvent.MOUSE_DOWN, onStartDrag);
			_button.addEventListener(DragEvent.DRAG_COMPLETE, onDragComp);
			
			var g:Group = new Group();
			g.width = g.height = 200;
			g.horizontalCenter = 10;
			g.verticalCenter = 0;
			addElement(g);
			addElement(_button);
			
			_rect.strokeAlpha = 1;
			_rect.strokeColor = 0x000000;
			_rect.percentHeight = _rect.percentWidth = 100;
			_rect.fillAlpha = 1;
			_rect.fillColor = 0x009aff;
			g.addElement(_rect);
			
			var label:Label = new Label();
			label.text = "拖拽到此处";
			label.horizontalCenter = label.verticalCenter = 0;
			g.addElement(label);
			
			_group.layout = new TileLayout();
			_group.percentHeight = _group.percentWidth = 100;
			g.addElement(_group);
			
			_group.addEventListener(DragEvent.DRAG_ENTER, onDragEnter);
			_group.addEventListener(DragEvent.DRAG_DROP, onDragDrop);
			_group.addEventListener(DragEvent.DRAG_EXIT, onDragExit);
		}
		
		/**
		 * 发起一次拖拽操作
		 */		
		private function onStartDrag(event:MouseEvent):void
		{
			_count++;
			var dragSource:DragData = new DragData();
			dragSource.addData("按钮"+_count, "ButtonData");
			var bitmapData:BitmapData = new BitmapData(_button.width, _button.height);
			bitmapData.draw(_button);
			var dragImage:Bitmap = new Bitmap();
			dragImage.bitmapData = bitmapData;
			
			DragManager.doDrag(_button, dragSource, dragImage);
		}
		
		/**
		 * 拖拽结束
		 */		
		private function onDragComp(event:DragEvent):void
		{
			if(event.relatedObject)
			{
				var target:InteractiveObject = event.relatedObject;
				trace("接受拖拽的对象是："+target);
			}
			else
			{
				trace("拖拽失败！没人接受你的数据");
			}
		}
		
		/**
		 * group监听拖拽进入事件
		 */		
		private function onDragEnter(event:DragEvent):void
		{
			_rect.strokeColor = 0xFF0000;
			if(event.dragData.hasFormat("ButtonData"))
			{
				DragManager.acceptDragDrop(_group);
			}
		}
		
		/**
		 * 拖拽移出group
		 */		
		private function onDragExit(event:DragEvent):void
		{
			_rect.strokeColor = 0x000000;
		}
		
		/**
		 * 在group上放下拖拽的数据
		 */		
		private function onDragDrop(event:DragEvent):void
		{
			_rect.strokeColor = 0x000000;
			var data:String = event.dragData.dataForFormat("ButtonData") as String;
			var btn:Button = new Button();
			btn.label = data;
			_group.addElement(btn);
		}
	}
}
