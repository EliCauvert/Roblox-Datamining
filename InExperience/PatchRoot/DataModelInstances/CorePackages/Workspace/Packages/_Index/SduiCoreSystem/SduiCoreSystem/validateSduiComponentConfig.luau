local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local sduiComponentTypeModule = require(sduiCoreSystem.SduiComponentType)
local sduiErrorType = require(sduiCoreSystem.SduiErrors).SduiErrorType
local uiComponentInterface = require(sduiCoreSystem.SduiConfigTypes).UiComponentInterface
local validateInterfaceModule = require(sduiCoreSystem.validateInterface)

return function(p1, p2)
	-- upvalues: sduiErrorType (ref), validateInterfaceModule (ref), uiComponentInterface (ref), sduiComponentTypeModule (ref)
	if p1 == nil then
		return false, { errorType = sduiErrorType.NilComponentConfig }
	end
	assert(p1, "componentConfig must exist")
	local var1, var2 = validateInterfaceModule(p1, uiComponentInterface, p2)
	
	if not var1 then
		return false, {
			errorType = sduiErrorType.InvalidComponentConfig,
			message = var2
		}
	elseif sduiComponentTypeModule[p1.componentType] ~= nil then
		return true
	end
	return false, { errorType = sduiErrorType.ComponentTypeNotRecognized }
end