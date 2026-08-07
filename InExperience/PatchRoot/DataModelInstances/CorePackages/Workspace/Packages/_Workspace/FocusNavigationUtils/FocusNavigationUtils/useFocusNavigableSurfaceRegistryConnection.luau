local focusNavigationUtils = script:FindFirstAncestor("FocusNavigationUtils")
local reactModule = require(focusNavigationUtils.Parent.React)
local focusNavigableSurfaceRegistryModule = require(focusNavigationUtils.FocusNavigableSurfaceRegistry)
local useRegisterFocusNavigableSurface = focusNavigableSurfaceRegistryModule.useRegisterFocusNavigableSurface
local useDeRegisterFocusNavigableSurface = focusNavigableSurfaceRegistryModule.useDeRegisterFocusNavigableSurface
local _ = require(focusNavigationUtils.FocusNavigableSurfaceIdentifierEnum)

return function(p0, p1, p2) --[[ line: 17 ]]
	-- upvalues: useRegisterFocusNavigableSurface (ref), useDeRegisterFocusNavigableSurface (ref), reactModule (ref)
	local var3 = useRegisterFocusNavigableSurface()
	local var4 = useDeRegisterFocusNavigableSurface()
	local var5 = p0 ~= nil and (p2 == nil or p2)
	reactModule.useEffect(function() --[[ line: 26 ]]
		-- upvalues: var5 (ref), var3 (ref), p1 (ref), p0 (ref), var4 (ref)
		if var5 then
			var3(p1, p0)
		else
			var4(p1, p0)
		end
		return function() --[[ line: 33 ]]
			-- upvalues: var4 (copy), p1 (copy), p0 (copy)
			var4(p1, p0)
		end
	end, { var5, p1, p0 })
end