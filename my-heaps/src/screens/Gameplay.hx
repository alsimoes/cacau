package screens;

class Gameplay extends Screen {
    private final TITLE_SCALE:Float = 3;

    override function init() {
        trace("Gameplay init()");
        
        var bitmap  = new h2d.Bitmap(hxd.Res.background.toTile(), this);
        bitmap.scale(ASSET_SCALE);

    }
}