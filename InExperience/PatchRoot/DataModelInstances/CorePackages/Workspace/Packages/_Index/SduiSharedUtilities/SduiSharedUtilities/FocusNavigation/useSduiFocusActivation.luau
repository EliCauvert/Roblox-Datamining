local ReactModule = require(script:FindFirstAncestor("SduiSharedUtilities").Parent.React)
local GetSduiFocusActivationStoreModule = require(script.Parent.getSduiFocusActivationStore)

return function(p1, p2) --[[ Line: 10 | Named "useSduiFocusActivation" ]]
	-- upvalues: ReactModule (copy), GetSduiFocusActivationStoreModule (copy)
	ReactModule.useEffect(function() --[[ Line: 11 ]]
		-- upvalues: p1 (copy), p2 (copy), GetSduiFocusActivationStoreModule (upval)
		if p1 == nil or p2 == nil then return end
		return GetSduiFocusActivationStoreModule().register(p1, p2)
	end, { p1, p2 })
end