local t = {
	AddLight = function(p0, p1) --[[ line: 80 ]]
		local part = Instance.new("Part")
		part.Anchored = true
		part.Transparency = 1
		part.Shape = Enum.PartType.Ball
		part.Color = p0.color
		part.Name = "ThumbnailLightAnchor_" .. tostring(p1)
		part.Parent = workspace
		local pointLight = Instance.new("PointLight")
		pointLight.Color = p0.color
		pointLight.Brightness = 3
		pointLight.Range = 10
		pointLight.Shadows = true
		pointLight.Name = "PointLight_" .. tostring(p1)
		pointLight.Parent = part
		part.Position = p0.worldPos
	end
}
local lightingService = game:GetService("Lighting")
local colorUtilityModule = require(script.Parent.ColorUtility)
local vectorUtilityModule = require(script.Parent.VectorUtility)

function t.AddLightsFromExtraParams(p2, p3) --[[ line: 100 ]]
	-- upvalues: colorUtilityModule (ref), vectorUtilityModule (ref), t (ref), lightingService (ref)
	local var6 = false
	local pointLights = p2 and p2.pointLights
	
	if pointLights then
		for i, v in ipairs(pointLights) do
			t.AddLight({
				color = colorUtilityModule.Color3FromString(v.color),
				worldPos = p3 * vectorUtilityModule.Vector3FromJson(v.pos)
			}, i)
			var6 = true
		end
	end
	local clockTime = p2 and p2.clockTime
	
	if clockTime then
		lightingService.ClockTime = clockTime
		var6 = true
	end
	local brightness = p2 and p2.brightness
	
	if brightness then
		lightingService.Brightness = brightness
		var6 = true
	end
	return var6
end

function t.AddDefaultPointLightRelativeTo(p4) --[[ line: 134 ]]
	-- upvalues: t (ref)
	t.AddLight({
		color = Color3.new(1, 1, 1),
		worldPos = p4 * Vector3.new(-5, 7, -5)
	}, 0)
end

function t.SetupSunlightWithJsonConfig(p5) --[[ line: 143 ]]
	-- upvalues: lightingService (ref)
	p5 = p5 or {
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
	lightingService.Brightness = p5.brightness and tonumber(p5.brightness) or 1
	p5 = p5.ambient and p5.ambient:split(",") or { "124", "124", "124" }
	lightingService.Ambient = Color3.fromRGB(tonumber(p5[1]), tonumber(p5[2]), tonumber(p5[3]))
	local var11 = p5.colorShiftBottom and p5.colorShiftBottom:split(",") or { "108", "94", "66" }
	local var12 = p5.colorShiftTop and p5.colorShiftTop:split(",") or { "94", "100", "172" }
	lightingService.ColorShift_Bottom = Color3.fromRGB(tonumber(var11[1]), tonumber(var11[2]), tonumber(var11[3]))
	lightingService.ColorShift_Top = Color3.fromRGB(tonumber(var12[1]), tonumber(var12[2]), tonumber(var12[3]))
	lightingService.EnvironmentDiffuseScale = p5.environmentDiffuseScale and tonumber(p5.environmentDiffuseScale) or 0
	lightingService.EnvironmentSpecularScale = p5.environmentSpecularScale and tonumber(p5.environmentSpecularScale) or 1
	lightingService.GlobalShadows = if p5.globalShadows then true else false
	lightingService.ShadowSoftness = p5.shadowSoftness and tonumber(p5.shadowSoftness) or 0
	local var13 = p5.outdoorAmbient and p5.outdoorAmbient:split(",") or { "0", "0", "0" }
	lightingService.OutdoorAmbient = Color3.fromRGB(tonumber(var13[1]), tonumber(var13[2]), tonumber(var13[3]))
	lightingService.ClockTime = p5.clockTime and tonumber(p5.clockTime) or 9.5
	lightingService.GeographicLatitude = p5.geographicLatitude and tonumber(p5.geographicLatitude) or 330
	lightingService.ExposureCompensation = p5.exposureCompensation and tonumber(p5.exposureCompensation) or 0
	lightingService.TimeOfDay = p5.timeOfDay or "09:30:00"
end

function t.SetupSceneLight(p6, p7) --[[ line: 190 ]]
	p6 = p6 or {}
	p6 = p6.lightType or "SpotLight"
	p7 = p7 or p6
	local part = Instance.new("Part")
	part.Anchored = true
	part.Transparency = 1
	part.Size = p6.partSize or Vector3.new(4, 1, 2)
	part.Shape = p6.partType or Enum.PartType.Block
	part.Name = "ThumbnailLightAnchor_" .. tostring(p7)
	part.Parent = workspace
	local var16 = Instance.new(p6)
	var16.Enabled = p6.enabled ~= nil or p6.enabled
	var16.Color = p6.color or Color3.fromRGB(255, 255, 255)
	var16.Brightness = p6.brightness or 10
	var16.Range = p6.range or 12
	var16.Angle = p6.angle or 30
	var16.Shadows = p6.shadows ~= nil or p6.shadows
	var16.Name = tostring(p7)
	var16.Parent = part
	part.CFrame = p6.partCFrame
end

function t.SetupSpotLight(p8, p9) --[[ line: 215 ]]
	-- upvalues: t (ref)
	p8 = p8 or {}
	p8.lightType = "SpotLight"
	t.SetupSceneLight(p8, p9)
end

function t.SetupSpotLightsIn3PointLighting(p10) --[[ line: 225 ]]
	-- upvalues: t (ref)
	p10 = p10 or {
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
	
	if p10.keyLight then
		t.SetupSpotLight(p10.keyLight, "KeyLight")
	end
	if p10.fillLight then
		t.SetupSpotLight(p10.fillLight, "FillLight")
	end
end

function t.SetupSpotLightsIn3PointLightingWithJsonConfig(p11) --[[ line: 251 ]]
	-- upvalues: t (ref)
	p11 = p11 or {
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
	local cframe = CFrame.Angles(0, math.rad(p11.rotation and tonumber(p11.rotation) or 105), 0)
	local var21 = p11.keyCFrame and p11.keyCFrame:split(",") or {
		"2.219", "103.178", "4.675", "30", "60", "-90"
	}
	local var22 = cframe:ToWorldSpace(CFrame.new(tonumber(var21[1]) or 0, tonumber(var21[2]) or 0, tonumber(var21[3]) or 0) * CFrame.Angles(math.rad(tonumber(var21[4]) or 0), math.rad(tonumber(var21[5]) or 0), math.rad(tonumber(var21[6]) or 0)))
	local var23 = p11.fillCFrame and p11.fillCFrame:split(",") or {
		"3.554", "107.01", "-1.036", "-15", "90", "-90"
	}
	local var24 = cframe:ToWorldSpace(CFrame.new(tonumber(var23[1]) or 0, tonumber(var23[2]) or 0, tonumber(var23[3]) or 0) * CFrame.Angles(math.rad(tonumber(var23[4]) or 0), math.rad(tonumber(var23[5]) or 0), math.rad(tonumber(var23[6]) or 0)))
	local keyBrightness = p11.keyBrightness and tonumber(p11.keyBrightness) or 11.2
	local keyRange = p11.keyRange and tonumber(p11.keyRange) or 12
	local keyAngle = p11.keyAngle and tonumber(p11.keyAngle) or 54
	local var28 = p11.keyColor and p11.keyColor:split(",") or { "218", "196", "144" }
	local var29 = p11.fillColor and p11.fillColor:split(",") or { "255", "255", "255" }
	t.SetupSpotLightsIn3PointLighting({
		keyLight = {
			partCFrame = var22,
			color = Color3.fromRGB(tonumber(var28[1]), tonumber(var28[2]), tonumber(var28[3])),
			brightness = keyBrightness,
			range = keyRange,
			angle = keyAngle
		},
		fillLight = {
			partCFrame = var24,
			color = Color3.fromRGB(tonumber(var29[1]), tonumber(var29[2]), tonumber(var29[3])),
			brightness = p11.fillBrightness and tonumber(p11.fillBrightness) or 1.6,
			range = p11.fillRange and tonumber(p11.fillRange) or 12,
			angle = p11.fillAngle and tonumber(p11.fillAngle) or 36
		}
	})
end

return t