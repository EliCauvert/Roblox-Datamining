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
local var1 = nil
local var2 = nil

local function _()
	-- upvalues: var1 (write), sduiForcePerfLevel (ref), t (ref), userInputService (ref), t_1 (ref)
	if var1 == nil then
		var1 = if sduiForcePerfLevel ~= "" then t_1[userInputService:GetDeviceLevel()] or 3 else t[sduiForcePerfLevel] or 3
	end
	return var1
end

local function getImageQualityValue()
	-- upvalues: sduiForceImageQualityLevel (ref), t (ref), var1 (write), sduiForcePerfLevel (ref), userInputService (ref), t_1 (ref), var2 (write), guiService (ref), argCheckModule (ref)
	if sduiForceImageQualityLevel ~= "" then
		return t[sduiForceImageQualityLevel] or 3
	elseif var1 == nil then
		var1 = if sduiForcePerfLevel == "" then t_1[userInputService:GetDeviceLevel()] or t.High else t[sduiForcePerfLevel] or t.High
	end
	local var3 = var1
	
	if var3 == 1 then
		return 1
	elseif var3 == 2 then
		return 2
	elseif var3 ~= 3 then
		argCheckModule.assert(true, `Unexpected performanceLevel {var3}`)
		
		return 3
	elseif var2 == nil then
		var2 = guiService:GetResolutionScale()
	end
	return if var2 >= 2 then 3 else 2
end

return {
	PERF_KEY = "performanceLevel",
	IMAGE_QUALITY_KEY = "imageQualityLevel",
	shouldIncludeKey = function(p1)
		return p1 == "imageQualityLevel" or p1 == "performanceLevel"
	end,
	shouldFailConditionEarly = function(p1, p2, p3)
		-- upvalues: var1 (write), sduiForcePerfLevel (ref), t (ref), userInputService (ref), t_1 (ref), sduiErrorsModule (ref), getImageQualityValue (ref)
		if p1 == "performanceLevel" then
			if var1 == nil then
				var1 = if sduiForcePerfLevel == "" then t_1[userInputService:GetDeviceLevel()] or t.High else t[sduiForcePerfLevel] or t.High
			end
			local var3 = var1
			local var4 = t[p2]
			
			if var4 then
				return var3 ~= var4
			end
			p3.dependencies.logger.reportError(sduiErrorsModule.SduiErrorType.InvalidResponsiveCondition, { name = p1, value = p2 }, p3.appPage)
			
			return false
		elseif p1 ~= "imageQualityLevel" then
			return false
		end
		local var5 = getImageQualityValue()
		local var6 = t[p2]
		
		if var6 then
			return var5 ~= var6
		end
		p3.dependencies.logger.reportError(sduiErrorsModule.SduiErrorType.InvalidResponsiveCondition, { name = p1, value = p2 }, p3.appPage)
		
		return false
	end,
	setDeviceLevelValueForTests = function(value)
		-- upvalues: var1 (write)
		var1 = value
	end,
	setResolutionScaleForTests = function(value)
		-- upvalues: var2 (write)
		var2 = value
	end,
	adaptThumbnailDimensions = function(p1, p2, p3, p4, p5)
		-- upvalues: getImageQualityValue (ref), argCheckModule (ref)
		local var3 = getImageQualityValue()
		
		if var3 == 3 then
			return p1, p2
		elseif var3 == 1 then
			return p3, p4
		elseif var3 ~= 2 then
			argCheckModule.assert(true, `Unexpected imageQualityLevel {var3}`)
		elseif p1 == 1320 and p2 == 440 then
			if p3 <= 660 and p4 <= 220 then
				return 660, 220
			end
		elseif p1 == 384 and p2 == 216 then
			if (p5 == "GameThumbnail" or p5 == "Asset") and (p3 <= 256 and p4 <= 144) then
				return 256, 144
			end
		elseif p1 == 768 and p2 == 432 or p1 == 576 and p2 == 324 then
			if (p5 == "GameThumbnail" or p5 == "Asset") and (p3 <= 384 and p4 <= 216) then
				return 384, 216
			end
		elseif p1 == 512 and p2 == 512 then
			if p5 == "GameIcon" and p3 <= 256 and p4 <= 256 then
				return 256, 256
			end
		elseif p1 == 700 and p2 == 700 and (p5 == "Asset" and p3 <= 420) and p4 <= 420 then
			return 420, 420
		end
		return p1, p2
	end,
	checkResponsiveConditions = function(p1, p2, p3, p4, p5, p6)
		-- upvalues: sduiConditionKey (ref), getImageQualityValue (ref), t (ref), sduiErrorsModule (ref), var1 (write), sduiForcePerfLevel (ref), userInputService (ref), t_1 (ref)
		local t_2 = {}
		
		if not p1 then
			return t_2
		end
		local var3
		assert(p1, "allConditionalProps must exist")
		
		for i, v in p1 do
			var3 = nil
			
			if v.conditions then
				for i_1, v_1 in v.conditions do
					local var4, var5
					if i_1 == sduiConditionKey.minScreenWidth then
						if p2.X < v_1 then
							var3 = true
							break
						end
					elseif i_1 == sduiConditionKey.maxScreenWidth then
						if v_1 < p2.X then
							var3 = true
							break
						end
					elseif i_1 == sduiConditionKey.isPortrait then
						if v_1 and p2.Y < p2.X then
							var3 = true
							break
						elseif not v_1 and p2.X < p2.Y then
							var3 = true
							break
						end
					elseif i_1 == sduiConditionKey.lastInput then
						if v_1 ~= p3 then
							var3 = true
							break
						end
					elseif i_1 == sduiConditionKey.preferredInput then
						if v_1 ~= p4 then
							var3 = true
							break
						end
					elseif i_1 == sduiConditionKey.isSpatial then
						if not p5 and v_1 or p5 and not v_1 then
							var3 = true
							break
						end
					elseif i_1 == sduiConditionKey.imageQualityLevel then
						var4 = getImageQualityValue()
						var5 = t[v_1]
						
						if not var5 then
							p6.dependencies.logger.reportError(sduiErrorsModule.SduiErrorType.InvalidResponsiveCondition, { name = i_1, value = v_1 }, p6.appPage)
							var3 = true
							break
						elseif var4 ~= var5 then
							var3 = true
							break
						end
					elseif i_1 == sduiConditionKey.performanceLevel then
						if var1 == nil then
							if sduiForcePerfLevel == "" then
								var1 = t_1[userInputService:GetDeviceLevel()] or t.High
							else
								var5 = t[sduiForcePerfLevel] or t.High
								var1 = var5
							end
						end
						var4 = var1
						var5 = t[v_1]
						
						if not var5 then
							p6.dependencies.logger.reportError(sduiErrorsModule.SduiErrorType.InvalidResponsiveCondition, { name = i_1, value = v_1 }, p6.appPage)
							var3 = true
							break
						elseif var4 ~= var5 then
							var3 = true
							break
						end
					end
				end
			end
			t_2[i] = var3
		end
		return t_2
	end,
	isPortraitOrientation = function()
		-- upvalues: getDisplayStore (ref)
		local viewportSize = getDisplayStore(false).getViewportSize(false)
		
		return viewportSize.X < viewportSize.Y
	end
}