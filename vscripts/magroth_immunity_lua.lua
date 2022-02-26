magroth_immunity_lua = class({})
LinkLuaModifier( "modifier_magroth_immunity_lua", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_magroth_immunity_lua_effect", LUA_MODIFIER_MOTION_NONE )
--------------------------------------------------------------------------------
-- Passive Modifier
function magroth_immunity_lua:GetIntrinsicModifierName()
    return "modifier_magroth_immunity_lua"
end