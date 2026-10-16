local _ = require(script.Parent.Parent.Types)
local CreateSignalFunction = require(script:FindFirstAncestor("Moments").Parent.Signals).createSignal

return function() --[[ Line: 26 | Named "createExperienceDetailsSheetStore" ]]
	-- upvalues: CreateSignalFunction (copy)
	local Signal, Signal2 = CreateSignalFunction(false)
	local Signal1, Signal2_1 = CreateSignalFunction(nil)
	
	return {
		getIsOpen = Signal,
		getContext = Signal1,
		open = function(p1) --[[ Line: 30 ]]
			-- upvalues: Signal2_1 (copy), Signal2 (copy)
			Signal2_1(p1)
			Signal2(true)
		end,
		close = function() --[[ Line: 35 ]]
			-- upvalues: Signal2 (copy)
			Signal2(false)
		end
	}
end