local parent = script:FindFirstAncestor("BuildExperience").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local headerBar = require(parent.UIBlox).App.Bar.HeaderBar
local view = foundationModule.View
local streamNotificationsBellIcon = require(parent.StreamNotifications).StreamNotificationsBellIcon
local useTokens = foundationModule.Hooks.useTokens
local flyoutSidePanelIXP = require(parent.SharedExperimentDefinition).FlyoutSidePanelIXP
local flyoutLeftHeader = require(parent.FlyoutSidePanel).Components.FlyoutLeftHeader
local fFlagEnableHomeRobloxLogo = require(parent.SharedFlags).FFlagEnableHomeRobloxLogo

local function renderHeaderUtilities() --[[ line: 26 ]]
	-- upvalues: reactModule (ref), view (ref), streamNotificationsBellIcon (ref)
	return reactModule.createElement(view, {
		tag = "row align-x-right align-y-center gap-xsmall auto-xy"
	}, {
		Notifications = reactModule.createElement(streamNotificationsBellIcon, { layoutOrder = 1, notificationCount = 0 })
	})
end

local function renderFlyoutLeftHeader() --[[ line: 37 ]]
	-- upvalues: reactModule (ref), flyoutLeftHeader (ref), fFlagEnableHomeRobloxLogo (ref), flyoutSidePanelIXP (ref)
	return reactModule.createElement(flyoutLeftHeader, {
		titleText = "Build",
		isRobloxLogoEnabled = false,
		isFlyoutEntrypointEnabled = if fFlagEnableHomeRobloxLogo then flyoutSidePanelIXP.isFlyoutSidePanelEnabled() else nil,
		isAlternateEntryPointEnabled = flyoutSidePanelIXP.isAlternateEntryPointEnabled()
	})
end

return function(p0) --[[ line: 48 | named "BuildPageHeader" ]]
	-- upvalues: useTokens (ref), flyoutSidePanelIXP (ref), reactModule (ref), view (ref), headerBar (ref), renderFlyoutLeftHeader (ref), renderHeaderUtilities (ref)
	local var4 = flyoutSidePanelIXP.isFlyoutSidePanelEnabled()
	
	return reactModule.createElement(view, {
		ZIndex = 3,
		tag = "size-full-0 auto-y",
		LayoutOrder = p0.LayoutOrder,
		Size = UDim2.new(1, 0, 0, p0.height)
	}, {
		HeaderBar = reactModule.createElement(headerBar, {
			isTitleCentered = false,
			barHeight = p0.height,
			contentPaddingRight = UDim.new(0, 0),
			paddingLeft = UDim.new(0, p0.sideMargin),
			paddingRight = UDim.new(0, math.max(p0.sideMargin - useTokens().Size.Size_100, 0)),
			renderLeft = if var4 then renderFlyoutLeftHeader else nil,
			renderRight = renderHeaderUtilities,
			title = if var4 then nil else "Build"
		})
	})
end