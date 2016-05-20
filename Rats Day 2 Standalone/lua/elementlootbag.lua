local _f_ElementLootBag_on_executed = ElementLootBag.on_executed

if not Global.game_settings or not Global.game_settings.level_id or not Global.game_settings.level_id == "alex_2" then
	return
end

function ElementLootBag:on_executed(...)
	if Global.game_settings and Global.game_settings.level_id == "alex_2" then
		local _id = "id_" .. tostring(self._id)
		local _data = {
			["id_103700"] = {pos = Vector3(312, -1210, -666), rot = Rotation(0, 0, 0.833886)},
			["id_103701"] = {pos = Vector3(316, -1182, -666), rot = Rotation(0, 0, 0.979925)},
			["id_103702"] = {pos = Vector3(108, -1153, -666), rot = Rotation(0, 0, 0.996195)},
			["id_103703"] = {pos = Vector3(100, -1175, -704.14), rot = Rotation(0, 0, 0.965926)},
			["id_103695"] = {pos = Vector3(84.193, -1123.83, -710), rot = Rotation(0, 0, 0.939693)},
			["id_103694"] = {pos = Vector3(72.847, -1177.54, -710), rot = Rotation(0, 0, -0.707107)},
			["id_103699"] = {pos = Vector3(293.474, -1219.66, -710), rot = Rotation(0, 0, 0.999048)},
			["id_103698"] = {pos = Vector3(299.128, -1181.02, -710), rot = Rotation(0, 0, 0.999048)},
			["id_103693"] = {pos = Vector3(152.515, -1157.01, -710), rot = Rotation(0, 0, -0.366501)}
		}
		if _data[_id] then		
			local carry_data = tweak_data.carry["meth"]		
			local unit = managers.player:server_drop_carry("meth", carry_data.multiplier, true, false, 1, _data[_id].pos, _data[_id].rot, Vector3(0, 0, 0), 0, nil, nil)
			if alive(unit) then
				self:_check_triggers("spawn", unit)
				unit:carry_data():set_mission_element(self)
			end		
			return
		end
	end
	_f_ElementLootBag_on_executed(self, ...)
end