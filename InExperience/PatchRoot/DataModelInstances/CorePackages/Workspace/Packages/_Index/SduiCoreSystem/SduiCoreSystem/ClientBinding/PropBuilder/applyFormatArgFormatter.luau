local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local localizationModule = require(sduiCoreSystem.Parent.Localization)
local sduiErrorsModule = require(sduiCoreSystem.SduiErrors)
local sduiLoggerModule = require(sduiCoreSystem.SduiLogger)
local localizationService = game:GetService("LocalizationService")

local function _(p1)
	return if type(p1) == "number" then p1 elseif type(p1) == "string" then tonumber(p1) else nil
end

local _ = function(p1)
	local ok, status = pcall(function()
		-- upvalues: p1 (ref)
		return DateTime.fromIsoDate(p1)
	end)
	
	return if ok and status then status else nil
end

local function resolveDateTimeForFormat(p1)
	-- upvalues: resolveDateTimeForFormat (ref)
	if type(p1) == "number" then
		return DateTime.fromUnixTimestamp(p1)
	elseif type(p1) == "string" then
		local var1 = if type(p1) == "number" then p1 elseif type(p1) == "string" then tonumber(p1) else nil
		
		if var1 ~= nil then
			return DateTime.fromUnixTimestamp(var1)
		end
		local ok, status = pcall(function()
			-- upvalues: p1 (ref)
			return DateTime.fromIsoDate(p1)
		end)
		
		return if ok and status then status else nil
	else
		return if type(p1) == "table" and p1.seconds ~= nil then resolveDateTimeForFormat(p1.seconds) else nil
	end
end

return {
	applyFormatArgFormatter = function(p1, p2, p3)
		-- upvalues: sduiLoggerModule (ref), sduiErrorsModule (ref), localizationModule (ref), localizationService (ref), resolveDateTimeForFormat (ref)
		if p2.type == "TYPE_INVALID" or p2.type == nil then
			sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.FailedToParseProp, { message = "Formatter specified without a type" }, p3)
			
			return nil
		elseif p2.type == "TYPE_NUMBER_ABBREVIATE" then
			local var1 = if type(p1) == "number" then p1 elseif type(p1) == "string" then tonumber(p1) else nil
			
			if var1 == nil then
				sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.FailedToParseProp, {
					message = `Formatter TYPE_NUMBER_ABBREVIATE received incompatible type '{typeof(p3)}'`
				}, p3)
				
				return nil
			end
			return localizationModule.NumberLocalization.abbreviate(var1, localizationService.RobloxLocaleId)
		elseif p2.type == "TYPE_NUMBER_LOCALIZE" then
			local var2 = if type(p1) == "number" then p1 elseif type(p1) == "string" then tonumber(p1) else nil
			
			if var2 == nil then
				sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.FailedToParseProp, {
					message = `Formatter TYPE_NUMBER_LOCALIZE received incompatible type '{typeof(p3)}'`
				}, p3)
				
				return nil
			end
			return localizationModule.NumberLocalization.localize(var2, localizationService.RobloxLocaleId)
		elseif p2.type ~= "TYPE_DATE_FORMAT" then
			sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.FailedToParseProp, { message = `Unknown formatter type '{p4.type}'` }, p3)
			
			return nil
		end
		local var3 = resolveDateTimeForFormat(p1)
		
		if var3 == nil then
			sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.FailedToParseProp, {
				message = `Formatter TYPE_DATE_FORMAT received incompatible type '{typeof(p3)}'`
			}, p3)
			
			return nil
		end
		local config = p2.config
		local _ = nil
		
		return var3:FormatLocalTime(if config and config.type == "date_config" and (config.value.pattern and config.value.pattern ~= "") then config.value.pattern else "L", localizationService.RobloxLocaleId)
	end
}