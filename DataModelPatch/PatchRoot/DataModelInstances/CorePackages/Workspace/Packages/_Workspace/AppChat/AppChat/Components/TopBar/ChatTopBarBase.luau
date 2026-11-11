local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local FFlagAppChatTopBarConfigDrivenModule = require(AppChat.Flags.FFlagAppChatTopBarConfigDriven)
local FFlagAppChatPerfTrackingModule = require(AppChat.Flags.FFlagAppChatPerfTracking)
local AppChatPerfTrackerModule = require(AppChat.Telemetry.AppChatPerfTracker)
local CreateBackFuncModule = require(script.Parent.createBackFunc)
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UIBloxModule = require(Parent.UIBlox)
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local AppNavBarModule = require(Parent.AppNavBar)
local VisibilityControl = AppNavBarModule.VisibilityControl
local FFlagAppIaScrollAway = require(Parent.SharedFlags).FFlagAppIaScrollAway
local HeaderBar = UIBloxModule.App.Bar.HeaderBar
local AppHeaderBarModule = require(Parent.AppHeaderBar)
local GetTopBarStoreModule = require(AppChat.Stores.GetTopBarStore)
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState

local function noOp()
	return nil
end

return function(p1)
	-- upvalues: FFlagAppChatTopBarConfigDrivenModule (copy), ReactModule (copy), FFlagAppChatPerfTrackingModule (copy), AppChatPerfTrackerModule (copy), GetTopBarStoreModule (copy), UseSignalStateFunction (copy), FFlagAppIaScrollAway (copy), AppHeaderBarModule (copy), UseLocalizationFunction (copy), UseStyleFunction (copy), UseTokensFunction (copy), noOp (copy), CreateBackFuncModule (copy), AppNavBarModule (copy), VisibilityControl (copy), FoundationModule (copy), HeaderBar (copy)
	if not FFlagAppChatTopBarConfigDrivenModule() then
		return nil
	end
	ReactModule.useEffect(function()
		-- upvalues: FFlagAppChatPerfTrackingModule (upval), AppChatPerfTrackerModule (upval)
		if FFlagAppChatPerfTrackingModule then
			AppChatPerfTrackerModule.finish(AppChatPerfTrackerModule.Events.TopBarRenderInterval)
		end
	end, {})
	local Navigation = p1.navigation
	local UseSignalStateResult = UseSignalStateFunction((GetTopBarStoreModule(false).getScreenTopBar(p1.screenName)))
	local IsInExperienceScreenProps = if FFlagAppIaScrollAway then Navigation.getScreenProps("isInExperience", false) else nil
	local TopBarHeightScreenProps = Navigation.getScreenProps("topBarHeight", 0)
	local NavigateToRootStackScreenProps = Navigation.getScreenProps("navigateToRootStack", nil)
	local HeaderText = UseSignalStateResult.headerText or {}
	local BackButtonEnabled = UseSignalStateResult.backButtonEnabled
	local CloseButtonEnabled = UseSignalStateResult.closeButtonEnabled
	local IsRoot = UseSignalStateResult.isRoot
	local ShouldBoldHeader = UseSignalStateResult.shouldBoldHeader
	local IsTitleLeftAligned = UseSignalStateResult.isTitleLeftAligned
	local LeftPaddingOverride = UseSignalStateResult.leftPaddingOverride
	local RightPaddingOverride = UseSignalStateResult.rightPaddingOverride
	local CloseInputBar = UseSignalStateResult.closeInputBar
	local IsSecondary = UseSignalStateResult.isSecondary
	local MakeBackButtonFunction = AppHeaderBarModule.makeBackButton
	local MakeCloseButtonFunction = AppHeaderBarModule.makeCloseButton
	local UseLocalizationResult = UseLocalizationFunction({
		headerText = HeaderText.shouldLocalize and HeaderText.raw or nil
	})
	local HeaderText1 = HeaderText.shouldLocalize and UseLocalizationResult.headerText or (HeaderText.raw or "")
	local UseStyleResult = UseStyleFunction()
	local UseTokensResult = UseTokensFunction()
	local RenderRight = if p1.renderRight then p1.renderRight else noOp
	local RenderCenter = if p1.renderCenter then p1.renderCenter else nil
	
	if RenderCenter then
		RenderRight = nil
	end
	local RenderLeft = nil
	if RenderCenter then
		RenderLeft = nil
	elseif p1.renderLeft then
		RenderLeft = p1.renderLeft
	else
		local BackFuncModule = CreateBackFuncModule({
			navigation = Navigation,
			navigateToRootStack = NavigateToRootStackScreenProps,
			isRoot = IsRoot,
			closeInputBar = CloseInputBar
		})
		RenderLeft = if BackButtonEnabled then MakeBackButtonFunction(BackFuncModule) elseif CloseButtonEnabled then MakeCloseButtonFunction(BackFuncModule) else noOp
	end
	local NoRenderCenter: boolean = not BackButtonEnabled and (not CloseButtonEnabled and RenderCenter == nil)
	
	if ShouldBoldHeader and RenderLeft == noOp then
		RenderLeft = nil
	end
	local Medium = UseTokensResult.Padding.Medium
	local MapResult = if FFlagAppIaScrollAway and not IsInExperienceScreenProps and AppNavBarModule.getScrollAwayEnabled() then VisibilityControl.getHeaderBinding():map(function(p2: number): UDim2
		-- upvalues: TopBarHeightScreenProps (copy)
		return UDim2.new(0, 0, 0, (p2 - 1) * (TopBarHeightScreenProps + 36))
	end) else nil
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = "size-full-0",
		LayoutOrder = -1,
		Size = UDim2.new(1, 0, 0, TopBarHeightScreenProps),
		ZIndex = if FFlagAppIaScrollAway then 2 else nil,
		Position = if FFlagAppIaScrollAway then MapResult else nil
	}, {
		headerBar = ReactModule.createElement(HeaderBar, {
			title = if RenderCenter or p1.hideTitle then nil else HeaderText1,
			barHeight = TopBarHeightScreenProps,
			renderLeft = if RenderCenter then nil elseif p1.renderLeft or NavigateToRootStackScreenProps then RenderLeft elseif NoRenderCenter then nil else RenderLeft or nil,
			isSecondary = IsSecondary,
			renderCenter = RenderCenter,
			renderRight = RenderRight,
			paddingLeft = UDim.new(0, if LeftPaddingOverride == nil then Medium else LeftPaddingOverride),
			paddingRight = UDim.new(0, if RightPaddingOverride == nil then Medium else RightPaddingOverride),
			isTitleCentered = not IsTitleLeftAligned,
			contentPaddingRight = UDim.new(0, 0),
			backgroundTransparency = if FFlagAppIaScrollAway and not IsInExperienceScreenProps then nil else UseStyleResult.Tokens.Color.None.Transparency
		})
	})
end