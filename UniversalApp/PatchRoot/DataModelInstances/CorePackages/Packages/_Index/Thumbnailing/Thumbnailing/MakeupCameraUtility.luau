local function _(Position, p1): CFrame
	return CFrame.lookAt(Position, Position + p1)
end

local _CFrame = CFrame.lookAt(vector.create(0, 0.09362129867076874, -15.755899429321289), vector.create(0, 0.09362129867076874, -14.755899429321289))
local config = {
	[76] = CFrame.lookAt(vector.create(4.592892646789551, 0.3791741728782654, -7.37427282333374), vector.create(4.046112537384033, 0.3595225214958191, -6.537227153778076)),
	[77] = CFrame.lookAt(vector.create(4.593966007232666, 0.2791934013366699, -7.375917911529541), vector.create(4.047185897827148, 0.25954174995422363, -6.538872241973877)),
	[88] = _CFrame,
	[89] = CFrame.lookAt(vector.create(0, -0.2991415858268738, -6.413480281829834), vector.create(0, -0.2991415858268738, -5.413480281829834)),
	[90] = CFrame.lookAt(vector.create(0, 0.10852961242198944, -9.357427597045898), vector.create(0, 0.10852961242198944, -8.357427597045898))
}

return {
	SetupCamera = function(Camera, Focus, p1)
		-- upvalues: config (copy), _CFrame (copy)
		Camera.CFrame = Focus * ((if p1 then config[p1] else nil) or _CFrame)
		Camera.Focus = Focus
		Camera.FieldOfView = 5
	end
}