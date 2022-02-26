modifier_lion_unlock_potential_lua = class({})

--------------------------------------------------------------------------------
-- Classifications
function modifier_lion_unlock_potential_lua:IsHidden()
	return false
end

function modifier_lion_unlock_potential_lua:IsDebuff()
    return false
end

function modifier_lion_unlock_potential_lua:IsPurgable()
	return true
end

--------------------------------------------------------------------------------
-- Initializations
function modifier_lion_unlock_potential_lua:OnCreated( kv )
	-- references
	self.chance_proc = self:GetAbility():GetSpecialValueFor( "chance_proc" ) -- special value
    self.bonus_damage_pct = self:GetAbility():GetSpecialValueFor( "bonus_damage_pct" )
    self.hp_regen_pct = self:GetAbility():GetSpecialValueFor( "hp_regen_pct" )
    self.armor = self:GetAbility():GetSpecialValueFor( "armor" )
end

function modifier_lion_unlock_potential_lua:OnRefresh( kv )
	-- references
	self.chance_proc = self:GetAbility():GetSpecialValueFor( "chance_proc" ) -- special value
    self.bonus_damage_pct = self:GetAbility():GetSpecialValueFor( "bonus_damage_pct" )
    self.hp_regen_pct = self:GetAbility():GetSpecialValueFor( "hp_regen_pct" )
    self.armor = self:GetAbility():GetSpecialValueFor( "armor" )	
end

function modifier_lion_unlock_potential_lua:OnDestroy( kv )
end

--------------------------------------------------------------------------------
-- Modifier Effects
function modifier_lion_unlock_potential_lua:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS,
        MODIFIER_PROPERTY_HEALTH_REGEN_PERCENTAGE,
        MODIFIER_PROPERTY_DAMAGEOUTGOING_PERCENTAGE,

        MODIFIER_EVENT_ON_ABILITY_FULLY_CAST,
        MODIFIER_EVENT_ON_ATTACK_FINISHED
	}

	return funcs
end

function modifier_lion_unlock_potential_lua:GetModifierPhysicalArmorBonus()
	return self.armor
end

function modifier_lion_unlock_potential_lua:GetModifierHealthRegenPercentage()
	return self.hp_regen_pct
end

function modifier_lion_unlock_potential_lua:GetModifierDamageOutgoing_Percentage()
	return self.bonus_damage_pct
end

function modifier_lion_unlock_potential_lua:OnAttackFinished( params )
	if not IsServer() then return end
    if params.attacker~=self:GetParent() then return end -- make sure the parent is the only thing to trigger the attack

    -- roll chance to proc strength
		local roll = RandomInt(1,100)
		if roll <= self.chance_proc then
			print("chance proc attack")
            self:ResetCooldowns()
		end
end

function modifier_lion_unlock_potential_lua:OnAbilityFullyCast( params )
    if not IsServer() then return end

    -- roll chance to proc strength
		local roll = RandomInt(1,100)
		if roll <= self.chance_proc then
			print("chance proc spell")
            self:ResetCooldowns()
		end
end

function modifier_lion_unlock_potential_lua:ResetCooldowns()
    if IsServer() then
        print("resetiing cooldowns...")
        -- reset cooldowns
        for _ = 0, 7 do
            local ability = self:GetParent():GetAbilityByIndex( _ )
            if ability then
                ability:EndCooldown()
            end
        end
        -- remove buff
        if self:GetParent():HasModifier("modifier_lion_unlock_potential_lua") then
            self:GetParent():RemoveModifierByName("modifier_lion_unlock_potential_lua")
        end
    end
end