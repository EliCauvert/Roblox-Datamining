local parent = script.Parent.Parent
local analyticsModule = require(parent.Analytics)
local _ = require(parent.util.Types)

return function(p1, p2)
	-- upvalues: analyticsModule (ref)
	local assetTypeEnum = p2.assetTypeEnum
	
	if #p1 == 0 then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateSingleInstance_ZeroInstances, nil, p2)
		
		return false, {
			string.format("Failed to find an instance of the asset type '%s'. Make sure one exists and try again.", assetTypeEnum.Name)
		}
	elseif #p1 > 1 then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateSingleInstance_MultipleInstances, nil, p2)
		
		return false, {
			string.format("Selected more than one instance of type '%s'. Please, select a single instance of this type and try again.", assetTypeEnum.Name)
		}
	end
	return true
end