item_orb_of_darkness_modifier = class({})
--------------------------------------------------------------------------------
function item_orb_of_darkness_modifier:IsHidden()
	return true
end

function item_orb_of_darkness_modifier:IsDebuff()
	return false
end

--------------------------------------------------------------------------------

function item_orb_of_darkness_modifier:OnCreated( kv )
    self.all_stats = self:GetAbility():GetSpecialValueFor( "all_stats" )
    if IsServer() then
        local hOwner = self:GetParent()
        if not hOwner:HasItemInInventory( "item_orb_of_fire" ) then return end
        if not hOwner:HasItemInInventory( "item_orb_of_frost" ) then return end
        if not hOwner:HasItemInInventory( "item_orb_of_lightning" ) then return end
        if not hOwner:HasItemInInventory( "item_mithril_shirt" ) then return end
        print("true")
        hOwner:AddItemByName("item_moo_tshirt")
    end
    
end

function item_orb_of_darkness_modifier:OnRefresh( kv )
    self:OnCreated( kv )
end

function item_orb_of_darkness_modifier:OnDestroy()
end

--------------------------------------------------------------------------------
-- Modifier Effects
function item_orb_of_darkness_modifier:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_STATS_STRENGTH_BONUS,
		MODIFIER_PROPERTY_STATS_AGILITY_BONUS,
        MODIFIER_PROPERTY_STATS_INTELLECT_BONUS
	}

	return funcs
end

function item_orb_of_darkness_modifier:GetModifierBonusStats_Strength()
    return self.all_stats
end

function item_orb_of_darkness_modifier:GetModifierBonusStats_Agility()
    return self.all_stats
end

function item_orb_of_darkness_modifier:GetModifierBonusStats_Intellect()
    return self.all_stats
end