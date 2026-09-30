local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local roactModule = require(parent.Roact)
local withLocalization = require(parent.Localization).withLocalization
local UIBloxModule = require(parent.UIBlox)
local withStyle = UIBloxModule.Style.withStyle
local appNavBarModule = require(parent.AppNavBar)
local visibilityControl = appNavBarModule.VisibilityControl
local headerBarTitleLeftAlignedModule = require(appChat.Components.ChatConversation.HeaderBarTitleLeftAligned)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagAppIaScrollAway = sharedFlagsModule.FFlagAppIaScrollAway
local fFlagEnableHomeRobloxLogo = sharedFlagsModule.FFlagEnableHomeRobloxLogo
local headerBar = UIBloxModule.App.Bar.HeaderBar
local appHeaderBarModule = require(parent.AppHeaderBar)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local fFlagAppChatDomLocatorFoundationMigrationModule = require(appChat.Flags.FFlagAppChatDomLocatorFoundationMigration)
local createBackFuncModule = require(appChat.Components.TopBar.createBackFunc)
local flyoutSidePanelIXP = require(parent.SharedExperimentDefinition).FlyoutSidePanelIXP
local var1 = if flyoutSidePanelIXP.isFlyoutSidePanelEnabled() then require(parent.FlyoutSidePanel).Components.FlyoutLeftHeader else nil

local function noOpt()
	return nil
end

return function(p1)
	-- upvalues: fFlagAppIaScrollAway (ref), flyoutSidePanelIXP (ref), appHeaderBarModule (ref), withLocalization (ref), createBackFuncModule (ref), fFlagAppChatDomLocatorFoundationMigrationModule (ref), reactModule (ref), foundationModule (ref), noOpt (ref), roactModule (ref), var1 (write), fFlagEnableHomeRobloxLogo (ref), headerBarTitleLeftAlignedModule (ref), appNavBarModule (ref), visibilityControl (ref), withStyle (ref), headerBar (ref)
	local var2 = if fFlagAppIaScrollAway or flyoutSidePanelIXP.isFlyoutSidePanelEnabled() then p1.navigation.getScreenProps("isInExperience", false) else nil
	local topBarHeight = p1.navigation.getScreenProps("topBarHeight", 0)
	local navigateToRootStack = p1.navigation.getScreenProps("navigateToRootStack", nil)
	local var3 = p1.shouldRenderCenter and p1.renderCenter ~= nil
	local headerText = p1.headerText or {}
	local makeBackButton = appHeaderBarModule.makeBackButton
	local makeCloseButton = appHeaderBarModule.makeCloseButton
	
	return withLocalization({
		headerText = if headerText.shouldLocalize then headerText.raw else nil
	})(function(p2)
		-- upvalues: headerText (ref), var3 (ref), p1 (ref), createBackFuncModule (copy), navigateToRootStack (ref), makeBackButton (ref), fFlagAppChatDomLocatorFoundationMigrationModule (copy), reactModule (copy), foundationModule (copy), makeCloseButton (ref), noOpt (copy), flyoutSidePanelIXP (copy), var2 (ref), roactModule (copy), var1 (copy), fFlagEnableHomeRobloxLogo (copy), headerBarTitleLeftAlignedModule (copy), fFlagAppIaScrollAway (copy), appNavBarModule (copy), visibilityControl (copy), topBarHeight (ref), withStyle (copy), headerBar (copy)
		local renderCenter
		local var4 = if headerText.shouldLocalize then p2.headerText else headerText.raw
		local _ = nil
		local _ = nil
		local _ = nil
		
		if var3 then
			var4 = ""
			local var5 = nil
			local var6 = nil
			renderCenter = p1.renderCenter
		else
			local var5 = function()
				-- upvalues: p1 (copy)
				local var7
				if p1.renderRight and not p1.rightHidden then
					var7 = p1.renderRight() or nil
				end
				return var7
			end
			
			renderCenter = nil
			local var7 = createBackFuncModule({
				navigation = p1.navigation,
				navigateToRootStack = navigateToRootStack,
				isRoot = p1.isRoot,
				closeInputBar = p1.closeInputBar
			})
			
			local var8 = function()
				-- upvalues: var7 (ref)
				var7()
			end
			
			if p1.backButtonEnabled then
				local var6 = makeBackButton(var8)
				
				if fFlagAppChatDomLocatorFoundationMigrationModule and p1.backButtonTestId then
					local var9 = var6
					
					var6 = function()
						-- upvalues: reactModule (copy), foundationModule (copy), p1 (copy), var9 (ref)
						return reactModule.createElement(foundationModule.View, { tag = "auto-xy", testId = p1.backButtonTestId }, { backButton = var9() })
					end
				end
			else
				local var6 = if p1.closeButtonEnabled then makeCloseButton(var8) else noOpt
			end
		end
		local var10 = not p1.backButtonEnabled and not var3
		
		if flyoutSidePanelIXP.isFlyoutSidePanelEnabled() and not var2 and (var10 and not p1.conversationId) then
			local var6 = function()
				-- upvalues: roactModule (copy), var1 (copy), var4 (write), fFlagEnableHomeRobloxLogo (copy), flyoutSidePanelIXP (copy)
				return roactModule.createElement(var1, {
					isRobloxLogoEnabled = false,
					titleText = var4,
					isFlyoutEntrypointEnabled = if fFlagEnableHomeRobloxLogo then flyoutSidePanelIXP.isFlyoutSidePanelEnabled() else nil,
					isAlternateEntryPointEnabled = flyoutSidePanelIXP.isAlternateEntryPointEnabled()
				})
			end
		end
		if p1.shouldBoldHeader and var6 == noOpt then
			local var6 = nil
		end
		local var11 = function()
			-- upvalues: roactModule (copy), headerBarTitleLeftAlignedModule (copy), var6 (write), noOpt (copy), var5 (write), var4 (write), p1 (copy)
			return roactModule.createElement(headerBarTitleLeftAlignedModule, {
				renderLeft = if var6 == noOpt then nil else var6,
				renderRight = var5,
				titleText = var4,
				conversationId = p1.conversationId,
				navigateToChatDetails = p1.navigateToChatDetails,
				ignoreRightMargin = p1.rightPaddingOverride ~= nil
			})
		end
		
		local uDim = UDim.new(0, 12)
		local uDim_1 = UDim.new(0, 12)
		
		if p1.leftPaddingOverride ~= nil then
			uDim = UDim.new(0, p1.leftPaddingOverride)
		end
		if p1.rightPaddingOverride ~= nil then
			uDim_1 = UDim.new(0, p1.rightPaddingOverride)
		end
		local var12 = if fFlagAppIaScrollAway and not var2 and appNavBarModule.getScrollAwayEnabled() then visibilityControl.getHeaderBinding():map(function(p3)
			-- upvalues: topBarHeight (copy)
			return UDim2.new(0, 0, 0, (p3 - 1) * (topBarHeight + 36))
		end) else nil
		local var13 = flyoutSidePanelIXP.isFlyoutSidePanelEnabled() and (not var2 and var10)
		
		return if navigateToRootStack then roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = -1,
			Size = UDim2.new(1, 0, 0, topBarHeight),
			ZIndex = if fFlagAppIaScrollAway then 2 else nil,
			Position = if fFlagAppIaScrollAway then var12 else nil
		}, {
			headerBar = withStyle(function(p3)
				-- upvalues: roactModule (copy), headerBar (copy), p1 (copy), var13 (ref), var4 (write), topBarHeight (copy), var6 (write), var11 (ref), renderCenter (write), var5 (write), uDim (write), uDim_1 (write), fFlagAppIaScrollAway (copy), var2 (copy)
				return roactModule.createElement(headerBar, {
					title = if p1.conversationId or var13 then nil else var4,
					barHeight = topBarHeight,
					renderLeft = if p1.conversationId then nil else var6,
					isSecondary = p1.isSecondary,
					renderCenter = if p1.conversationId then var11 else renderCenter,
					renderRight = if p1.conversationId then nil else var5,
					paddingLeft = uDim,
					paddingRight = uDim_1,
					isTitleCentered = not p1.isTitleLeftAligned,
					contentPaddingRight = UDim.new(0, 0),
					backgroundTransparency = if fFlagAppIaScrollAway and not var2 and not p1.isDialog then nil else p3.Tokens.Color.None.Transparency
				})
			end)
		}) else roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = -1,
			Size = UDim2.new(1, 0, 0, topBarHeight),
			ZIndex = if fFlagAppIaScrollAway then 2 else nil,
			Position = if fFlagAppIaScrollAway then var12 else nil
		}, {
			headerBar = withStyle(function(p3)
				-- upvalues: roactModule (copy), headerBar (copy), p1 (copy), var13 (ref), var4 (write), topBarHeight (copy), var10 (ref), var6 (write), var11 (ref), renderCenter (write), var5 (write), uDim (write), uDim_1 (write), fFlagAppIaScrollAway (copy), var2 (copy)
				return roactModule.createElement(headerBar, {
					title = if p1.conversationId or var13 then nil else var4,
					barHeight = topBarHeight,
					renderLeft = if p1.conversationId then nil elseif not var10 then var6 else nil,
					isSecondary = p1.isSecondary,
					renderCenter = if p1.conversationId then var11 else renderCenter,
					renderRight = if p1.conversationId then nil else var5,
					paddingLeft = uDim,
					paddingRight = uDim_1,
					isTitleCentered = not p1.isTitleLeftAligned,
					contentPaddingRight = UDim.new(0, 0),
					backgroundTransparency = if fFlagAppIaScrollAway and not var2 and not p1.isDialog then nil else p3.Tokens.Color.None.Transparency
				})
			end)
		})
	end)
end