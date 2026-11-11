local ReactModule = require(script:FindFirstAncestor("SduiSharedUtilities").Parent.React)
local GetSduiFocusActivationStoreModule = require(script.Parent.getSduiFocusActivationStore)

return function(p1, p2)
	-- upvalues: ReactModule (copy), GetSduiFocusActivationStoreModule (copy)
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), p2 (copy), GetSduiFocusActivationStoreModule (upval)
		if p1 == nil or p2 == nil then return end
		return GetSduiFocusActivationStoreModule().register(p1, p2)
	end, { p1, p2 })
end