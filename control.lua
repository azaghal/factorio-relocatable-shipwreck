-- Copyright (c) 2022 Branko Majic
-- Provided under MIT license. See LICENSE for details.


local shipwreck = require("scripts.shipwreck")


-- Handler registration
-- ====================

script.on_event(defines.events.on_built_entity, shipwreck.on_built_entity, {{filter="name", name="crash-site-spaceship"}})
script.on_event(defines.events.on_robot_built_entity, shipwreck.on_robot_built_entity, {{filter="name", name="crash-site-spaceship"}})
script.on_event(defines.events.script_raised_built, shipwreck.script_raised_built, {{filter="name", name="crash-site-spaceship"}})
script.on_event(defines.events.script_raised_revive, shipwreck.script_raised_revive, {{filter="name", name="crash-site-spaceship"}})
