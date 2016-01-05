package bt
{
	import org.hammerc.archer.bt.base.BehaviorNode;
	import org.hammerc.archer.bt.composites.Parallel;
	import org.hammerc.archer.bt.composites.RandomSelector;
	import org.hammerc.archer.bt.composites.Selector;
	import org.hammerc.archer.bt.composites.Sequence;
	
	public final class BTCreator
	{
		private static var _actionTest:BehaviorNode;
		private static var _sequenceTest:BehaviorNode;
		private static var _selectorTest:BehaviorNode;
		private static var _selectorRandomTest:BehaviorNode;
		private static var _parallelTest:BehaviorNode;
		
		public static function init():void
		{
			_actionTest = new ActionTest("action test");
			
			_sequenceTest = new Sequence(function(self:Sequence):void{
				self.addChild(new MoveLeftAction("move left action"));
				self.addChild(new RotateAction("rotate action"));
				self.addChild(new MoveRightAction("move right action"));
			}, "sequence test");
			
			_selectorTest = new Selector(function(self:Selector):void{
				self.addChild(new MoveLeftAction("move left action"));
				self.addChild(new RotateAction("rotate action"));
				self.addChild(new MoveRightAction("move right action"));
			}, "selector test");
			
			_selectorRandomTest = new RandomSelector(function(self:RandomSelector):void{
				
			}, "random selector test");
			
			_parallelTest = new Parallel(function(self:Parallel):void{
				
			}, "parallel test");
		}
		
		public static function get actionTest():BehaviorNode
		{
			return _actionTest.clone();
		}
		
		public static function get sequenceTest():BehaviorNode
		{
			return _sequenceTest.clone();
		}
		
		public static function get selectorTest():BehaviorNode
		{
			return _selectorTest.clone();
		}
		
		public static function get selectorRandomTest():BehaviorNode
		{
			return _selectorRandomTest.clone();
		}
		
		public static function get parallelTest():BehaviorNode
		{
			return _parallelTest.clone();
		}
	}
}
