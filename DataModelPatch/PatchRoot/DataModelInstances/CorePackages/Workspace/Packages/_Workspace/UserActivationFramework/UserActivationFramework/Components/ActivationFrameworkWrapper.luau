local UserActivationFramework = script:FindFirstAncestor("UserActivationFramework")
local Parent = UserActivationFramework.Parent
local ReactModule = require(Parent.React)
local FullPageNavigationHeaderModule = require(UserActivationFramework.Components.FullPageNavigationHeader)
local FullPageNavigationFooterModule = require(UserActivationFramework.Components.FullPageNavigationFooter)
local _ = require(UserActivationFramework.Components.ActivationFrameworkTokenMapper)
local _ = require(UserActivationFramework.Types)
local FullPageActivationFrameworkContextModule = require(UserActivationFramework.Context.FullPageActivationFrameworkContext)
local NavigationActionModule = require(UserActivationFramework.Enums.NavigationAction)
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local AuthAnalyticsModule = require(Parent.AuthAnalytics)
local EventStreamConstants = AuthAnalyticsModule.EventStreamConstants
local AuthButtonClickFunction = AuthAnalyticsModule.Events.authButtonClick
local AuthPageloadFunction = AuthAnalyticsModule.Events.authPageload
local _ = require(UserActivationFramework.Enums.Namespace)
local UseUpdateActivationWorkflowAndNavigateModule = require(UserActivationFramework.Hooks.useUpdateActivationWorkflowAndNavigate)

return function(p1)
	-- upvalues: ReactModule (copy), FullPageActivationFrameworkContextModule (copy), UseDesignTokensFunction (copy), AuthPageloadFunction (copy), UseUpdateActivationWorkflowAndNavigateModule (copy), AuthButtonClickFunction (copy), EventStreamConstants (copy), NavigationActionModule (copy), FullPageNavigationHeaderModule (copy), FullPageNavigationFooterModule (copy)
	local ActivationFrameworkState = ReactModule.useContext(FullPageActivationFrameworkContextModule).activationFrameworkState
	local UseStateResult, UseStateResult2 = ReactModule.useState(0)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(0)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(0)
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(0)
	local UseStateResult5, UseStateResult2_4 = ReactModule.useState(0)
	local UseStateResult6, UseStateResult2_5 = ReactModule.useState(0)
	local UseStateResult7, UseStateResult2_6 = ReactModule.useState(0)
	local UseStateResult8, UseStateResult2_7 = ReactModule.useState(0)
	local ActivationFramework = UseDesignTokensFunction().LuaApps.ActivationFramework
	local NoShouldExpandMiddleContent = not p1.shouldExpandMiddleContent
	ReactModule.useEffect(function()
		-- upvalues: AuthPageloadFunction (upval), p1 (copy), ActivationFrameworkState (copy)
		AuthPageloadFunction(p1.namespace, ActivationFrameworkState.currentState)
	end, {})
	local UseUpdateActivationWorkflowAndNavigateModuleResult = nil
	UseUpdateActivationWorkflowAndNavigateModuleResult = UseUpdateActivationWorkflowAndNavigateModule(p1.navigation)
	
	local function OnSkip()
		-- upvalues: AuthButtonClickFunction (upval), p1 (copy), EventStreamConstants (upval), ActivationFrameworkState (copy), UseUpdateActivationWorkflowAndNavigateModuleResult (ref), NavigationActionModule (upval)
		AuthButtonClickFunction(p1.namespace, EventStreamConstants.Button.Skip, ActivationFrameworkState.currentState)
		UseUpdateActivationWorkflowAndNavigateModuleResult(NavigationActionModule.Skip)
	end
	
	local UseStateResult9, UseStateResult2_8 = ReactModule.useState({
		shouldShowBackButton = false,
		icon = "icons/actions/cycleLeft",
		onBack = function()
			-- upvalues: AuthButtonClickFunction (upval), p1 (copy), EventStreamConstants (upval), ActivationFrameworkState (copy), UseUpdateActivationWorkflowAndNavigateModuleResult (ref), NavigationActionModule (upval)
			AuthButtonClickFunction(p1.namespace, EventStreamConstants.Button.Back, ActivationFrameworkState.currentState)
			UseUpdateActivationWorkflowAndNavigateModuleResult(NavigationActionModule.Back)
		end
	})
	local UseStateResult10, UseStateResult2_9 = ReactModule.useState({
		shouldShowSkipButton = false,
		skipButtonTextKey = "Authentication.SignUp.Label.Skip",
		onSkip = OnSkip
	})
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult9 (copy), UseStateResult10 (copy), ActivationFrameworkState (copy), NavigationActionModule (upval), UseStateResult2_8 (copy), UseStateResult2_9 (copy)
		local Copy = table.clone(UseStateResult9)
		local Copy1 = table.clone(UseStateResult10)
		Copy1.shouldShowSkipButton = table.find(ActivationFrameworkState.availableActions, NavigationActionModule.Skip) ~= nil
		Copy.shouldShowBackButton = false
		
		if table.find(ActivationFrameworkState.availableActions, NavigationActionModule.Back) then
			Copy.shouldShowBackButton = true
			Copy.icon = "icons/actions/cycleLeft"
		elseif table.find(ActivationFrameworkState.availableActions, NavigationActionModule.Close) then
			Copy.shouldShowBackButton = true
			Copy.icon = "icons/navigation/close"
		end
		UseStateResult2_8(Copy)
		UseStateResult2_9(Copy1)
	end, { ActivationFrameworkState.availableActions })
	local VerticalPaddingPx = ActivationFramework.verticalPaddingPx
	local VerticalPaddingPx1 = ActivationFramework.verticalPaddingPx
	ReactModule.useLayoutEffect(function()
		-- upvalues: UseStateResult3 (copy), ActivationFramework (copy), UseStateResult2_4 (copy), UseStateResult2_6 (copy)
		if UseStateResult3 > 0 then
			local UseStateResultDelta = UseStateResult3 - ActivationFramework.horizontalPaddingPx * 2
			UseStateResult2_4(UseStateResultDelta)
			UseStateResult2_6(UseStateResultDelta)
		end
	end, { UseStateResult3 })
	ReactModule.useLayoutEffect(function()
		-- upvalues: NoShouldExpandMiddleContent (copy), UseStateResult (copy), UseStateResult1 (copy), UseStateResult4 (copy), UseStateResult6 (copy), VerticalPaddingPx (copy), VerticalPaddingPx1 (copy), UseStateResult2_7 (copy)
		if NoShouldExpandMiddleContent and UseStateResult > 0 and UseStateResult1 > 0 and UseStateResult4 > 0 and UseStateResult6 > 0 then
			UseStateResult2_7(UseStateResult4 - UseStateResult - UseStateResult1 - VerticalPaddingPx - VerticalPaddingPx1 - UseStateResult6)
		end
	end, {
		UseStateResult,
		UseStateResult1,
		UseStateResult4,
		UseStateResult6
	})
	ReactModule.useLayoutEffect(function()
		-- upvalues: p1 (copy), UseStateResult (copy), UseStateResult1 (copy), UseStateResult4 (copy), VerticalPaddingPx (copy), VerticalPaddingPx1 (copy), UseStateResult8 (copy), UseStateResult2_5 (copy)
		if p1.shouldExpandMiddleContent and UseStateResult > 0 and UseStateResult1 > 0 and UseStateResult4 > 0 then
			UseStateResult2_5(UseStateResult4 - UseStateResult - UseStateResult1 - VerticalPaddingPx - VerticalPaddingPx1 - UseStateResult8)
		end
	end, {
		UseStateResult,
		UseStateResult1,
		UseStateResult4,
		UseStateResult8
	})
	
	return ReactModule.createElement("Frame", {
		Size = UDim2.new(1, 0, 1, 0),
		Position = UDim2.new(0, 0, 0, 0),
		BackgroundTransparency = 1,
		[ReactModule.Change.AbsoluteSize] = function(Frame: Frame)
			-- upvalues: UseStateResult2_2 (copy), UseStateResult2_3 (copy)
			UseStateResult2_2(Frame.AbsoluteSize.X)
			UseStateResult2_3(Frame.AbsoluteSize.Y)
		end,
		BorderSizePixel = 0
	}, {
		Padding = ReactModule.createElement("UIPadding", {
			PaddingBottom = UDim.new(0, ActivationFramework.verticalPaddingPx),
			PaddingTop = UDim.new(0, ActivationFramework.verticalPaddingPx),
			PaddingLeft = UDim.new(0, ActivationFramework.horizontalPaddingPx),
			PaddingRight = UDim.new(0, ActivationFramework.horizontalPaddingPx)
		}),
		Layout = ReactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Top
		}),
		Header = ReactModule.createElement("Frame", {
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			[ReactModule.Change.AbsoluteSize] = function(Frame)
				-- upvalues: UseStateResult2 (copy)
				UseStateResult2(Frame.AbsoluteSize.Y)
			end,
			LayoutOrder = 1
		}, {
			Padding = ReactModule.createElement("UIPadding", {
				PaddingBottom = UDim.new(0, ActivationFramework.headerTopPadding)
			}),
			HeaderContent = ReactModule.createElement(FullPageNavigationHeaderModule, {
				skipProps = UseStateResult10,
				backProps = UseStateResult9,
				titleTextKey = p1.titleTextKey,
				bodyTextKey = p1.bodyTextKey,
				headingTextKey = p1.headingTextKey,
				ixpTitleTextKey = p1.ixpTitleTextKey,
				ixpBodyTextKey = p1.ixpBodyTextKey
			})
		}),
		Content = ReactModule.createElement("Frame", {
			Size = if p1.shouldExpandMiddleContent then UDim2.new(0, UseStateResult5, 0, UseStateResult6) else UDim2.new(0, UseStateResult5, 0, 0),
			AutomaticSize = if p1.shouldExpandMiddleContent then nil else Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			[ReactModule.Change.AbsoluteSize] = function(Frame)
				-- upvalues: p1 (copy), UseStateResult2_5 (copy)
				if not p1.shouldExpandMiddleContent then
					UseStateResult2_5(Frame.AbsoluteSize.Y)
				end
			end
		}, { p1.children }),
		Footer = ReactModule.createElement("Frame", {
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			[ReactModule.Change.AbsoluteSize] = function(Frame)
				-- upvalues: UseStateResult2_1 (copy)
				UseStateResult2_1(Frame.AbsoluteSize.Y)
			end,
			BackgroundTransparency = 1,
			LayoutOrder = 3
		}, {
			Padding = ReactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, ActivationFramework.footerTopPaddingPx)
			}),
			FooterContent = ReactModule.createElement(FullPageNavigationFooterModule, {
				primaryButton = p1.primaryButton,
				secondaryButton = p1.secondaryButton,
				shouldShowButtonDivider = p1.shouldShowButtonDivider,
				navigation = p1.navigation
			})
		}),
		SubFooterContent = if p1.subFooterContent then ReactModule.createElement("Frame", {
			Size = if NoShouldExpandMiddleContent then UDim2.new(0, UseStateResult7, 0, UseStateResult8) else UDim2.new(0, UseStateResult7, 0, 0),
			AutomaticSize = if NoShouldExpandMiddleContent then nil else Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			LayoutOrder = 4,
			[ReactModule.Change.AbsoluteSize] = function(Frame)
				-- upvalues: NoShouldExpandMiddleContent (copy), UseStateResult2_7 (copy)
				if not NoShouldExpandMiddleContent then
					UseStateResult2_7(Frame.AbsoluteSize.Y)
				end
			end
		}, {
			Padding = ReactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, ActivationFramework.subfooterTopPaddingPx),
				PaddingBottom = UDim.new(0, ActivationFramework.subfooterBottomPaddingPx)
			}),
			p1.subFooterContent
		}) else nil
	})
end