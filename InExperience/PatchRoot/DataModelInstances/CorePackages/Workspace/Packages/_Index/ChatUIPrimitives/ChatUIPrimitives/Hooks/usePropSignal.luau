local Parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.Signals)
local UseStableSignalModule = require(script.Parent.useStableSignal)

return function(p1) --[[ Line: 25 | Named "usePropSignal" ]]
	-- upvalues: UseStableSignalModule (copy), ReactModule (copy)
	local UseStableSignalModuleResult, UseStableSignalModuleResult2 = UseStableSignalModule(p1)
	ReactModule.useEffect(function() --[[ Line: 27 ]]
		-- upvalues: UseStableSignalModuleResult (copy), p1 (copy), UseStableSignalModuleResult2 (copy)
		if UseStableSignalModuleResult(false) ~= p1 then
			UseStableSignalModuleResult2(p1)
		end
	end, {
		p1,
		UseStableSignalModuleResult,
		UseStableSignalModuleResult2
	})
	
	return UseStableSignalModuleResult
end