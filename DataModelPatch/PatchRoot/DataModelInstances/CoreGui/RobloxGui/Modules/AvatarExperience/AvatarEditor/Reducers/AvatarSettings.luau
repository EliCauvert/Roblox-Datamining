local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ConstantsModule = require(Modules.AvatarExperience.AvatarEditor.Constants)

return require(game:GetService("CorePackages").Packages.Rodux).createReducer({
	ObtainedAvatarRules = false,
	[ConstantsModule.AvatarSettings.minDeltaBodyColorDifference] = 0,
	[ConstantsModule.AvatarSettings.scalesRules] = {
		height = { min = 0.9, max = 1.05, increment = 0.01 },
		width = { min = 0.7, max = 1, increment = 0.01 },
		head = { min = 0.95, max = 1, increment = 0.01 },
		proportion = { min = 0, max = 1, increment = 0.01 },
		bodyType = { min = 0, max = 1, increment = 0.01 }
	},
	[ConstantsModule.AvatarSettings.accessoryRefinementTypes] = {
		[1] = Enum.AssetType.Hat.Value,
		[2] = Enum.AssetType.FaceAccessory.Value
	},
	[ConstantsModule.AvatarSettings.accessoryRefinementLowerBounds] = {
		hat = {
			position = { xPosition = -0.25, yPosition = -0.25, zPosition = -0.25 },
			rotation = { xRotation = -30, yRotation = -30, zRotation = -30 },
			scale = { xScale = 0.8, yScale = 0.8, zScale = 0.8 }
		},
		faceAccessory = {
			position = { xPosition = -0.25, yPosition = -0.25, zPosition = -0.25 },
			rotation = { xRotation = -30, yRotation = -30, zRotation = -30 },
			scale = { xScale = 0.8, yScale = 0.8, zScale = 0.8 }
		}
	},
	[ConstantsModule.AvatarSettings.accessoryRefinementUpperBounds] = {
		hat = {
			position = { xPosition = 0.25, yPosition = 0.25, zPosition = 0.25 },
			rotation = { xRotation = 30, yRotation = 30, zRotation = 30 },
			scale = { xScale = 1.2, yScale = 1.2, zScale = 1.2 }
		},
		faceAccessory = {
			position = { xPosition = 0.25, yPosition = 0.25, zPosition = 0.25 },
			rotation = { xRotation = 30, yRotation = 30, zRotation = 30 },
			scale = { xScale = 1.2, yScale = 1.2, zScale = 1.2 }
		}
	}
}, {
	[require(Modules.AvatarExperience.AvatarEditor.Actions.SetAvatarSettings).name] = function(_, p1)
		-- upvalues: ConstantsModule (copy)
		return {
			ObtainedAvatarRules = true,
			[ConstantsModule.AvatarSettings.scalesRules] = p1.scalesRules,
			[ConstantsModule.AvatarSettings.minDeltaBodyColorDifference] = p1.minimumDeltaEBodyColorDifference,
			[ConstantsModule.AvatarSettings.accessoryRefinementTypes] = p1.accessoryRefinementTypes,
			[ConstantsModule.AvatarSettings.accessoryRefinementLowerBounds] = p1.accessoryRefinementLowerBounds,
			[ConstantsModule.AvatarSettings.accessoryRefinementUpperBounds] = p1.accessoryRefinementUpperBounds
		}
	end
})