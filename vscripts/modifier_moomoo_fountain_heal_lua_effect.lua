modifier_moomoo_fountain_heal_lua_effect = class({})

--------------------------------------------------------------------------------
-- Classifications
function modifier_moomoo_fountain_heal_lua_effect:IsHidden()
	return false
end

function modifier_moomoo_fountain_heal_lua_effect:IsDebuff()
	return false
end

function modifier_moomoo_fountain_heal_lua_effect:IsPurgable()
	return false
end

--------------------------------------------------------------------------------
-- Initializations
function modifier_moomoo_fountain_heal_lua_effect:OnCreated( kv )
    self.bonus_hp_regen = self:GetAbility():GetSpecialValueFor( "bonus_hp_regen" )
end

function modifier_moomoo_fountain_heal_lua_effect:OnRefresh( kv )
    self.bonus_hp_regen = self:GetAbility():GetSpecialValueFor( "bonus_hp_regen" )
end

function modifier_moomoo_fountain_heal_lua_effect:OnRemoved()
end

--------------------------------------------------------------------------------
-- Modifier Effects
function modifier_moomoo_fountain_heal_lua_effect:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_HEALTH_REGEN_PERCENTAGE,
	}

	return funcs
end

function modifier_moomoo_fountain_heal_lua_effect:GetModifierHealthRegenPercentage()
	return self.bonus_hp_regen
end
