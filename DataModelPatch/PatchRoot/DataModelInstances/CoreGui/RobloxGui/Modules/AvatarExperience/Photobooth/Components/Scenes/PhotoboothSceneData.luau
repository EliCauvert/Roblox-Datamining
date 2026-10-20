local AvatarExperienceFlagsModule = require(game:GetService("CorePackages").Workspace.Packages.AvatarExperienceFlags)
local FFlagAXBackgroundSceneManagerRevamp = AvatarExperienceFlagsModule.FFlagAXBackgroundSceneManagerRevamp
local FFlagAXPhotoboothAddTropicalRunway = AvatarExperienceFlagsModule.FFlagAXPhotoboothAddTropicalRunway
local Config = if FFlagAXBackgroundSceneManagerRevamp then {
	[""] = {
		id = "",
		position = vector.create(0, 0, 0),
		name = "Feature.Avatar.Label.Blocky",
		order = 1,
		thumbnail = "rbxassetid://111539366244714",
		color = Color3.fromRGB(220, 220, 220)
	},
	abyssblue = {
		id = "abyssblue",
		name = "Feature.Avatar.Label.AbyssBlue",
		order = 2,
		asset = "rbxasset://models/Photobooth/AbyssBlueLight.rbxm",
		thumbnail = "rbxassetid://70757611690112",
		position = vector.create(0, 0, 0),
		color = Color3.fromRGB(15, 48, 157),
		rotation = CFrame.Angles(0, 4.71238898038469, 0),
		dark = {
			asset = "rbxasset://models/Photobooth/AbyssBlue.rbxm",
			thumbnail = "rbxassetid://123948685752107",
			rotation = CFrame.Angles(0, 4.71238898038469, 0)
		}
	}
} else {
	[""] = {
		id = "",
		position = vector.create(-2.5, 0, 0),
		name = "Feature.Avatar.Label.Blocky",
		order = 1,
		thumbnail = "rbxassetid://103403748802347",
		asset = "AvatarSceneNew",
		color = Color3.fromRGB(220, 220, 220)
	},
	blue = {
		id = "blue",
		name = "Feature.Avatar.Label.AbyssBlueDark",
		order = 2,
		asset = "rbxasset://models/Photobooth/AbyssBlue.rbxm",
		thumbnail = "rbxassetid://117588323750072",
		color = Color3.fromRGB(15, 48, 157),
		rotation = CFrame.Angles(0, 4.71238898038469, 0),
		lighting = {
			Brightness = 1,
			EnvironmentDiffuseScale = 1,
			EnvironmentSpecularScale = 1,
			GlobalShadows = true,
			ClockTime = -0.674,
			FogEnd = 100000,
			FogStart = 0,
			ShadowSoftness = 0.22,
			GeographicLatitude = 58.812,
			TimeOfDay = "00:00:00",
			Ambient = Color3.fromRGB(131, 131, 131),
			ColorShift_Bottom = Color3.fromRGB(0, 0, 0),
			ColorShift_Top = Color3.fromRGB(0, 0, 0),
			FogColor = Color3.fromRGB(192, 192, 192),
			OutdoorAmbient = Color3.fromRGB(181, 181, 181)
		}
	},
	abyssbluelight = {
		id = "abyssbluelight",
		name = "Feature.Avatar.Label.AbyssBlueLight",
		order = 3,
		asset = "rbxasset://models/Photobooth/AbyssBlueLight.rbxm",
		thumbnail = "rbxassetid://76040566043616",
		color = Color3.fromRGB(255, 255, 255),
		rotation = CFrame.Angles(0, 4.71238898038469, 0),
		lighting = {
			Brightness = 1,
			EnvironmentDiffuseScale = 1,
			EnvironmentSpecularScale = 1,
			GlobalShadows = true,
			ClockTime = -0.674,
			FogEnd = 100000,
			FogStart = 0,
			ShadowSoftness = 0.22,
			GeographicLatitude = 58.812,
			TimeOfDay = "00:00:00",
			Ambient = Color3.fromRGB(131, 131, 131),
			ColorShift_Bottom = Color3.fromRGB(0, 0, 0),
			ColorShift_Top = Color3.fromRGB(0, 0, 0),
			FogColor = Color3.fromRGB(192, 192, 192),
			OutdoorAmbient = Color3.fromRGB(181, 181, 181)
		}
	}
}

if FFlagAXBackgroundSceneManagerRevamp and FFlagAXPhotoboothAddTropicalRunway then
	Config.tropicalrunway = {
		id = "tropicalrunway",
		name = "Feature.Avatar.Label.TropicalRunway",
		order = 3,
		asset = "rbxassetid://111374395460751",
		thumbnail = "rbxassetid://88076582911570",
		remote = true,
		position = vector.create(0, 0, 0),
		color = Color3.fromRGB(255, 210, 28),
		dark = {
			remote = true,
			thumbnail = "rbxassetid://92691362580817",
			asset = "rbxassetid://75079908802972"
		}
	}
end
return { PHOTOBOOTH_SCENES = Config }