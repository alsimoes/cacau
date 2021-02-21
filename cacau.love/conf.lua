--! file:conf.lua
--
-- Configurarion file: Configurations
--

ConfigTable = {}

function love.conf(t)
    t.window.title  = "Cacao"
    t.window.icon   = "assets/dummy_icon.png"
    t.version       = "11.3"
    t.console       = true 
    t.window.width  = 1024 -- #FIXME: #9 Handle resolution change.
    t.window.height = 768
    t.window.x      = 1450
    t.window.y      = 150
    ConfigTable     = t
end


-- RESOLUTION STUDY
--
-- iPad resolutions:
-- iPad Pro 12.9-inch (2nd gen) -> 2048 x 2732
-- iPad Pro 10.5-inch           -> 1668 x 2224
-- iPad Pro (12.9-inch)         -> 2048 x 2732
-- iPad Pro (9.7-inch)          -> 1536 x 2048
-- iPad Air 2                   -> 1536 x 2048
-- iPad Mini 4                  -> 1536 x 2048
-- Development                  -> 1024 x 768 <- choice
-- 
-- 16:9 resolutions:
-- Development -> 1024 × 576
-- Low         -> 1280 x 720
-- HD          -> 1920 x 1080
-- My monitor  -> 2560 x 1440
-- 4K          -> 3840 × 2160