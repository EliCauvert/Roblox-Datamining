local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
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

local function noOp()
	return nil
end

return function(p1)
	-- upvalues: reactModule (ref), fFlagAppChatPerfTrackingModule (ref), appChatPerfTrackerModule (ref), getTopBarStoreModule (ref), useSignalState (ref), fFlagAppIaScrollAway (ref), appHeaderBarModule (ref), useLocalization (ref), useStyle (ref), useTokens (ref), noOp (ref), createBackFuncModule (ref), appNavBarModule (ref), visibilityControl (ref), foundationModule (ref), headerBar (ref)
	reactModule.useEffect(function()
		-- upvalues: fFlagAppChatPerfTrackingModule (copy), appChatPerfTrackerModule (copy)
		if fFlagAppChatPerfTrackingModule then
			appChatPerfTrackerModule.finish(appChatPerfTrackerModule.Events.TopBarRenderInterval)
		end
	end, {})
	local navigation = p1.navigation
	local var1 = useSignalState(getTopBarStoreModule(false).getScreenTopBar(p1.screenName))
	local var2 = if fFlagAppIaScrollAway then navigation.getScreenProps("isInExperience", false) else nil
	local topBarHeight = navigation.getScreenProps("topBarHeight", 0)
	local navigateToRootStack = navigation.getScreenProps("navigateToRootStack", nil)
	local headerText = var1.headerText or {}
	local backButtonEnabled = var1.backButtonEnabled
	local closeButtonEnabled = var1.closeButtonEnabled
	local isRoot = var1.isRoot
	local shouldBoldHeader = var1.shouldBoldHeader
	local isTitleLeftAligned = var1.isTitleLeftAligned
	local leftPaddingOverride = var1.leftPaddingOverride
	local rightPaddingOverride = var1.rightPaddingOverride
	local closeInputBar = var1.closeInputBar
	local isSecondary = var1.isSecondary
	local makeBackButton = appHeaderBarModule.makeBackButton
	local makeCloseButton = appHeaderBarModule.makeCloseButton
	local var3 = if headerText.shouldLocalize then useLocalization({
		headerText = if headerText.shouldLocalize then headerText.raw else nil
	}).headerText else headerText.raw or ""
	local var4 = useStyle()
	local var5 = useTokens()
	local var6 = if p1.renderRight then p1.renderRight else noOp
	local var7 = if p1.renderCenter then p1.renderCenter else nil
	
	if var7 then
		var6 = nil
	end
	local var8
	local _ = nil
	
	if var7 then
		var8 = nil
	elseif p1.renderLeft then
		var8 = p1.renderLeft
	else
		local var9 = createBackFuncModule({
			navigation = navigation,
			navigateToRootStack = navigateToRootStack,
			isRoot = isRoot,
			closeInputBar = closeInputBar
		})
		var8 = if backButtonEnabled then makeBackButton(var9) elseif closeButtonEnabled then makeCloseButton(var9) else noOp
	end
	local var10 = not backButtonEnabled and (not closeButtonEnabled and var7 == nil)
	
	if shouldBoldHeader and var8 == noOp then
		var8 = nil
	end
	local medium = var5.Padding.Medium
	
	return reactModule.createElement(foundationModule.View, {
		tag = "size-full-0",
		LayoutOrder = -1,
		Size = UDim2.new(1, 0, 0, topBarHeight),
		ZIndex = if fFlagAppIaScrollAway then 2 else nil,
		Position = if fFlagAppIaScrollAway then if fFlagAppIaScrollAway and not var2 and appNavBarModule.getScrollAwayEnabled() then visibilityControl.getHeaderBinding():map(function(p2)
			-- upvalues: topBarHeight (ref)
			return UDim2.new(0, 0, 0, (p2 - 1) * (topBarHeight + 36))
		end) else nil else nil
	}, {
		headerBar = reactModule.createElement(headerBar, {
			title = if var7 or p1.hideTitle then nil else var3,
			barHeight = topBarHeight,
			renderLeft = if var7 then nil elseif p1.renderLeft or navigateToRootStack then var8 elseif not var10 then var8 else nil,
			isSecondary = isSecondary,
			renderCenter = var7,
			renderRight = var6,
			paddingLeft = UDim.new(0, if leftPaddingOverride ~= nil then medium else leftPaddingOverride),
			paddingRight = UDim.new(0, if rightPaddingOverride ~= nil then medium else rightPaddingOverride),
			isTitleCentered = not isTitleLeftAligned,
			contentPaddingRight = UDim.new(0, 0),
			backgroundTransparency = if fFlagAppIaScrollAway and not var2 then nil else var4.Tokens.Color.None.Transparency
		})
	})
end