local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)

return require(CorePackages.Packages.Rodux).createReducer({}, {
	[require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.ProfilePictureEditor.Actions.SetPeekabooLayoutDetails).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, {
			[p2.screenName] = CryoModule.Dictionary.join(p1[p2.screenName] or {}, {
				screenHeightPix = p2.screenHeightPix,
				topYPix = p2.topYPix,
				viewportSizePix = p2.viewportSizePix
			})
		})
	end
})