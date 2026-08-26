local reactModule = require(script:FindFirstAncestor("SduiSharedUtilities").Parent.React)
local getSduiFocusActivationStoreModule = require(script.Parent.getSduiFocusActivationStore)

return function(p1, p2)
	-- upvalues: reactModule (ref), getSduiFocusActivationStoreModule (ref)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), p2 (ref), getSduiFocusActivationStoreModule (copy)
		if p1 == nil or p2 == nil then
			return
		end
		return getSduiFocusActivationStoreModule().register(p1, p2)
	end, { p1, p2 })
end