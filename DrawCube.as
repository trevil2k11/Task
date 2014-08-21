package
{
	import DrawCube.*;
	
	public class DrawCube extends World
	{
	
		public var st_x:int = 700;
		public var st_y:int = 100;
		public var z_coord:int = 0;
		public var w:int = 100;
		public var h:int = 50;
		
		public function DrawBox(hght:Number)
        {
            this.z_coord = hght;
            this.drawCube();
            return;
        }
		
		protected function drawCube():void {
		
			graphics.clear();

			graphics.lineStyle(3,0x545454);
			graphics.beginFill(0xbebebe);
			graphics.moveTo(st_x - i*w, st_y - j*h); //100,100
			graphics.lineTo(st_x - i*w, st_y - j*h + 50); //100,150
			graphics.lineTo(st_x - i*w - 50, st_y - j*h + 75); //150,175
			graphics.lineTo(st_x - i*w - 50, st_y - j*h + 75); //150,125
			graphics.lineTo(st_x - i*w, st_y - j*h); //100,100
			graphics.endFill();
			
			graphics.beginFill(0xb1b1b1);
			graphics.moveTo(st_x - i*w - 50, st_y - j*h + 75); //150,175
			graphics.lineTo(st_x - i*w - 100, st_y - j*h + 50);
			graphics.lineTo(st_x - i*w - 100, st_y - j*h);
			graphics.lineTo(st_x - i*w - 50, st_y - j*h + 25);
			graphics.endFill();
			
			graphics.beginFill(0xededed);
			graphics.moveTo(st_x - i*w, st_y - j*h); //150,175
			graphics.lineTo(st_x - i*w - 50, st_y - j*h - 25);
			graphics.lineTo(st_x - i*w - 100, st_y - j*h);
			graphics.lineTo(st_x - i*w - 50, st_y - j*h + 25);
			graphics.endFill();
		}
	}
}