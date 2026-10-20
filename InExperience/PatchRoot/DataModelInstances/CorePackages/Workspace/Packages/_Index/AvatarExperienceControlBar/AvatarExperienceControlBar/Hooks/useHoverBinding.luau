local Parent = script:FindFirstAncestor("AvatarExperienceControlBar").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)

return function()
	-- upvalues: ReactModule (copy), FoundationModule (copy)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(false)
	
	return UseBindingResult, (ReactModule.useCallback(function(Default)
		-- upvalues: FoundationModule (upval), UseBindingResult2 (copy)
		if Default == FoundationModule.Enums.ControlState.Default then
			UseBindingResult2(false)
			
			return
		end
		if Default == FoundationModule.Enums.ControlState.Hover then
			UseBindingResult2(true)
		end
	end, {}))
end