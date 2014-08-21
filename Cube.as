package
{
	public class Cube extends Sprite
	{
		import XYZ.*;
		
		private var pos:XYZ;
		private var len:Number;
		
		public function Cube(ln:Number)
        {
            this.len = ln;
            this.pos = new XYZ();
            this.redrawPos();
        }

        protected function redrawPos():void
        {
            var pos_1 = GetCoord.ConvCtoS(this.pos);
            super.x = pos_1.x;
            super.y = pos_1.y;
        }

        override public function set x(p_x:Number):void
        {
            this.pos.x = p_x;
            this.updateScreenPosition();
        }

        override public function get x():Number
        {
            return this.pos.x;
        }

        override public function set y(p_y:Number):void
        {
            this.pos.y = p_y;
            this.redrawPos();
        }

        override public function get y():Number
        {
            return this.pos.y;
        }

        override public function set z(p_z:Number):void
        {
            this.pos.z = p_z;
            this.redrawPos();
        }

        override public function get z():Number
        {
            return this.pos.z;
        }

        public function set position(p_XYZ:XYZ):void
        {
            this.pos = p_XYZ;
            this.redrawPos();
        }

        public function get position():XYZ
        {
            return this.pos;
        }

        public function get line():Number
        {
            return (this.pos.x + this.pos.z) * 0.866 - this.pos.y * 0.707;
        }
	}
}