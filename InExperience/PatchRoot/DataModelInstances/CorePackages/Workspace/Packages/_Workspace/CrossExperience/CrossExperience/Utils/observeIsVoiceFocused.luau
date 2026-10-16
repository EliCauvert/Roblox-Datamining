local CrossExperience = script:FindFirstAncestor("CrossExperience")
local ConstantsModule = require(CrossExperience.Constants)
local ObserveCurrentContextIdModule = require(CrossExperience.Utils.observeCurrentContextId)

return function(Callback) --[[ Line: 6 ]]
	-- upvalues: ObserveCurrentContextIdModule (copy), ConstantsModule (copy)
	local IsCONTEXTIDMatch = nil
	ObserveCurrentContextIdModule(function(CONTEXTID) --[[ Line: 8 ]]
		-- upvalues: ConstantsModule (upval), IsCONTEXTIDMatch (ref), Callback (copy)
		local IsCONTEXTIDMatch1 = CONTEXTID == ConstantsModule.AUDIO_FOCUS_MANAGEMENT.CEV.CONTEXT_ID
		
		if IsCONTEXTIDMatch1 ~= IsCONTEXTIDMatch then
			IsCONTEXTIDMatch = IsCONTEXTIDMatch1
			Callback(IsCONTEXTIDMatch)
		end
	end)
end