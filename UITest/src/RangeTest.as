package
{
	import flash.events.Event;
	
	import app.AppContainer;
	
	import org.hammerc.components.Group;
	import org.hammerc.components.HScrollBar;
	import org.hammerc.components.HSlider;
	import org.hammerc.components.Label;
	import org.hammerc.components.NumericStepper;
	import org.hammerc.components.ProgressBar;
	import org.hammerc.components.Spinner;
	import org.hammerc.components.VScrollBar;
	import org.hammerc.components.VSlider;
	import org.hammerc.layouts.HorizontalAlign;
	import org.hammerc.layouts.VerticalLayout;
	
	[SWF(width=800, height=600)]
	public class RangeTest extends AppContainer
	{
		private var _progressBar:ProgressBar;
		
		public function RangeTest()
		{
			super(false);
		}
		
		override protected function createChildren():void
		{
			super.createChildren();
			
			var layout:VerticalLayout = new VerticalLayout();
			layout.gap = 5;
			layout.horizontalAlign = HorizontalAlign.CENTER;
			
			var group:Group = new Group();
			group.horizontalCenter = 0;
			group.verticalCenter = 0;
			group.layout = layout;
			addElement(group);
			
			_progressBar = new ProgressBar();
			_progressBar.width = 200;
			_progressBar.height = 35;
			group.addElement(_progressBar);
			
			var hScrollBar:HScrollBar = new HScrollBar();
			hScrollBar.addEventListener(Event.CHANGE, hsbChangeHandler);
			group.addElement(hScrollBar);
			
			var hsbLabel:Label = new Label();
			hsbLabel.text = hScrollBar.value + "/" + hScrollBar.maximum;
			group.addElement(hsbLabel);
			
			var vScrollBar:VScrollBar = new VScrollBar();
			vScrollBar.addEventListener(Event.CHANGE, vsbChangeHandler);
			group.addElement(vScrollBar);
			
			var vsbLabel:Label = new Label();
			vsbLabel.text = vScrollBar.value + "/" + vScrollBar.maximum;
			group.addElement(vsbLabel);
			
			var hSlider:HSlider = new HSlider();
			hSlider.addEventListener(Event.CHANGE, hsChangeHandler);
			group.addElement(hSlider);
			
			var hsLabel:Label = new Label();
			hsLabel.text = hSlider.value + "/" + hSlider.maximum;
			group.addElement(hsLabel);
			
			var vSlider:VSlider = new VSlider();
			vSlider.addEventListener(Event.CHANGE, vsChangeHandler);
			group.addElement(vSlider);
			
			var vsLabel:Label = new Label();
			vsLabel.text = vSlider.value + "/" + vSlider.maximum;
			group.addElement(vsLabel);
			
			var spinner:Spinner = new Spinner();
			spinner.addEventListener(Event.CHANGE, spinnerChangeHandler);
			group.addElement(spinner);
			
			var spinnerLabel:Label = new Label();
			spinnerLabel.text = spinner.value + "/" + spinner.maximum;
			group.addElement(spinnerLabel);
			
			var ns:NumericStepper = new NumericStepper();
			ns.addEventListener(Event.CHANGE, nsChangeHandler);
			group.addElement(ns);
			
			var nsLabel:Label = new Label();
			nsLabel.text = ns.value + "/" + ns.maximum;
			group.addElement(nsLabel);
			
			addEventListener(Event.ENTER_FRAME, enterFrameHandler);
			
			function hsbChangeHandler(event:Event):void
			{
				hsbLabel.text = hScrollBar.value + "/" + hScrollBar.maximum;
			}
			
			function vsbChangeHandler(event:Event):void
			{
				vsbLabel.text = vScrollBar.value + "/" + vScrollBar.maximum;
			}
			
			function hsChangeHandler(event:Event):void
			{
				hsLabel.text = hSlider.value + "/" + hSlider.maximum;
			}
			
			function vsChangeHandler(event:Event):void
			{
				vsLabel.text = vSlider.value + "/" + vSlider.maximum;
			}
			
			function spinnerChangeHandler(event:Event):void
			{
				spinnerLabel.text = spinner.value + "/" + spinner.maximum;
			}
			
			function nsChangeHandler(event:Event):void
			{
				nsLabel.text = ns.value + "/" + ns.maximum;
			}
		}
		
		private function enterFrameHandler(event:Event):void
		{
			_progressBar.value++;
			if(_progressBar.value == _progressBar.maximum)
			{
				_progressBar.value = 0;
			}
		}
	}
}
