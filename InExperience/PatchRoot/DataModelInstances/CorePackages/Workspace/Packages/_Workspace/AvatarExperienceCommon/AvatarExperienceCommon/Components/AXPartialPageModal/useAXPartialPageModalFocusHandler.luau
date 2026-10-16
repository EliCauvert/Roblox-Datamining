local Parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local ReactModule = require(Parent.React)
local UseOverlayFunction = require(Parent.Foundation).Hooks.useOverlay
local UseFocusGuiObjectFunction = require(Parent.ReactFocusNavigation).useFocusGuiObject
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local UseFocusNavigableSurfaceRegistryConnectionFunction = FocusNavigationUtilsModule.useFocusNavigableSurfaceRegistryConnection
local WasLastInputGamepadFunction = require(Parent.RoactUtils).wasLastInputGamepad

return function(p1) --[[ Line: 14 ]]
	-- upvalues: UseOverlayFunction (copy), UseFocusNavigableSurfaceRegistryConnectionFunction (copy), FocusNavigableSurfaceIdentifierEnum (copy), UseFocusGuiObjectFunction (copy), WasLastInputGamepadFunction (copy), ReactModule (copy)
	local UseOverlayResult = UseOverlayFunction()
	UseFocusNavigableSurfaceRegistryConnectionFunction(p1.current, FocusNavigableSurfaceIdentifierEnum.CentralOverlay)
	local UseFocusGuiObjectResult = UseFocusGuiObjectFunction()
	local WasLastInputGamepadResult = WasLastInputGamepadFunction()
	ReactModule.useEffect(function() --[[ Line: 22 ]]
		-- upvalues: p1 (copy), UseOverlayResult (copy), WasLastInputGamepadResult (copy), UseFocusGuiObjectResult (copy)
		if p1.current and UseOverlayResult == nil and WasLastInputGamepadResult then
			task.delay(0.1, function() --[[ Line: 24 ]]
				-- upvalues: UseFocusGuiObjectResult (upval), p1 (upval)
				UseFocusGuiObjectResult(p1.current)
			end)
		end
	end, {
		UseFocusGuiObjectResult,
		UseOverlayResult,
		WasLastInputGamepadResult
	})
	
	return UseOverlayResult
end