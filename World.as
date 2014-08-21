package
{
	public class World extends Sprite
	{
		
		private var arr:Array;
		private var obj:Sprite;
		
		public function World(){
			
			this.obj = new Sprite();
			addChild(this.obj);
			arr = new Array();
		}
		
		public function addToSt(iObj:Cube) : void
        {
            this.obj.addChild(iObj);
            this.arr.push(iObj);
            this.sort();
        }

        public function sort() : void
        {
            this.arr.sortOn("depth", Array.NUMERIC);
            var pos:int = 0;
            while (pos < this.arr.length)
            {
                this.obj.setChildIndex(this.arr[pos],pos);
                pos++;
            }
        }
	}
}