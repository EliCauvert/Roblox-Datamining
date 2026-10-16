local GuiService = game:GetService("GuiService")
local UserInputService = game:GetService("UserInputService")
local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local Parent = SduiCoreSystem.Parent
local ArgCheckModule = require(Parent.ArgCheck)
local GetDisplayStoreFunction = require(Parent.Display).GetDisplayStore
local _ = require(SduiCoreSystem.SduiBuilderTypes)
local SduiConditionKey = require(SduiCoreSystem.ConditionalProps.SduiConditionalPropTypes).SduiConditionKey
local SduiErrorsModule = require(SduiCoreSystem.SduiErrors)
local SduiForcePerfLevel = game:DefineFastString("SduiForcePerfLevel", "")
local SduiForceImageQualityLevel = game:DefineFastString("SduiForceImageQualityLevel", "")
local config = {
	low = 1,
	Low = 1,
	medium = 2,
	Medium = 2,
	high = 3,
	High = 3
}
local config1 = {
	[Enum.DeviceLevel.Low] = 1,
	[Enum.DeviceLevel.Medium] = 2,
	[Enum.DeviceLevel.High] = 3
}
local DeviceLevelValueForTests = nil
local ResolutionScale = nil

local function _() --[[ Line: 48 | Named "getDevicePerformanceValue" ]]
	-- upvalues: DeviceLevelValueForTests (ref), SduiForcePerfLevel (copy), config (copy), UserInputService (copy), config1 (copy)
	if DeviceLevelValueForTests == nil then
		DeviceLevelValueForTests = (if SduiForcePerfLevel == "" then config1[UserInputService:GetDeviceLevel()] else config[SduiForcePerfLevel]) or 3
	end
	return DeviceLevelValueForTests
end

local function getImageQualityValue() --[[ Line: 60 ]]
	-- upvalues: SduiForceImageQualityLevel (copy), config (copy), DeviceLevelValueForTests (ref), SduiForcePerfLevel (copy), UserInputService (copy), config1 (copy), ResolutionScale (ref), GuiService (copy), ArgCheckModule (copy)
	if SduiForceImageQualityLevel ~= "" then
		return config[SduiForceImageQualityLevel] or 3
	end
	if DeviceLevelValueForTests == nil then
		DeviceLevelValueForTests = (if SduiForcePerfLevel == "" then config1[UserInputService:GetDeviceLevel()] else config[SduiForcePerfLevel]) or config.High
	end
	local DeviceLevelValueForTests1 = DeviceLevelValueForTests
	
	if DeviceLevelValueForTests1 == 1 then
		return 1
	end
	if DeviceLevelValueForTests1 == 2 then
		return 2
	end
	if DeviceLevelValueForTests1 ~= 3 then
		ArgCheckModule.assert(true, `Unexpected performanceLevel {DeviceLevelValueForTests1}`)
		
		return 3
	end
	if ResolutionScale == nil then
		ResolutionScale = GuiService:GetResolutionScale()
	end
	return if ResolutionScale >= 2 then 3 else 2
end

return {
	PERF_KEY = "performanceLevel",
	IMAGE_QUALITY_KEY = "imageQualityLevel",
	shouldIncludeKey = function(p1): boolean --[[ Line: 117 ]]
		return p1 ~= "imageQualityLevel" and p1 ~= "performanceLevel"
	end,
	shouldFailConditionEarly = function(Name, Value, p1): boolean --[[ Line: 87 ]]
		-- upvalues: DeviceLevelValueForTests (ref), SduiForcePerfLevel (copy), config (copy), UserInputService (copy), config1 (copy), SduiErrorsModule (copy), getImageQualityValue (copy)
		if Name == "performanceLevel" then
			if DeviceLevelValueForTests == nil then
				DeviceLevelValueForTests = (if SduiForcePerfLevel == "" then config1[UserInputService:GetDeviceLevel()] else config[SduiForcePerfLevel]) or config.High
			end
			local DeviceLevelValueForTests1 = DeviceLevelValueForTests
			local Entry = config[Value]
			
			if Entry then
				return DeviceLevelValueForTests1 ~= Entry
			else
				p1.dependencies.logger.reportError(SduiErrorsModule.SduiErrorType.InvalidResponsiveCondition, { name = Name, value = Value }, p1.appPage)
				
				return false
			end
		elseif Name ~= "imageQualityLevel" then
			return false
		else
			local ImageQualityValue = getImageQualityValue()
			local Entry = config[Value]
			
			if Entry then
				return ImageQualityValue ~= Entry
			else
				p1.dependencies.logger.reportError(SduiErrorsModule.SduiErrorType.InvalidResponsiveCondition, { name = Name, value = Value }, p1.appPage)
				
				return false
			end
		end
	end,
	setDeviceLevelValueForTests = function(Value) --[[ Line: 286 ]]
		-- upvalues: DeviceLevelValueForTests (ref)
		DeviceLevelValueForTests = Value
	end,
	setResolutionScaleForTests = function(Value) --[[ Line: 291 ]]
		-- upvalues: ResolutionScale (ref)
		ResolutionScale = Value
	end,
	adaptThumbnailDimensions = function(p1, p2, p3: number, p4: number, p5) --[[ Line: 125 ]]
		-- upvalues: getImageQualityValue (copy), ArgCheckModule (copy)
		local ImageQualityValue = getImageQualityValue()
		
		if ImageQualityValue == 3 then
			return p1, p2
		end
		if ImageQualityValue == 1 then
			return p3, p4
		end
		if ImageQualityValue ~= 2 then
			ArgCheckModule.assert(true, `Unexpected imageQualityLevel {ImageQualityValue}`)
		elseif p1 == 1320 and p2 == 440 then
			if p3 <= 660 and p4 <= 220 then
				return 660, 220
			end
		elseif p1 == 384 and p2 == 216 then
			if (p5 == "GameThumbnail" or p5 == "Asset") and p3 <= 256 and p4 <= 144 then
				return 256, 144
			end
		elseif p1 == 768 and p2 == 432 or p1 == 576 and p2 == 324 then
			if (p5 == "GameThumbnail" or p5 == "Asset") and p3 <= 384 and p4 <= 216 then
				return 384, 216
			end
		elseif p1 == 512 and p2 == 512 then
			if p5 == "GameIcon" and p3 <= 256 and p4 <= 256 then
				return 256, 256
			end
		elseif p1 == 700 and p2 == 700 and p5 == "Asset" and p3 <= 420 and p4 <= 420 then
			return 420, 420
		end
		return p1, p2
	end,
	checkResponsiveConditions = function(List, Vector, p1, p2, p3, p4) --[[ Line: 174 ]]
		-- upvalues: SduiConditionKey (copy), getImageQualityValue (copy), config (copy), SduiErrorsModule (copy), DeviceLevelValueForTests (ref), SduiForcePerfLevel (copy), UserInputService (copy), config1 (copy)
		local t = {}
		
		if not List then
			return t
		end
		assert(List, "allConditionalProps must exist")
		local Flag = nil
		
		for i, value in List do
			Flag = nil
			
			if value.conditions then
				for Name, condition in value.conditions do
					if Name ~= SduiConditionKey.minScreenWidth then
						if Name ~= SduiConditionKey.maxScreenWidth then
							if Name ~= SduiConditionKey.isPortrait then
								if Name ~= SduiConditionKey.lastInput then
									if Name ~= SduiConditionKey.preferredInput then
										if Name ~= SduiConditionKey.isSpatial then
											if Name == SduiConditionKey.imageQualityLevel then
												local ImageQualityValue = getImageQualityValue()
												local Entry = config[condition]
												
												if Entry then
													if ImageQualityValue ~= Entry then
														Flag = true
														break
													end
												else
													p4.dependencies.logger.reportError(SduiErrorsModule.SduiErrorType.InvalidResponsiveCondition, { name = Name, value = condition }, p4.appPage)
													Flag = true
													break
												end
											elseif Name == SduiConditionKey.performanceLevel then
												if DeviceLevelValueForTests == nil then
													DeviceLevelValueForTests = (if SduiForcePerfLevel == "" then config1[UserInputService:GetDeviceLevel()] else config[SduiForcePerfLevel]) or config.High
												end
												local DeviceLevelValueForTests1 = DeviceLevelValueForTests
												local Entry = config[condition]
												
												if Entry then
													if DeviceLevelValueForTests1 ~= Entry then
														Flag = true
														break
													end
												else
													p4.dependencies.logger.reportError(SduiErrorsModule.SduiErrorType.InvalidResponsiveCondition, { name = Name, value = condition }, p4.appPage)
													Flag = true
													break
												end
											end
										elseif not p3 and condition or p3 and not condition then
											Flag = true
											break
										end
									elseif condition ~= p2 then
										Flag = true
										break
									end
								elseif condition ~= p1 then
									Flag = true
									break
								end
							elseif condition and Vector.Y < Vector.X then
								Flag = true
								break
							elseif not condition and Vector.X < Vector.Y then
								Flag = true
								break
							end
						elseif condition < Vector.X then
							Flag = true
							break
						end
					elseif Vector.X < condition then
						Flag = true
						break
					end
				end
			end
			t[i] = Flag
		end
		return t
	end,
	isPortraitOrientation = function(): boolean --[[ Line: 273 ]]
		-- upvalues: GetDisplayStoreFunction (copy)
		local ViewportSize = GetDisplayStoreFunction(false).getViewportSize(false)
		
		return ViewportSize.X < ViewportSize.Y
	end
}