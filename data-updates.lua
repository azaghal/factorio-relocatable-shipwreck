-- Copyright (c) 2022 Branko Majic
-- Provided under MIT license. See LICENSE for details.


local crash_site_spaceship = data.raw["container"]["crash-site-spaceship"]

-- Make the crash site spaceship mineable and placeable if it is available.
if crash_site_spaceship then
    data:extend({
            {
                type = "item",
                name = "crash-site-spaceship",
                icon = "__base__/graphics/icons/crash-site-spaceship.png",
                icon_size = 64,
                icon_mipmaps = 4,
                subgroup = "transport",
                place_result = "crash-site-spaceship",
                order = "b[personal-transport]-z[crash-site-spaceship]",
                stack_size = 1
            }
    })

    crash_site_spaceship["flags"] = {"placeable-neutral", "player-creation"}
    crash_site_spaceship["minable"]["result"] = "crash-site-spaceship"
end
