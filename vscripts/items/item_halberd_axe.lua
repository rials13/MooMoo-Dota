item_halberd_axe = class({})
LinkLuaModifier( "item_halberd_axe_modifier", "items/item_halberd_axe_modifier", LUA_MODIFIER_MOTION_NONE )

--------------------------------------------------------------------------------
-- Passive Modifiers
function item_halberd_axe:GetIntrinsicModifierName()
    return "item_halberd_axe_modifier"
end