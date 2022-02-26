--------------------------------------------------------------------------------
moomoo_reactive_armor_lua = class({})
LinkLuaModifier( "modifier_moomoo_reactive_armor_lua", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_moomoo_reactive_armor_lua_stack", LUA_MODIFIER_MOTION_NONE )

--------------------------------------------------------------------------------
-- Passive Modifier
function moomoo_reactive_armor_lua:GetIntrinsicModifierName()
	return "modifier_moomoo_reactive_armor_lua"
end