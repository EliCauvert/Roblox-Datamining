local AvatarExperienceRodux = script:FindFirstAncestor("AvatarExperienceRodux")
local Parent = AvatarExperienceRodux.Parent
local CryoModule = require(Parent.Cryo)
local RoduxModule = require(Parent.Rodux)
local _ = require(AvatarExperienceRodux.Types.RoduxTypes)

return (RoduxModule.createReducer({ enabled = false, errorOccurred = false }, {
	[require(AvatarExperienceRodux.Actions.SetCameraButtonStatus).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return (CryoModule.Dictionary.join(p1, { enabled = p2.status }))
	end,
	[require(AvatarExperienceRodux.Actions.SetCameraButtonErrorOccurred).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return (CryoModule.Dictionary.join(p1, { errorOccurred = p2.errorOccurred }))
	end
}))