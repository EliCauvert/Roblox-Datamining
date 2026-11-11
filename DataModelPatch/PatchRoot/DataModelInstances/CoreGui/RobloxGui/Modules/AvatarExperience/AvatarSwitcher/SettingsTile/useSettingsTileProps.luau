local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local ResponsiveModule = require(CorePackages.Workspace.Packages.Responsive)
local ReactFocusNavigationModule = require(CorePackages.Packages.ReactFocusNavigation)
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local NavigateWithLockFunction = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Thunks.NavigateWithLock
local SlotBasedEditorAnalytics = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).Surfaces.SlotBasedEditorAnalytics

return function(p1, p2)
	-- upvalues: UseNavigationFunction (copy), UseDispatchFunction (copy), ReactFocusNavigationModule (copy), ResponsiveModule (copy), ReactModule (copy), SlotBasedEditorAnalytics (copy), AvatarScreen (copy), NavigateWithLockFunction (copy)
	local UseNavigationResult = UseNavigationFunction()
	local UseDispatchResult = UseDispatchFunction()
	local UseFocusGuiObjectResult = ReactFocusNavigationModule.useFocusGuiObject()
	local UsePreferredInputResult = ResponsiveModule.usePreferredInput()
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UsePreferredInputResult (copy), ResponsiveModule (upval), UseFocusGuiObjectResult (copy), p2 (copy)
		if UsePreferredInputResult == ResponsiveModule.Input.Directional then
			UseFocusGuiObjectResult(p2.current)
		end
	end, { UsePreferredInputResult, UseFocusGuiObjectResult })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: SlotBasedEditorAnalytics (upval), p2 (copy), UseNavigationResult (copy), AvatarScreen (upval), UseResult (copy)
		SlotBasedEditorAnalytics.trackSettingsTileClick()
		
		if p2.current then
			UseNavigationResult.navigate(AvatarScreen.CreateOrUpdateOutfitMenu, {
				saveTilePosition = p2.current.AbsolutePosition + p2.current.AbsoluteSize * Vector2.new(0.5, 0.5),
				onOverlayClosed = UseResult
			})
		end
	end, { UseNavigationResult, UseResult })
	
	return {
		index = p1.index,
		itemWidth = p1.itemWidth,
		onActivated = ReactModule.useCallback(function()
			-- upvalues: p2 (copy), UseDispatchResult (copy), NavigateWithLockFunction (upval), UseResult1 (copy)
			if p2.current then
				UseDispatchResult(NavigateWithLockFunction(UseResult1))
			end
		end, { UseDispatchResult, UseResult1 }),
		squareAspectRatio = p1.squareAspectRatio
	}
end