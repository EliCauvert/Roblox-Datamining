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
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local appEventIngestService = require(parent.RoactServiceTags).AppEventIngestService
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local statusIndicator = foundationModule.StatusIndicator
local statusIndicatorVariant = foundationModule.Enums.StatusIndicatorVariant
local flags = foundationModule.Utility.Flags
local useTokens = foundationModule.Hooks.useTokens
local fFlagLuaAppFixNotificationBadgeCountsSync = require(parent.SharedFlags).FFlagLuaAppFixNotificationBadgeCountsSync

local function getTotalNotificationCount(p0, p1, p2) --[[ line: 35 ]]
	-- upvalues: fFlagLuaAppFixNotificationBadgeCountsSync (ref)
	local var10 = 0
	
	if p0.MorePageSettings and p0.MorePageSettings > 0 then
		var10 += p0.MorePageSettings
	end
	if fFlagLuaAppFixNotificationBadgeCountsSync then
		if p1 > 0 then
			var10 += p1
		end
		if p2 > 0 then
			var10 += p2
			
			return var10
		end
	elseif p0.MorePageFriends and p0.MorePageFriends > 0 then
		var10 += p0.MorePageFriends
	end
	if p0.MorePageMessages and p0.MorePageMessages > 0 then
		var10 += p0.MorePageMessages
	end
	return var10
end

return function(p3) --[[ line: 62 | named "FlyoutHamburgerButton" ]]
	-- upvalues: useSetDrawerVisible (ref), useRoactService (ref), appEventIngestService (ref), useSelector (ref), fFlagLuaAppFixNotificationBadgeCountsSync (ref), getTotalNotificationCount (ref), useTokens (ref), reactModule (ref), flyoutAnalyticsModule (ref), flyoutTooltipManagerModule (ref), useLocalization (ref), coreGuiService (ref), tooltipOrientation (ref), userInputService (ref), foundationModule (ref), statusIndicator (ref), flags (ref), statusIndicatorVariant (ref), flyoutAlternateEntryPointModule (ref), icon (ref), builderIconsModule (ref), iconSize (ref), withTooltip (ref)
	local var11 = useSetDrawerVisible()
	local var12 = useRoactService(appEventIngestService)
	local var13 = getTotalNotificationCount(useSelector(function(p4) --[[ line: 65 ]]
		return p4.NotificationBadgeCounts or {}
	end), useSelector(function(p5) --[[ line: 68 ]]
		-- upvalues: fFlagLuaAppFixNotificationBadgeCountsSync (copy)
		if fFlagLuaAppFixNotificationBadgeCountsSync then
			local friendsCarousel = p5.FriendsCarousel
			local requests = friendsCarousel and (friendsCarousel.Friends and friendsCarousel.Friends.requests)
			
			return if requests then requests.receivedCount else 0
		end
		return 0
	end), useSelector(function(p6) --[[ line: 76 ]]
		-- upvalues: fFlagLuaAppFixNotificationBadgeCountsSync (copy)
		return if fFlagLuaAppFixNotificationBadgeCountsSync then if p6.SocialTab then p6.SocialTab.UnreadConversationCount else 0 else 0
	end))
	local var14 = useTokens()
	local var15 = reactModule.useCallback(function() --[[ line: 85 ]]
		-- upvalues: flyoutAnalyticsModule (copy), var12 (ref), p3 (ref), var11 (ref), flyoutTooltipManagerModule (copy)
		flyoutAnalyticsModule.sendPageLoadEvent(var12, p3.titleText)
		var11(true)
		flyoutTooltipManagerModule:flyoutSidePanelOpened()
	end, {})
	local var16, var17 = reactModule.useState(flyoutTooltipManagerModule:isTooltipActive())
	local var18 = useLocalization({
		body = "Feature.FlyoutSidePanel.Label.TooltipBody",
		title = {
			"Feature.FlyoutSidePanel.Label.TooltipTitle",
			itemName = useLocalization({ itemName = "CommonUI.Features.Label.More" }).itemName
		}
	})
	local t = nil
	local t_1 = nil
	
	if var16 then
		t = {
			active = true,
			DisplayOrder = 10,
			guiTarget = coreGuiService,
			preferredOrientation = tooltipOrientation.Top
		}
		t_1 = {
			useLargeDropShadow = false,
			headerRichText = true,
			headerText = var18.title,
			bodyText = var18.body,
			textAlignment = Enum.TextXAlignment.Left
		}
	end
	local var21 = reactModule.useCallback(function(_) --[[ line: 117 ]]
		-- upvalues: var16 (ref), var17 (ref), flyoutAnalyticsModule (copy)
		if var16 then
			var17(false)
			flyoutAnalyticsModule.onFlyoutTooltipDismissed({ source = "click" })
		end
	end, { var16 })
	reactModule.useEffect(function() --[[ line: 125 ]]
		-- upvalues: var16 (ref), flyoutTooltipManagerModule (copy), flyoutAnalyticsModule (copy), userInputService (copy), var21 (ref)
		local inputBeganConnection = nil
		
		if var16 then
			flyoutAnalyticsModule.onFlyoutTooltipShown({ count = flyoutTooltipManagerModule:getTooltipCount() })
			inputBeganConnection = userInputService.InputBegan:Connect(var21)
		end
		return function() --[[ line: 132 ]]
			-- upvalues: inputBeganConnection (write)
			if inputBeganConnection then
				inputBeganConnection:Disconnect()
				inputBeganConnection = nil
			end
		end
	end, { var16, var21 })
	
	return reactModule.createElement("TextButton", {
		AutoButtonColor = false,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Text = "",
		Size = UDim2.fromOffset(var14.Size.Size_1000, var14.Size.Size_1000),
		[reactModule.Event.Activated] = var15,
		ref = p3.buttonRef
	}, {
		StatusIndicatorContainer = if var13 > 0 then reactModule.createElement(foundationModule.View, {
			tag = "auto-xy padding-xxsmall radius-circle bg-surface-0",
			ZIndex = 2,
			Position = if p3.isAlternateEntryPointEnabled then UDim2.new(1, -var14.Size.Size_100, 0, var14.Size.Size_100) else UDim2.new(1, -var14.Size.Size_300, 0, var14.Size.Size_150),
			AnchorPoint = Vector2.new(1, 0)
		}, {
			StatusIndicator = reactModule.createElement(statusIndicator, {
				variant = if flags.FoundationStatusIndicatorVariantExperiment then statusIndicatorVariant.Contrast_Experiment else statusIndicatorVariant.Emphasis
			})
		}) else nil,
		HamburgerButton = reactModule.createElement(foundationModule.View, {
			tag = "auto-xy",
			Position = UDim2.new(0, 0, 0.5, 0),
			AnchorPoint = Vector2.new(0, 0.5)
		}, {
			Hamburger = if p3.isAlternateEntryPointEnabled then reactModule.createElement(flyoutAlternateEntryPointModule) else reactModule.createElement(icon, {
				name = builderIconsModule.Icon.ThreeBarsHorizontal,
				size = iconSize.Large
			}),
			Tooltip = if var16 then withTooltip(t_1, t, function(p7) --[[ line: 179 ]]
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