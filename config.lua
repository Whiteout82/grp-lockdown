Config = {}

Config.LockdownTime = 30 -- minutes
Config.Speed = 0.12
Config.Distance = 2.0
Config.ServerDistance = 4.0
Config.Size = vec3(1.0, 1.0, 2.0)

Config.Jobs = {
    police = 0,
    sheriff = 0,
}

Config.Locations = {
    -- LTD
    { coords = vector3(-709.962280, -917.066284, 19.214331), shutter = 'ltd_1' }, -- Postal 8140
    { coords = vector3(-51.986130, -1757.888916, 29.439529), shutter = 'ltd_2' }, -- Postal 9094
    { coords = vector3(-1823.333252, 786.656006, 138.211670), shutter = 'ltd_3' }, -- Postal 5016
    { coords = vector3(1161.359131, -326.625488, 69.218651), shutter = 'ltd_4' }, -- Postal 7302
    { coords = vector3(1697.641846, 4927.968750, 42.231678), shutter = 'ltd_5' }, -- Postal 2006

    -- 24/7
    { coords = vector3(33.334095, -1349.779297, 29.329365), shutter = '247_1' }, -- Postal 9046
    { coords = vector3(382.987061, 321.476257, 103.308701), shutter = '247_2' }, -- Postal 7093
    { coords = vector3(2559.643799, 381.185974, 108.621048), shutter = '247_3' }, -- Postal 7355
    { coords = vector3(-3037.122803, 586.409363, 7.809175), shutter = '247_4' }, -- Postal 5048
    { coords = vector3(-3241.304443, 1012.540039, 12.540501), shutter = '247_5' }, -- Postal 5037
    { coords = vector3(1723.395630, 6412.821289, 35.006596), shutter = '247_6' }, -- Postal 1000
    { coords = vector3(548.338806, 2673.775635, 42.195267), shutter = '247_7' }, -- Postal 4019
    { coords = vector3(2678.864258, 3275.534912, 55.409161), shutter = '247_8' }, -- Postal 3051

    -- Liquor
    { coords = vector3(-1228.803711, -903.282959, 12.201653), shutter = 'liquor_1' }, -- Postal 8093
    { coords = vector3(-1490.430786, -384.673553, 40.108578), shutter = 'liquor_2' }, -- Postal 7169
    { coords = vector3(1141.701416, -980.025024, 46.243320), shutter = 'liquor_3' }, -- Postal 7326
    { coords = vector3(-2974.165527, 389.926788, 15.031960), shutter = 'liquor_4' }, -- Postal 5067

    -- Optional per-location overrides:
    -- {
    --     coords = vector3(0.0, 0.0, 0.0),
    --     shutter = 'example_1',
    --     time = 10,
    --     speed = 0.20,
    --     distance = 2.5,
    --     size = vec3(1.0, 1.0, 2.0),
    --     rotation = 0.0,
    --     jobs = { police = 2, lscso = 2 },
    -- },
}