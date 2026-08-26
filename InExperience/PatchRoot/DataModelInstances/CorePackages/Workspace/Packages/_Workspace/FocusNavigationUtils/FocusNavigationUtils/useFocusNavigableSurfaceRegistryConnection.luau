local focusNavigationUtils = script:FindFirstAncestor("FocusNavigationUtils")
local reactModule = require(focusNavigationUtils.Parent.React)
local focusNavigableSurfaceRegistryModule = require(focusNavigationUtils.FocusNavigableSurfaceRegistry)
local useRegisterFocusNavigableSurface = focusNavigableSurfaceRegistryModule.useRegisterFocusNavigableSurface
local useDeRegisterFocusNavigableSurface = focusNavigableSurfaceRegistryModule.useDeRegisterFocusNavigableSurface
local _ = require(focusNavigationUtils.FocusNavigableSurfaceIdentifierEnum)

return function(p1, p2, p3)
	-- upvalues: useRegisterFocusNavigableSurface (ref), useDeRegisterFocusNavigableSurface (ref), reactModule (ref)
	local var1 = useRegisterFocusNavigableSurface()
	local var2 = useDeRegisterFocusNavigableSurface()
	local var3 = p1 ~= nil and (p3 == nil or p3)
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), var1 (ref), p2 (ref), p1 (ref), var2 (ref)
		if var3 then
			var1(p2, p1)
		else
			var2(p2, p1)
		end
		return function()
			-- upvalues: var2 (copy), p2 (copy), p1 (copy)
			var2(p2, p1)
		end
	end, { var3, p2, p1 })
end