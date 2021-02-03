modifier_life_stealer_cannibalize = class({})

--------------------------------------------------------------------------------
-- hide buff bar icon
function modifier_life_stealer_cannibalize:IsHidden()
	return true
end

--------------------------------------------------------------------------------
-- get values for the lifesteal percent
function modifier_life_stealer_cannibalize:OnCreated( kv )
	self.lifesteal_percent = self:GetAbility():GetSpecialValueFor( "lifesteal_percent" )
end

--------------------------------------------------------------------------------

function modifier_life_stealer_cannibalize:OnRefresh( kv )
	self.lifesteal_percent = self:GetAbility():GetSpecialValueFor( "lifesteal_percent" )
end

--------------------------------------------------------------------------------

function modifier_life_stealer_cannibalize:DeclareFunctions()
	local funcs = {
		MODIFIER_EVENT_ON_ATTACK_LANDED,
	}

	return funcs
end

--------------------------------------------------------------------------------
function modifier_life_stealer_cannibalize:OnAttackLanded( params )
	if IsServer() then
		if params.attacker == self:GetParent() and ( not self:GetParent():IsIllusion() ) then
			if self:GetParent():PassivesDisabled() then
				return 0
			end

			local target = params.target
			if target ~= nil and target:GetTeamNumber() ~= self:GetParent():GetTeamNumber() then
                local heal = params.damage * self.lifesteal_percent / 100
                params.attacker:Heal(heal, params.attacker)
                print("Attack landed. Lifesteal " .. heal)
				
			end
		end
	end
	
	return 0
end