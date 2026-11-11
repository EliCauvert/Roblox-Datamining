local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local FoundationModule = require(CorePackages.Packages.Foundation)
local ReactModule = require(CorePackages.Packages.React)
local ReactFocusNavigationModule = require(CorePackages.Packages.ReactFocusNavigation)
local InputHandlersModule = require(CorePackages.Packages.InputHandlers)
local FocusNavigationEventNameEnum = require(CorePackages.Workspace.Packages.FocusNavigationUtils).FocusNavigationEventNameEnum
local AvatarExperienceCommonModule = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local UseTableWrappedCallbackRefFunction = AvatarExperienceCommonModule.Utils.RoactGamepadMigration.useTableWrappedCallbackRef
local GetSafeAreaSizeFunction = require(CorePackages.Workspace.Packages.InputUi).getSafeAreaSize
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local AvatarExperienceControlBarModule = require(CorePackages.Workspace.Packages.AvatarExperienceControlBar)
local IconOnlyMenu = AvatarExperienceControlBarModule.IconOnlyMenu
local MenuItemEnum = AvatarExperienceControlBarModule.Enums.MenuItemEnum
local AdaptiveScrollingViewModule = require(Modules.AvatarExperience.Common.Components.AdaptiveScrollingView)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local GamepadFocusHandlerForPageModule = require(Modules.AvatarExperience.Common.Components.GamepadFocusHandlerForPage)
local SceneInteractionFrameModule = require(Modules.AvatarExperience.Common.Components.Scene.SceneInteractionFrame)
local UseFullViewModule = require(Modules.AvatarExperience.Common.Hooks.useFullView)
local FullView = AvatarExperienceCommonModule.Enums.FullView
local BottomInsetBackgroundModule = require(Modules.AvatarExperience.Common.Components.BottomInsetBackground)
local TopBarModule = require(Modules.LuaApp.Components.TopBar.TopBar)
local PhotoboothScenesContainerModule = require(Modules.AvatarExperience.Photobooth.Components.Scenes.PhotoboothScenesContainer)
local PhotoboothAnimationsContainerModule = require(Modules.AvatarExperience.Photobooth.Components.Animations.PhotoboothAnimationsContainer)
local PhotoboothShareModalModule = require(Modules.AvatarExperience.Photobooth.Components.PhotoboothShareModal)
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local FFlagAXPhotoboothBugBashFixes = AvatarExperienceFlagsModule.FFlagAXPhotoboothBugBashFixes
local FFlagAXMigrateAXToGlobalAutofocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus
local FFlagAXPhotoboothShareModal = AvatarExperienceFlagsModule.FFlagAXPhotoboothShareModal
local Focusable = require(CorePackages.Packages.RoactGamepad).Focusable
local NewPeekHeaderHeight = if FFlagAXPhotoboothBugBashFixes then ConstantsModule.PeekHeaderHeight + ConstantsModule.MainNavPhotoboothHeight else ConstantsModule.PeekHeaderHeight + ConstantsModule.MainNavHeight + ConstantsModule.SubNavHeight

local function selectGlobalGuiInset(p1)
	return p1.GlobalGuiInset
end

local function selectScreenSize(p1)
	return p1.ScreenSize
end

local config = {
	[Enum.KeyCode.ButtonB] = FocusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = FocusNavigationEventNameEnum.NavigateBack
}

local function useFocusNavigationBindings(p1, Callback)
	-- upvalues: ReactFocusNavigationModule (copy), config (copy), ReactModule (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy)
	return ReactFocusNavigationModule.useEventHandlerMap(ReactModule.useMemo(function()
		-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), Callback (copy)
		return {
			[FocusNavigationEventNameEnum.NavigateBack] = {
				handler = InputHandlersModule.onRelease(function(p2)
					-- upvalues: Callback (upval)
					p2.cancelled = true
					Callback()
				end)
			}
		}
	end, { Callback }), (ReactFocusNavigationModule.useEventMap(config, p1)))
end

return function(p1)
	-- upvalues: FFlagAXMigrateAXToGlobalAutofocus (copy), ReactModule (copy), UseLocalizationFunction (copy), UseFullViewModule (copy), FFlagAXPhotoboothBugBashFixes (copy), FullView (copy), UseSelectorFunction (copy), selectGlobalGuiInset (copy), selectScreenSize (copy), GetSafeAreaSizeFunction (copy), ConstantsModule (copy), MenuItemEnum (copy), useFocusNavigationBindings (copy), UseTableWrappedCallbackRefFunction (copy), AdaptiveScrollingViewModule (copy), NewPeekHeaderHeight (copy), FoundationModule (copy), PhotoboothAnimationsContainerModule (copy), PhotoboothScenesContainerModule (copy), Focusable (copy), GamepadFocusHandlerForPageModule (copy), TopBarModule (copy), SceneInteractionFrameModule (copy), IconOnlyMenu (copy), BottomInsetBackgroundModule (copy), FFlagAXPhotoboothShareModal (copy), PhotoboothShareModalModule (copy)
	local Tokens = p1.tokens
	local FocusController = if FFlagAXMigrateAXToGlobalAutofocus then nil else p1.focusController
	local UseRefResult = ReactModule.useRef(nil)
	local UseLocalizationResult = UseLocalizationFunction({ Photobooth = "Feature.Avatar.Label.Photobooth" })
	local _, UseFullViewModuleResult2 = UseFullViewModule()
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: FFlagAXPhotoboothBugBashFixes (upval), p1 (copy), UseFullViewModuleResult2 (copy), FullView (upval)
		if FFlagAXPhotoboothBugBashFixes and p1.isPortrait then
			UseFullViewModuleResult2(FullView.None)
		end
	end, { UseFullViewModuleResult2, p1.isPortrait })
	local UseSelectorResult = UseSelectorFunction(selectGlobalGuiInset)
	local UseSelectorResult1 = UseSelectorFunction(selectScreenSize)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseSelectorResult1 (copy), UseSelectorResult (copy), p1 (copy)
		return UseSelectorResult1.Y - UseSelectorResult.bottom - p1.topBarHeight
	end, {
		UseSelectorResult1.Y,
		UseSelectorResult.bottom,
		p1.topBarHeight
	})
	local UseMemoResultDelta = UseMemoResult - ReactModule.useMemo(function()
		-- upvalues: GetSafeAreaSizeFunction (upval), UseSelectorResult1 (copy), UseSelectorResult (copy), ConstantsModule (upval)
		return GetSafeAreaSizeFunction(UseSelectorResult1, UseSelectorResult).Y.Offset * ConstantsModule.PortraitSceneHeight
	end, { UseSelectorResult1, UseSelectorResult })
	local UseStateResult, UseStateResult2 = ReactModule.useState(Vector2.new(0, 0))
	local UseResult1 = ReactModule.useCallback(function(Frame: Frame)
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(Vector2.new(Frame.AbsoluteSize.X, Frame.AbsoluteSize.Y))
	end, {})
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: p1 (copy)
		p1.onBackButtonPressed()
	end, { p1.onBackButtonPressed })
	ReactModule.useEffect(function()
		-- upvalues: FFlagAXPhotoboothBugBashFixes (upval), p1 (copy), UseFullViewModuleResult2 (copy), FullView (upval), MenuItemEnum (upval)
		if FFlagAXPhotoboothBugBashFixes and not p1.isPortrait then
			UseFullViewModuleResult2(FullView.SceneFullView)
			
			return
		end
		if p1.activeMenuItemId == "" then
			UseFullViewModuleResult2(FullView.SceneFullView)
			
			return
		end
		if FFlagAXPhotoboothBugBashFixes and (p1.activeMenuItemId == MenuItemEnum.Photobooth.Animations or p1.activeMenuItemId == MenuItemEnum.Photobooth.Scenes) and p1.isPortrait then
			UseFullViewModuleResult2(FullView.None)
		end
	end, { p1.activeMenuItemId, p1.isPortrait })
	local IsNotActiveMenuItemIdMatch: boolean = FFlagAXPhotoboothBugBashFixes and (p1.isPortrait and (UseSelectorResult.bottom > 0 and p1.activeMenuItemId ~= ""))
	
	return ReactModule.createElement(Focusable.Frame, {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		focusController = if FFlagAXMigrateAXToGlobalAutofocus then nil else FocusController,
		defaultChild = UseRefResult,
		ref = UseTableWrappedCallbackRefFunction((useFocusNavigationBindings(nil, UseResult2)))
	}, {
		GamepadFocusHandlerForPage = if FFlagAXMigrateAXToGlobalAutofocus then nil else ReactModule.createElement(GamepadFocusHandlerForPageModule, {
			captureFocusOnMount = true,
			focusController = FocusController
		}),
		PhotoboothTopBar = ReactModule.createElement(TopBarModule.Container, {
			transparentBackground = true,
			ZIndex = 4,
			titleText = UseLocalizationResult.Photobooth,
			leftItem = TopBarModule.makeBackButton(p1.onBackButtonPressed),
			ref = UseRefResult
		}),
		SceneInteraction = ReactModule.createElement(SceneInteractionFrameModule),
		PBControlBarContainer = ReactModule.createElement(FoundationModule.View, {
			tag = "auto-xy col gap-small",
			ZIndex = 2,
			Position = UDim2.fromOffset(Tokens.Size.Size_500, p1.topBarHeight),
			onAbsoluteSizeChanged = UseResult1
		}, {
			FirstMenu = ReactModule.createElement(IconOnlyMenu, {
				direction = "vertical",
				LayoutOrder = 1,
				items = p1.firstMenuItems,
				activeItemId = p1.activeMenuItemId,
				onItemActivated = p1.onMenuItemActivated
			}),
			SecondMenu = ReactModule.createElement(IconOnlyMenu, {
				direction = "vertical",
				LayoutOrder = 2,
				items = p1.secondMenuItems,
				activeItemId = p1.activeMenuItemId,
				onItemActivated = p1.onMenuItemActivated
			})
		}),
		FlashOverlay = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ZIndex = 10000,
			Visible = true,
			Size = UDim2.fromScale(1, 1),
			Position = UDim2.fromScale(0, 0),
			BackgroundColor3 = Tokens.Color.OverMedia.OverMedia_0.Color3,
			ref = p1.flashRef
		}),
		ActiveComponent = ReactModule.createElement(FoundationModule.View, { tag = "size-full-full", ZIndex = 3 }, {
			Content = ReactModule.useMemo(function()
				-- upvalues: p1 (copy), MenuItemEnum (upval), ReactModule (upval), AdaptiveScrollingViewModule (upval), UseMemoResult (copy), UseMemoResultDelta (copy), NewPeekHeaderHeight (upval), FFlagAXPhotoboothBugBashFixes (upval), FoundationModule (upval), Tokens (copy), PhotoboothAnimationsContainerModule (upval), UseResult (copy), PhotoboothScenesContainerModule (upval), UseStateResult (copy)
				if p1.isPortrait then
					if p1.activeMenuItemId == MenuItemEnum.Photobooth.Animations then
						return (ReactModule.createElement(AdaptiveScrollingViewModule, {
							fullHeight = UseMemoResult,
							midHeight = UseMemoResultDelta,
							alwaysShowingHeight = NewPeekHeaderHeight,
							topBarHeight = p1.topBarHeight,
							fullHeightOptions = {
								opaqueBackground = true,
								draggerToDivider = not FFlagAXPhotoboothBugBashFixes
							}
						}, {
							AnimationContent = ReactModule.createElement(FoundationModule.View, {
								tag = "padding-x-large col gap-small",
								backgroundStyle = {
									Transparency = 0,
									Color3 = Tokens.Color.OverMedia.OverMedia_0.Color3
								},
								Size = UDim2.new(1, 0, 1, 0)
							}, {
								PhotoboothAnimationsContainer = ReactModule.createElement(PhotoboothAnimationsContainerModule, {
									Position = UDim2.fromOffset(0, 0),
									onTileClicked = UseResult
								})
							})
						}))
					elseif p1.activeMenuItemId == MenuItemEnum.Photobooth.Scenes then
						return (ReactModule.createElement(AdaptiveScrollingViewModule, {
							fullHeight = UseMemoResult,
							midHeight = UseMemoResultDelta,
							alwaysShowingHeight = NewPeekHeaderHeight,
							topBarHeight = p1.topBarHeight,
							fullHeightOptions = {
								opaqueBackground = true,
								draggerToDivider = not FFlagAXPhotoboothBugBashFixes
							}
						}, {
							ScenesContent = ReactModule.createElement(FoundationModule.View, {
								tag = "padding-x-large col gap-small",
								backgroundStyle = {
									Transparency = 0,
									Color3 = Tokens.Color.OverMedia.OverMedia_0.Color3
								},
								Size = UDim2.new(1, 0, 1, 0)
							}, {
								ScenesContainer = ReactModule.createElement(PhotoboothScenesContainerModule, {
									Position = UDim2.fromOffset(0, 0),
									onTileClicked = UseResult
								})
							})
						}))
					end
				elseif p1.activeMenuItemId == MenuItemEnum.Photobooth.Animations then
					return (ReactModule.createElement(FoundationModule.View, {
						tag = "padding-y-medium padding-x-large radius-medium col gap-small",
						backgroundStyle = Tokens.Color.OverMedia.OverMedia_0,
						Size = UDim2.new(0.4, 0, 0.7, 0),
						Position = UDim2.fromOffset(UseStateResult.X + (Tokens.Size.Size_500 + Tokens.Size.Size_300), p1.topBarHeight)
					}, {
						AnimationContent = ReactModule.createElement(PhotoboothAnimationsContainerModule, {
							Position = UDim2.fromOffset(0, 0),
							onTileClicked = UseResult
						})
					}))
				elseif p1.activeMenuItemId == MenuItemEnum.Photobooth.Scenes then
					return (ReactModule.createElement(FoundationModule.View, {
						tag = "padding-y-medium padding-x-large radius-medium col gap-small",
						backgroundStyle = Tokens.Color.OverMedia.OverMedia_0,
						Size = UDim2.new(0.4, 0, 0.7, 0),
						Position = UDim2.fromOffset(UseStateResult.X + (Tokens.Size.Size_500 + Tokens.Size.Size_300), p1.topBarHeight)
					}, {
						ScenesContent = ReactModule.createElement(PhotoboothScenesContainerModule, {
							Position = UDim2.fromOffset(0, 0),
							onTileClicked = UseResult
						})
					}))
				end
				return (ReactModule.createElement(FoundationModule.View, {}))
			end, {
				p1.activeMenuItemId,
				p1.isPortrait,
				UseStateResult,
				p1.topBarHeight,
				Tokens
			})
		}),
		BottomInsetBackground = if FFlagAXPhotoboothBugBashFixes and IsNotActiveMenuItemIdMatch then ReactModule.createElement(BottomInsetBackgroundModule, { globalGuiInset = UseSelectorResult }) else nil,
		ShareModal = if FFlagAXPhotoboothShareModal and (p1.isShareModalVisible and p1.onShareModalClose) then ReactModule.createElement(PhotoboothShareModalModule, {
			isVisible = p1.isShareModalVisible or false,
			screenshotPath = p1.screenshotPath,
			onClose = p1.onShareModalClose
		}) else nil
	})
end