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

local function getTotalNotificationCount(p0, p1, p2) --[[ line: 40 ]]
	-- upvalues: fFlagLuaAppFixNotificationBadgeCountsSync (ref)
	local var11 = 0
	
	if p0.MorePageSettings and p0.MorePageSettings > 0 then
		var11 += p0.MorePageSettings
	end
	if fFlagLuaAppFixNotificationBadgeCountsSync then
		if p1 > 0 then
			var11 += p1
		end
		if p2 > 0 then
			var11 += p2
			
			return var11
		end
	elseif p0.MorePageFriends and p0.MorePageFriends > 0 then
		var11 += p0.MorePageFriends
	end
	if p0.MorePageMessages and p0.MorePageMessages > 0 then
		var11 += p0.MorePageMessages
	end
	return var11
end

return function(p3) --[[ line: 67 | named "FlyoutHamburgerButton" ]]
	-- upvalues: useSelector (ref), fFlagLuaAppFixNotificationBadgeCountsSync (ref), getTotalNotificationCount (ref), useTokens (ref), fFlagFlyoutUseOpenHook (ref), useOpenFlyoutSidePanelModule (ref), useSetDrawerVisible (ref), useRoactService (ref), appEventIngestService (ref), reactModule (ref), flyoutAnalyticsModule (ref), flyoutTooltipManagerModule (ref), useLocalization (ref), coreGuiService (ref), tooltipOrientation (ref), userInputService (ref), fFlagEnableFlyoutOnNavRail (ref), foundationModule (ref), statusIndicator (ref), flags (ref), statusIndicatorVariant (ref), flyoutAlternateEntryPointModule (ref), icon (ref), builderIconsModule (ref), iconSize (ref), withTooltip (ref)
	local var14
	local var12 = getTotalNotificationCount(useSelector(function(p4) --[[ line: 68 ]]
		return p4.NotificationBadgeCounts or {}
	end), useSelector(function(p5) --[[ line: 71 ]]
		-- upvalues: fFlagLuaAppFixNotificationBadgeCountsSync (copy)
		if fFlagLuaAppFixNotificationBadgeCountsSync then
			local friendsCarousel = p5.FriendsCarousel
			local requests = friendsCarousel and (friendsCarousel.Friends and friendsCarousel.Friends.requests)
			
			return if requests then requests.receivedCount else 0
		end
		return 0
	end), useSelector(function(p6) --[[ line: 79 ]]
		-- upvalues: fFlagLuaAppFixNotificationBadgeCountsSync (copy)
		return if fFlagLuaAppFixNotificationBadgeCountsSync then if p6.SocialTab then p6.SocialTab.UnreadConversationCount else 0 else 0
	end))
	local var13 = useTokens()
	local _ = nil
	
	if fFlagFlyoutUseOpenHook then
		var14 = useOpenFlyoutSidePanelModule(p3.titleText)
	else
		local var15 = useSetDrawerVisible()
		local var16 = useRoactService(appEventIngestService)
		var14 = reactModule.useCallback(function() --[[ line: 95 ]]
			-- upvalues: flyoutAnalyticsModule (copy), var16 (ref), p3 (ref), var15 (ref), flyoutTooltipManagerModule (copy)
			flyoutAnalyticsModule.sendPageLoadEvent(var16, p3.titleText)
			var15(true)
			flyoutTooltipManagerModule:flyoutSidePanelOpened()
		end, {})
	end
	local var17, var18 = reactModule.useState(flyoutTooltipManagerModule:isTooltipActive())
	local var19 = useLocalization({
		body = "Feature.FlyoutSidePanel.Label.TooltipBody",
		title = {
			"Feature.FlyoutSidePanel.Label.TooltipTitle",
			itemName = useLocalization({ itemName = "CommonUI.Features.Label.More" }).itemName
		}
	})
	local t = nil
	local t_1 = nil
	
	if var17 then
		t = {
			active = true,
			DisplayOrder = 10,
			guiTarget = coreGuiService,
			preferredOrientation = tooltipOrientation.Top
		}
		t_1 = {
			useLargeDropShadow = false,
			headerRichText = true,
			headerText = var19.title,
			bodyText = var19.body,
			textAlignment = Enum.TextXAlignment.Left
		}
	end
	local var22 = reactModule.useCallback(function(_) --[[ line: 128 ]]
		-- upvalues: var17 (ref), var18 (ref), flyoutAnalyticsModule (copy)
		if var17 then
			var18(false)
			flyoutAnalyticsModule.onFlyoutTooltipDismissed({ source = "click" })
		end
	end, { var17 })
	reactModule.useEffect(function() --[[ line: 136 ]]
		-- upvalues: var17 (ref), flyoutTooltipManagerModule (copy), flyoutAnalyticsModule (copy), userInputService (copy), var22 (ref)
		local inputBeganConnection = nil
		
		if var17 then
			flyoutAnalyticsModule.onFlyoutTooltipShown({ count = flyoutTooltipManagerModule:getTooltipCount() })
			inputBeganConnection = userInputService.InputBegan:Connect(var22)
		end
		return function() --[[ line: 143 ]]
			-- upvalues: inputBeganConnection (write)
			if inputBeganConnection then
				inputBeganConnection:Disconnect()
				inputBeganConnection = nil
			end
		end
	end, { var17, var22 })
	
	return reactModule.createElement("TextButton", {
		AutoButtonColor = false,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Text = "",
		Size = UDim2.fromOffset(var13.Size.Size_1000, var13.Size.Size_1000),
		Selectable = if fFlagEnableFlyoutOnNavRail then p3.selectable else nil,
		[reactModule.Event.Activated] = var14,
		ref = p3.buttonRef
	}, {
		StatusIndicatorContainer = if var12 > 0 then reactModule.createElement(foundationModule.View, {
			tag = "auto-xy padding-xxsmall radius-circle bg-surface-0",
			ZIndex = 2,
			Position = if p3.isAlternateEntryPointEnabled then if fFlagEnableFlyoutOnNavRail and p3.isIconCentered then UDim2.new(1, 0, 0, var13.Size.Size_100) else UDim2.new(1, -var13.Size.Size_100, 0, var13.Size.Size_100) elseif fFlagEnableFlyoutOnNavRail and p3.isIconCentered then UDim2.new(1, -var13.Size.Size_100, 0, var13.Size.Size_150) else UDim2.new(1, -var13.Size.Size_300, 0, var13.Size.Size_150),
			AnchorPoint = Vector2.new(1, 0)
		}, {
			StatusIndicator = reactModule.createElement(statusIndicator, {
				variant = if flags.FoundationStatusIndicatorVariantExperiment then statusIndicatorVariant.Contrast_Experiment else statusIndicatorVariant.Emphasis
			})
		}) else nil,
		HamburgerButton = reactModule.createElement(foundationModule.View, {
			tag = "auto-xy",
			Position = if fFlagEnableFlyoutOnNavRail and p3.isIconCentered then UDim2.new(0.5, 0, 0.5, 0) else UDim2.new(0, 0, 0.5, 0),
			AnchorPoint = if fFlagEnableFlyoutOnNavRail and p3.isIconCentered then Vector2.new(0.5, 0.5) else Vector2.new(0, 0.5)
		}, {
			Hamburger = if p3.isAlternateEntryPointEnabled then reactModule.createElement(flyoutAlternateEntryPointModule) else reactModule.createElement(icon, {
				name = builderIconsModule.Icon.ThreeBarsHorizontal,
				size = iconSize.Large
			}),
			Tooltip = if var17 then withTooltip(t_1, t, function(p7) --[[ line: 202 ]]
				-- upvalues: reactModule (copy)
				return reactModule.createElement("Frame", {
					Visible = false,
					Size = UDim2.new(1, 0, 1, 0),
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					[reactModule.Change.AbsolutePosition] = p7,
					[reactModule.Change.AbsoluteSize] = p7
				})
			end) else nil
		})
	})
end