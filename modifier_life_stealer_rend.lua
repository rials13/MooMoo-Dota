modifier_life_stealer_rend = class({})
--------------------------------------------------------------------------------

function modifier_life_stealer_rend:IsDebuff()
	return true
end

--------------------------------------------------------------------------------

function modifier_life_stealer_rend:IsAura()
	if self:GetCaster() == self:GetParent() then
		return true
	end
	
	return false
end

--------------------------------------------------------------------------------

function modifier_life_stealer_rend:GetModifierAura()
	return "modifier_life_stealer_rend"
end

--------------------------------------------------------------------------------

function modifier_life_stealer_rend:GetAuraSearchTeam()
	return DOTA_UNIT_TARGET_TEAM_ENEMY
end

--------------------------------------------------------------------------------

function modifier_life_stealer_rend:GetAuraSearchType()
	return DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC
end

--------------------------------------------------------------------------------

function modifier_life_stealer_rend:GetAuraRadius()
	return self.armor_reduction_radius
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- hide buff bar icon
function modifier_life_stealer_rend:IsHidden()
	return true
end

--------------------------------------------------------------------------------
-- get values from special properties
function modifier_life_stealer_rend:OnCreated( kv )
    self.percent_chance = self:GetAbility():GetSpecialValueFor( "percent_chance" )
    self.armor_reduction = self:GetAbility():GetSpecialValueFor( "armor_reduction" )
    self.armor_reduction_radius = self:GetAbility():GetSpecialValueFor( "armor_reduction_radius" )
    self.armor_reduction_duration = self:GetAbility():GetSpecialValueFor( "armor_reduction_duration" )
    self.percent_str_damage = self:GetAbility():GetSpecialValueFor( "percent_str_damage" )
end

--------------------------------------------------------------------------------

function modifier_life_stealer_rend:OnRefresh( kv )
	self.percent_chance = self:GetAbility():GetSpecialValueFor( "percent_chance" )
    self.armor_reduction = self:GetAbility():GetSpecialValueFor( "armor_reduction" )
    self.armor_reduction_radius = self:GetAbility():GetSpecialValueFor( "armor_reduction_radius" )
    self.armor_reduction_duration = self:GetAbility():GetSpecialValueFor( "armor_reduction_duration" )
    self.percent_str_damage = self:GetAbility():GetSpecialValueFor( "percent_str_damage" )
end

--------------------------------------------------------------------------------

function modifier_life_stealer_rend:DeclareFunctions()
	local funcs = {
        MODIFIER_EVENT_ON_ATTACK_LANDED,
	}

	return funcs
end

--------------------------------------------------------------------------------
function modifier_life_stealer_rend:OnAttackLanded( params )
	if IsServer() then
		if params.attacker == self:GetParent() and ( not self:GetParent():IsIllusion() ) then
			if self:GetParent():PassivesDisabled() then
				return 0
			end

			local target = params.target
			if target ~= nil and target:GetTeamNumber() ~= self:GetParent():GetTeamNumber() then
                local roll = RandomInt(1, 100)
                --params.attacker:Heal(heal, params.attacker)
                print("Attack landed. roll: " .. roll)
                local percent = self.percent_chance
                print("Percent: " .. percent)
                if roll <= percent then
                    local strDamage = self:GetCaster():GetStrength() * self.percent_str_damage / 100
                    print("Proc! Additional Strength damage: " .. strDamage)
                end
				
			end
		end
	end
	
	return 0
end
