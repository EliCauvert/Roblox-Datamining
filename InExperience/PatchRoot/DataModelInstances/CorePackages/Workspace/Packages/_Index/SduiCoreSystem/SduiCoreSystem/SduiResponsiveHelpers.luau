local guiService = game:GetService("GuiService")
local userInputService = game:GetService("UserInputService")
local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local parent = sduiCoreSystem.Parent
local argCheckModule = require(parent.ArgCheck)
local getDisplayStore = require(parent.Display).GetDisplayStore
local _ = require(sduiCoreSystem.SduiBuilderTypes)
local sduiConditionKey = require(sduiCoreSystem.ConditionalProps.SduiConditionalPropTypes).SduiConditionKey
local sduiErrorsModule = require(sduiCoreSystem.SduiErrors)
local sduiForcePerfLevel = game:DefineFastString("SduiForcePerfLevel", "")
local sduiForceImageQualityLevel = game:DefineFastString("SduiForceImageQualityLevel", "")
local t = {
	low = 1,
	Low = 1,
	medium = 2,
	Medium = 2,
	high = 3,
	High = 3
}
local t_1 = {
	[Enum.DeviceLevel.Low] = 1,
	[Enum.DeviceLevel.Medium] = 2,
	[Enum.DeviceLevel.High] = 3
}
local var9 = nil
local var10 = nil

local function _() --[[ line: 48 | named "getDevicePerformanceValue" ]]
	-- upvalues: var9 (write), sduiForcePerfLevel (ref), t (ref), userInputService (ref), t_1 (ref)
	if var9 == nil then
		var9 = if sduiForcePerfLevel == "" then t_1[userInputService:GetDeviceLevel()] or t.High else t[sduiForcePerfLevel] or t.High
	end
	return var9
end

local function getImageQualityValue() --[[ line: 60 ]]
	-- upvalues: sduiForceImageQualityLevel (ref), t (ref), var9 (write), sduiForcePerfLevel (ref), userInputService (ref), t_1 (ref), var10 (write), guiService (ref), argCheckModule (ref)
	if sduiForceImageQualityLevel ~= "" then
		return t[sduiForceImageQualityLevel] or t.High
	elseif var9 == nil then
		var9 = if sduiForcePerfLevel == "" then t_1[userInputService:GetDeviceLevel()] or t.High else t[sduiForcePerfLevel] or t.High
	end
	local var12 = var9
	
	if var12 == t.Low then
		return t.Low
	elseif var12 == t.Medium then
		return t.Medium
	elseif var12 ~= t.High then
		argCheckModule.assert(true, `Unexpected performanceLevel {var12}`)
		
		return t.High
	elseif var10 == nil then
		var10 = guiService:GetResolutionScale()
	end
	return if var10 >= 2 then t.High else t.Medium
end

return {
	PERF_KEY = "performanceLevel",
	IMAGE_QUALITY_KEY = "imageQualityLevel",
	shouldIncludeKey = function(p0) --[[ line: 117 ]]
		return p0 == "imageQualityLevel" or p0 == "performanceLevel"
	end,
	shouldFailConditionEarly = function(p1, p2, p3) --[[ line: 87 ]]
		-- upvalues: var9 (write), sduiForcePerfLevel (ref), t (ref), userInputService (ref), t_1 (ref), sduiErrorsModule (ref), getImageQualityValue (ref)
		if p1 == "performanceLevel" then
			if var9 == nil then
				var9 = if sduiForcePerfLevel == "" then t_1[userInputService:GetDeviceLevel()] or t.High else t[sduiForcePerfLevel] or t.High
			end
			local var13 = var9
			local var14 = t[p2]
			
			if var14 then
				return var13 ~= var14
			end
			p3.dependencies.logger.reportError(sduiErrorsModule.SduiErrorType.InvalidResponsiveCondition, { name = p1, value = p2 }, p3.appPage)
			
			return false
		elseif p1 ~= "imageQualityLevel" then
			return false
		end
		local var15 = getImageQualityValue()
		local var16 = t[p2]
		
		if var16 then
			return var15 ~= var16
		end
		p3.dependencies.logger.reportError(sduiErrorsModule.SduiErrorType.InvalidResponsiveCondition, { name = p1, value = p2 }, p3.appPage)
		
		return false
	end,
	setDeviceLevelValueForTests = function(value) --[[ line: 286 ]]
		-- upvalues: var9 (write)
		var9 = value
	end,
	setResolutionScaleForTests = function(value) --[[ line: 291 ]]
		-- upvalues: var10 (write)
		var10 = value
	end,
	adaptThumbnailDimensions = function(p4, p5, p6, p7, p8) --[[ line: 125 ]]
		-- upvalues: getImageQualityValue (ref), t (ref), argCheckModule (ref)
		local var17 = getImageQualityValue()
		
		if var17 == t.High then
			return p4, p5
		elseif var17 == t.Low then
			return p6, p7
		elseif var17 ~= t.Medium then
			argCheckModule.assert(true, `Unexpected imageQualityLevel {var17}`)
		elseif p4 == 1320 and p5 == 440 then
			if p6 <= 660 and p7 <= 220 then
				return 660, 220
			end
		elseif p4 == 384 and p5 == 216 then
			if (p8 == "GameThumbnail" or p8 == "Asset") and (p6 <= 256 and p7 <= 144) then
				return 256, 144
			end
		elseif p4 == 768 and p5 == 432 or p4 == 576 and p5 == 324 then
			if (p8 == "GameThumbnail" or p8 == "Asset") and (p6 <= 384 and p7 <= 216) then
				return 384, 216
			end
		elseif p4 == 512 and p5 == 512 then
			if p8 == "GameIcon" and p6 <= 256 and p7 <= 256 then
				return 256, 256
			end
		elseif p4 == 700 and p5 == 700 and (p8 == "Asset" and p6 <= 420) and p7 <= 420 then
			return 420, 420
		end
		return p4, p5
	end,
	checkResponsiveConditions = function(p9, p10, p11, p12, p13, p14) --[[ line: 174 ]]
		-- upvalues: sduiConditionKey (ref), getImageQualityValue (ref), t (ref), sduiErrorsModule (ref), var9 (write), sduiForcePerfLevel (ref), userInputService (ref), t_1 (ref)
		local t_2 = {}
		
		if not p9 then
			return t_2
		end
		local var19
		assert(p9, "allConditionalProps must exist")
		
		for i, v in p9 do
			var19 = nil
			
			if v.conditions then
				for i_1, v_1 in v.conditions do
					local var20, var21
					if i_1 == sduiConditionKey.minScreenWidth then
						if p10.X < v_1 then
							var19 = true
							break
						end
					elseif i_1 == sduiConditionKey.maxScreenWidth then
						if v_1 < p10.X then
							var19 = true
							break
						end
					elseif i_1 == sduiConditionKey.isPortrait then
						if v_1 and p10.Y < p10.X then
							var19 = true
							break
						elseif not v_1 and p10.X < p10.Y then
							var19 = true
							break
						end
					elseif i_1 == sduiConditionKey.lastInput then
						if v_1 ~= p11 then
							var19 = true
							break
						end
					elseif i_1 == sduiConditionKey.preferredInput then
						if v_1 ~= p12 then
							var19 = true
							break
						end
					elseif i_1 == sduiConditionKey.isSpatial then
						if not p13 and v_1 or p13 and not v_1 then
							var19 = true
							break
						end
					elseif i_1 == sduiConditionKey.imageQualityLevel then
						var20 = getImageQualityValue()
						var21 = t[v_1]
						
						if not var21 then
							p14.dependencies.logger.reportError(sduiErrorsModule.SduiErrorType.InvalidResponsiveCondition, { name = i_1, value = v_1 }, p14.appPage)
							var19 = true
							break
						elseif var20 ~= var21 then
							var19 = true
							break
						end
					elseif i_1 == sduiConditionKey.performanceLevel then
						if var9 == nil then
							if sduiForcePerfLevel == "" then
								var9 = t_1[userInputService:GetDeviceLevel()] or t.High
							else
								var21 = t[sduiForcePerfLevel] or t.High
								var9 = var21
							end
						end
						var20 = var9
						var21 = t[v_1]
						
						if not var21 then
							p14.dependencies.logger.reportError(sduiErrorsModule.SduiErrorType.InvalidResponsiveCondition, { name = i_1, value = v_1 }, p14.appPage)
							var19 = true
							break
						elseif var20 ~= var21 then
							var19 = true
							break
						end
					end
				end
			end
			t_2[i] = var19
		end
		return t_2
	end,
	isPortraitOrientation = function() --[[ line: 273 ]]
		-- upvalues: getDisplayStore (ref)
		local viewportSize = getDisplayStore(false).getViewportSize(false)
		
		return viewportSize.X < viewportSize.Y
	end
}