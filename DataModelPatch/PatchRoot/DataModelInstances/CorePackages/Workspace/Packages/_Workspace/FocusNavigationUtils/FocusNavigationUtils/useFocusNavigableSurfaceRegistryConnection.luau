local FocusNavigationUtils = script:FindFirstAncestor("FocusNavigationUtils")
local ReactModule = require(FocusNavigationUtils.Parent.React)
local FocusNavigableSurfaceRegistryModule = require(FocusNavigationUtils.FocusNavigableSurfaceRegistry)
local UseRegisterFocusNavigableSurfaceFunction = FocusNavigableSurfaceRegistryModule.useRegisterFocusNavigableSurface
local UseDeRegisterFocusNavigableSurfaceFunction = FocusNavigableSurfaceRegistryModule.useDeRegisterFocusNavigableSurface
local _ = require(FocusNavigationUtils.FocusNavigableSurfaceIdentifierEnum)

return function(p1, p2, p3)
	-- upvalues: UseRegisterFocusNavigableSurfaceFunction (copy), UseDeRegisterFocusNavigableSurfaceFunction (copy), ReactModule (copy)
	local UseRegisterFocusNavigableSurfaceResult = UseRegisterFocusNavigableSurfaceFunction()
	local UseDeRegisterFocusNavigableSurfaceResult = UseDeRegisterFocusNavigableSurfaceFunction()
	local v1 = p1 ~= nil and (p3 == nil or p3)
	ReactModule.useEffect(function()
		-- upvalues: v1 (copy), UseRegisterFocusNavigableSurfaceResult (copy), p2 (copy), p1 (copy), UseDeRegisterFocusNavigableSurfaceResult (copy)
		if v1 then
			UseRegisterFocusNavigableSurfaceResult(p2, p1)
		else
			UseDeRegisterFocusNavigableSurfaceResult(p2, p1)
		end
		return function()
			-- upvalues: UseDeRegisterFocusNavigableSurfaceResult (upval), p2 (upval), p1 (upval)
			UseDeRegisterFocusNavigableSurfaceResult(p2, p1)
		end
	end, { v1, p2, p1 })
end