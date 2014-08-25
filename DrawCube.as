package 
{
	import DrawCube;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.display3D.IndexBuffer3D;
	
	public class DrawCube extends Sprite
	{
	
		public var st_x:int = 200;
		public var st_y:int = 200;
		public var z_coord:int = 0;
		public var w:int = 100;
		public var h:int = 50;

		public var pos_i:int;
		public var pos_j:int;
		public var max_i:int;
		public var max_j:int;

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

			graphics.clear();
			graphics.lineStyle(3,0x545454);
			
			if (this.z_coord >=0) drawTop(this.z_coord);
			
			drawLeft(this.z_coord);
			drawRight(this.z_coord);
			
			if (this.z_coord < 0) {
				drawTop(this.z_coord);
				if (pos_j < max_j - 1){
					graphics.beginFill(left_side_color);
					graphics.moveTo(st_x, st_y - z_c); //1
					graphics.lineTo(st_x, st_y);//4
					graphics.lineTo(st_x + w/2, st_y + h/2);//3 
					graphics.lineTo(st_x + w/2, (st_y + h/2) - z_c);//2 
					graphics.endFill();				
				}
				if (pos_i < max_i - 1){
					graphics.beginFill(right_side_color);
					graphics.moveTo(st_x + w/2, (st_y + h/2) - z_c);//2
					graphics.lineTo(st_x + w/2, st_y + h/2); //3
					graphics.lineTo(st_x + w, st_y);//6
					graphics.lineTo(st_x + w, st_y - z_c);//5
					graphics.endFill();				
				}
			}
			return;
		}
		
		protected function drawTop(z_c:Number):void{
			var now_color:uint;
			
			if (m_over) now_color = mouse_over_color;
			else if (clicked) now_color = select_color;
			else now_color = top_default_color;
			
			graphics.beginFill(now_color);
			graphics.moveTo(st_x, st_y - z_c); //100,200
			graphics.lineTo(st_x + w/2, (st_y + h/2) - z_c);//150,225
			graphics.lineTo(st_x + w, st_y - z_c);//200,200
			graphics.lineTo(st_x + w/2, st_y - z_c - h/2); //150,175
			graphics.endFill();
			return;
		}
		
		//public function redraw
		
		protected function drawLeft(z_c:Number):void{
			if (pos_i != 0){
				graphics.beginFill(left_side_color);
				graphics.moveTo(st_x, st_y - z_c); //1
				graphics.lineTo(st_x, st_y);//4
				if (this.z_coord < 0){
					graphics.lineTo(st_x + w/2, st_y - h/2);//3 
					graphics.lineTo(st_x + w/2, (st_y - h/2) - z_c);//2 
				} else {
					graphics.lineTo(st_x + w/2, st_y + h/2);//3 
					graphics.lineTo(st_x + w/2, (st_y + h/2) - z_c);//2 
				}
				graphics.endFill();				
			}
			
			if (this.z_coord < 0 && pos_i != 0 && pos_j != 0 && pos_j != max_j - 1 && pos_i != max_i - 1){
				graphics.beginFill(left_side_color);
				graphics.moveTo(st_x, st_y - z_c); //1
				graphics.lineTo(st_x, st_y);//4
				graphics.lineTo(st_x + w/2, st_y + h/2);//3 
				graphics.lineTo(st_x + w/2, (st_y + h/2) - z_c);//2 
				graphics.endFill();
			}
			return;
		}
		
		protected function drawRight(z_c:Number):void{
			if (pos_j != 0){
				graphics.beginFill(right_side_color);
				if (this.z_coord < 0){
					graphics.moveTo(st_x + w/2, (st_y - h/2) - z_c);//2
					graphics.lineTo(st_x + w/2, st_y - h/2); //3
				} else {
					graphics.moveTo(st_x + w/2, (st_y + h/2) - z_c);//2
					graphics.lineTo(st_x + w/2, st_y + h/2); //3
				}
				graphics.lineTo(st_x + w, st_y);//6
				graphics.lineTo(st_x + w, st_y - z_c);//5
				graphics.endFill();				
			}
			return;
		}
		
		protected function FillInRed(event:MouseEvent):void{
				m_over = !m_over;		
			if (this.z_coord >= 0){
				graphics.beginFill(mouse_over_color);
				graphics.moveTo(st_x, st_y - this.z_coord); //100,200
				graphics.lineTo(st_x + w/2, (st_y + h/2) - this.z_coord);//150,225
				graphics.lineTo(st_x + w, st_y - this.z_coord);//200,200
				graphics.lineTo(st_x + w/2, st_y - this.z_coord - h/2); //150,175
				graphics.endFill();
			}			
			return;
		}
		
		protected function FillInBack(event:MouseEvent):void{
			if (!clicked){
				m_over = !m_over;
				if (this.z_coord >= 0){
					graphics.beginFill(top_default_color);
					graphics.moveTo(st_x, st_y - this.z_coord); //100,200
					graphics.lineTo(st_x + w/2, (st_y + h/2) - this.z_coord);//150,225
					graphics.lineTo(st_x + w, st_y - this.z_coord);//200,200
					graphics.lineTo(st_x + w/2, st_y - this.z_coord - h/2); //150,175
					graphics.endFill();
				}			
			} else {
				m_over = !m_over;
				if (this.z_coord >= 0){
					graphics.beginFill(select_color);
					graphics.moveTo(st_x, st_y - this.z_coord); //100,200
					graphics.lineTo(st_x + w/2, (st_y + h/2) - this.z_coord);//150,225
					graphics.lineTo(st_x + w, st_y - this.z_coord);//200,200
					graphics.lineTo(st_x + w/2, st_y - this.z_coord - h/2); //150,175
					graphics.endFill();
				}				
			}
			return;
		}
		
		protected function Select(event:MouseEvent):void{
			if (!clicked){
				if (this.z_coord >= 0){
					graphics.beginFill(select_color);
					graphics.moveTo(st_x, st_y - this.z_coord); //100,200
					graphics.lineTo(st_x + w/2, (st_y + h/2) - this.z_coord);//150,225
					graphics.lineTo(st_x + w, st_y - this.z_coord);//200,200
					graphics.lineTo(st_x + w/2, st_y - this.z_coord - h/2); //150,175
					graphics.endFill();
				}
				clicked = !clicked;		
			} else {
				if (this.z_coord >=0){
					graphics.beginFill(top_default_color);
					graphics.moveTo(st_x, st_y - this.z_coord); //100,200
					graphics.lineTo(st_x + w/2, (st_y + h/2) - this.z_coord);//150,225
					graphics.lineTo(st_x + w, st_y - this.z_coord);//200,200
					graphics.lineTo(st_x + w/2, st_y - this.z_coord - h/2); //150,175
					graphics.endFill();
				}				
				clicked = !clicked;
			}
			return;
		}
	}
}