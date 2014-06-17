package app
{
	import org.hammerc.core.Injector;
	import org.hammerc.debug.Stats;
	import org.hammerc.managers.SystemManager;
	import org.hammerc.skins.Theme;
	import org.hammerc.themes.hi.HiTheme;
	import org.hammerc.themes.wing.DefaultStyleDeclaration;
	import org.hammerc.themes.wing.WingTheme;
	
	public class AppContainer extends SystemManager
	{
		public function AppContainer(useHiTheme:Boolean)
		{
			super();
			
			if(useHiTheme)
			{
				Injector.mapClass(Theme, HiTheme);
			}
			else
			{
				Injector.mapClass(Theme, WingTheme);
				DefaultStyleDeclaration.install();
			}
		}
		
		override protected function createChildren():void
		{
			super.createChildren();
			stage.frameRate = 60;
			stage.addChild(new Stats(true));
		}
	}
}
