package app
{
	import org.hammerc.core.Injector;
	import org.hammerc.managers.SystemManager;
	import org.hammerc.skins.Theme;
	import org.hammerc.themes.hi.HiTheme;
	
	public class AppContainer extends SystemManager
	{
		public function AppContainer()
		{
			super();
			
			Injector.mapClass(Theme, HiTheme);
		}
	}
}
