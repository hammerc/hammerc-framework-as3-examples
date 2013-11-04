package
{
	import org.hammerc.components.Group;
	import org.hammerc.components.UIAsset;
	import org.hammerc.core.hammerc_internal;
	import org.hammerc.layouts.HorizontalLayout;
	import org.hammerc.layouts.VerticalAlign;
	import org.hammerc.themes.hi.skins.ButtonSkin;
	
	use namespace hammerc_internal;
	
	public class IconButtonSkin extends ButtonSkin
	{
		public var icon:UIAsset;
		
		public function IconButtonSkin()
		{
			super();
			this.styleProperties = ["icon"];
		}
		
		/**
		 * @inheritDoc
		 */
		override protected function createChildren():void
		{
			super.createChildren();
			
			icon = new UIAsset();
			icon.verticalCenter = 0;
			
			var layout:HorizontalLayout = new HorizontalLayout();
			layout.gap = 3;
			layout.verticalAlign = VerticalAlign.MIDDLE;
			
			var group:Group = new Group();
			group.layout = layout;
			group.left = 5;
			group.right = 5;
			group.top = 3;
			group.bottom = 3;
			this.addElement(group);
			
			group.addElement(icon);
			group.addElement(labelDisplay);
		}
		
		override protected function commitCurrentStyle(styleProperty:String, hasSet:Boolean, value:*=null):void
		{
			super.commitCurrentStyle(styleProperty, hasSet, value);
			
			switch(styleProperty)
			{
				case "icon":
					icon.includeInLayout = icon.visible = hasSet;
					if(hasSet)
						icon.skinName = value;
					else
						icon.skinName = null;
					break;
			}
		}
	}
}
