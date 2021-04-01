package screens;

class Menu extends Screen {
    private final TITLE_SCALE:Float = 3;
    var time:Float;
    var mov:Int = 1;
    var sy:Int = 560;
    var ey:Int = 640;
    var ty:Int = 30;
    var tf_start: h2d.Text;
    var tf_exit: h2d.Text;
    var tf_title: h2d.Text;
    var fx_scale: Float = 1.0;

    override function init() {
        trace("Menu init()");
        
        var bitmap  = new h2d.Bitmap(hxd.Res.background.toTile(), this);
        bitmap.scale(ASSET_SCALE);

        tf_title = new h2d.Text(hxd.Res.GloriaHallelujah.toFont(), this);
        tf_title.scale(TITLE_SCALE);
        add_title(tf_title, ty);

        tf_start = new h2d.Text(hxd.Res.GloriaHallelujah.toFont(), this);
        tf_exit = new h2d.Text(hxd.Res.GloriaHallelujah.toFont(), this);
        update_menu(sy, ey);
    }

    private function add_title(item:h2d.Text, y:Int) {
        item.text = "Colhe Cacau!";
        item.x = ((this.window.width/2)-(item.textWidth*TITLE_SCALE)/2);
        item.y = y; 
    }

    private function update_menu(sy:Int, ey:Int) {
        menu_add(tf_start, sy,  "Press enter to start");
        menu_add(tf_exit, ey, "Press esc to exit");
    }

    private function menu_add(item:h2d.Text, y:Int, descricao:String) {
        //trace("Menu menu_add(): " + descricao);
        item.text = descricao;
        item.x = ((this.window.width/2)-item.textWidth/2);
        item.y = y; 
    }

    override function update(dt:Float) {
        time += dt;

        if (time <= 0.5){
            if (fx_scale <= 1.0 || fx_scale < 1.01) {
                fx_scale += dt/2;
                trace("fx_scale (+): " + fx_scale);
            }
            if (fx_scale <= 1.01) {
                fx_scale -= dt/2;
                trace("fx_scale (-): " + fx_scale);
            }
            tf_start.scale(fx_scale);
            time = 0;
        }
        
        if (hxd.Key.isPressed(27)) {
            trace("Menu update(): esc wasPressed");
            hxd.System.exit();
        }

        if (hxd.Key.isPressed(13)) {
            trace("Menu update(): ender wasPressed");
        }

    }
}