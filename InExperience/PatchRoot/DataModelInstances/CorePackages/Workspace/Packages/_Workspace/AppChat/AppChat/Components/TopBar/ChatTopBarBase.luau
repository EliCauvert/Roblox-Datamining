local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local fFlagAppChatTopBarConfigDrivenModule = require(appChat.Flags.FFlagAppChatTopBarConfigDriven)
local fFlagAppChatAddTopBarDividerModule = require(appChat.Flags.FFlagAppChatAddTopBarDivider)
local fFlagAppChatPerfTrackingModule = require(appChat.Flags.FFlagAppChatPerfTracking)
local appChatPerfTrackerModule = require(appChat.Telemetry.AppChatPerfTracker)
local createBackFuncModule = require(script.Parent.createBackFunc)
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local UIBloxModule = require(parent.UIBlox)
local useStyle = UIBloxModule.Core.Style.useStyle
local appNavBarModule = require(parent.AppNavBar)
local visibilityControl = appNavBarModule.VisibilityControl
local fFlagAppIaScrollAway = require(parent.SharedFlags).FFlagAppIaScrollAway
local headerBar = UIBloxModule.App.Bar.HeaderBar
local appHeaderBarModule = require(parent.AppHeaderBar)
local getTopBarStoreModule = require(appChat.Stores.GetTopBarStore)
local useSignalState = require(parent.SignalsReact).useSignalState

local function noOp() --[[ line: 35 ]]
	return nil
end

return function(p0) --[[ line: 51 | named "ChatTopBarBase" ]]
	-- upvalues: fFlagAppChatTopBarConfigDrivenModule (ref), reactModule (ref), fFlagAppChatPerfTrackingModule (ref), appChatPerfTrackerModule (ref), getTopBarStoreModule (ref), useSignalState (ref), fFlagAppIaScrollAway (ref), appHeaderBarModule (ref), useLocalization (ref), useStyle (ref), useTokens (ref), noOp (ref), createBackFuncModule (ref), appNavBarModule (ref), visibilityControl (ref), foundationModule (ref), headerBar (ref), fFlagAppChatAddTopBarDividerModule (ref)
	if not fFlagAppChatTopBarConfigDrivenModule() then
		return nil
	end
	reactModule.useEffect(function() --[[ line: 56 ]]
		-- upvalues: fFlagAppChatPerfTrackingModule (copy), appChatPerfTrackerModule (copy)
		if fFlagAppChatPerfTrackingModule then
			appChatPerfTrackerModule.finish(appChatPerfTrackerModule.Events.TopBarRenderInterval)
		end
	end, {})
	local navigation = p0.navigation
	local var13 = useSignalState(getTopBarStoreModule(false).getScreenTopBar(p0.screenName))
	local var14 = if fFlagAppIaScrollAway then navigation.getScreenProps("isInExperience", false) else nil
	local topBarHeight = navigation.getScreenProps("topBarHeight", 0)
	local navigateToRootStack = navigation.getScreenProps("navigateToRootStack", nil)
	local headerText = var13.headerText or {}
	local backButtonEnabled = var13.backButtonEnabled
	local closeButtonEnabled = var13.closeButtonEnabled
	local isRoot = var13.isRoot
	local shouldBoldHeader = var13.shouldBoldHeader
	local isTitleLeftAligned = var13.isTitleLeftAligned
	local leftPaddingOverride = var13.leftPaddingOverride
	local rightPaddingOverride = var13.rightPaddingOverride
	local closeInputBar = var13.closeInputBar
	local isSecondary = var13.isSecondary
	local makeBackButton = appHeaderBarModule.makeBackButton
	local makeCloseButton = appHeaderBarModule.makeCloseButton
	local var18 = if headerText.shouldLocalize then useLocalization({
		headerText = if headerText.shouldLocalize then headerText.raw else nil
	}).headerText else headerText.raw or ""
	local var19 = useStyle()
	local var20 = useTokens()
	local var21 = if p0.renderRight then p0.renderRight else noOp
	local var22 = if p0.renderCenter then p0.renderCenter else nil
	
	if var22 then
		var21 = nil
	end
	local var23
	local _ = nil
	
	if var22 then
		var23 = nil
	elseif p0.renderLeft then
		var23 = p0.renderLeft
	else
		local var24 = createBackFuncModule({
			navigation = navigation,
			navigateToRootStack = navigateToRootStack,
			isRoot = isRoot,
			closeInputBar = closeInputBar
		})
		var23 = if backButtonEnabled then makeBackButton(var24) elseif closeButtonEnabled then makeCloseButton(var24) else noOp
	end
	local var25 = not backButtonEnabled and (not closeButtonEnabled and var22 == nil)
	
	if shouldBoldHeader and var23 == noOp then
		var23 = nil
	end
	local medium = var20.Padding.Medium
	
	return reactModule.createElement(foundationModule.View, {
		tag = "size-full-0",
		LayoutOrder = -1,
		Size = UDim2.new(1, 0, 0, topBarHeight),
		ZIndex = if fFlagAppIaScrollAway then 2 else nil,
		Position = if fFlagAppIaScrollAway then if fFlagAppIaScrollAway and not var14 and appNavBarModule.getScrollAwayEnabled() then visibilityControl.getHeaderBinding():map(function(p1) --[[ line: 138 ]]
			-- upvalues: topBarHeight (ref)
			return UDim2.new(0, 0, 0, (p1 - 1) * (topBarHeight + 36))
		end) else nil else nil
	}, {
		headerBar = reactModule.createElement(headerBar, {
			title = if var22 or p0.hideTitle then nil else var18,
			barHeight = topBarHeight,
			renderLeft = if var22 then nil elseif p0.renderLeft or navigateToRootStack then var23 elseif not var25 then var23 else nil,
			isSecondary = isSecondary,
			renderCenter = var22,
			renderRight = var21,
			paddingLeft = UDim.new(0, if leftPaddingOverride ~= nil then medium else leftPaddingOverride),
			paddingRight = UDim.new(0, if rightPaddingOverride ~= nil then medium else rightPaddingOverride),
			isTitleCentered = not isTitleLeftAligned,
			contentPaddingRight = UDim.new(0, 0),
			hasDivider = fFlagAppChatAddTopBarDividerModule,
			backgroundTransparency = if fFlagAppIaScrollAway and not var14 then nil else var19.Tokens.Color.None.Transparency
		})
	})
end