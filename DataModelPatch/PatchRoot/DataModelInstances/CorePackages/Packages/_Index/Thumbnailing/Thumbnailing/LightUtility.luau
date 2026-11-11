local Lighting = game:GetService("Lighting")
local ColorUtilityModule = require(script.Parent.ColorUtility)
local VectorUtilityModule = require(script.Parent.VectorUtility)
local LightUtilityModule = {
	AddLight = function(p1, p2)
		local Part = Instance.new("Part")
		Part.Anchored = true
		Part.Transparency = 1
		Part.Shape = Enum.PartType.Ball
		Part.Color = p1.color
		Part.Name = "ThumbnailLightAnchor_" .. tostring(p2)
		Part.Parent = workspace
		local PointLight = Instance.new("PointLight")
		PointLight.Color = p1.color
		PointLight.Brightness = 3
		PointLight.Range = 10
		PointLight.Shadows = true
		PointLight.Name = "PointLight_" .. tostring(p2)
		PointLight.Parent = Part
		Part.Position = p1.worldPos
	end
}

function LightUtilityModule.AddLightsFromExtraParams(p1, p2): boolean
	-- upvalues: ColorUtilityModule (copy), VectorUtilityModule (copy), LightUtilityModule (copy), Lighting (copy)
	local Flag = false
	local PointLights = p1 and p1.pointLights
	
	if PointLights then
		for i, pointLight in ipairs(PointLights) do
			LightUtilityModule.AddLight({
				color = ColorUtilityModule.Color3FromString(pointLight.color),
				worldPos = p2 * VectorUtilityModule.Vector3FromJson(pointLight.pos)
			}, i)
			Flag = true
		end
	end
	local ClockTime = p1 and p1.clockTime
	
	if ClockTime then
		Lighting.ClockTime = ClockTime
		Flag = true
	end
	local Brightness = p1 and p1.brightness
	
	if Brightness then
		Lighting.Brightness = Brightness
		Flag = true
	end
	return Flag
end

function LightUtilityModule.AddDefaultPointLightRelativeTo(p3)
	-- upvalues: LightUtilityModule (copy)
	LightUtilityModule.AddLight({
		color = Color3.new(1, 1, 1),
		worldPos = p3 * vector.create(-5, 7, -5)
	}, 0)
end

function LightUtilityModule.SetupSunlightWithJsonConfig(p3)
	-- upvalues: Lighting (copy)
	local P5 = p3 or {
		brightness = "1",
		ambient = "124,124,124",
		colorShiftBottom = "108,94,66",
		colorShiftTop = "94,100,172",
		environmentDiffuseScale = "0",
		environmentSpecularScale = "1",
		globalShadows = "true",
		shadowSoftness = "0",
		outdoorAmbient = "0,0,0",
		clockTime = "9.5",
		geographicLatitude = "330",
		exposureCompensation = "0",
		timeOfDay = "09:30:00"
	}
	Lighting.Brightness = P5.brightness and tonumber(P5.brightness) or 1
	local v1 = P5.ambient and P5.ambient:split(",") or { "124", "124", "124" }
	Lighting.Ambient = Color3.fromRGB(tonumber(v1[1]), tonumber(v1[2]), (tonumber(v1[3])))
	local v2 = P5.colorShiftBottom and P5.colorShiftBottom:split(",") or { "108", "94", "66" }
	local v3 = P5.colorShiftTop and P5.colorShiftTop:split(",") or { "94", "100", "172" }
	Lighting.ColorShift_Bottom = Color3.fromRGB(tonumber(v2[1]), tonumber(v2[2]), (tonumber(v2[3])))
	Lighting.ColorShift_Top = Color3.fromRGB(tonumber(v3[1]), tonumber(v3[2]), (tonumber(v3[3])))
	Lighting.EnvironmentDiffuseScale = P5.environmentDiffuseScale and tonumber(P5.environmentDiffuseScale) or 0
	Lighting.EnvironmentSpecularScale = P5.environmentSpecularScale and tonumber(P5.environmentSpecularScale) or 1
	Lighting.GlobalShadows = if P5.globalShadows then P5.globalShadows == "true" else false
	Lighting.ShadowSoftness = P5.shadowSoftness and tonumber(P5.shadowSoftness) or 0
	local v4 = P5.outdoorAmbient and P5.outdoorAmbient:split(",") or { "0", "0", "0" }
	Lighting.OutdoorAmbient = Color3.fromRGB(tonumber(v4[1]), tonumber(v4[2]), (tonumber(v4[3])))
	Lighting.ClockTime = P5.clockTime and tonumber(P5.clockTime) or 9.5
	Lighting.GeographicLatitude = P5.geographicLatitude and tonumber(P5.geographicLatitude) or 330
	Lighting.ExposureCompensation = P5.exposureCompensation and tonumber(P5.exposureCompensation) or 0
	Lighting.TimeOfDay = P5.timeOfDay or "09:30:00"
end

function LightUtilityModule.SetupSceneLight(p3, p4)
	local P6 = p3 or {}
	local LightType = P6.lightType or "SpotLight"
	local P7 = p4 or LightType
	local Part = Instance.new("Part")
	Part.Anchored = true
	Part.Transparency = 1
	Part.Size = P6.partSize or vector.create(4, 1, 2)
	Part.Shape = P6.partType or Enum.PartType.Block
	Part.Name = "ThumbnailLightAnchor_" .. tostring(P7)
	Part.Parent = workspace
	local NewInstance = Instance.new(LightType)
	NewInstance.Enabled = P6.enabled == nil or P6.enabled
	NewInstance.Color = P6.color or Color3.fromRGB(255, 255, 255)
	NewInstance.Brightness = P6.brightness or 10
	NewInstance.Range = P6.range or 12
	NewInstance.Angle = P6.angle or 30
	NewInstance.Shadows = P6.shadows == nil or P6.shadows
	NewInstance.Name = tostring(P7)
	NewInstance.Parent = Part
	Part.CFrame = P6.partCFrame
end

function LightUtilityModule.SetupSpotLight(FillLight, p3)
	-- upvalues: LightUtilityModule (copy)
	local FillLight1 = FillLight or {}
	FillLight1.lightType = "SpotLight"
	LightUtilityModule.SetupSceneLight(FillLight1, p3)
end

function LightUtilityModule.SetupSpotLightsIn3PointLighting(p3)
	-- upvalues: LightUtilityModule (copy)
	local P10 = p3 or {
		keyLight = {
			brightness = 11.2,
			range = 12,
			angle = 54,
			partCFrame = CFrame.new(2.219, 103.178, 4.675) * CFrame.Angles(30, 60, -90),
			color = Color3.fromRGB(218, 196, 144)
		},
		fillLight = {
			brightness = 1.6,
			range = 12,
			angle = 36,
			partCFrame = CFrame.new(3.554, 107.01, -1.036) * CFrame.Angles(-15, 90, -90),
			color = Color3.fromRGB(255, 255, 255)
		}
	}
	
	if P10.keyLight then
		LightUtilityModule.SetupSpotLight(P10.keyLight, "KeyLight")
	end
	if P10.fillLight then
		LightUtilityModule.SetupSpotLight(P10.fillLight, "FillLight")
	end
end

function LightUtilityModule.SetupSpotLightsIn3PointLightingWithJsonConfig(p3)
	-- upvalues: LightUtilityModule (copy)
	local P11 = p3 or {
		rotation = "105",
		keyCFrame = "2.219,103.178,4.675,30,60,-90",
		keyBrightness = "11.2",
		keyRange = "12",
		keyAngle = "54",
		keyColor = "218,196,144",
		fillCFrame = "3.554,107.01,-1.036,-15,90,-90",
		fillBrightness = "1.6",
		fillRange = "12",
		fillAngle = "36",
		fillColor = "255,255,255"
	}
	local _CFrame = CFrame.Angles(0, math.rad(P11.rotation and tonumber(P11.rotation) or 105), 0)
	local v1 = P11.keyCFrame and P11.keyCFrame:split(",") or {
		"2.219", "103.178", "4.675", "30", "60", "-90"
	}
	local v2 = P11.fillCFrame and P11.fillCFrame:split(",") or {
		"3.554", "107.01", "-1.036", "-15", "90", "-90"
	}
	local v3 = P11.keyColor and P11.keyColor:split(",") or { "218", "196", "144" }
	local v4 = P11.fillColor and P11.fillColor:split(",") or { "255", "255", "255" }
	LightUtilityModule.SetupSpotLightsIn3PointLighting({
		keyLight = {
			partCFrame = _CFrame:ToWorldSpace(CFrame.new(tonumber(v1[1]) or 0, tonumber(v1[2]) or 0, tonumber(v1[3]) or 0) * CFrame.Angles(math.rad(tonumber(v1[4]) or 0), math.rad(tonumber(v1[5]) or 0), (math.rad(tonumber(v1[6]) or 0)))),
			color = Color3.fromRGB(tonumber(v3[1]), tonumber(v3[2]), (tonumber(v3[3]))),
			brightness = P11.keyBrightness and tonumber(P11.keyBrightness) or 11.2,
			range = P11.keyRange and tonumber(P11.keyRange) or 12,
			angle = P11.keyAngle and tonumber(P11.keyAngle) or 54
		},
		fillLight = {
			partCFrame = _CFrame:ToWorldSpace(CFrame.new(tonumber(v2[1]) or 0, tonumber(v2[2]) or 0, tonumber(v2[3]) or 0) * CFrame.Angles(math.rad(tonumber(v2[4]) or 0), math.rad(tonumber(v2[5]) or 0), (math.rad(tonumber(v2[6]) or 0)))),
			color = Color3.fromRGB(tonumber(v4[1]), tonumber(v4[2]), (tonumber(v4[3]))),
			brightness = P11.fillBrightness and tonumber(P11.fillBrightness) or 1.6,
			range = P11.fillRange and tonumber(P11.fillRange) or 12,
			angle = P11.fillAngle and tonumber(P11.fillAngle) or 36
		}
	})
end

return LightUtilityModule