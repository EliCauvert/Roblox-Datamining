local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local _ = require(sduiCoreSystem.Parent.ServiceContractsProto)
local getPropBuilderModule = require(sduiCoreSystem.ClientBinding.PropBuilder.getPropBuilder)
local _ = require(sduiCoreSystem.ClientBinding.SduiClientBindingTypes)
local sduiErrorsModule = require(sduiCoreSystem.SduiErrors)
local sduiLoggerModule = require(sduiCoreSystem.SduiLogger)

local function _(p1, p2)
	-- upvalues: sduiLoggerModule (ref), sduiErrorsModule (ref)
	return function(p3)
		-- upvalues: sduiLoggerModule (copy), sduiErrorsModule (copy), p2 (ref), p1 (ref)
		if typeof(p3) ~= "table" or not p3.map_key then
			sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.FailedToResolveLocalizedLiteral, {
				message = `Invalid translationRef: expected table with map_key, got {typeof(p3)}`
			}, p2)
			
			return nil
		end
		local mapKey = p3.map_key
		local var1 = p1 and p1[mapKey]
		
		if var1 == nil then
			sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.FailedToResolveLocalizedLiteral, {
				message = `Could not find localized literal for mapKey: {tostring(mapKey)}, namespace: {p3.namespace}, key: {p3.key}`
			}, p2)
		end
		return var1
	end
end

return function(p3)
	-- upvalues: getPropBuilderModule (ref), sduiLoggerModule (ref), sduiErrorsModule (ref)
	local t = {
		appPage = p3.appPage,
		debugName = p3.debugName,
		getTemplateForRobloxComponent = p3.getTemplateForRobloxComponent,
		getPropBuilder = getPropBuilderModule
	}
	local localizedLiterals = p3.localizedLiterals
	local appPage = p3.appPage
	
	function t.resolveLocalizedLiteral(p4)
		-- upvalues: sduiLoggerModule (copy), sduiErrorsModule (copy), appPage (ref), localizedLiterals (ref)
		if typeof(p4) ~= "table" or not p4.map_key then
			sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.FailedToResolveLocalizedLiteral, {
				message = `Invalid translationRef: expected table with map_key, got {typeof(p4)}`
			}, appPage)
			
			return nil
		end
		local mapKey = p4.map_key
		local var1 = localizedLiterals and localizedLiterals[mapKey]
		
		if var1 == nil then
			sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.FailedToResolveLocalizedLiteral, {
				message = `Could not find localized literal for mapKey: {tostring(mapKey)}, namespace: {p4.namespace}, key: {p4.key}`
			}, appPage)
		end
		return var1
	end
	
	t.configKey = p3.configKey
	
	return t
end