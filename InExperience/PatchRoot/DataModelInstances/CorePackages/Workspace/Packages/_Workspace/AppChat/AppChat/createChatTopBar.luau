local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local enumScreensModule = require(appChat.EnumScreens)
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
local fFlagAppChatFixBackButtonOnRotationModule = require(appChat.Flags.FFlagAppChatFixBackButtonOnRotation)
local canPopParentStackModule = require(appChat.Utils.canPopParentStack)
local flyoutSidePanelIXP = require(parent.SharedExperimentDefinition).FlyoutSidePanelIXP
local var13 = if flyoutSidePanelIXP.isFlyoutSidePanelEnabled() then require(parent.FlyoutSidePanel).Components.FlyoutLeftHeader else nil

local function noOpt() --[[ line: 30 ]]
	return nil
end

return function(p0) --[[ line: 37 ]]
	-- upvalues: fFlagAppIaScrollAway (ref), flyoutSidePanelIXP (ref), appHeaderBarModule (ref), withLocalization (ref), fFlagAppChatFixBackButtonOnRotationModule (ref), canPopParentStackModule (ref), enumScreensModule (ref), fFlagAppChatDomLocatorFoundationMigrationModule (ref), reactModule (ref), foundationModule (ref), noOpt (ref), roactModule (ref), var13 (write), fFlagEnableHomeRobloxLogo (ref), headerBarTitleLeftAlignedModule (ref), appNavBarModule (ref), visibilityControl (ref), withStyle (ref), headerBar (ref)
	local var15 = if fFlagAppIaScrollAway or flyoutSidePanelIXP.isFlyoutSidePanelEnabled() then p0.navigation.getScreenProps("isInExperience", false) else nil
	local topBarHeight = p0.navigation.getScreenProps("topBarHeight", 0)
	local navigateToRootStack = p0.navigation.getScreenProps("navigateToRootStack", nil)
	local var18 = p0.shouldRenderCenter and p0.renderCenter ~= nil
	local headerText = p0.headerText or {}
	local makeBackButton = appHeaderBarModule.makeBackButton
	local makeCloseButton = appHeaderBarModule.makeCloseButton
	
	return withLocalization({
		headerText = if headerText.shouldLocalize then headerText.raw else nil
	})(function(p1) --[[ line: 53 ]]
		-- upvalues: headerText (ref), var18 (ref), p0 (ref), navigateToRootStack (ref), fFlagAppChatFixBackButtonOnRotationModule (copy), canPopParentStackModule (copy), enumScreensModule (copy), makeBackButton (ref), fFlagAppChatDomLocatorFoundationMigrationModule (copy), reactModule (copy), foundationModule (copy), makeCloseButton (ref), noOpt (copy), flyoutSidePanelIXP (copy), var15 (ref), roactModule (copy), var13 (copy), fFlagEnableHomeRobloxLogo (copy), headerBarTitleLeftAlignedModule (copy), fFlagAppIaScrollAway (copy), appNavBarModule (copy), visibilityControl (copy), topBarHeight (ref), withStyle (copy), headerBar (copy)
		local renderCenter
		local var20 = if headerText.shouldLocalize then p1.headerText else headerText.raw
		local _ = nil
		local _ = nil
		local _ = nil
		
		if var18 then
			var20 = ""
			local var21 = nil
			local var23 = nil
			renderCenter = p0.renderCenter
		else
			local var21 = function() --[[ line: 64 ]]
				-- upvalues: p0 (copy)
				local var31
				if p0.renderRight and not p0.rightHidden then
					var31 = p0.renderRight() or nil
				end
				return var31
			end
			
			renderCenter = nil
			local var22 = if navigateToRootStack then function() --[[ line: 71 ]]
				-- upvalues: p0 (copy), fFlagAppChatFixBackButtonOnRotationModule (copy), canPopParentStackModule (copy), enumScreensModule (copy), navigateToRootStack (copy)
				if p0.closeInputBar then
					p0.closeInputBar()
				end
				if not p0.isRoot then
					p0.navigation.pop()
					
					return
				elseif fFlagAppChatFixBackButtonOnRotationModule and canPopParentStackModule(p0.navigation) then
					p0.navigation.pop()
					
					return
				end
				p0.navigation.navigate(enumScreensModule.EmptyConversation)
				navigateToRootStack()
			end else function() --[[ line: 92 ]]
				-- upvalues: p0 (copy)
				p0.navigation.pop()
			end
			
			if p0.backButtonEnabled then
				local var23 = makeBackButton(var22)
				
				if fFlagAppChatDomLocatorFoundationMigrationModule and p0.backButtonTestId then
					local var24 = var23
					
					local var23 = function() --[[ line: 100 ]]
						-- upvalues: reactModule (copy), foundationModule (copy), p0 (copy), var24 (ref)
						return reactModule.createElement(foundationModule.View, { tag = "auto-xy", testId = p0.backButtonTestId }, { backButton = var24() })
					end
				end
			else
				local var23 = if p0.closeButtonEnabled then makeCloseButton(var22) else noOpt
			end
		end
		local var25 = not p0.backButtonEnabled and not var18
		
		if flyoutSidePanelIXP.isFlyoutSidePanelEnabled() and not var15 and (var25 and not p0.conversationId) then
			local var23 = function() --[[ line: 122 ]]
				-- upvalues: roactModule (copy), var13 (copy), var20 (write), fFlagEnableHomeRobloxLogo (copy), flyoutSidePanelIXP (copy)
				return roactModule.createElement(var13, {
					isRobloxLogoEnabled = false,
					titleText = var20,
					isFlyoutEntrypointEnabled = if fFlagEnableHomeRobloxLogo then flyoutSidePanelIXP.isFlyoutSidePanelEnabled() else nil,
					isAlternateEntryPointEnabled = flyoutSidePanelIXP.isAlternateEntryPointEnabled()
				})
			end
		end
		if p0.shouldBoldHeader and var23 == noOpt then
			local var23 = nil
		end
		local var26 = function() --[[ line: 140 ]]
			-- upvalues: roactModule (copy), headerBarTitleLeftAlignedModule (copy), var23 (write), noOpt (copy), var21 (write), var20 (write), p0 (copy)
			return roactModule.createElement(headerBarTitleLeftAlignedModule, {
				renderLeft = if var23 == noOpt then nil else var23,
				renderRight = var21,
				titleText = var20,
				conversationId = p0.conversationId,
				navigateToChatDetails = p0.navigateToChatDetails,
				ignoreRightMargin = p0.rightPaddingOverride ~= nil
			})
		end
		
		local uDim = UDim.new(0, 12)
		local uDim_1 = UDim.new(0, 12)
		
		if p0.leftPaddingOverride ~= nil then
			uDim = UDim.new(0, p0.leftPaddingOverride)
		end
		if p0.rightPaddingOverride ~= nil then
			uDim_1 = UDim.new(0, p0.rightPaddingOverride)
		end
		local var29 = if fFlagAppIaScrollAway and not var15 and appNavBarModule.getScrollAwayEnabled() then visibilityControl.getHeaderBinding():map(function(p2) --[[ line: 163 ]]
			-- upvalues: topBarHeight (copy)
			return UDim2.new(0, 0, 0, (p2 - 1) * (topBarHeight + 36))
		end) else nil
		local var25_1 = flyoutSidePanelIXP.isFlyoutSidePanelEnabled() and (not var15 and var25)
		
		return if navigateToRootStack then roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = -1,
			Size = UDim2.new(1, 0, 0, topBarHeight),
			ZIndex = if fFlagAppIaScrollAway then 2 else nil,
			Position = if fFlagAppIaScrollAway then var29 else nil
		}, {
			headerBar = withStyle(function(p4) --[[ line: 181 ]]
				-- upvalues: roactModule (copy), headerBar (copy), p0 (copy), var25_1 (ref), var20 (write), topBarHeight (copy), var23 (write), var26 (ref), renderCenter (write), var21 (write), uDim (write), uDim_1 (write), fFlagAppIaScrollAway (copy), var15 (copy)
				return roactModule.createElement(headerBar, {
					title = if p0.conversationId or var25_1 then nil else var20,
					barHeight = topBarHeight,
					renderLeft = if p0.conversationId then nil else var23,
					isSecondary = p0.isSecondary,
					renderCenter = if p0.conversationId then var26 else renderCenter,
					renderRight = if p0.conversationId then nil else var21,
					paddingLeft = uDim,
					paddingRight = uDim_1,
					isTitleCentered = not p0.isTitleLeftAligned,
					contentPaddingRight = UDim.new(0, 0),
					backgroundTransparency = if fFlagAppIaScrollAway and not var15 and not p0.isDialog then nil else p4.Tokens.Color.None.Transparency
				})
			end)
		}) else roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = -1,
			Size = UDim2.new(1, 0, 0, topBarHeight),
			ZIndex = if fFlagAppIaScrollAway then 2 else nil,
			Position = if fFlagAppIaScrollAway then var29 else nil
		}, {
			headerBar = withStyle(function(p3) --[[ line: 209 ]]
				-- upvalues: roactModule (copy), headerBar (copy), p0 (copy), var25_1 (ref), var20 (write), topBarHeight (copy), var25 (ref), var23 (write), var26 (ref), renderCenter (write), var21 (write), uDim (write), uDim_1 (write), fFlagAppIaScrollAway (copy), var15 (copy)
				return roactModule.createElement(headerBar, {
					title = if p0.conversationId or var25_1 then nil else var20,
					barHeight = topBarHeight,
					renderLeft = if p0.conversationId then nil elseif not var25 then var23 else nil,
					isSecondary = p0.isSecondary,
					renderCenter = if p0.conversationId then var26 else renderCenter,
					renderRight = if p0.conversationId then nil else var21,
					paddingLeft = uDim,
					paddingRight = uDim_1,
					isTitleCentered = not p0.isTitleLeftAligned,
					contentPaddingRight = UDim.new(0, 0),
					backgroundTransparency = if fFlagAppIaScrollAway and not var15 and not p0.isDialog then nil else p3.Tokens.Color.None.Transparency
				})
			end)
		})
	end)
end