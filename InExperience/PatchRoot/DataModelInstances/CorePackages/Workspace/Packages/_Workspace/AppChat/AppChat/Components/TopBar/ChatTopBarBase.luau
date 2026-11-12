local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local FFlagAppChatFoundationHeaderBarModule = require(AppChat.Flags.FFlagAppChatFoundationHeaderBar)
local FFlagAppChatFoundationHeaderBarPageMarginInsetModule = require(AppChat.Flags.FFlagAppChatFoundationHeaderBarPageMarginInset)
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
local HeaderBar1 = FoundationModule.HeaderBar
local AppHeaderBarModule = require(Parent.AppHeaderBar)
local GetTopBarStoreModule = require(AppChat.Stores.GetTopBarStore)
local ThemeBackgroundModule = require(Parent.ThemeBackground)
local FFlagAppThemeHalloween2026ChatBackgroundModule = require(AppChat.Flags.FFlagAppThemeHalloween2026ChatBackground)
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState

local function noOp()
	return nil
end

local function createFoundationTitle(Text, Enabled, IsTitleLeftAligned)
	-- upvalues: ReactModule (copy), FoundationModule (copy)
	return if Text and Text ~= "" then ReactModule.createElement(FoundationModule.Text, {
		LayoutOrder = 1,
		Text = Text,
		tag = {
			["auto-xy text-no-wrap text-truncate-end content-emphasis"] = true,
			["text-heading-large"] = Enabled == true,
			["text-heading-medium"] = not Enabled,
			shrink = not IsTitleLeftAligned
		}
	}) else nil
end

return function(p1)
	-- upvalues: ReactModule (copy), FFlagAppChatPerfTrackingModule (copy), AppChatPerfTrackerModule (copy), GetTopBarStoreModule (copy), UseSignalStateFunction (copy), FFlagAppIaScrollAway (copy), AppHeaderBarModule (copy), UseLocalizationFunction (copy), UseStyleFunction (copy), UseTokensFunction (copy), noOp (copy), CreateBackFuncModule (copy), AppNavBarModule (copy), VisibilityControl (copy), FFlagAppThemeHalloween2026ChatBackgroundModule (copy), ThemeBackgroundModule (copy), FFlagAppChatFoundationHeaderBarModule (copy), createFoundationTitle (copy), HeaderBar1 (copy), FFlagAppChatFoundationHeaderBarPageMarginInsetModule (copy), FoundationModule (copy), HeaderBar (copy)
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
	local _UDim = UDim.new(0, if LeftPaddingOverride == nil then Medium else LeftPaddingOverride)
	local _UDim1 = UDim.new(0, if RightPaddingOverride == nil then Medium else RightPaddingOverride)
	local MapResult = if FFlagAppIaScrollAway and not IsInExperienceScreenProps and AppNavBarModule.getScrollAwayEnabled() then VisibilityControl.getHeaderBinding():map(function(p2: number): UDim2
		-- upvalues: TopBarHeightScreenProps (copy)
		return UDim2.new(0, 0, 0, (p2 - 1) * (TopBarHeightScreenProps + 36))
	end) else nil
	local Callback = if RenderCenter then nil elseif p1.renderLeft or NavigateToRootStackScreenProps then RenderLeft elseif NoRenderCenter then nil else RenderLeft or nil
	local HeaderText2 = if RenderCenter or p1.hideTitle then nil else HeaderText1
	local UseThemeBackgroundResult = if FFlagAppThemeHalloween2026ChatBackgroundModule then ThemeBackgroundModule.useThemeBackground() else nil
	
	if not FFlagAppChatFoundationHeaderBarModule then
		return ReactModule.createElement(FoundationModule.View, {
			tag = "size-full-0",
			LayoutOrder = -1,
			Size = UDim2.new(1, 0, 0, TopBarHeightScreenProps),
			ZIndex = if FFlagAppIaScrollAway then 2 else nil,
			Position = if FFlagAppIaScrollAway then MapResult else nil
		}, {
			BackgroundSlot = if UseThemeBackgroundResult then ReactModule.createElement(ThemeBackgroundModule.ThemeBackgroundHeaderSlot) else nil,
			headerBar = ReactModule.createElement(HeaderBar, {
				title = HeaderText2,
				barHeight = TopBarHeightScreenProps,
				renderLeft = Callback,
				isSecondary = IsSecondary,
				renderCenter = RenderCenter,
				renderRight = RenderRight,
				paddingLeft = _UDim,
				paddingRight = _UDim1,
				isTitleCentered = not IsTitleLeftAligned,
				contentPaddingRight = UDim.new(0, 0),
				backgroundTransparency = if UseThemeBackgroundResult then 1 elseif FFlagAppIaScrollAway and not IsInExperienceScreenProps then nil else UseStyleResult.Tokens.Color.None.Transparency
			})
		})
	end
	local FoundationTitle = createFoundationTitle(HeaderText2, ShouldBoldHeader, IsTitleLeftAligned)
	local CallbackResult = if Callback then Callback() else nil
	local FoundationTitle1 = if IsTitleLeftAligned then FoundationTitle else nil
	local RenderCenterResult = if RenderCenter then RenderCenter() elseif IsTitleLeftAligned then nil else FoundationTitle
	local RenderRightResult = if RenderRight then RenderRight() else nil
	local NoIsInExperienceScreenProps: boolean = UseThemeBackgroundResult == nil and (FFlagAppIaScrollAway and not IsInExperienceScreenProps)
	local Element = ReactModule.createElement(HeaderBar1.Root, {
		hasBackground = NoIsInExperienceScreenProps and not FFlagAppChatFoundationHeaderBarPageMarginInsetModule
	}, {
		Leading = if CallbackResult or FoundationTitle1 then ReactModule.createElement(HeaderBar1.Leading, nil, { leftContent = CallbackResult, title = FoundationTitle1 }) else nil,
		Content = if RenderCenterResult then ReactModule.createElement(HeaderBar1.Content, nil, { centerContent = RenderCenterResult }) else nil,
		Trailing = if RenderRightResult then ReactModule.createElement(HeaderBar1.Trailing, nil, { rightContent = RenderRightResult }) else nil
	})
	local Element1 = nil
	
	if FFlagAppChatFoundationHeaderBarPageMarginInsetModule then
		local OffsetDelta = _UDim.Offset - Medium
		Element1 = ReactModule.createElement(FoundationModule.View, {
			Position = UDim2.fromOffset(OffsetDelta, 0),
			Size = UDim2.new(1, -(OffsetDelta + (_UDim1.Offset - Medium)), 1, 0)
		}, { headerBar = Element })
	end
	return ReactModule.createElement(FoundationModule.View, {
		LayoutOrder = -1,
		tag = if FFlagAppChatFoundationHeaderBarPageMarginInsetModule then { ["bg-surface-0"] = NoIsInExperienceScreenProps } else nil,
		Size = UDim2.new(1, 0, 0, TopBarHeightScreenProps),
		ZIndex = if FFlagAppIaScrollAway then 2 else nil,
		Position = if FFlagAppIaScrollAway then MapResult else nil
	}, {
		BackgroundSlot = if UseThemeBackgroundResult then ReactModule.createElement(ThemeBackgroundModule.ThemeBackgroundHeaderSlot) else nil,
		headerBar = if Element1 then nil else Element,
		headerBarInset = Element1
	})
end