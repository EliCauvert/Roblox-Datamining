local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local RoactModule = require(CorePackages.Packages.Roact)
local Focusable = require(CorePackages.Packages.RoactGamepad).Focusable
local UseScreenSizeFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useScreenSize
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local FFlagUseNavigationSelectors = require(CorePackages.Workspace.Packages.SharedFlags).FFlagUseNavigationSelectors
local Selectors = require(CorePackages.Workspace.Packages.NavigationRodux).Selectors
local FFlagSignalsNavP3gAvatarExperience = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3gAvatarExperience
local UseSignalStateFunction = require(CorePackages.Packages.SignalsReact).useSignalState
local GetLegacyNavigationStore = if FFlagSignalsNavP3gAvatarExperience then require(CorePackages.Workspace.Packages.NavigationRodux).GetLegacyNavigationStore else nil
local AvatarExperienceNavigationModule = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation)
local AvatarScreen = AvatarExperienceNavigationModule.Enums.AvatarScreen
local UseAvatarRouteFunction = AvatarExperienceNavigationModule.AvatarRoute.Hooks.useAvatarRoute
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local FetchMySharedAvatarsModule = require(Modules.AvatarExperience.AvatarEditor.Thunks.FetchMySharedAvatars)
local NavigationUtilsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)
local NavOverlayContainerModule = require(Modules.AvatarExperience.Common.Components.NavOverlayContainer)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local Images = UIBloxModule.App.ImageSet.Images
local ContextualMenu = UIBloxModule.App.Menu.ContextualMenu
local MenuDirection = UIBloxModule.App.Menu.MenuDirection

return (require(Modules.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams)((require(Modules.AvatarExperience.Common.Components.withOverlayFocusHandling)(function(p1)
	-- upvalues: UseScreenSizeFunction (copy), UseNavigationFunction (copy), UseLocalizationFunction (copy), UseDispatchFunction (copy), UseRoactServiceModule (copy), RoactNetworkingModule (copy), ReactModule (copy), UseAvatarRouteFunction (copy), FFlagSignalsNavP3gAvatarExperience (copy), GetLegacyNavigationStore (copy), UseSignalStateFunction (copy), UseSelectorFunction (copy), FFlagUseNavigationSelectors (copy), Selectors (copy), NavigationUtilsModule (copy), AvatarScreen (copy), FetchMySharedAvatarsModule (copy), Images (copy), RoactModule (copy), NavOverlayContainerModule (copy), Focusable (copy), ContextualMenu (copy), MenuDirection (copy)
	local UseScreenSizeResult = UseScreenSizeFunction()
	local UseNavigationResult = UseNavigationFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		shareAvatar = "Feature.Avatar.Action.ShareAvatar",
		mySharedAvatar = "Feature.Avatar.Action.MySharedAvatars"
	})
	local UseDispatchResult = UseDispatchFunction()
	local UseRoactServiceModuleResult = UseRoactServiceModule(RoactNetworkingModule)
	local _, Binding2 = ReactModule.createBinding(UDim2.fromOffset(0, 0))
	local UseAvatarRouteResult = UseAvatarRouteFunction()
	local UseSignalStateResult = nil
	UseSignalStateResult = if FFlagSignalsNavP3gAvatarExperience then UseSignalStateFunction(GetLegacyNavigationStore(false).getHistory) else UseSelectorFunction(function(p2)
		-- upvalues: FFlagUseNavigationSelectors (upval), Selectors (upval)
		return if FFlagUseNavigationSelectors then Selectors.selectLegacyHistory(p2) else p2.Navigation.history
	end)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: NavigationUtilsModule (upval), UseNavigationResult (copy), AvatarScreen (upval), UseAvatarRouteResult (copy), UseSignalStateResult (ref)
		NavigationUtilsModule.closeOverlay(UseNavigationResult)
		NavigationUtilsModule.closeMySharedAvatars(UseNavigationResult)
		NavigationUtilsModule.navigateFromOverlay(UseNavigationResult, AvatarScreen.LookComposerPage, {
			prevNavPage = if UseAvatarRouteResult then UseAvatarRouteResult.opaque.name else nil,
			prevNavHistory = UseSignalStateResult
		})
	end, { UseNavigationResult })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseDispatchResult (copy), FetchMySharedAvatarsModule (upval), UseRoactServiceModuleResult (copy), NavigationUtilsModule (upval), UseNavigationResult (copy), AvatarScreen (upval)
		UseDispatchResult(FetchMySharedAvatarsModule(UseRoactServiceModuleResult))
		NavigationUtilsModule.navigateFromOverlay(UseNavigationResult, AvatarScreen.MySharedAvatars)
	end, {
		UseDispatchResult,
		UseNavigationResult,
		UseRoactServiceModuleResult
	})
	
	return RoactModule.createElement(NavOverlayContainerModule, {
		onAbsolutePositionChanged = ReactModule.useCallback(function(Frame: Frame)
			-- upvalues: Binding2 (copy)
			Binding2(UDim2.fromOffset(-Frame.AbsolutePosition.X, -Frame.AbsolutePosition.Y))
		end, {})
	}, {
		SizeFrame = RoactModule.createElement(Focusable.Frame, {
			BackgroundTransparency = 1,
			Position = UDim2.fromOffset(p1.entryButtonPosition.X - 300, 0),
			Size = UDim2.new(0, 324, 1, 0),
			ref = p1.defaultChildRef
		}, {
			PositionOffsetFrame = RoactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
				ContextMenu = RoactModule.createElement(ContextualMenu, {
					open = true,
					closeBackgroundVisible = true,
					buttonProps = ReactModule.useMemo(function()
						-- upvalues: UseLocalizationResult (copy), Images (upval), UseResult (copy), UseResult1 (copy)
						return {
							{
								iconSize = 36,
								inputBindingKey = "CommonUI.Controls.Action.Confirm",
								text = UseLocalizationResult.shareAvatar,
								icon = Images["icons/common/plus"],
								onActivated = UseResult
							},
							{
								iconSize = 36,
								inputBindingKey = "CommonUI.Controls.Action.Confirm",
								text = UseLocalizationResult.mySharedAvatar,
								icon = Images["icons/actions/friend_sort/my_profile"],
								onActivated = UseResult1
							}
						}
					end, { UseLocalizationResult, UseResult, UseResult1 }),
					contextMenuWidthOverride = UDim.new(0, 300),
					menuDirection = MenuDirection.Down,
					openPositionY = UDim.new(0, p1.entryButtonPosition.Y + 25),
					screenSize = UseScreenSizeResult
				})
			})
		})
	})
end))))