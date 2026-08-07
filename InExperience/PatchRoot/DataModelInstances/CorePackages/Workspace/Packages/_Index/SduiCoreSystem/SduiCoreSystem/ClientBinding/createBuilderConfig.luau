local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local parent = sduiCoreSystem.Parent
local _ = require(parent.ServiceContractsProto)
local getPropBuilderModule = require(sduiCoreSystem.ClientBinding.PropBuilder.getPropBuilder)
local _ = require(sduiCoreSystem.ClientBinding.SduiClientBindingTypes)
local sduiErrorsModule = require(sduiCoreSystem.SduiErrors)
local sduiLoggerModule = require(sduiCoreSystem.SduiLogger)
local fFlagSduiExperienceDetailsSupport = require(parent.SharedFlags).FFlagSduiExperienceDetailsSupport
local fFlagSduiEventDetailsSupport = require(parent.SharedFlags).FFlagSduiEventDetailsSupport

local function _(p0, p1) --[[ line: 16 | named "getLocalizedLiteralResolver" ]]
	-- upvalues: sduiLoggerModule (ref), sduiErrorsModule (ref)
	return function(p2) --[[ line: 17 ]]
		-- upvalues: sduiLoggerModule (copy), sduiErrorsModule (copy), p1 (ref), p0 (ref)
		if typeof(p2) ~= "table" or not p2.map_key then
			sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.FailedToResolveLocalizedLiteral, {
				message = `Invalid translationRef: expected table with map_key, got {typeof(p2)}`
			}, p1)
			
			return nil
		end
		local mapKey = p2.map_key
		local var4 = p0 and p0[mapKey]
		
		if var4 == nil then
			sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.FailedToResolveLocalizedLiteral, {
				message = `Could not find localized literal for mapKey: {tostring(mapKey)}, namespace: {p2.namespace}, key: {p2.key}`
			}, p1)
		end
		return var4
	end
end

return function(p3) --[[ line: 49 | named "createBuilderConfig" ]]
	-- upvalues: getPropBuilderModule (ref), sduiLoggerModule (ref), sduiErrorsModule (ref), fFlagSduiExperienceDetailsSupport (ref), fFlagSduiEventDetailsSupport (ref)
	local t = {
		appPage = p3.appPage,
		debugName = p3.debugName,
		getTemplateForRobloxComponent = p3.getTemplateForRobloxComponent,
		getPropBuilder = getPropBuilderModule
	}
	local localizedLiterals = p3.localizedLiterals
	local appPage = p3.appPage
	
	function t.resolveLocalizedLiteral(p4) --[[ line: 17 ]]
		-- upvalues: sduiLoggerModule (copy), sduiErrorsModule (copy), appPage (ref), localizedLiterals (ref)
		if typeof(p4) ~= "table" or not p4.map_key then
			sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.FailedToResolveLocalizedLiteral, {
				message = `Invalid translationRef: expected table with map_key, got {typeof(p4)}`
			}, appPage)
			
			return nil
		end
		local mapKey = p4.map_key
		local var4 = localizedLiterals and localizedLiterals[mapKey]
		
		if var4 == nil then
			sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.FailedToResolveLocalizedLiteral, {
				message = `Could not find localized literal for mapKey: {tostring(mapKey)}, namespace: {p4.namespace}, key: {p4.key}`
			}, appPage)
		end
		return var4
	end
	
	t.configKey = if fFlagSduiExperienceDetailsSupport or fFlagSduiEventDetailsSupport then p3.configKey else nil
	
	return t
end