local t = {
	AddLight = function(p1, p2)
		local part = Instance.new("Part")
		part.Anchored = true
		part.Transparency = 1
		part.Shape = Enum.PartType.Ball
		part.Color = p1.color
		part.Name = "ThumbnailLightAnchor_" .. tostring(p2)
		part.Parent = workspace
		local pointLight = Instance.new("PointLight")
		pointLight.Color = p1.color
		pointLight.Brightness = 3
		pointLight.Range = 10
		pointLight.Shadows = true
		pointLight.Name = "PointLight_" .. tostring(p2)
		pointLight.Parent = part
		part.Position = p1.worldPos
	end
}
local lightingService = game:GetService("Lighting")
local colorUtilityModule = require(script.Parent.ColorUtility)
local vectorUtilityModule = require(script.Parent.VectorUtility)

function t.AddLightsFromExtraParams(p1, p2)
	-- upvalues: colorUtilityModule (ref), vectorUtilityModule (ref), t (ref), lightingService (ref)
	local var1 = false
	local pointLights = p1 and p1.pointLights
	
	if pointLights then
		for i, v in ipairs(pointLights) do
			t.AddLight({
				color = colorUtilityModule.Color3FromString(v.color),
				worldPos = p2 * vectorUtilityModule.Vector3FromJson(v.pos)
			}, i)
			var1 = true
		end
	end
	local clockTime = p1 and p1.clockTime
	
	if clockTime then
		lightingService.ClockTime = clockTime
		var1 = true
	end
	local brightness = p1 and p1.brightness
	
	if brightness then
		lightingService.Brightness = brightness
		var1 = true
	end
	return var1
end

function t.AddDefaultPointLightRelativeTo(p3)
	-- upvalues: t (ref)
	t.AddLight({
		color = Color3.new(1, 1, 1),
		worldPos = p3 * Vector3.new(-5, 7, -5)
	}, 0)
end

function t.SetupSunlightWithJsonConfig(p3)
	-- upvalues: lightingService (ref)
	p3 = p3 or {
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
	lightingService.Brightness = p3.brightness and tonumber(p3.brightness) or 1
	p3 = p3.ambient and p3.ambient:split(",") or { "124", "124", "124" }
	lightingService.Ambient = Color3.fromRGB(tonumber(p3[1]), tonumber(p3[2]), tonumber(p3[3]))
	local var2 = p3.colorShiftBottom and p3.colorShiftBottom:split(",") or { "108", "94", "66" }
	local var3 = p3.colorShiftTop and p3.colorShiftTop:split(",") or { "94", "100", "172" }
	lightingService.ColorShift_Bottom = Color3.fromRGB(tonumber(var2[1]), tonumber(var2[2]), tonumber(var2[3]))
	lightingService.ColorShift_Top = Color3.fromRGB(tonumber(var3[1]), tonumber(var3[2]), tonumber(var3[3]))
	lightingService.EnvironmentDiffuseScale = p3.environmentDiffuseScale and tonumber(p3.environmentDiffuseScale) or 0
	lightingService.EnvironmentSpecularScale = p3.environmentSpecularScale and tonumber(p3.environmentSpecularScale) or 1
	lightingService.GlobalShadows = if p3.globalShadows then true else false
	lightingService.ShadowSoftness = p3.shadowSoftness and tonumber(p3.shadowSoftness) or 0
	local var4 = p3.outdoorAmbient and p3.outdoorAmbient:split(",") or { "0", "0", "0" }
	lightingService.OutdoorAmbient = Color3.fromRGB(tonumber(var4[1]), tonumber(var4[2]), tonumber(var4[3]))
	lightingService.ClockTime = p3.clockTime and tonumber(p3.clockTime) or 9.5
	lightingService.GeographicLatitude = p3.geographicLatitude and tonumber(p3.geographicLatitude) or 330
	lightingService.ExposureCompensation = p3.exposureCompensation and tonumber(p3.exposureCompensation) or 0
	lightingService.TimeOfDay = p3.timeOfDay or "09:30:00"
end

function t.SetupSceneLight(p3, p4)
	p3 = p3 or {}
	p3 = p3.lightType or "SpotLight"
	p4 = p4 or p3
	local part = Instance.new("Part")
	part.Anchored = true
	part.Transparency = 1
	part.Size = p3.partSize or Vector3.new(4, 1, 2)
	part.Shape = p3.partType or Enum.PartType.Block
	part.Name = "ThumbnailLightAnchor_" .. tostring(p4)
	part.Parent = workspace
	local var2 = Instance.new(p3)
	var2.Enabled = p3.enabled ~= nil or p3.enabled
	var2.Color = p3.color or Color3.fromRGB(255, 255, 255)
	var2.Brightness = p3.brightness or 10
	var2.Range = p3.range or 12
	var2.Angle = p3.angle or 30
	var2.Shadows = p3.shadows ~= nil or p3.shadows
	var2.Name = tostring(p4)
	var2.Parent = part
	part.CFrame = p3.partCFrame
end

function t.SetupSpotLight(p3, p4)
	-- upvalues: t (ref)
	p3 = p3 or {}
	p3.lightType = "SpotLight"
	t.SetupSceneLight(p3, p4)
end

function t.SetupSpotLightsIn3PointLighting(p3)
	-- upvalues: t (ref)
	p3 = p3 or {
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
	
	if p3.keyLight then
		t.SetupSpotLight(p3.keyLight, "KeyLight")
	end
	if p3.fillLight then
		t.SetupSpotLight(p3.fillLight, "FillLight")
	end
end

function t.SetupSpotLightsIn3PointLightingWithJsonConfig(p3)
	-- upvalues: t (ref)
	p3 = p3 or {
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
	local cframe = CFrame.Angles(0, math.rad(p3.rotation and tonumber(p3.rotation) or 105), 0)
	local var2 = p3.keyCFrame and p3.keyCFrame:split(",") or {
		"2.219", "103.178", "4.675", "30", "60", "-90"
	}
	local var3 = cframe:ToWorldSpace(CFrame.new(tonumber(var2[1]) or 0, tonumber(var2[2]) or 0, tonumber(var2[3]) or 0) * CFrame.Angles(math.rad(tonumber(var2[4]) or 0), math.rad(tonumber(var2[5]) or 0), math.rad(tonumber(var2[6]) or 0)))
	local var4 = p3.fillCFrame and p3.fillCFrame:split(",") or {
		"3.554", "107.01", "-1.036", "-15", "90", "-90"
	}
	local var5 = cframe:ToWorldSpace(CFrame.new(tonumber(var4[1]) or 0, tonumber(var4[2]) or 0, tonumber(var4[3]) or 0) * CFrame.Angles(math.rad(tonumber(var4[4]) or 0), math.rad(tonumber(var4[5]) or 0), math.rad(tonumber(var4[6]) or 0)))
	local keyBrightness = p3.keyBrightness and tonumber(p3.keyBrightness) or 11.2
	local keyRange = p3.keyRange and tonumber(p3.keyRange) or 12
	local keyAngle = p3.keyAngle and tonumber(p3.keyAngle) or 54
	local var6 = p3.keyColor and p3.keyColor:split(",") or { "218", "196", "144" }
	local var7 = p3.fillColor and p3.fillColor:split(",") or { "255", "255", "255" }
	t.SetupSpotLightsIn3PointLighting({
		keyLight = {
			partCFrame = var3,
			color = Color3.fromRGB(tonumber(var6[1]), tonumber(var6[2]), tonumber(var6[3])),
			brightness = keyBrightness,
			range = keyRange,
			angle = keyAngle
		},
		fillLight = {
			partCFrame = var5,
			color = Color3.fromRGB(tonumber(var7[1]), tonumber(var7[2]), tonumber(var7[3])),
			brightness = p3.fillBrightness and tonumber(p3.fillBrightness) or 1.6,
			range = p3.fillRange and tonumber(p3.fillRange) or 12,
			angle = p3.fillAngle and tonumber(p3.fillAngle) or 36
		}
	})
end

return t