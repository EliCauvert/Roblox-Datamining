local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local localizationModule = require(sduiCoreSystem.Parent.Localization)
local sduiErrorsModule = require(sduiCoreSystem.SduiErrors)
local sduiLoggerModule = require(sduiCoreSystem.SduiLogger)
local localizationService = game:GetService("LocalizationService")

local function _(p0) --[[ line: 30 | named "coerceNumericArg" ]]
	return if type(p0) == "number" then p0 elseif type(p0) == "string" then tonumber(p0) else nil
end

local _ = function(p1) --[[ line: 40 | named "tryDateTimeFromIsoString" ]]
	local ok, status = pcall(function() --[[ line: 41 ]]
		-- upvalues: p1 (ref)
		return DateTime.fromIsoDate(p1)
	end)
	
	return if ok and status then status else nil
end

local function resolveDateTimeForFormat(p2) --[[ line: 52 ]]
	-- upvalues: resolveDateTimeForFormat (ref)
	if type(p2) == "number" then
		return DateTime.fromUnixTimestamp(p2)
	elseif type(p2) == "string" then
		local var6 = if type(p2) == "number" then p2 elseif type(p2) == "string" then tonumber(p2) else nil
		
		if var6 ~= nil then
			return DateTime.fromUnixTimestamp(var6)
		end
		local ok, status = pcall(function() --[[ line: 41 ]]
			-- upvalues: p2 (ref)
			return DateTime.fromIsoDate(p2)
		end)
		
		return if ok and status then status else nil
	else
		return if type(p2) == "table" and p2.seconds ~= nil then resolveDateTimeForFormat(p2.seconds) else nil
	end
end

return {
	applyFormatArgFormatter = function(p3, p4, p5) --[[ line: 78 ]]
		-- upvalues: sduiLoggerModule (ref), sduiErrorsModule (ref), localizationModule (ref), localizationService (ref), resolveDateTimeForFormat (ref)
		if p4.type == "TYPE_INVALID" or p4.type == nil then
			sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.FailedToParseProp, { message = "Formatter specified without a type" }, p5)
			
			return nil
		elseif p4.type == "TYPE_NUMBER_ABBREVIATE" then
			local var7 = if type(p3) == "number" then p3 elseif type(p3) == "string" then tonumber(p3) else nil
			
			if var7 == nil then
				sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.FailedToParseProp, {
					message = `Formatter TYPE_NUMBER_ABBREVIATE received incompatible type '{typeof(p3)}'`
				}, p5)
				
				return nil
			end
			return localizationModule.NumberLocalization.abbreviate(var7, localizationService.RobloxLocaleId)
		elseif p4.type == "TYPE_NUMBER_LOCALIZE" then
			local var8 = if type(p3) == "number" then p3 elseif type(p3) == "string" then tonumber(p3) else nil
			
			if var8 == nil then
				sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.FailedToParseProp, {
					message = `Formatter TYPE_NUMBER_LOCALIZE received incompatible type '{typeof(p3)}'`
				}, p5)
				
				return nil
			end
			return localizationModule.NumberLocalization.localize(var8, localizationService.RobloxLocaleId)
		elseif p4.type ~= "TYPE_DATE_FORMAT" then
			sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.FailedToParseProp, { message = `Unknown formatter type '{p4.type}'` }, p5)
			
			return nil
		end
		local var9 = resolveDateTimeForFormat(p3)
		
		if var9 == nil then
			sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.FailedToParseProp, {
				message = `Formatter TYPE_DATE_FORMAT received incompatible type '{typeof(p3)}'`
			}, p5)
			
			return nil
		end
		local config = p4.config
		local _ = nil
		
		return var9:FormatLocalTime(if config and config.type == "date_config" and (config.value.pattern and config.value.pattern ~= "") then config.value.pattern else "L", localizationService.RobloxLocaleId)
	end
}