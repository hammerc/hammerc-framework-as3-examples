package
{
	import app.AppContainer;
	
	import org.hammerc.collections.ObjectCollection;
	import org.hammerc.collections.XMLCollection;
	import org.hammerc.components.Tree;
	
	[SWF(width=800, height=600)]
	public class TreeTest extends AppContainer
	{
		public function TreeTest()
		{
			super();
		}
		
		override protected function createChildren():void
		{
			super.createChildren();
			
			var obj:Object = {
				children:[
					{label:"数据1", children:[
						{label:"子项1"}, {label:"子项2", children:[
							{label:"孙项1"}, {label:"孙项2"}
						]}
					]}, 
					{label:"数据2", children:[
						{label:"子项1"}, {label:"子项2"}
					]}, 
					{label:"数据1", children:[
						{label:"子项1adskfjaksdjflkasdkfjalksdfjaksdfl"}, {label:"子项2", children:[
							{label:"孙项1"}, {label:"孙项2"}
						]}
					]}, 
					{label:"数据2", children:[
						{label:"子项1"}, {label:"子项2"}
					]}, 
					{label:"数据1", children:[
						{label:"子项1"}, {label:"子项2", children:[
							{label:"孙项1"}, {label:"孙项2"}
						]}
					]}, 
					{label:"数据2", children:[
						{label:"子项1"}, {label:"子项2"}
					]}, 
				]
			};
			
			ObjectCollection.assignParent(obj);
			
			var data:ObjectCollection = new ObjectCollection();
			data.source = obj;
			
			var tree:Tree = new Tree();
			tree.x = 100;
			tree.y = 100;
			tree.width = 200;
			tree.height = 300;
			tree.dataProvider = data;
			addElement(tree);
			
			var xml:XML = <root>
					<item dir='true' name='XML数据源0'>
						<item name='XML数据源00'/>
						<item dir='true' name='XML数据源01'>
							<item name='XML数据源000'/>
						</item>
					</item>
					<item dir='true' name='XML数据源1'/>
					<item name="XML数据源2"/>
				</root>;
			
			var xmlc:XMLCollection = new XMLCollection();
			xmlc.source = xml;
			
			tree = new Tree();
			tree.x = 350;
			tree.y = 100;
			tree.width = 200;
			tree.height = 300;
			tree.dataProvider = xmlc;
			tree.labelField = "@name";
			addElement(tree);
		}
	}
}