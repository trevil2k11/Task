﻿package 
{
    import flash.geom.*;

    public class GetCoord extends Object
    {
        public static const Koeff:Number = Math.cos((-Math.PI)/4) * Math.SQRT2;

        public static function ConvCtoS(p_XYZ:XYZ) : Point
        {
            var pos_1 = p_XYZ.x - param1.z;
            var pos_2 = p_XYZ.y * Koeff + (p_XYZ.x + p_XYZ.z) * 0.5;
            return new Point(pos_1,pos_2);
        }

        public static function ConvStoC(p_XYZ:Point) : XYZ
        {
            var pos_1 = p_XYZ.y + p_XYZ.x * 0.5;
            var pos_2 = 0;
            var pos_3 = p_XYZ.y - p_XYZ.x * 0.5;
            return new XYZ(pos_1, pos_2, pos_3);
        }
    }
}