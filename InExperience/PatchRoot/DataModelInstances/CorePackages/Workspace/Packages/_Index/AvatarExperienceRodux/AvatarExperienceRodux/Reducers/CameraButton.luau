local avatarExperienceRodux = script:FindFirstAncestor("AvatarExperienceRodux")
local parent = avatarExperienceRodux.Parent
local cryoModule = require(parent.Cryo)
local _ = require(avatarExperienceRodux.Types.RoduxTypes)

return require(parent.Rodux).createReducer({ enabled = false, errorOccurred = false }, {
	[require(avatarExperienceRodux.Actions.SetCameraButtonStatus).name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, { enabled = p2.status })
	end,
	[require(avatarExperienceRodux.Actions.SetCameraButtonErrorOccurred).name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, { errorOccurred = p2.errorOccurred })
	end
})