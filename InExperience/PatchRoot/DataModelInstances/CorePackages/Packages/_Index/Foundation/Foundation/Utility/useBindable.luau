local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local ReactModule = require(Parent.React)
local ReactIsModule = require(Parent.ReactIs)
local _ = require(Foundation.Components.Types)

return function(p1) --[[ Line: 10 | Named "useBindable" ]]
	-- upvalues: ReactModule (copy), ReactIsModule (copy)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(nil)
	
	if ReactIsModule.isBinding(p1) then
		return p1
	else
		UseBindingResult2(p1)
		
		return UseBindingResult
	end
end