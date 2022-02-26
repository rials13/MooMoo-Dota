-- Generated from template

require( "game_setup" )

if CAddonTemplateGameMode == nil then
	CAddonTemplateGameMode = class({})
end

function Precache( context )
	--[[
		Precache things we know we'll use.  Possible file types include (but not limited to):
			PrecacheResource( "model", "*.vmdl", context )
			PrecacheResource( "soundfile", "*.vsndevts", context )
			PrecacheResource( "particle", "*.vpcf", context )
			PrecacheResource( "particle_folder", "particles/folder", context )
	]]

	-- need to precache the particle effect for the custom arrow - dont have to do it for tool only for other player
	PrecacheResource( "particle", "particles/econ/items/mirana/mirana_crescent_arrow/mirana_spell_crescent_arrow.vpcf", context )
	PrecacheResource( "particle", "particles/units/heroes/hero_venomancer/venomancer_venomousgale_launch.vpcf", context )
	
end

-- Create the game mode when we activate
function Activate()
	GameRules.AddonTemplate = CAddonTemplateGameMode()
	GameRules.AddonTemplate:InitGameMode()
end

function CAddonTemplateGameMode:InitGameMode()
	print( "Template addon is loaded." )
	GameRules:GetGameModeEntity():SetThink( "OnThink", self, "GlobalThink", 2 )

	-- added by me:
	GameSetup:init()

	CreateUnitByName("npc_dota_creature_gnoll_assassin", Vector(0,500), true, nil, nil, DOTA_TEAM_BADGUYS)
	CreateUnitByName("npc_dota_creature_gnoll_assassin", Vector(10,500), true, nil, nil, DOTA_TEAM_BADGUYS)
	CreateUnitByName("npc_dota_creature_gnoll_assassin", Vector(20,500), true, nil, nil, DOTA_TEAM_BADGUYS)
	CreateUnitByName("npc_dota_creature_gnoll_assassin", Vector(-10,500), true, nil, nil, DOTA_TEAM_BADGUYS)
	CreateUnitByName("npc_dota_creature_gnoll_assassin", Vector(-20,500), true, nil, nil, DOTA_TEAM_BADGUYS)

	CreateUnitByName("npc_dota_hero_axe", Vector(0,250), true, nil, nil, DOTA_TEAM_BADGUYS)

	--ListenToGameEvent("npc_spawned", Dynamic_Wrap(self, "OnUnitSpawned"), self)

	ListenToGameEvent("entity_killed", Dynamic_Wrap(self, "OnUnitKilled"), self)

end



-- on unit spanwed function: from lesson 9

-- entity killed function: from lesson 9
function CAddonTemplateGameMode:OnUnitKilled( args )
	local unit = EntIndexToHScript(args.entindex_killed) -- converts entity to 

	if unit ~= nil then
		if unit:IsHero() then
			print("Killed hero: " .. unit:GetName())
		end
	end
	
	--args.entindex_attacker
	--args.entindex_inflictor
	--args.damagebits
end



-- Evaluate the state of the game
function CAddonTemplateGameMode:OnThink()
	if GameRules:State_Get() == DOTA_GAMERULES_STATE_GAME_IN_PROGRESS then
		--print( "Template addon script is running." )
	elseif GameRules:State_Get() >= DOTA_GAMERULES_STATE_POST_GAME then
		return nil
	end
	return 1
end