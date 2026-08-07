local avatarExperienceRodux = script:FindFirstAncestor("AvatarExperienceRodux")
local parent = avatarExperienceRodux.Parent
local cryoModule = require(parent.Cryo)
local _ = require(avatarExperienceRodux.Types.RoduxTypes)

return require(parent.Rodux).createReducer({ enabled = false, errorOccurred = false }, {
	[require(avatarExperienceRodux.Actions.SetCameraButtonStatus).name] = function(p0, p1) --[[ line: 25 ]]
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p0, { enabled = p1.status })
	end,
	[require(avatarExperienceRodux.Actions.SetCameraButtonErrorOccurred).name] = function(p2, p3) --[[ line: 32 ]]
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p2, { errorOccurred = p3.errorOccurred })
	end
})