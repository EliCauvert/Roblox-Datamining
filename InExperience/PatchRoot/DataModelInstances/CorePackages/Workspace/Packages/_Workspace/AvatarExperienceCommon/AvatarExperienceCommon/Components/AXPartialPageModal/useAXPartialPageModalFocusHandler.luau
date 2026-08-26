local parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local reactModule = require(parent.React)
local useOverlay = require(parent.Foundation).Hooks.useOverlay
local useFocusGuiObject = require(parent.ReactFocusNavigation).useFocusGuiObject
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local useFocusNavigableSurfaceRegistryConnection = focusNavigationUtilsModule.useFocusNavigableSurfaceRegistryConnection
local wasLastInputGamepad = require(parent.RoactUtils).wasLastInputGamepad

return function(p1)
	-- upvalues: useOverlay (ref), useFocusNavigableSurfaceRegistryConnection (ref), focusNavigableSurfaceIdentifierEnum (ref), useFocusGuiObject (ref), wasLastInputGamepad (ref), reactModule (ref)
	local var1 = useOverlay()
	useFocusNavigableSurfaceRegistryConnection(p1.current, focusNavigableSurfaceIdentifierEnum.CentralOverlay)
	local var2 = useFocusGuiObject()
	local var3 = wasLastInputGamepad()
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var1 (ref), var3 (ref), var2 (ref)
		if p1.current and var1 == nil and var3 then
			task.delay(0.1, function()
				-- upvalues: var2 (copy), p1 (copy)
				var2(p1.current)
			end)
		end
	end, { var2, var1, var3 })
	
	return var1
end