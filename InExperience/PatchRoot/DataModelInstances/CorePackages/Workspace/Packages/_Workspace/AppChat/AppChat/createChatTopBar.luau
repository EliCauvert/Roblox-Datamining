local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local RoactModule = require(Parent.Roact)
local WithLocalizationFunction = require(Parent.Localization).withLocalization
local UIBloxModule = require(Parent.UIBlox)
local WithStyleFunction = UIBloxModule.Style.withStyle
local AppNavBarModule = require(Parent.AppNavBar)
local VisibilityControl = AppNavBarModule.VisibilityControl
local HeaderBarTitleLeftAlignedModule = require(AppChat.Components.ChatConversation.HeaderBarTitleLeftAligned)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagAppIaScrollAway = SharedFlagsModule.FFlagAppIaScrollAway
local FFlagEnableHomeRobloxLogo = SharedFlagsModule.FFlagEnableHomeRobloxLogo
local HeaderBar = UIBloxModule.App.Bar.HeaderBar
local AppHeaderBarModule = require(Parent.AppHeaderBar)
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local FFlagAppChatDomLocatorFoundationMigrationModule = require(AppChat.Flags.FFlagAppChatDomLocatorFoundationMigration)
local CreateBackFuncModule = require(AppChat.Components.TopBar.createBackFunc)
local ThemeBackgroundModule = require(Parent.ThemeBackground)
local FFlagAppThemeHalloween2026ChatBackgroundModule = require(AppChat.Flags.FFlagAppThemeHalloween2026ChatBackground)
local FlyoutSidePanelIXP = require(Parent.SharedExperimentDefinition).FlyoutSidePanelIXP
local FlyoutLeftHeader = if FlyoutSidePanelIXP.isFlyoutSidePanelEnabled() then require(Parent.FlyoutSidePanel).Components.FlyoutLeftHeader else nil

local function noOpt()
	return nil
end

return function(p1)
	-- upvalues: FFlagAppThemeHalloween2026ChatBackgroundModule (copy), ThemeBackgroundModule (copy), FFlagAppIaScrollAway (copy), FlyoutSidePanelIXP (copy), AppHeaderBarModule (copy), WithLocalizationFunction (copy), CreateBackFuncModule (copy), FFlagAppChatDomLocatorFoundationMigrationModule (copy), ReactModule (copy), FoundationModule (copy), noOpt (copy), RoactModule (copy), FlyoutLeftHeader (ref), FFlagEnableHomeRobloxLogo (copy), HeaderBarTitleLeftAlignedModule (copy), AppNavBarModule (copy), VisibilityControl (copy), WithStyleFunction (copy), HeaderBar (copy)
	local UseThemeBackgroundResult = if FFlagAppThemeHalloween2026ChatBackgroundModule then ThemeBackgroundModule.useThemeBackground() else nil
	local IsInExperienceScreenProps = if FFlagAppIaScrollAway or FlyoutSidePanelIXP.isFlyoutSidePanelEnabled() then p1.navigation.getScreenProps("isInExperience", false) else nil
	local TopBarHeightScreenProps = p1.navigation.getScreenProps("topBarHeight", 0)
	local NavigateToRootStackScreenProps = p1.navigation.getScreenProps("navigateToRootStack", nil)
	local HasRenderCenter: boolean = p1.shouldRenderCenter and p1.renderCenter ~= nil
	local HeaderText = p1.headerText or {}
	local MakeBackButtonFunction = AppHeaderBarModule.makeBackButton
	local MakeCloseButtonFunction = AppHeaderBarModule.makeCloseButton
	
	return WithLocalizationFunction({
		headerText = HeaderText.shouldLocalize and HeaderText.raw or nil
	})(function(p2)
		-- upvalues: HeaderText (copy), HasRenderCenter (copy), p1 (copy), CreateBackFuncModule (upval), NavigateToRootStackScreenProps (copy), MakeBackButtonFunction (copy), FFlagAppChatDomLocatorFoundationMigrationModule (upval), ReactModule (upval), FoundationModule (upval), MakeCloseButtonFunction (copy), noOpt (upval), FlyoutSidePanelIXP (upval), IsInExperienceScreenProps (copy), RoactModule (upval), FlyoutLeftHeader (upval), FFlagEnableHomeRobloxLogo (upval), HeaderBarTitleLeftAlignedModule (upval), FFlagAppIaScrollAway (upval), AppNavBarModule (upval), VisibilityControl (upval), TopBarHeightScreenProps (copy), UseThemeBackgroundResult (ref), ThemeBackgroundModule (upval), WithStyleFunction (upval), HeaderBar (upval)
		local HeaderText1 = HeaderText.shouldLocalize and p2.headerText or HeaderText.raw
		local RenderRight = nil
		local RenderCenter = nil
		local NoOpt = nil
		
		if HasRenderCenter then
			HeaderText1 = ""
			RenderRight = nil
			NoOpt = nil
			RenderCenter = p1.renderCenter
		else
			RenderRight = function()
				-- upvalues: p1 (upval)
				return p1.renderRight and not p1.rightHidden and p1.renderRight() or nil
			end
			
			RenderCenter = nil
			local BackFuncModule = CreateBackFuncModule({
				navigation = p1.navigation,
				navigateToRootStack = NavigateToRootStackScreenProps,
				isRoot = p1.isRoot,
				closeInputBar = p1.closeInputBar
			})
			
			local function v35()
				-- upvalues: BackFuncModule (copy)
				BackFuncModule()
			end
			
			if p1.backButtonEnabled then
				NoOpt = MakeBackButtonFunction(v35)
				
				if FFlagAppChatDomLocatorFoundationMigrationModule and p1.backButtonTestId then
					local Callback = NoOpt
					
					NoOpt = function()
						-- upvalues: ReactModule (upval), FoundationModule (upval), p1 (upval), Callback (copy)
						return ReactModule.createElement(FoundationModule.View, { tag = "auto-xy", testId = p1.backButtonTestId }, { backButton = Callback() })
					end
				end
			else
				NoOpt = if p1.closeButtonEnabled then MakeCloseButtonFunction(v35) else noOpt
			end
		end
		local NoHasRenderCenter: boolean = not p1.backButtonEnabled and not HasRenderCenter
		
		if FlyoutSidePanelIXP.isFlyoutSidePanelEnabled() and not IsInExperienceScreenProps and NoHasRenderCenter and not p1.conversationId then
			NoOpt = function()
				-- upvalues: RoactModule (upval), FlyoutLeftHeader (upval), HeaderText1 (ref), FFlagEnableHomeRobloxLogo (upval), FlyoutSidePanelIXP (upval)
				return RoactModule.createElement(FlyoutLeftHeader, {
					isRobloxLogoEnabled = false,
					titleText = HeaderText1,
					isFlyoutEntrypointEnabled = if FFlagEnableHomeRobloxLogo then FlyoutSidePanelIXP.isFlyoutSidePanelEnabled() else nil,
					isAlternateEntryPointEnabled = FlyoutSidePanelIXP.isAlternateEntryPointEnabled()
				})
			end
		end
		if p1.shouldBoldHeader and NoOpt == noOpt then
			NoOpt = nil
		end
		local function v37()
			-- upvalues: RoactModule (upval), HeaderBarTitleLeftAlignedModule (upval), NoOpt (ref), noOpt (upval), RenderRight (ref), HeaderText1 (ref), p1 (upval)
			return RoactModule.createElement(HeaderBarTitleLeftAlignedModule, {
				renderLeft = if NoOpt == noOpt then nil else NoOpt,
				renderRight = RenderRight,
				titleText = HeaderText1,
				conversationId = p1.conversationId,
				navigateToChatDetails = p1.navigateToChatDetails,
				ignoreRightMargin = p1.rightPaddingOverride ~= nil
			})
		end
		
		local _UDim = UDim.new(0, 12)
		local _UDim1 = UDim.new(0, 12)
		
		if p1.leftPaddingOverride ~= nil then
			_UDim = UDim.new(0, p1.leftPaddingOverride)
		end
		if p1.rightPaddingOverride ~= nil then
			_UDim1 = UDim.new(0, p1.rightPaddingOverride)
		end
		local MapResult = if FFlagAppIaScrollAway and not IsInExperienceScreenProps and AppNavBarModule.getScrollAwayEnabled() then VisibilityControl.getHeaderBinding():map(function(p3: number): UDim2
			-- upvalues: TopBarHeightScreenProps (upval)
			return UDim2.new(0, 0, 0, (p3 - 1) * (TopBarHeightScreenProps + 36))
		end) else nil
		local NoHasRenderCenter1: boolean = FlyoutSidePanelIXP.isFlyoutSidePanelEnabled() and (not IsInExperienceScreenProps and NoHasRenderCenter)
		
		return if NavigateToRootStackScreenProps then RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = -1,
			Size = UDim2.new(1, 0, 0, TopBarHeightScreenProps),
			ZIndex = if FFlagAppIaScrollAway then 2 else nil,
			Position = if FFlagAppIaScrollAway then MapResult else nil
		}, {
			BackgroundSlot = if UseThemeBackgroundResult then RoactModule.createElement(ThemeBackgroundModule.ThemeBackgroundHeaderSlot) else nil,
			headerBar = WithStyleFunction(function(p3)
				-- upvalues: RoactModule (upval), HeaderBar (upval), p1 (upval), NoHasRenderCenter1 (copy), HeaderText1 (ref), TopBarHeightScreenProps (upval), NoOpt (ref), v37 (copy), RenderCenter (ref), RenderRight (ref), _UDim (ref), _UDim1 (ref), UseThemeBackgroundResult (upval), FFlagAppIaScrollAway (upval), IsInExperienceScreenProps (upval)
				return RoactModule.createElement(HeaderBar, {
					title = if p1.conversationId or NoHasRenderCenter1 then nil else HeaderText1,
					barHeight = TopBarHeightScreenProps,
					renderLeft = if p1.conversationId then nil else NoOpt,
					isSecondary = p1.isSecondary,
					renderCenter = if p1.conversationId then v37 else RenderCenter,
					renderRight = if p1.conversationId then nil else RenderRight,
					paddingLeft = _UDim,
					paddingRight = _UDim1,
					isTitleCentered = not p1.isTitleLeftAligned,
					contentPaddingRight = UDim.new(0, 0),
					backgroundTransparency = if UseThemeBackgroundResult then 1 elseif FFlagAppIaScrollAway and not IsInExperienceScreenProps and not p1.isDialog then nil else p3.Tokens.Color.None.Transparency
				})
			end)
		}) else RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = -1,
			Size = UDim2.new(1, 0, 0, TopBarHeightScreenProps),
			ZIndex = if FFlagAppIaScrollAway then 2 else nil,
			Position = if FFlagAppIaScrollAway then MapResult else nil
		}, {
			BackgroundSlot = if UseThemeBackgroundResult then RoactModule.createElement(ThemeBackgroundModule.ThemeBackgroundHeaderSlot) else nil,
			headerBar = WithStyleFunction(function(p3)
				-- upvalues: RoactModule (upval), HeaderBar (upval), p1 (upval), NoHasRenderCenter1 (copy), HeaderText1 (ref), TopBarHeightScreenProps (upval), NoHasRenderCenter (copy), NoOpt (ref), v37 (copy), RenderCenter (ref), RenderRight (ref), _UDim (ref), _UDim1 (ref), UseThemeBackgroundResult (upval), FFlagAppIaScrollAway (upval), IsInExperienceScreenProps (upval)
				return RoactModule.createElement(HeaderBar, {
					title = if p1.conversationId or NoHasRenderCenter1 then nil else HeaderText1,
					barHeight = TopBarHeightScreenProps,
					renderLeft = if p1.conversationId then nil elseif NoHasRenderCenter then nil else NoOpt or nil,
					isSecondary = p1.isSecondary,
					renderCenter = if p1.conversationId then v37 else RenderCenter,
					renderRight = if p1.conversationId then nil else RenderRight,
					paddingLeft = _UDim,
					paddingRight = _UDim1,
					isTitleCentered = not p1.isTitleLeftAligned,
					contentPaddingRight = UDim.new(0, 0),
					backgroundTransparency = if UseThemeBackgroundResult then 1 elseif FFlagAppIaScrollAway and not IsInExperienceScreenProps and not p1.isDialog then nil else p3.Tokens.Color.None.Transparency
				})
			end)
		})
	end)
end