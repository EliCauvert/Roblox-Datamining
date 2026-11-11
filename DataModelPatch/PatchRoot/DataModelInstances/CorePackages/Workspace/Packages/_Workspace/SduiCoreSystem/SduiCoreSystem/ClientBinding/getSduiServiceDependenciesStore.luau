local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local SduiErrorsModule = require(SduiCoreSystem.SduiErrors)
local SduiLoggerModule = require(SduiCoreSystem.SduiLogger)
local _ = require(SduiCoreSystem.SduiBuilderTypes)

local function createSduiServiceDependenciesStore()
	-- upvalues: SduiLoggerModule (copy), SduiErrorsModule (copy)
	local Dependencies = nil
	
	return {
		getDependencies = function(p1)
			-- upvalues: Dependencies (ref), SduiLoggerModule (upval), SduiErrorsModule (upval)
			if Dependencies == nil then
				SduiLoggerModule.reportError(SduiErrorsModule.SduiErrorType.GetNilDependencies, { message = "Getting dependencies before they were set" }, p1)
			end
			return Dependencies
		end,
		setDependencies = function(Value)
			-- upvalues: Dependencies (ref)
			Dependencies = Value
		end
	}
end

local v1 = nil

return function()
	-- upvalues: v1 (ref), createSduiServiceDependenciesStore (copy)
	if v1 == nil then
		v1 = createSduiServiceDependenciesStore()
	end
	return v1
end