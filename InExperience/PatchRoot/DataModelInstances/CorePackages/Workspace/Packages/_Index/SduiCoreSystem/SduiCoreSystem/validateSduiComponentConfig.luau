local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local sduiComponentTypeModule = require(sduiCoreSystem.SduiComponentType)
local sduiErrorType = require(sduiCoreSystem.SduiErrors).SduiErrorType
local uiComponentInterface = require(sduiCoreSystem.SduiConfigTypes).UiComponentInterface
local validateInterfaceModule = require(sduiCoreSystem.validateInterface)

return function(p0, p1)
	-- upvalues: sduiErrorType (ref), validateInterfaceModule (ref), uiComponentInterface (ref), sduiComponentTypeModule (ref)
	if p0 == nil then
		return false, { errorType = sduiErrorType.NilComponentConfig }
	end
	assert(p0, "componentConfig must exist")
	local var3, var4 = validateInterfaceModule(p0, uiComponentInterface, p1)
	
	if not var3 then
		return false, {
			errorType = sduiErrorType.InvalidComponentConfig,
			message = var4
		}
	elseif sduiComponentTypeModule[p0.componentType] ~= nil then
		return true
	end
	return false, { errorType = sduiErrorType.ComponentTypeNotRecognized }
end