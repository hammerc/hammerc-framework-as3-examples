package bt
{
	import org.hammerc.archer.bt.BehaviorStatus;
	import org.hammerc.archer.bt.actions.Action;
	import org.hammerc.archer.bt.base.BehaviorNode;
	
	public class ActionTest extends Action
	{
		private var _time:Number;
		
		public function ActionTest(id:String = null)
		{
			super(id);
		}
		
		override protected function enter():void
		{
			trace("enter");
			
			_time = 0;
		}
		
		override protected function execute(time:Number):int
		{
			trace("execute", time);
			
			if(_time >= 1)
				return BehaviorStatus.SUCCESS;
			
			_time += time;
			
			return BehaviorStatus.RUNNING;
		}
		
		override protected function exit(success:Boolean):void
		{
			trace("exit", success);
		}
		
		override public function clone():BehaviorNode
		{
			return new ActionTest(_id);
		}
	}
}
