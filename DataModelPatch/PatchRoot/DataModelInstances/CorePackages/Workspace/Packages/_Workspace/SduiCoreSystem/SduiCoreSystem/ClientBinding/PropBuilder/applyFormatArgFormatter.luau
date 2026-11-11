local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local LocalizationModule = require(SduiCoreSystem.Parent.Localization)
local SduiErrorsModule = require(SduiCoreSystem.SduiErrors)
local SduiLoggerModule = require(SduiCoreSystem.SduiLogger)
local LocalizationService = game:GetService("LocalizationService")

local function _(p1)
	return if type(p1) == "number" then p1 elseif type(p1) == "string" then tonumber(p1) else nil
end

local _ = function(p1)
	local Success, Result = pcall(function()
		-- upvalues: p1 (copy)
		return DateTime.fromIsoDate(p1)
	end)
	
	return if Success and Result then Result else nil
end

local function resolveDateTimeForFormat(Seconds)
	-- upvalues: resolveDateTimeForFormat (copy)
	if type(Seconds) == "number" then
		return DateTime.fromUnixTimestamp(Seconds)
	elseif type(Seconds) ~= "string" then
		return if type(Seconds) == "table" and Seconds.seconds ~= nil then resolveDateTimeForFormat(Seconds.seconds) else nil
	else
		local Seconds1 = if type(Seconds) == "number" then Seconds elseif type(Seconds) == "string" then tonumber(Seconds) else nil
		
		if Seconds1 == nil then
			local Success, Result = pcall(function()
				-- upvalues: Seconds (copy)
				return DateTime.fromIsoDate(Seconds)
			end)
			
			return if Success and Result then Result else nil
		else
			return DateTime.fromUnixTimestamp(Seconds1)
		end
	end
end

return {
	applyFormatArgFormatter = function(p1, p2, p3)
		-- upvalues: SduiLoggerModule (copy), SduiErrorsModule (copy), LocalizationModule (copy), LocalizationService (copy), resolveDateTimeForFormat (copy)
		if p2.type == "TYPE_INVALID" or p2.type == nil then
			SduiLoggerModule.reportError(SduiErrorsModule.SduiErrorType.FailedToParseProp, { message = "Formatter specified without a type" }, p3)
			
			return nil
		elseif p2.type == "TYPE_NUMBER_ABBREVIATE" then
			local Number = if type(p1) == "number" then p1 elseif type(p1) == "string" then tonumber(p1) else nil
			
			if Number == nil then
				SduiLoggerModule.reportError(SduiErrorsModule.SduiErrorType.FailedToParseProp, {
					message = `Formatter TYPE_NUMBER_ABBREVIATE received incompatible type '{typeof(p3)}'`
				}, p3)
				
				return nil
			else
				return LocalizationModule.NumberLocalization.abbreviate(Number, LocalizationService.RobloxLocaleId)
			end
		elseif p2.type == "TYPE_NUMBER_LOCALIZE" then
			local Number = if type(p1) == "number" then p1 elseif type(p1) == "string" then tonumber(p1) else nil
			
			if Number == nil then
				SduiLoggerModule.reportError(SduiErrorsModule.SduiErrorType.FailedToParseProp, {
					message = `Formatter TYPE_NUMBER_LOCALIZE received incompatible type '{typeof(p3)}'`
				}, p3)
				
				return nil
			else
				return LocalizationModule.NumberLocalization.localize(Number, LocalizationService.RobloxLocaleId)
			end
		elseif p2.type ~= "TYPE_DATE_FORMAT" then
			SduiLoggerModule.reportError(SduiErrorsModule.SduiErrorType.FailedToParseProp, { message = `Unknown formatter type '{p4.type}'` }, p3)
			
			return nil
		else
			local ResolveDateTimeForFormatResult = resolveDateTimeForFormat(p1)
			
			if ResolveDateTimeForFormatResult == nil then
				SduiLoggerModule.reportError(SduiErrorsModule.SduiErrorType.FailedToParseProp, {
					message = `Formatter TYPE_DATE_FORMAT received incompatible type '{typeof(p3)}'`
				}, p3)
				
				return nil
			else
				local Config = p2.config
				
				return ResolveDateTimeForFormatResult:FormatLocalTime(if Config and Config.type == "date_config" and Config.value.pattern and Config.value.pattern ~= "" then Config.value.pattern else "L", LocalizationService.RobloxLocaleId)
			end
		end
	end
}