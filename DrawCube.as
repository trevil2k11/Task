package 
{
	import DrawCube;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	public class DrawCube extends Sprite
	{
	
		public var st_x:int = 200;
		public var st_y:int = 200;
		public var z_coord:int = 0;
		public var w:int = 100;
		public var h:int = 50;

		public var select_color:uint = 0x00ff00;
		public var mouse_over_color:uint = 0xff0000;
		public var top_default_color:uint = 0xededed;
		public var left_side_color:uint = 0xbebebe;
		public var right_side_color:uint = 0xb1b1b1;

		public var m_over:Boolean = false;
		public var clicked:Boolean = false;
		
		public function DrawBox(hght:Number,new_x:Number=200,new_y:Number=200):void
        {
            this.z_coord = hght;
			this.st_x = new_x;
			this.st_y = new_y;
            this.drawCube(this.z_coord);
			this.addEventListener(MouseEvent.MOUSE_OVER,FillInRed);
			this.addEventListener(MouseEvent.MOUSE_OUT,FillInBack);
			this.addEventListener(MouseEvent.CLICK,Select);
            return;
        }
		
		protected function drawCube(z_c:Number):void {
		
			var now_color:uint;
			
			if (m_over) now_color = mouse_over_color;
			else if (clicked) now_color = select_color;
			else now_color = top_default_color;
		
			graphics.clear();
			
			graphics.lineStyle(3,0x545454);
			graphics.beginFill(now_color);
			graphics.moveTo(st_x, st_y - z_c); //100,200
			graphics.lineTo(st_x + w/2, (st_y + h/2) - z_c);//150,225
			graphics.lineTo(st_x + w, st_y - z_c);//200,200
			graphics.lineTo(st_x + w/2, st_y - z_c - h/2); //150,175
			graphics.endFill();
			
			graphics.beginFill(left_side_color);
			graphics.moveTo(st_x, st_y - z_c); 
			graphics.lineTo(st_x, st_y);
			graphics.lineTo(st_x + w/2, st_y + h/2); 
			graphics.lineTo(st_x + w/2, (st_y + h/2) - z_c); 
			graphics.endFill();
			
			graphics.beginFill(right_side_color);
			graphics.moveTo(st_x + w/2, (st_y + h/2) - z_c);
			graphics.lineTo(st_x + w/2, st_y + h/2); 
			graphics.lineTo(st_x + w, st_y);
			graphics.lineTo(st_x + w, st_y - z_c);
			graphics.endFill();
		}
		
		protected function FillInRed(event:MouseEvent):void{
			m_over = !m_over;		
			graphics.beginFill(mouse_over_color);
			graphics.moveTo(st_x, st_y - this.z_coord); //100,200
			graphics.lineTo(st_x + w/2, (st_y + h/2) - this.z_coord);//150,225
			graphics.lineTo(st_x + w, st_y - this.z_coord);//200,200
			graphics.lineTo(st_x + w/2, st_y - this.z_coord - h/2); //150,175
			graphics.endFill();
		}
		
		protected function FillInBack(event:MouseEvent):void{
			if (!clicked){
				m_over = !m_over;
				graphics.beginFill(top_default_color);
				graphics.moveTo(st_x, st_y - this.z_coord); //100,200
				graphics.lineTo(st_x + w/2, (st_y + h/2) - this.z_coord);//150,225
				graphics.lineTo(st_x + w, st_y - this.z_coord);//200,200
				graphics.lineTo(st_x + w/2, st_y - this.z_coord - h/2); //150,175
				graphics.endFill();
			} else {
				m_over = !m_over;
				graphics.beginFill(select_color);
				graphics.moveTo(st_x, st_y - this.z_coord); //100,200
				graphics.lineTo(st_x + w/2, (st_y + h/2) - this.z_coord);//150,225
				graphics.lineTo(st_x + w, st_y - this.z_coord);//200,200
				graphics.lineTo(st_x + w/2, st_y - this.z_coord - h/2); //150,175
				graphics.endFill();
			}
		}
		
		protected function Select(event:MouseEvent):void{
			if (!clicked){
				graphics.beginFill(select_color);
				graphics.moveTo(st_x, st_y - this.z_coord); //100,200
				graphics.lineTo(st_x + w/2, (st_y + h/2) - this.z_coord);//150,225
				graphics.lineTo(st_x + w, st_y - this.z_coord);//200,200
				graphics.lineTo(st_x + w/2, st_y - this.z_coord - h/2); //150,175
				graphics.endFill();
				
				clicked = !clicked;		
			} else {
				graphics.beginFill(top_default_color);
				graphics.moveTo(st_x, st_y - this.z_coord); //100,200
				graphics.lineTo(st_x + w/2, (st_y + h/2) - this.z_coord);//150,225
				graphics.lineTo(st_x + w, st_y - this.z_coord);//200,200
				graphics.lineTo(st_x + w/2, st_y - this.z_coord - h/2); //150,175
				graphics.endFill();
				
				clicked = !clicked;
			}
		}
	}
}