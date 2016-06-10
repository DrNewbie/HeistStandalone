Hooks:Add("LocalizationManagerPostInit", "EscapeDaysLocalization", function(loc)
	LocalizationManager:add_localized_strings({
	["heist_contact_heist_standalone"] = "Heist Standalone",
	["heist_contact_heist_standalone_description"] = "",
	})
end)

if not tweak_data then
	return
end

if not tweak_data.narrative.contacts.heist_standalone then
	tweak_data.narrative.contacts.heist_standalone = tweak_data.narrative.contacts.heist_standalone or {}
	tweak_data.narrative.contacts.heist_standalone.name_id = "heist_contact_heist_standalone"
	tweak_data.narrative.contacts.heist_standalone.descriptions_id = "heist_contact_heist_standalone_description"
	tweak_data.narrative.contacts.heist_standalone.package = "packages/contact_bain"
	tweak_data.narrative.contacts.heist_standalone.assets_gui = Idstring("guis/mission_briefing/preload_contact_bain")
end

local _heistt = {"firestarter_2", "election_day_3", "hox_2", "short1_stage1", "short1_stage2", "short2_stage1", "short2_stage2b"}

for _, heist in pairs(_heistt) do
	tweak_data.narrative.jobs[heist] = {}
	tweak_data.narrative.jobs[heist] = deep_clone(tweak_data.narrative.jobs.rat)
	tweak_data.narrative.jobs[heist].name_id = tweak_data.levels[heist].name_id
	tweak_data.narrative.jobs[heist].briefing_id = tweak_data.levels[heist].briefing_id 
	tweak_data.narrative.jobs[heist].contact = "heist_standalone"
	tweak_data.narrative.jobs[heist].region = "street"
	tweak_data.narrative.jobs[heist].package = tweak_data.levels[heist].package
	tweak_data.narrative.jobs[heist].chain = {
			{
				level_id = heist,
				type_id = "heist_type_assault",
				type = "d"
			}
		}
	tweak_data.narrative.jobs[heist].payout = {
		10,
		20,
		40,
		80,
		160
	}
	tweak_data.narrative.jobs[heist].contract_cost = {
		650000,
		845000,
		1365000,
		2665000,
		5330000
	}
	table.insert(tweak_data.narrative._jobs_index, heist)
end

_heistt = {}