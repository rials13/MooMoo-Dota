--------------------------------------------------------------------------------
moomoo_magic_immunity_lua = class({})
LinkLuaModifier( "modifier_moomoo_magic_immunity_lua", LUA_MODIFIER_MOTION_NONE )

--------------------------------------------------------------------------------
-- Passive Modifier
function moomoo_magic_immunity_lua:GetIntrinsicModifierName()
	return "modifier_moomoo_magic_immunity_lua"
end