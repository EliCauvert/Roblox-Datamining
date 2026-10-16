local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local _ = require(SduiCoreSystem.Parent.ServiceContractsProto)
local GetPropBuilderModule = require(SduiCoreSystem.ClientBinding.PropBuilder.getPropBuilder)
local _ = require(SduiCoreSystem.ClientBinding.SduiClientBindingTypes)
local SduiErrorsModule = require(SduiCoreSystem.SduiErrors)
local SduiLoggerModule = require(SduiCoreSystem.SduiLogger)

local function _(p1, p2) --[[ Line: 14 | Named "getLocalizedLiteralResolver" ]]
	-- upvalues: SduiLoggerModule (copy), SduiErrorsModule (copy)
	return function(p3) --[[ Line: 15 ]]
		-- upvalues: SduiLoggerModule (upval), SduiErrorsModule (upval), p2 (copy), p1 (copy)
		if typeof(p3) ~= "table" or not p3.map_key then
			SduiLoggerModule.reportError(SduiErrorsModule.SduiErrorType.FailedToResolveLocalizedLiteral, {
				message = `Invalid translationRef: expected table with map_key, got {typeof(p3)}`
			}, p2)
			
			return nil
		end
		local MapKey = p3.map_key
		local v1 = p1 and p1[MapKey]
		
		if v1 == nil then
			SduiLoggerModule.reportError(SduiErrorsModule.SduiErrorType.FailedToResolveLocalizedLiteral, {
				message = `Could not find localized literal for mapKey: {tostring(MapKey)}, namespace: {p3.namespace}, key: {p3.key}`
			}, p2)
		end
		return v1
	end
end

return function(p3) --[[ Line: 47 | Named "createBuilderConfig" ]]
	-- upvalues: GetPropBuilderModule (copy), SduiLoggerModule (copy), SduiErrorsModule (copy)
	local LocalizedLiterals = p3.localizedLiterals
	local AppPage = p3.appPage
	
	return {
		appPage = p3.appPage,
		debugName = p3.debugName,
		getTemplateForRobloxComponent = p3.getTemplateForRobloxComponent,
		getPropBuilder = GetPropBuilderModule,
		resolveLocalizedLiteral = function(p4) --[[ Line: 15 ]]
			-- upvalues: SduiLoggerModule (upval), SduiErrorsModule (upval), AppPage (copy), LocalizedLiterals (copy)
			if typeof(p4) ~= "table" or not p4.map_key then
				SduiLoggerModule.reportError(SduiErrorsModule.SduiErrorType.FailedToResolveLocalizedLiteral, {
					message = `Invalid translationRef: expected table with map_key, got {typeof(p4)}`
				}, AppPage)
				
				return nil
			end
			local MapKey = p4.map_key
			local v1 = LocalizedLiterals and LocalizedLiterals[MapKey]
			
			if v1 == nil then
				SduiLoggerModule.reportError(SduiErrorsModule.SduiErrorType.FailedToResolveLocalizedLiteral, {
					message = `Could not find localized literal for mapKey: {tostring(MapKey)}, namespace: {p4.namespace}, key: {p4.key}`
				}, AppPage)
			end
			return v1
		end,
		configKey = p3.configKey
	}
end