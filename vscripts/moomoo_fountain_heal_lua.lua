moomoo_fountain_heal_lua = class({})
LinkLuaModifier( "modifier_moomoo_fountain_heal_lua", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_moomoo_fountain_heal_lua_effect", LUA_MODIFIER_MOTION_NONE )

--------------------------------------------------------------------------------
-- Passive Modifier
function moomoo_fountain_heal_lua:GetIntrinsicModifierName()
    return "modifier_moomoo_fountain_heal_lua"
end