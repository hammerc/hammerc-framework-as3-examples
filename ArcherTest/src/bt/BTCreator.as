package bt
{
	import org.hammerc.archer.bt.base.BehaviorNode;
	import org.hammerc.archer.bt.composites.Parallel;
	import org.hammerc.archer.bt.composites.ParallelChildFinishPolicy;
	import org.hammerc.archer.bt.composites.ParallelFailurePolicy;
	import org.hammerc.archer.bt.composites.ParallelSuccessPolicy;
	import org.hammerc.archer.bt.composites.RandomSelector;
	import org.hammerc.archer.bt.composites.Selector;
	import org.hammerc.archer.bt.composites.Sequence;
	
	public final class BTCreator
	{
		private static var _actionTest:BehaviorNode;
		private static var _sequenceTest:Sequence;
		private static var _selectorTest:Selector;
		private static var _selectorRandomTest:RandomSelector;
		private static var _parallelTest:Sequence;
		
		public static function init():void
		{
			_actionTest = new ActionTest("action test");
			
			_sequenceTest = new Sequence("sequence test");
			_sequenceTest.addChild(new MoveLeftAction("move left action"));
			_sequenceTest.addChild(new RotateAction("rotate action"));
			_sequenceTest.addChild(new MoveRightAction("move right action"));
			
			_selectorTest = new Selector("selector test");
			_selectorTest.addChild(new MoveLeftAction("move left action"));
			_selectorTest.addChild(new RotateAction("rotate action"));
			_selectorTest.addChild(new MoveRightAction("move right action"));
			
			_selectorRandomTest = new RandomSelector("random selector test");
			_selectorRandomTest.addChild(new MoveLeftAction("move left action"));
			_selectorRandomTest.addChild(new RotateAction("rotate action"));
			_selectorRandomTest.addChild(new MoveRightAction("move right action"));
			
			_parallelTest = new Sequence("sequence test");
			var p:Parallel = new Parallel("parallel test", ParallelFailurePolicy.ONE, ParallelSuccessPolicy.ALL, ParallelChildFinishPolicy.ONCE);
			p.addChild(new MoveLeftAction("move left action"));
			p.addChild(new RotateAction("rotate action"));
			_parallelTest.addChild(p);
			_parallelTest.addChild(new MoveRightAction("move right action"));
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
