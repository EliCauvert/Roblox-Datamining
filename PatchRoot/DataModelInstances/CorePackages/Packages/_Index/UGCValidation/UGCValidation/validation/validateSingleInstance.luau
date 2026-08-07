-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:44 2026 Pacific Standard Time.

local parent = script.Parent.Parent
local analyticsModule = require(parent.Analytics)
local _ = require(parent.util.Types)

return function(p0, p1) --[[ line: 7 | named "validateSingleInstance" ]]
	-- upvalues: analyticsModule (ref)
	local assetTypeEnum = p1.assetTypeEnum
	
	if #p0 == 0 then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateSingleInstance_ZeroInstances, nil, p1)
		
		return false, {
			string.format("Failed to find an instance of the asset type '%s'. Make sure one exists and try again.", assetTypeEnum.Name)
		}
	elseif #p0 > 1 then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateSingleInstance_MultipleInstances, nil, p1)
		
		return false, {
			string.format("Selected more than one instance of type '%s'. Please, select a single instance of this type and try again.", assetTypeEnum.Name)
		}
	end
	return true
end