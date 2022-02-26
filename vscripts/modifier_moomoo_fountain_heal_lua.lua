modifier_moomoo_fountain_heal_lua = class({})
--------------------------------------------------------------------------------
function modifier_moomoo_fountain_heal_lua:IsHidden()
	return false
end

function modifier_moomoo_fountain_heal_lua:IsDebuff()
	return false
end

--------------------------------------------------------------------------------

function modifier_moomoo_fountain_heal_lua:IsAura()
	return true
end

--------------------------------------------------------------------------------

function modifier_moomoo_fountain_heal_lua:GetModifierAura()
	return "modifier_moomoo_fountain_heal_lua_effect"
end

--------------------------------------------------------------------------------

function modifier_moomoo_fountain_heal_lua:GetAuraRadius()
	return self.radius
end

--------------------------------------------------------------------------------
function modifier_moomoo_fountain_heal_lua:GetAuraSearchTeam()
	return DOTA_UNIT_TARGET_TEAM_FRIENDLY
end

--------------------------------------------------------------------------------

function modifier_moomoo_fountain_heal_lua:GetAuraSearchType()
	return DOTA_UNIT_TARGET_HERO 
end

--------------------------------------------------------------------------------

function modifier_moomoo_fountain_heal_lua:OnCreated( kv )
    self.radius = self:GetAbility():GetSpecialValueFor( "radius" )

	if IsServer() then
		self:PlayEffects()
	end
end

function modifier_moomoo_fountain_heal_lua:OnRefresh( kv )
    self.radius = self:GetAbility():GetSpecialValueFor( "radius" )
end

function modifier_moomoo_fountain_heal_lua:OnDestroy()

end
--------------------------------------------------------------------------------
-- Graphics & Animations
function modifier_moomoo_fountain_heal_lua:PlayEffects()
	local particle_cast = "particles/units/heroes/hero_dazzle/dazzle_armor_friend_ring.vpcf"
	local effect_cast = ParticleManager:CreateParticle( particle_cast, PATTACH_ABSORIGIN_FOLLOW, self:GetParent() )
	ParticleManager:SetParticleControl( effect_cast, 1, Vector( self.radius, 1, 1 ) )

	-- buff particle
	self:AddParticle(
		effect_cast,
		false,
		false,
		-1,
		false,
		false
	)
end