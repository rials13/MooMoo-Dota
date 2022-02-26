--------------------------------------------------------------------------------
modifier_moomoo_reactive_armor_lua_stack = class({})

--------------------------------------------------------------------------------
-- Classifications
function modifier_moomoo_reactive_armor_lua_stack:IsHidden()
	return true
end

function modifier_moomoo_reactive_armor_lua_stack:IsPurgable()
	return false
end

function modifier_moomoo_reactive_armor_lua_stack:GetAttributes()
	return MODIFIER_ATTRIBUTE_MULTIPLE + MODIFIER_ATTRIBUTE_IGNORE_INVULNERABLE
end

--------------------------------------------------------------------------------
-- Initializations
function modifier_moomoo_reactive_armor_lua_stack:OnDestroy()
	if not IsServer() then return end
	self.parent:RemoveStack()
end