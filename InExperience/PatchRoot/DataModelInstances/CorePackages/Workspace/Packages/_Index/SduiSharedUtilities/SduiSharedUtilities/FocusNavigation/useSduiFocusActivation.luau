local reactModule = require(script:FindFirstAncestor("SduiSharedUtilities").Parent.React)
local getSduiFocusActivationStoreModule = require(script.Parent.getSduiFocusActivationStore)

return function(p0, p1)
	-- upvalues: reactModule (ref), getSduiFocusActivationStoreModule (ref)
	reactModule.useEffect(function()
		-- upvalues: p0 (ref), p1 (ref), getSduiFocusActivationStoreModule (copy)
		if p0 == nil or p1 == nil then
			return
		end
		return getSduiFocusActivationStoreModule().register(p0, p1)
	end, { p0, p1 })
end