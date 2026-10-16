local Parent = script:FindFirstAncestor("FlyoutSidePanel").Parent
local ReactModule = require(Parent.React)
local BuilderIconsModule = require(Parent.BuilderIcons)
local FoundationModule = require(Parent.Foundation)
local Icon = FoundationModule.Icon
local IconSize = FoundationModule.Enums.IconSize
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseSetDrawerVisibleFunction = require(Parent.Drawer).Hooks.useSetDrawerVisible
local FlyoutAlternateEntryPointModule = require(script.Parent.FlyoutAlternateEntryPoint)
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local UIBloxModule = require(Parent.UIBlox)
local WithTooltipFunction = UIBloxModule.App.Dialog.TooltipV2.withTooltip
local TooltipOrientation = UIBloxModule.App.Dialog.Enum.TooltipOrientation
local FlyoutTooltipManagerModule = require(script.Parent.Parent.FlyoutTooltipManager)
local FlyoutAnalyticsModule = require(script.Parent.Parent.Analytics.FlyoutAnalytics)
local UseOpenFlyoutSidePanelModule = require(script.Parent.Parent.Hooks.useOpenFlyoutSidePanel)
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local AppEventIngestService = require(Parent.RoactServiceTags).AppEventIngestService
local RoactUtilsModule = require(Parent.RoactUtils)
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local GetTestIdFunction = RoactUtilsModule.getTestId
local StatusIndicator = FoundationModule.StatusIndicator
local StatusIndicatorVariant = FoundationModule.Enums.StatusIndicatorVariant
local UseTokensFunction = FoundationModule.Hooks.useTokens
local FFlagLuaAppFixNotificationBadgeCountsSync = require(Parent.SharedFlags).FFlagLuaAppFixNotificationBadgeCountsSync
local FFlagEnableFlyoutOnNavRail = require(Parent.SharedFlags).FFlagEnableFlyoutOnNavRail
local FFlagFlyoutUseOpenHook = require(Parent.SharedFlags).FFlagFlyoutUseOpenHook
local FFlagFlyoutHeaderFixPadding = require(Parent.SharedFlags).FFlagFlyoutHeaderFixPadding
local FFlagLuaAppAddTestIdsForArrow = require(Parent.SharedFlags).FFlagLuaAppAddTestIdsForArrow

local function getTotalNotificationCount(p1, Amount: number, Amount1: number): number --[[ Line: 42 ]]
	-- upvalues: FFlagLuaAppFixNotificationBadgeCountsSync (copy)
	local Total = 0
	
	if p1.MorePageSettings and p1.MorePageSettings > 0 then
		Total += p1.MorePageSettings
	end
	if FFlagLuaAppFixNotificationBadgeCountsSync then
		if Amount > 0 then
			Total += Amount
		end
		if Amount1 > 0 then
			Total += Amount1
			
			return Total
		end
	else
		if p1.MorePageFriends and p1.MorePageFriends > 0 then
			Total += p1.MorePageFriends
		end
		if p1.MorePageMessages and p1.MorePageMessages > 0 then
			Total += p1.MorePageMessages
		end
	end
	return Total
end

return function(p1) --[[ Line: 69 | Named "FlyoutHamburgerButton" ]]
	-- upvalues: UseSelectorFunction (copy), FFlagLuaAppFixNotificationBadgeCountsSync (copy), getTotalNotificationCount (copy), UseTokensFunction (copy), FFlagFlyoutUseOpenHook (copy), UseOpenFlyoutSidePanelModule (copy), UseSetDrawerVisibleFunction (copy), UseRoactServiceFunction (copy), AppEventIngestService (copy), ReactModule (copy), FlyoutAnalyticsModule (copy), FlyoutTooltipManagerModule (copy), UseLocalizationFunction (copy), CoreGui (copy), TooltipOrientation (copy), UserInputService (copy), FFlagEnableFlyoutOnNavRail (copy), FFlagFlyoutHeaderFixPadding (copy), FFlagLuaAppAddTestIdsForArrow (copy), GetTestIdFunction (copy), FoundationModule (copy), StatusIndicator (copy), StatusIndicatorVariant (copy), FlyoutAlternateEntryPointModule (copy), Icon (copy), BuilderIconsModule (copy), IconSize (copy), WithTooltipFunction (copy)
	local TotalNotificationCount: number = getTotalNotificationCount(UseSelectorFunction(function(p2) --[[ Line: 70 ]]
		return p2.NotificationBadgeCounts or {}
	end), UseSelectorFunction(function(p2) --[[ Line: 73 ]]
		-- upvalues: FFlagLuaAppFixNotificationBadgeCountsSync (upval)
		if FFlagLuaAppFixNotificationBadgeCountsSync then
			local FriendsCarousel = p2.FriendsCarousel
			local Requests = FriendsCarousel and (FriendsCarousel.Friends and FriendsCarousel.Friends.requests)
			
			return Requests and Requests.receivedCount or 0
		else
			return 0
		end
	end), (UseSelectorFunction(function(p2) --[[ Line: 81 ]]
		-- upvalues: FFlagLuaAppFixNotificationBadgeCountsSync (upval)
		return FFlagLuaAppFixNotificationBadgeCountsSync and (p2.SocialTab and p2.SocialTab.UnreadConversationCount) or 0
	end)))
	local UseTokensResult = UseTokensFunction()
	local UseOpenFlyoutSidePanelModuleResult = nil
	
	if FFlagFlyoutUseOpenHook then
		UseOpenFlyoutSidePanelModuleResult = UseOpenFlyoutSidePanelModule(p1.titleText)
	else
		local UseSetDrawerVisibleResult = UseSetDrawerVisibleFunction()
		local UseRoactServiceResult = UseRoactServiceFunction(AppEventIngestService)
		UseOpenFlyoutSidePanelModuleResult = ReactModule.useCallback(function() --[[ Line: 97 ]]
			-- upvalues: FlyoutAnalyticsModule (upval), UseRoactServiceResult (copy), p1 (copy), UseSetDrawerVisibleResult (copy), FlyoutTooltipManagerModule (upval)
			FlyoutAnalyticsModule.sendPageLoadEvent(UseRoactServiceResult, p1.titleText)
			UseSetDrawerVisibleResult(true)
			FlyoutTooltipManagerModule:flyoutSidePanelOpened()
		end, {})
	end
	local UseStateResult, UseStateResult2 = ReactModule.useState(FlyoutTooltipManagerModule:isTooltipActive())
	local UseLocalizationResult = UseLocalizationFunction({
		body = "Feature.FlyoutSidePanel.Label.TooltipBody",
		title = {
			"Feature.FlyoutSidePanel.Label.TooltipTitle",
			itemName = UseLocalizationFunction({ itemName = "CommonUI.Features.Label.More" }).itemName
		}
	})
	local v1 = nil
	local v2 = nil
	
	if UseStateResult then
		v1 = {
			active = true,
			DisplayOrder = 10,
			guiTarget = CoreGui,
			preferredOrientation = TooltipOrientation.Top
		}
		v2 = {
			useLargeDropShadow = false,
			headerRichText = true,
			headerText = UseLocalizationResult.title,
			bodyText = UseLocalizationResult.body,
			textAlignment = Enum.TextXAlignment.Left
		}
	end
	local UseResult = ReactModule.useCallback(function(_) --[[ Line: 130 ]]
		-- upvalues: UseStateResult (copy), UseStateResult2 (copy), FlyoutAnalyticsModule (upval)
		if UseStateResult then
			UseStateResult2(false)
			FlyoutAnalyticsModule.onFlyoutTooltipDismissed({ source = "click" })
		end
	end, { UseStateResult })
	ReactModule.useEffect(function() --[[ Line: 138 ]]
		-- upvalues: UseStateResult (copy), FlyoutTooltipManagerModule (upval), FlyoutAnalyticsModule (upval), UserInputService (upval), UseResult (copy)
		local Connection = nil
		
		if UseStateResult then
			FlyoutAnalyticsModule.onFlyoutTooltipShown({ count = FlyoutTooltipManagerModule:getTooltipCount() })
			Connection = UserInputService.InputBegan:Connect(UseResult)
		end
		return function() --[[ Line: 145 ]]
			-- upvalues: Connection (ref)
			if Connection then
				Connection:Disconnect()
				Connection = nil
			end
		end
	end, { UseStateResult, UseResult })
	local _UDim2: UDim2 = if p1.isAlternateEntryPointEnabled then if FFlagEnableFlyoutOnNavRail and p1.isIconCentered then UDim2.new(1, 0, 0, UseTokensResult.Size.Size_100) else UDim2.new(1, if FFlagFlyoutHeaderFixPadding then 0 else -UseTokensResult.Size.Size_100, 0, UseTokensResult.Size.Size_100) elseif FFlagEnableFlyoutOnNavRail and p1.isIconCentered then UDim2.new(1, -UseTokensResult.Size.Size_100, 0, UseTokensResult.Size.Size_150) else UDim2.new(1, if FFlagFlyoutHeaderFixPadding then -UseTokensResult.Size.Size_200 else -UseTokensResult.Size.Size_300, 0, UseTokensResult.Size.Size_150)
	
	return ReactModule.createElement("TextButton", {
		AutoButtonColor = false,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Text = "",
		Size = UDim2.fromOffset(if FFlagFlyoutHeaderFixPadding then UseTokensResult.Size.Size_900 else UseTokensResult.Size.Size_1000, UseTokensResult.Size.Size_1000),
		Selectable = if FFlagEnableFlyoutOnNavRail then p1.selectable else nil,
		[ReactModule.Event.Activated] = UseOpenFlyoutSidePanelModuleResult,
		[ReactModule.Tag] = if FFlagLuaAppAddTestIdsForArrow then GetTestIdFunction("core-ui-flyout-hamburger") else nil,
		ref = p1.buttonRef
	}, {
		StatusIndicatorContainer = if TotalNotificationCount > 0 then ReactModule.createElement(FoundationModule.View, {
			tag = "auto-xy padding-xxsmall radius-circle bg-surface-0",
			ZIndex = 2,
			Position = _UDim2,
			AnchorPoint = Vector2.new(1, 0)
		}, {
			StatusIndicator = ReactModule.createElement(StatusIndicator, { variant = StatusIndicatorVariant.Emphasis })
		}) else nil,
		HamburgerButton = ReactModule.createElement(FoundationModule.View, {
			tag = "auto-xy",
			Position = if FFlagEnableFlyoutOnNavRail and p1.isIconCentered then UDim2.new(0.5, 0, 0.5, 0) else UDim2.new(0, 0, 0.5, 0),
			AnchorPoint = if FFlagEnableFlyoutOnNavRail and p1.isIconCentered then Vector2.new(0.5, 0.5) else Vector2.new(0, 0.5)
		}, {
			Hamburger = if p1.isAlternateEntryPointEnabled then ReactModule.createElement(FlyoutAlternateEntryPointModule) else ReactModule.createElement(Icon, {
				name = BuilderIconsModule.Icon.ThreeBarsHorizontal,
				size = IconSize.Large
			}),
			Tooltip = if UseStateResult then WithTooltipFunction(v2, v1, function(p2) --[[ Line: 216 ]]
				-- upvalues: ReactModule (upval)
				return ReactModule.createElement("Frame", {
					Visible = false,
					Size = UDim2.new(1, 0, 1, 0),
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					[ReactModule.Change.AbsolutePosition] = p2,
					[ReactModule.Change.AbsoluteSize] = p2
				})
			end) else nil
		})
	})
end