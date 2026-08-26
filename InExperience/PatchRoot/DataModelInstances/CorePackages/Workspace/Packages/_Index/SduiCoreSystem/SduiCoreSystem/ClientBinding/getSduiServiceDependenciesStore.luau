local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local sduiErrorsModule = require(sduiCoreSystem.SduiErrors)
local sduiLoggerModule = require(sduiCoreSystem.SduiLogger)
local _ = require(sduiCoreSystem.SduiBuilderTypes)

local function createSduiServiceDependenciesStore()
	-- upvalues: sduiLoggerModule (ref), sduiErrorsModule (ref)
	local var1 = nil
	
	return {
		getDependencies = function(p1)
			-- upvalues: var1 (write), sduiLoggerModule (copy), sduiErrorsModule (copy)
			if var1 == nil then
				sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.GetNilDependencies, { message = "Getting dependencies before they were set" }, p1)
			end
			return var1
		end,
		setDependencies = function(value)
			-- upvalues: var1 (write)
			var1 = value
		end
	}
end

local var1 = nil

return function()
	-- upvalues: var1 (write), createSduiServiceDependenciesStore (ref)
	if var1 == nil then
		var1 = createSduiServiceDependenciesStore()
	end
	return var1
end