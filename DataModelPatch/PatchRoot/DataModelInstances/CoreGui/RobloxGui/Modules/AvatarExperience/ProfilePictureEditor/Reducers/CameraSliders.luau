local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CryoModule = require(CorePackages.Packages.Cryo)

return require(CorePackages.Packages.Rodux).createReducer({ zoomSliderValue = 0, rotateSliderValue = 0 }, {
	[require(Modules.AvatarExperience.ProfilePictureEditor.Actions.SetCameraSliderZoom).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { zoomSliderValue = p2.zoomSliderValue })
	end,
	[require(Modules.AvatarExperience.ProfilePictureEditor.Actions.SetCameraSliderRotate).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { rotateSliderValue = p2.rotateSliderValue })
	end
})