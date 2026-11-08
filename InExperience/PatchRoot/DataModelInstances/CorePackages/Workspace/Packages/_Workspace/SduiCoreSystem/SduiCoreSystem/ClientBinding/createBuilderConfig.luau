local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local Parent = SduiCoreSystem.Parent
local _ = require(Parent.ServiceContractsProto)
local GetPropBuilderModule = require(SduiCoreSystem.ClientBinding.PropBuilder.getPropBuilder)
local _ = require(SduiCoreSystem.ClientBinding.SduiClientBindingTypes)
local SduiErrorsModule = require(SduiCoreSystem.SduiErrors)
local AddSduiErrorContextFieldsModule = require(SduiCoreSystem.addSduiErrorContextFields)
local SduiLoggerModule = require(SduiCoreSystem.SduiLogger)
local FFlagSduiSharedLocalizedLiterals = require(Parent.SharedFlags).FFlagSduiSharedLocalizedLiterals
local FFlagSduiErrorPaths = require(Parent.SharedFlags).FFlagSduiErrorPaths

local function _(p1, p2, p3)
	-- upvalues: FFlagSduiErrorPaths (copy), AddSduiErrorContextFieldsModule (copy), SduiLoggerModule (copy), SduiErrorsModule (copy), FFlagSduiSharedLocalizedLiterals (copy)
	return function(p4, p5)
		-- upvalues: FFlagSduiErrorPaths (upval), AddSduiErrorContextFieldsModule (upval), SduiLoggerModule (upval), SduiErrorsModule (upval), p2 (copy), FFlagSduiSharedLocalizedLiterals (upval), p3 (copy), p1 (copy)
		if typeof(p4) == "table" and p4.map_key then
			local MapKey = p4.map_key
			local v1 = if FFlagSduiSharedLocalizedLiterals then p3(MapKey) else p1 and p1[MapKey]
			
			if v1 == nil then
				local config = {
					message = `Could not find localized literal for mapKey: {tostring(MapKey)}, namespace: {p4.namespace}, key: {p4.key}`
				}
				
				if FFlagSduiErrorPaths then
					AddSduiErrorContextFieldsModule(config, p5)
				end
				SduiLoggerModule.reportError(SduiErrorsModule.SduiErrorType.FailedToResolveLocalizedLiteral, config, p2)
			end
			return v1
		else
			local config = {
				message = `Invalid translationRef: expected table with map_key, got {typeof(p4)}`
			}
			
			if FFlagSduiErrorPaths then
				AddSduiErrorContextFieldsModule(config, p5)
			end
			SduiLoggerModule.reportError(SduiErrorsModule.SduiErrorType.FailedToResolveLocalizedLiteral, config, p2)
			
			return nil
		end
	end
end

return function(p4)
	-- upvalues: FFlagSduiErrorPaths (copy), GetPropBuilderModule (copy), FFlagSduiSharedLocalizedLiterals (copy), AddSduiErrorContextFieldsModule (copy), SduiLoggerModule (copy), SduiErrorsModule (copy)
	local LocalizedLiterals = p4.localizedLiterals
	local AppPage = p4.appPage
	local GetLocalizedLiteral = if FFlagSduiSharedLocalizedLiterals then p4.getLocalizedLiteral else nil
	
	return {
		appPage = p4.appPage,
		debugName = p4.debugName,
		getTemplateForRobloxComponent = p4.getTemplateForRobloxComponent,
		getTemplateIdForRCT = if FFlagSduiErrorPaths then p4.getTemplateIdForRCT else nil,
		getPropBuilder = GetPropBuilderModule,
		resolveLocalizedLiteral = function(p5, p6)
			-- upvalues: FFlagSduiErrorPaths (upval), AddSduiErrorContextFieldsModule (upval), SduiLoggerModule (upval), SduiErrorsModule (upval), AppPage (copy), FFlagSduiSharedLocalizedLiterals (upval), GetLocalizedLiteral (copy), LocalizedLiterals (copy)
			if typeof(p5) == "table" and p5.map_key then
				local MapKey = p5.map_key
				local v1 = if FFlagSduiSharedLocalizedLiterals then GetLocalizedLiteral(MapKey) else LocalizedLiterals and LocalizedLiterals[MapKey]
				
				if v1 == nil then
					local config = {
						message = `Could not find localized literal for mapKey: {tostring(MapKey)}, namespace: {p5.namespace}, key: {p5.key}`
					}
					
					if FFlagSduiErrorPaths then
						AddSduiErrorContextFieldsModule(config, p6)
					end
					SduiLoggerModule.reportError(SduiErrorsModule.SduiErrorType.FailedToResolveLocalizedLiteral, config, AppPage)
				end
				return v1
			else
				local config = {
					message = `Invalid translationRef: expected table with map_key, got {typeof(p5)}`
				}
				
				if FFlagSduiErrorPaths then
					AddSduiErrorContextFieldsModule(config, p6)
				end
				SduiLoggerModule.reportError(SduiErrorsModule.SduiErrorType.FailedToResolveLocalizedLiteral, config, AppPage)
				
				return nil
			end
		end,
		configKey = p4.configKey
	}
end