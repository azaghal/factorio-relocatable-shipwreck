-- Copyright (c) 2022 Branko Majic
-- Provided under MIT license. See LICENSE for details.


-- Main implementation
-- ===================


local shipwreck = {}


--- Calculates spawn position relative to passed-in (shipwreck) entity.
--
-- Calculated position is offset by the same amount from the entity as in case of a vanilla game.
--
-- @param entity LuaEntity Entity from which the relative position should be calculated.
--
-- @return MapPosition Spawn position for players.
--
function shipwreck.get_spawn_position_relative_to_entity(entity)

    -- Corresponds to offset from the bottom-right of the shipwreck entity in vanilla game.
    local x = math.ceil(entity.selection_box.right_bottom.x) - 2
    local y = math.floor(entity.selection_box.right_bottom.y) + 2

    return {x = x, y = y}
end


--- Sets spawn position for force owning the entity next to passed-in entity.
--
-- @param entity LuaEntity Entity in whose vicinity players from the force should spawn at.
--
function shipwreck.set_force_spawn_position_next_to(entity)
    local force = entity.force
    local surface = entity.surface
    local position = shipwreck.get_spawn_position_relative_to_entity(entity)

    force.set_spawn_position(position, surface)
end


-- Event handlers
-- ==============


--- Handler for player building an entity.
--
-- @param event EventData Event data passed-on by the game engine.
--
function shipwreck.on_built_entity(event)
    shipwreck.set_force_spawn_position_next_to(event.entity)
end


--- Handler for robots building an entity.
--
-- @param event EventData Event data passed-on by the game engine.
--
function shipwreck.on_robot_built_entity(event)
    shipwreck.set_force_spawn_position_next_to(event.entity)
end


--- Handler for entity being built by a script.
--
-- @param event EventData Event data passed-on by the game engine.
--
function shipwreck.script_raised_built(event)
    shipwreck.set_force_spawn_position_next_to(event.entity)
end


--- Handler for entity ghost being revived by a script.
--
-- @param event EventData Event data passed-on by the game engine.
--
function shipwreck.script_raised_built(event)
    shipwreck.set_force_spawn_position_next_to(event.entity)
end


return shipwreck
