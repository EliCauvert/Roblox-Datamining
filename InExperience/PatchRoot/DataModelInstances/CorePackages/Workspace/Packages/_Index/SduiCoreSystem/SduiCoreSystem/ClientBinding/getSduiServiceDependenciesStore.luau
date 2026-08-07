local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local sduiErrorsModule = require(sduiCoreSystem.SduiErrors)
local sduiLoggerModule = require(sduiCoreSystem.SduiLogger)
local _ = require(sduiCoreSystem.SduiBuilderTypes)

local function createSduiServiceDependenciesStore() --[[ line: 20 ]]
	-- upvalues: sduiLoggerModule (ref), sduiErrorsModule (ref)
	local var5 = nil
	
	return {
		getDependencies = function(p0) --[[ line: 27 ]]
			-- upvalues: var5 (write), sduiLoggerModule (copy), sduiErrorsModule (copy)
			if var5 == nil then
				sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.GetNilDependencies, { message = "Getting dependencies before they were set" }, p0)
			end
			return var5
		end,
		setDependencies = function(value) --[[ line: 23 ]]
			-- upvalues: var5 (write)
			var5 = value
		end
	}
end

local var4 = nil

return function() --[[ line: 44 | named "getSduiServiceDependenciesStore" ]]
	-- upvalues: var4 (write), createSduiServiceDependenciesStore (ref)
	if var4 == nil then
		var4 = createSduiServiceDependenciesStore()
	end
	return var4
end