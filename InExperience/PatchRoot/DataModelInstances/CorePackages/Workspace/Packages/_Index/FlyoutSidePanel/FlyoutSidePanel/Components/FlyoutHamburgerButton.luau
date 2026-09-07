local parent = script:FindFirstAncestor("FlyoutSidePanel").Parent
local reactModule = require(parent.React)
local builderIconsModule = require(parent.BuilderIcons)
local foundationModule = require(parent.Foundation)
local icon = foundationModule.Icon
local iconSize = foundationModule.Enums.IconSize
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useSetDrawerVisible = require(parent.Drawer).Hooks.useSetDrawerVisible
local flyoutAlternateEntryPointModule = require(script.Parent.FlyoutAlternateEntryPoint)
local coreGuiService = game:GetService("CoreGui")
local userInputService = game:GetService("UserInputService")
local UIBloxModule = require(parent.UIBlox)
local withTooltip = UIBloxModule.App.Dialog.TooltipV2.withTooltip
local tooltipOrientation = UIBloxModule.App.Dialog.Enum.TooltipOrientation
local flyoutTooltipManagerModule = require(script.Parent.Parent.FlyoutTooltipManager)
local flyoutAnalyticsModule = require(script.Parent.Parent.Analytics.FlyoutAnalytics)
local useOpenFlyoutSidePanelModule = require(script.Parent.Parent.Hooks.useOpenFlyoutSidePanel)
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local appEventIngestService = require(parent.RoactServiceTags).AppEventIngestService
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local statusIndicator = foundationModule.StatusIndicator
local statusIndicatorVariant = foundationModule.Enums.StatusIndicatorVariant
local flags = foundationModule.Utility.Flags
local useTokens = foundationModule.Hooks.useTokens
local fFlagLuaAppFixNotificationBadgeCountsSync = require(parent.SharedFlags).FFlagLuaAppFixNotificationBadgeCountsSync
local fFlagEnableFlyoutOnNavRail = require(parent.SharedFlags).FFlagEnableFlyoutOnNavRail
local fFlagFlyoutUseOpenHook = require(parent.SharedFlags).FFlagFlyoutUseOpenHook

local function getTotalNotificationCount(p1, p2, p3)
	-- upvalues: fFlagLuaAppFixNotificationBadgeCountsSync (ref)
	local var1 = 0
	
	if p1.MorePageSettings and p1.MorePageSettings > 0 then
		var1 += p1.MorePageSettings
	end
	if fFlagLuaAppFixNotificationBadgeCountsSync then
		if p2 > 0 then
			var1 += p2
		end
		if p3 > 0 then
			var1 += p3
			
			return var1
		end
	elseif p1.MorePageFriends and p1.MorePageFriends > 0 then
		var1 += p1.MorePageFriends
	end
	if p1.MorePageMessages and p1.MorePageMessages > 0 then
		var1 += p1.MorePageMessages
	end
	return var1
end

return function(p1)
	-- upvalues: useSelector (ref), fFlagLuaAppFixNotificationBadgeCountsSync (ref), getTotalNotificationCount (ref), useTokens (ref), fFlagFlyoutUseOpenHook (ref), useOpenFlyoutSidePanelModule (ref), useSetDrawerVisible (ref), useRoactService (ref), appEventIngestService (ref), reactModule (ref), flyoutAnalyticsModule (ref), flyoutTooltipManagerModule (ref), useLocalization (ref), coreGuiService (ref), tooltipOrientation (ref), userInputService (ref), fFlagEnableFlyoutOnNavRail (ref), foundationModule (ref), statusIndicator (ref), flags (ref), statusIndicatorVariant (ref), flyoutAlternateEntryPointModule (ref), icon (ref), builderIconsModule (ref), iconSize (ref), withTooltip (ref)
	local var1
	local var2 = getTotalNotificationCount(useSelector(function(p2)
		return p2.NotificationBadgeCounts or {}
	end), useSelector(function(p2)
		-- upvalues: fFlagLuaAppFixNotificationBadgeCountsSync (copy)
		if fFlagLuaAppFixNotificationBadgeCountsSync then
			local friendsCarousel = p2.FriendsCarousel
			local requests = friendsCarousel and (friendsCarousel.Friends and friendsCarousel.Friends.requests)
			
			return if requests then requests.receivedCount else 0
		end
		return 0
	end), useSelector(function(p2)
		-- upvalues: fFlagLuaAppFixNotificationBadgeCountsSync (copy)
		return if fFlagLuaAppFixNotificationBadgeCountsSync then if p2.SocialTab then p2.SocialTab.UnreadConversationCount else 0 else 0
	end))
	local var3 = useTokens()
	local _ = nil
	
	if fFlagFlyoutUseOpenHook then
		var1 = useOpenFlyoutSidePanelModule(p1.titleText)
	else
		local var4 = useSetDrawerVisible()
		local var5 = useRoactService(appEventIngestService)
		var1 = reactModule.useCallback(function()
			-- upvalues: flyoutAnalyticsModule (copy), var5 (ref), p1 (ref), var4 (ref), flyoutTooltipManagerModule (copy)
			flyoutAnalyticsModule.sendPageLoadEvent(var5, p1.titleText)
			var4(true)
			flyoutTooltipManagerModule:flyoutSidePanelOpened()
		end, {})
	end
	local var6, var7 = reactModule.useState(flyoutTooltipManagerModule:isTooltipActive())
	local var8 = useLocalization({
		body = "Feature.FlyoutSidePanel.Label.TooltipBody",
		title = {
			"Feature.FlyoutSidePanel.Label.TooltipTitle",
			itemName = useLocalization({ itemName = "CommonUI.Features.Label.More" }).itemName
		}
	})
	local t = nil
	local t_1 = nil
	
	if var6 then
		t = {
			active = true,
			DisplayOrder = 10,
			guiTarget = coreGuiService,
			preferredOrientation = tooltipOrientation.Top
		}
		t_1 = {
			useLargeDropShadow = false,
			headerRichText = true,
			headerText = var8.title,
			bodyText = var8.body,
			textAlignment = Enum.TextXAlignment.Left
		}
	end
	local var9 = reactModule.useCallback(function(_)
		-- upvalues: var6 (ref), var7 (ref), flyoutAnalyticsModule (copy)
		if var6 then
			var7(false)
			flyoutAnalyticsModule.onFlyoutTooltipDismissed({ source = "click" })
		end
	end, { var6 })
	reactModule.useEffect(function()
		-- upvalues: var6 (ref), flyoutTooltipManagerModule (copy), flyoutAnalyticsModule (copy), userInputService (copy), var9 (ref)
		local inputBeganConnection = nil
		
		if var6 then
			flyoutAnalyticsModule.onFlyoutTooltipShown({ count = flyoutTooltipManagerModule:getTooltipCount() })
			inputBeganConnection = userInputService.InputBegan:Connect(var9)
		end
		return function()
			-- upvalues: inputBeganConnection (write)
			if inputBeganConnection then
				inputBeganConnection:Disconnect()
				inputBeganConnection = nil
			end
		end
	end, { var6, var9 })
	
	return reactModule.createElement("TextButton", {
		AutoButtonColor = false,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Text = "",
		Size = UDim2.fromOffset(var3.Size.Size_1000, var3.Size.Size_1000),
		Selectable = if fFlagEnableFlyoutOnNavRail then p1.selectable else nil,
		[reactModule.Event.Activated] = var1,
		ref = p1.buttonRef
	}, {
		StatusIndicatorContainer = if var2 > 0 then reactModule.createElement(foundationModule.View, {
			tag = "auto-xy padding-xxsmall radius-circle bg-surface-0",
			ZIndex = 2,
			Position = if p1.isAlternateEntryPointEnabled then if fFlagEnableFlyoutOnNavRail and p1.isIconCentered then UDim2.new(1, 0, 0, var3.Size.Size_100) else UDim2.new(1, -var3.Size.Size_100, 0, var3.Size.Size_100) elseif fFlagEnableFlyoutOnNavRail and p1.isIconCentered then UDim2.new(1, -var3.Size.Size_100, 0, var3.Size.Size_150) else UDim2.new(1, -var3.Size.Size_300, 0, var3.Size.Size_150),
			AnchorPoint = Vector2.new(1, 0)
		}, {
			StatusIndicator = reactModule.createElement(statusIndicator, {
				variant = if flags.FoundationStatusIndicatorVariantExperiment then statusIndicatorVariant.Contrast_Experiment else statusIndicatorVariant.Emphasis
			})
		}) else nil,
		HamburgerButton = reactModule.createElement(foundationModule.View, {
			tag = "auto-xy",
			Position = if fFlagEnableFlyoutOnNavRail and p1.isIconCentered then UDim2.new(0.5, 0, 0.5, 0) else UDim2.new(0, 0, 0.5, 0),
			AnchorPoint = if fFlagEnableFlyoutOnNavRail and p1.isIconCentered then Vector2.new(0.5, 0.5) else Vector2.new(0, 0.5)
		}, {
			Hamburger = if p1.isAlternateEntryPointEnabled then reactModule.createElement(flyoutAlternateEntryPointModule) else reactModule.createElement(icon, {
				name = builderIconsModule.Icon.ThreeBarsHorizontal,
				size = iconSize.Large
			}),
			Tooltip = if var6 then withTooltip(t_1, t, function(p2)
				-- upvalues: reactModule (copy)
				return reactModule.createElement("Frame", {
					Visible = false,
					Size = UDim2.new(1, 0, 1, 0),
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					[reactModule.Change.AbsolutePosition] = p2,
					[reactModule.Change.AbsoluteSize] = p2
				})
			end) else nil
		})
	})
end