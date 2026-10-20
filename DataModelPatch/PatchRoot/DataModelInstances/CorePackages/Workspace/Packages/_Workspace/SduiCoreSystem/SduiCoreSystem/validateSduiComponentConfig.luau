local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local SduiComponentTypeModule = require(SduiCoreSystem.SduiComponentType)
local SduiErrorType = require(SduiCoreSystem.SduiErrors).SduiErrorType
local UiComponentInterface = require(SduiCoreSystem.SduiConfigTypes).UiComponentInterface
local ValidateInterfaceModule = require(SduiCoreSystem.validateInterface)

return function(p1, p2)
	-- upvalues: SduiErrorType (copy), ValidateInterfaceModule (copy), UiComponentInterface (copy), SduiComponentTypeModule (copy)
	if p1 == nil then
		return false, { errorType = SduiErrorType.NilComponentConfig }
	end
	assert(p1, "componentConfig must exist")
	local ValidateInterfaceModuleResult, ValidateInterfaceModuleResult2 = ValidateInterfaceModule(p1, UiComponentInterface, p2)
	
	if not ValidateInterfaceModuleResult then
		return false, {
			errorType = SduiErrorType.InvalidComponentConfig,
			message = ValidateInterfaceModuleResult2
		}
	elseif SduiComponentTypeModule[p1.componentType] ~= nil then
		return true
	else
		return false, { errorType = SduiErrorType.ComponentTypeNotRecognized }
	end
end