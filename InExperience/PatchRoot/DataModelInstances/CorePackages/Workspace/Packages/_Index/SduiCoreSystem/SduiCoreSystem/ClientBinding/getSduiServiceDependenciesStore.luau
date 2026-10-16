local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local SduiErrorsModule = require(SduiCoreSystem.SduiErrors)
local SduiLoggerModule = require(SduiCoreSystem.SduiLogger)
local _ = require(SduiCoreSystem.SduiBuilderTypes)

local function createSduiServiceDependenciesStore() --[[ Line: 20 ]]
	-- upvalues: SduiLoggerModule (copy), SduiErrorsModule (copy)
	local Dependencies = nil
	
	return {
		getDependencies = function(p1) --[[ Line: 27 ]]
			-- upvalues: Dependencies (ref), SduiLoggerModule (upval), SduiErrorsModule (upval)
			if Dependencies == nil then
				SduiLoggerModule.reportError(SduiErrorsModule.SduiErrorType.GetNilDependencies, { message = "Getting dependencies before they were set" }, p1)
			end
			return Dependencies
		end,
		setDependencies = function(Value) --[[ Line: 23 ]]
			-- upvalues: Dependencies (ref)
			Dependencies = Value
		end
	}
end

local v1 = nil

return function() --[[ Line: 44 | Named "getSduiServiceDependenciesStore" ]]
	-- upvalues: v1 (ref), createSduiServiceDependenciesStore (copy)
	if v1 == nil then
		v1 = createSduiServiceDependenciesStore()
	end
	return v1
end