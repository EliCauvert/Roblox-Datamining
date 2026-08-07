local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local fFlagAppChatTopBarConfigDrivenModule = require(appChat.Flags.FFlagAppChatTopBarConfigDriven)
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

local function noOp() --[[ line: 34 ]]
	return nil
end

return function(p0) --[[ line: 50 | named "ChatTopBarBase" ]]
	-- upvalues: fFlagAppChatTopBarConfigDrivenModule (ref), reactModule (ref), fFlagAppChatPerfTrackingModule (ref), appChatPerfTrackerModule (ref), getTopBarStoreModule (ref), useSignalState (ref), fFlagAppIaScrollAway (ref), appHeaderBarModule (ref), useLocalization (ref), useStyle (ref), useTokens (ref), noOp (ref), createBackFuncModule (ref), appNavBarModule (ref), visibilityControl (ref), foundationModule (ref), headerBar (ref)
	if not fFlagAppChatTopBarConfigDrivenModule() then
		return nil
	end
	reactModule.useEffect(function() --[[ line: 55 ]]
		-- upvalues: fFlagAppChatPerfTrackingModule (copy), appChatPerfTrackerModule (copy)
		if fFlagAppChatPerfTrackingModule then
			appChatPerfTrackerModule.finish(appChatPerfTrackerModule.Events.TopBarRenderInterval)
		end
	end, {})
	local navigation = p0.navigation
	local var12 = useSignalState(getTopBarStoreModule(false).getScreenTopBar(p0.screenName))
	local var13 = if fFlagAppIaScrollAway then navigation.getScreenProps("isInExperience", false) else nil
	local topBarHeight = navigation.getScreenProps("topBarHeight", 0)
	local navigateToRootStack = navigation.getScreenProps("navigateToRootStack", nil)
	local headerText = var12.headerText or {}
	local backButtonEnabled = var12.backButtonEnabled
	local closeButtonEnabled = var12.closeButtonEnabled
	local isRoot = var12.isRoot
	local shouldBoldHeader = var12.shouldBoldHeader
	local isTitleLeftAligned = var12.isTitleLeftAligned
	local leftPaddingOverride = var12.leftPaddingOverride
	local rightPaddingOverride = var12.rightPaddingOverride
	local closeInputBar = var12.closeInputBar
	local isSecondary = var12.isSecondary
	local makeBackButton = appHeaderBarModule.makeBackButton
	local makeCloseButton = appHeaderBarModule.makeCloseButton
	local var17 = if headerText.shouldLocalize then useLocalization({
		headerText = if headerText.shouldLocalize then headerText.raw else nil
	}).headerText else headerText.raw or ""
	local var18 = useStyle()
	local var19 = useTokens()
	local var20 = if p0.renderRight then p0.renderRight else noOp
	local var21 = if p0.renderCenter then p0.renderCenter else nil
	
	if var21 then
		var20 = nil
	end
	local var22
	local _ = nil
	
	if var21 then
		var22 = nil
	elseif p0.renderLeft then
		var22 = p0.renderLeft
	else
		local var23 = createBackFuncModule({
			navigation = navigation,
			navigateToRootStack = navigateToRootStack,
			isRoot = isRoot,
			closeInputBar = closeInputBar
		})
		var22 = if backButtonEnabled then makeBackButton(var23) elseif closeButtonEnabled then makeCloseButton(var23) else noOp
	end
	local var24 = not backButtonEnabled and (not closeButtonEnabled and var21 == nil)
	
	if shouldBoldHeader and var22 == noOp then
		var22 = nil
	end
	local medium = var19.Padding.Medium
	
	return reactModule.createElement(foundationModule.View, {
		tag = "size-full-0",
		LayoutOrder = -1,
		Size = UDim2.new(1, 0, 0, topBarHeight),
		ZIndex = if fFlagAppIaScrollAway then 2 else nil,
		Position = if fFlagAppIaScrollAway then if fFlagAppIaScrollAway and not var13 and appNavBarModule.getScrollAwayEnabled() then visibilityControl.getHeaderBinding():map(function(p1) --[[ line: 137 ]]
			-- upvalues: topBarHeight (ref)
			return UDim2.new(0, 0, 0, (p1 - 1) * (topBarHeight + 36))
		end) else nil else nil
	}, {
		headerBar = reactModule.createElement(headerBar, {
			title = if var21 or p0.hideTitle then nil else var17,
			barHeight = topBarHeight,
			renderLeft = if var21 then nil elseif p0.renderLeft or navigateToRootStack then var22 elseif not var24 then var22 else nil,
			isSecondary = isSecondary,
			renderCenter = var21,
			renderRight = var20,
			paddingLeft = UDim.new(0, if leftPaddingOverride ~= nil then medium else leftPaddingOverride),
			paddingRight = UDim.new(0, if rightPaddingOverride ~= nil then medium else rightPaddingOverride),
			isTitleCentered = not isTitleLeftAligned,
			contentPaddingRight = UDim.new(0, 0),
			backgroundTransparency = if fFlagAppIaScrollAway and not var13 then nil else var18.Tokens.Color.None.Transparency
		})
	})
end