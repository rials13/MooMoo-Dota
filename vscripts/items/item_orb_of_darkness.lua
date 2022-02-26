item_orb_of_darkness = class({})
LinkLuaModifier( "item_orb_of_darkness_modifier", "items/item_orb_of_darkness_modifier", LUA_MODIFIER_MOTION_NONE )

--------------------------------------------------------------------------------
-- Passive Modifier
function item_orb_of_darkness:GetIntrinsicModifierName()
	return "item_orb_of_darkness_modifier"
end

--------------------------------------------------------------------------------