local Lighting = game:GetService("Lighting")
local Object = require(script:FindFirstAncestor("SceneManagement").Parent.LuauPolyfill).Object
local config = {
	BloomEnabled = false,
	ColorCorrectionEnabled = false,
	LightingConfig = {
		Brightness = 1,
		ClockTime = 12,
		GeographicLatitude = 41.733,
		TimeOfDay = "12:00:00",
		FogEnd = 92,
		FogStart = 20,
		ColorShift_Bottom = Color3.fromRGB(232, 255, 146),
		ColorShift_Top = Color3.fromRGB(85, 136, 167),
		OutdoorAmbient = Color3.fromRGB(0, 0, 0),
		Ambient = Color3.fromRGB(170, 170, 170),
		FogColor = Color3.fromRGB(45, 46, 49)
	},
	SkyConfig = {
		CelestialBodiesShown = false,
		StarCount = 0,
		SkyboxAssetLocation = "rbxasset://textures/ui/AvatarExperience/AvatarExperienceSkyboxDarkTheme.png"
	},
	BloomConfig = { Intensity = 0.3, Size = 12, Threshold = 0.95 },
	ColorCorrectionConfig = { Brightness = 0, Contrast = 0, Saturation = 0 }
}

local function configureLighting(LightingConfig)
	-- upvalues: Object (copy), config (copy), Lighting (copy)
	local AssignResult = Object.assign({}, config.LightingConfig, LightingConfig or {})
	Lighting.Brightness = AssignResult.Brightness
	Lighting.ColorShift_Bottom = AssignResult.ColorShift_Bottom
	Lighting.ColorShift_Top = AssignResult.ColorShift_Top
	Lighting.OutdoorAmbient = AssignResult.OutdoorAmbient
	Lighting.Ambient = AssignResult.Ambient
	Lighting.ClockTime = AssignResult.ClockTime
	Lighting.GeographicLatitude = AssignResult.GeographicLatitude
	Lighting.TimeOfDay = AssignResult.TimeOfDay
	Lighting.FogColor = AssignResult.FogColor
	Lighting.FogEnd = AssignResult.FogEnd
	Lighting.FogStart = AssignResult.FogStart
end

local function _()
	-- upvalues: Lighting (copy)
	local Sky = Lighting:FindFirstChild("Sky")
	
	if Sky == nil then
		Sky = Instance.new("Sky")
		Sky.Parent = Lighting
	end
	return Sky
end

local function configureSky(Sky, SkyConfig)
	-- upvalues: Object (copy), config (copy)
	local AssignResult = Object.assign({}, config.SkyConfig, SkyConfig or {})
	Sky.CelestialBodiesShown = AssignResult.CelestialBodiesShown
	Sky.StarCount = AssignResult.StarCount
	Sky.SkyboxBk = AssignResult.SkyboxAssetLocation
	Sky.SkyboxDn = AssignResult.SkyboxAssetLocation
	Sky.SkyboxFt = AssignResult.SkyboxAssetLocation
	Sky.SkyboxLf = AssignResult.SkyboxAssetLocation
	Sky.SkyboxRt = AssignResult.SkyboxAssetLocation
	Sky.SkyboxUp = AssignResult.SkyboxAssetLocation
end

local _ = function()
	-- upvalues: Lighting (copy)
	return (Lighting:FindFirstChild("Bloom"))
end

local _ = function()
	-- upvalues: Lighting (copy)
	local Bloom = Lighting:FindFirstChild("Bloom")
	
	if Bloom == nil then
		Bloom = Instance.new("BloomEffect")
		Bloom.Parent = Lighting
	end
	return Bloom
end

local function configureBloom(Bloom, BloomConfig)
	-- upvalues: Object (copy), config (copy)
	local AssignResult = Object.assign({}, config.BloomConfig, BloomConfig or {})
	Bloom.Enabled = true
	Bloom.Intensity = AssignResult.Intensity
	Bloom.Size = AssignResult.Size
	Bloom.Threshold = AssignResult.Threshold
end

local _ = function()
	-- upvalues: Lighting (copy)
	return (Lighting:FindFirstChild("ColorCorrection"))
end

local _ = function()
	-- upvalues: Lighting (copy)
	local ColorCorrection = Lighting:FindFirstChild("ColorCorrection")
	
	if ColorCorrection == nil then
		ColorCorrection = Instance.new("ColorCorrectionEffect")
		ColorCorrection.Parent = Lighting
	end
	return ColorCorrection
end

local function configureColorCorrection(ColorCorrection, ColorCorrectionConfig)
	-- upvalues: Object (copy), config (copy)
	local AssignResult = Object.assign({}, config.ColorCorrectionConfig, ColorCorrectionConfig or {})
	ColorCorrection.Enabled = true
	ColorCorrection.Brightness = AssignResult.Brightness
	ColorCorrection.Contrast = AssignResult.Contrast
	ColorCorrection.Saturation = AssignResult.Saturation
end

return {
	configure = function(p1)
		-- upvalues: config (copy), configureLighting (copy), Lighting (copy), configureSky (copy), configureBloom (copy), configureColorCorrection (copy)
		local BloomEnabled = config.BloomEnabled or (p1 and p1.BloomEnabled or false)
		local ColorCorrectionEnabled = config.ColorCorrectionEnabled or (p1 and p1.ColorCorrectionEnabled or false)
		local SkyConfig = if p1 then p1.SkyConfig else nil
		local BloomConfig = if p1 then p1.BloomConfig else nil
		local ColorCorrectionConfig = if p1 then p1.ColorCorrectionConfig else nil
		configureLighting(if p1 then p1.LightingConfig else nil)
		local Sky = Lighting:FindFirstChild("Sky")
		
		if Sky == nil then
			Sky = Instance.new("Sky")
			Sky.Parent = Lighting
		end
		configureSky(Sky, SkyConfig)
		
		if BloomEnabled then
			local Bloom = Lighting:FindFirstChild("Bloom")
			
			if Bloom == nil then
				Bloom = Instance.new("BloomEffect")
				Bloom.Parent = Lighting
			end
			configureBloom(Bloom, BloomConfig)
		else
			local Bloom1 = Lighting:FindFirstChild("Bloom")
			
			if Bloom1 ~= nil then
				Bloom1.Enabled = false
			end
		end
		if ColorCorrectionEnabled then
			local ColorCorrection = Lighting:FindFirstChild("ColorCorrection")
			
			if ColorCorrection == nil then
				ColorCorrection = Instance.new("ColorCorrectionEffect")
				ColorCorrection.Parent = Lighting
			end
			configureColorCorrection(ColorCorrection, ColorCorrectionConfig)
			
			return
		else
			local ColorCorrection1 = Lighting:FindFirstChild("ColorCorrection")
			
			if ColorCorrection1 ~= nil then
				ColorCorrection1.Enabled = false
			end
		end
	end
}