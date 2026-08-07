local parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local reactModule = require(parent.React)
local useOverlay = require(parent.Foundation).Hooks.useOverlay
local useFocusGuiObject = require(parent.ReactFocusNavigation).useFocusGuiObject
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local useFocusNavigableSurfaceRegistryConnection = focusNavigationUtilsModule.useFocusNavigableSurfaceRegistryConnection
local wasLastInputGamepad = require(parent.RoactUtils).wasLastInputGamepad

return function(p0) --[[ line: 14 ]]
	-- upvalues: useOverlay (ref), useFocusNavigableSurfaceRegistryConnection (ref), focusNavigableSurfaceIdentifierEnum (ref), useFocusGuiObject (ref), wasLastInputGamepad (ref), reactModule (ref)
	local var2 = useOverlay()
	useFocusNavigableSurfaceRegistryConnection(p0.current, focusNavigableSurfaceIdentifierEnum.CentralOverlay)
	local var3 = useFocusGuiObject()
	local var4 = wasLastInputGamepad()
	reactModule.useEffect(function() --[[ line: 22 ]]
		-- upvalues: p0 (ref), var2 (ref), var4 (ref), var3 (ref)
		if p0.current and var2 == nil and var4 then
			task.delay(0.1, function() --[[ line: 24 ]]
				-- upvalues: var3 (copy), p0 (copy)
				var3(p0.current)
			end)
		end
	end, { var3, var2, var4 })
	
	return var2
end