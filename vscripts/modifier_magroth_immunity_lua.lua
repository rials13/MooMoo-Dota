modifier_magroth_immunity_lua = class({})

--------------------------------------------------------------------------------
-- Classifications
function modifier_magroth_immunity_lua:IsHidden()
	return true
end

function modifier_magroth_immunity_lua:IsPurgable()
	return false
end

--------------------------------------------------------------------------------
-- Initializations
function modifier_magroth_immunity_lua:OnCreated( kv )
    self.duration = self:GetAbility():GetSpecialValueFor( "duration" )
    self.damage_percent = self:GetAbility():GetSpecialValueFor( "damage_percent" )
end

function modifier_magroth_immunity_lua:OnRefresh( kv )
    --self.duration = self:GetAbility():GetSpecialValueFor( "duration" )
    --self.damage_percent = self:GetAbility():GetSpecialValueFor( "damage_percent" )
end

function modifier_magroth_immunity_lua:OnDestroy( kv )

end

--------------------------------------------------------------------------------
-- Modifier Effects
function modifier_magroth_immunity_lua:DeclareFunctions()
	local funcs = {
        MODIFIER_EVENT_ON_ATTACK_LANDED
	}

	return funcs
end

function modifier_magroth_immunity_lua:OnAttackLanded( params )
	if IsServer() then
		--if params.target~=self:GetCaster() then return end
		if self:GetCaster():PassivesDisabled() then return end
		if params.attacker:GetTeamNumber()==params.target:GetTeamNumber() then return end
		if params.attacker:IsOther() or params.attacker:IsBuilding() then return end
		if self:GetAbility():IsCooldownReady()==false then return end
		if params.target==self:GetCaster() or params.attacker==self:GetCaster() then -- if self attacks or is attacked

			self:GetParent():AddNewModifier(
				self:GetParent(), -- player source
				self:GetAbility(), -- ability source
				"modifier_magroth_immunity_lua_effect", -- modifier name
				{ duration = self.duration } -- kv
			)

			-- cooldown
			self:GetAbility():UseResources(false, false, true)

			-- Play Effects
			local sound_cast = "Hero_Omniknight.GuardianAngel.Cast"
			EmitSoundOn( sound_cast, self:GetParent() )
		end
	end
end
--------------------------------------------------------------------------------
-- Graphics and Animations