
function event_death_complete(e)
	--guildslain = eq.get_guild_name_by_id(uguild_id);
	entity_list = eq.get_entity_list();
	eq.debug("self name " .. e.self:GetCleanName());

	if (e.other and e.other:IsClient()) then
		local killer_char_id = entity_list:GetClientByID(e.other:GetID()):CharacterID(); --local characteridbymob = entity_list:GetClientByID(e.killer_id):CharacterID();
		local killer_guild_id = eq.get_guild_id_by_char_id(killer_char_id);
		local killer_guild_name = eq.get_guild_name_by_id(killer_guild_id);

		local killed_char_id = entity_list:GetClientByID(e.self:GetID()):CharacterID();
		local killed_guild_id = eq.get_guild_id_by_char_id(killed_char_id);
		local killed_guild_name = eq.get_guild_name_by_id(killed_guild_id);

		--local killerdeitycheck = entity_list:GetMobByID(e.killer_id):GetDeity();
		--eq.debug("killer = " .. e.other:CharacterID());
		--eq.debug("guildid = " .. killerguildname);
		local killeddeitycheck = e.self:GetDeity();
		--eq.debug("character ID = " ..  entity_list:GetClientByID(e.other:GetID()):CharacterID());
		if (killed_guild_id == 0 and killer_guild_id == 0) then
			eq.world_emote(315, "[PVP] " .. e.self:GetCleanName() .. " has been slain by " .. e.other:GetCleanName() .. " in " .. eq.get_zone_long_name() .. "!")
			return;
		elseif (killed_guild_id == 0 and killer_guild_id > 0) then
			eq.world_emote(315, "[PVP] " .. e.self:GetCleanName() .. " has been slain by " .. e.other:GetCleanName() .. " <" .. killer_guild_name .. "> in " .. eq.get_zone_long_name() .. "!")
			return;
		elseif (killed_guild_id > 0 and killer_guild_id == 0) then
			eq.world_emote(315, "[PVP] " .. e.self:GetCleanName() .. " <" .. killed_guild_name .. "> has been slain by " .. e.other:GetCleanName() .. " in " .. eq.get_zone_long_name() .. "!")
			return;
		else
			eq.world_emote(315, "[PVP] " .. e.self:GetCleanName() .. " <" .. killed_guild_name .. "> has been slain by " .. e.other:GetCleanName() .. " <" .. killer_guild_name .. "> in " .. eq.get_zone_long_name() .. "!")
			return;
		end
	end

	if (e.other and e.other:IsPet()) then
		local pet_owner_char_id = entity_list:GetClientByID(e.other:GetOwner():GetID()):CharacterID();
		local pet_owner_guild_id = eq.get_guild_id_by_char_id(pet_owner_char_id);
		local pet_owner_guild_name = eq.get_guild_name_by_id(pet_owner_guild_id);

		local killed_char_id = entity_list:GetClientByID(e.self:GetID()):CharacterID();
		local killed_guild_id = eq.get_guild_id_by_char_id(killed_char_id);
		local killed_guild_name = eq.get_guild_name_by_id(killed_guild_id);

		--eq.debug("owner id = " .. pet_owner_char_id);

		eq.world_emote(315, "[PVP] " .. e.self:GetCleanName() .. " <" .. killed_guild_name .. "> has been slain by " .. e.other:GetOwner():GetCleanName() .. " <" .. pet_owner_guild_name .. "> in " .. eq.get_zone_long_name() .. "!")
		
		return; 
		
	end

end

--[[
0  /*13855*/ Skill1HBlunt = 0,
1  /*13856*/ Skill1HSlashing,
2  /*13857*/ Skill2HBlunt,
3  /*13858*/ Skill2HSlashing,
4  /*13859*/ SkillAbjuration,
5  /*13861*/ SkillAlteration,
6  /*13862*/ SkillApplyPoison, X
7  /*13863*/ SkillArchery, X
8  /*13864*/ SkillBackstab,
9  /*13866*/ SkillBindWound,
10 /*13867*/ SkillBash,
11 /*13871*/ SkillBlock,
12 /*13872*/ SkillBrassInstruments,
13 /*13874*/ SkillChanneling,
14 /*13875*/ SkillConjuration,
15 /*13876*/ SkillDefense,
16 /*13877*/ SkillDisarm,
17 /*13878*/ SkillDisarmTraps, 
18 /*13879*/ SkillDivination,
19 /*13880*/ SkillDodge,
20 /*13881*/ SkillDoubleAttack,
21 /*13882*/ SkillDragonPunch,
21 /*13924*/ SkillTailRake = SkillDragonPunch, // Iksar Monk equivilent
22 /*13883*/ SkillDualWield,
23 /*13884*/ SkillEagleStrike,
24 /*13885*/ SkillEvocation,
25 /*13886*/ SkillFeignDeath,
26 /*13888*/ SkillFlyingKick,
27 /*13889*/ SkillForage, X
28 /*13890*/ SkillHandtoHand,
29 /*13891*/ SkillHide,
30 /*13893*/ SkillKick,
31 /*13894*/ SkillMeditate,
32 /*13895*/ SkillMend,
33 /*13896*/ SkillOffense,
34 /*13897*/ SkillParry,
35 /*13899*/ SkillPickLock, X
36 /*13900*/ Skill1HPiercing,        // Changed in RoF2(05-10-2013)
37 /*13903*/ SkillRiposte,
38 /*13904*/ SkillRoundKick,
39 /*13905*/ SkillSafeFall, 
40 /*13906*/ SkillSenseHeading, X
41 /*13908*/ SkillSinging,
42 /*13909*/ SkillSneak,
43 /*13910*/ SkillSpecializeAbjure,      // No idea why they truncated this one..especially when there are longer ones...
44 /*13911*/ SkillSpecializeAlteration,
45 /*13912*/ SkillSpecializeConjuration,
46 /*13913*/ SkillSpecializeDivination,
47 /*13914*/ SkillSpecializeEvocation,
48 /*13915*/ SkillPickPockets, X
49 /*13916*/ SkillStringedInstruments,
50 /*13917*/ SkillSwimming, X
51 /*13919*/ SkillThrowing,
52 /*13920*/ SkillTigerClaw,
53 /*13921*/ SkillTracking, X
54 /*13923*/ SkillWindInstruments,
55 /*13854*/ SkillFishing, X
56 /*13853*/ SkillMakePoison, X
57 /*13852*/ SkillTinkering, X
58 /*13851*/ SkillResearch, X
59 /*13850*/ SkillAlchemy, X
60 /*13865*/ SkillBaking, X
61 /*13918*/ SkillTailoring, X
62 /*13907*/ SkillSenseTraps, X
63 /*13870*/ SkillBlacksmithing, X
64 /*13887*/ SkillFletching, X
65 /*13873*/ SkillBrewing, X
66 /*13860*/ SkillAlcoholTolerance, X
67 /*13868*/ SkillBegging, 
68 /*13892*/ SkillJewelryMaking, X
69 /*13901*/ SkillPottery, X
70 /*13898*/ SkillPercussionInstruments,
71 /*13922*/ SkillIntimidation,
72 /*13869*/ SkillBerserking,
73 /*13902*/ SkillTaunt,
74 /*05837*/ SkillFrenzy,
75 /*03670*/  SkillRemoveTraps,  X
76 /*13049*/  SkillTripleAttack,
]]--

function event_level_up(e)
  local free_skills =  {0,1,2,3,4,5,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,28,29,30,31,32,33,34,36,37,38,39,41,42,43,44,45,46,47,49,51,52,54,67,70,71,72,73,74,76};

  for k,v in ipairs(free_skills) do
    if ( e.self:MaxSkill(v) > 0 and e.self:GetRawSkill(v) < 1 and e.self:CanHaveSkill(v) ) then 
      e.self:SetSkill(v, 1);
    end
      
  end
end