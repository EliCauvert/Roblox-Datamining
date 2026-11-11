local NotApprovedPage = script:FindFirstAncestor("NotApprovedPage")
local Parent = NotApprovedPage.Parent
local VRService = game:GetService("VRService")
local ReactModule = require(Parent.React)
local UseCallbackFunction = ReactModule.useCallback
local UseEffectFunction = ReactModule.useEffect
local UseMemoFunction = ReactModule.useMemo
local UseRefFunction = ReactModule.useRef
local UseStateFunction = ReactModule.useState
local FoundationModule = require(Parent.Foundation)
local Button = FoundationModule.Button
local ButtonSize = FoundationModule.Enums.ButtonSize
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local IconButton = FoundationModule.IconButton
local IconName = FoundationModule.Enums.IconName
local OverlayProvider = FoundationModule.OverlayProvider
local PopoverSide = FoundationModule.Enums.PopoverSide
local PopoverAlign = FoundationModule.Enums.PopoverAlign
local Popover = FoundationModule.Popover
local Radius = FoundationModule.Enums.Radius
local UseTokensFunction = FoundationModule.Hooks.useTokens
local View = FoundationModule.View
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local FocusNavigationEventNameEnum = FocusNavigationUtilsModule.FocusNavigationEventNameEnum
local UseAppFocusRootFunction = FocusNavigationUtilsModule.useAppFocusRoot
local GetVRSurfaceGuiModule = require(NotApprovedPage.Utils.getVRSurfaceGui)
local InputHandlersModule = require(Parent.InputHandlers)
local _ = require(Parent.ReactFocusNavigation)
local UseLogoutModule = require(NotApprovedPage.Utils.useLogout)
local UseNotApprovedPageContextFunction = require(NotApprovedPage.Contexts.NotApprovedPageContext).useNotApprovedPageContext

return ReactModule.memo(function(p1)
	-- upvalues: UseTokensFunction (copy), UseNotApprovedPageContextFunction (copy), UseStateFunction (copy), UseLogoutModule (copy), UseRefFunction (copy), VRService (copy), GetVRSurfaceGuiModule (copy), UseMemoFunction (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy), UseAppFocusRootFunction (copy), FocusNavigableSurfaceIdentifierEnum (copy), UseCallbackFunction (copy), UseEffectFunction (copy), ReactModule (copy), OverlayProvider (copy), Popover (copy), IconButton (copy), IconName (copy), ButtonVariant (copy), ButtonSize (copy), PopoverSide (copy), PopoverAlign (copy), Radius (copy), View (copy), Button (copy)
	local UseTokensResult = UseTokensFunction()
	local Translations = UseNotApprovedPageContextFunction().translations
	local UseStateResult, UseStateResult2 = UseStateFunction(false)
	local UseStateResult1, UseStateResult2_1 = UseStateFunction(false)
	local UseLogoutModuleResult = UseLogoutModule(UseStateResult2, p1.LogoutThunk)
	local UseRefResult = UseRefFunction(nil)
	local VRSurfaceGuiModule = if VRService.VREnabled then GetVRSurfaceGuiModule() else nil
	local UseAppFocusRootResult = UseAppFocusRootFunction({
		surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.ContextualMenu,
		isFocusable = UseStateResult1,
		customEventHandlers = UseMemoFunction(function()
			-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), UseStateResult2_1 (copy)
			return {
				[FocusNavigationEventNameEnum.NavigateBack] = {
					handler = InputHandlersModule.onRelease(function(p2)
						-- upvalues: UseStateResult2_1 (upval)
						p2.cancelled = true
						UseStateResult2_1(false)
					end)
				}
			}
		end, { UseStateResult2_1 })
	})
	local UseCallbackResult = UseCallbackFunction(function(Current)
		-- upvalues: UseRefResult (copy), UseAppFocusRootResult (copy)
		UseRefResult.current = Current
		
		if type(UseAppFocusRootResult) == "function" then
			UseAppFocusRootResult(Current)
		end
	end, { UseAppFocusRootResult })
	UseEffectFunction(function()
		-- upvalues: UseRefResult (copy)
		if UseRefResult and UseRefResult.current then
			UseRefResult.current.SelectionBehaviorDown = Enum.SelectionBehavior.Stop
			UseRefResult.current.SelectionBehaviorLeft = Enum.SelectionBehavior.Stop
			UseRefResult.current.SelectionBehaviorRight = Enum.SelectionBehavior.Stop
			UseRefResult.current.SelectionBehaviorUp = Enum.SelectionBehavior.Stop
			UseRefResult.current.SelectionGroup = true
		end
	end, { UseStateResult1 })
	local UseCallbackResult1 = UseCallbackFunction(function()
		-- upvalues: UseStateResult2_1 (copy)
		UseStateResult2_1(function(p2): boolean
			return not p2
		end)
	end, {})
	local UseCallbackResult2 = UseCallbackFunction(function()
		-- upvalues: UseStateResult2_1 (copy)
		UseStateResult2_1(false)
	end, {})
	
	return ReactModule.createElement(OverlayProvider, { gui = VRSurfaceGuiModule }, {
		PopoverMenu = ReactModule.createElement(Popover.Root, { isOpen = UseStateResult1 }, {
			Anchor = ReactModule.createElement(Popover.Anchor, nil, {
				MenuButton = ReactModule.createElement(IconButton, {
					testId = "header-menu-button",
					icon = IconName.ThreeDotsVertical,
					variant = ButtonVariant.Utility,
					onActivated = UseCallbackResult1,
					size = ButtonSize.Medium
				})
			}),
			Content = ReactModule.createElement(Popover.Content, {
				hasArrow = false,
				side = {
					position = PopoverSide.Bottom,
					offset = UseTokensResult.Padding.Small
				},
				align = PopoverAlign.End,
				backgroundStyle = UseTokensResult.Color.Surface.Surface_100,
				radius = Radius.Medium,
				onPressedOutside = UseCallbackResult2
			}, {
				MenuContent = ReactModule.createElement(View, {
					tag = "auto-xy radius-medium bg-surface-100 stroke-standard stroke-default padding-small",
					ref = UseCallbackResult
				}, {
					LogoutButton = ReactModule.createElement(Button, {
						text = Translations.logoutButton,
						onActivated = UseCallbackFunction(function()
							-- upvalues: UseCallbackResult2 (copy), UseLogoutModuleResult (copy)
							UseCallbackResult2()
							UseLogoutModuleResult()
						end, { UseLogoutModuleResult, UseCallbackResult2 }),
						isDisabled = UseStateResult,
						isLoading = UseStateResult,
						variant = ButtonVariant.Utility,
						size = ButtonSize.Small
					})
				})
			})
		})
	})
end)