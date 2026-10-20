local Parent = script.Parent.Parent
local DependenciesModule = require(Parent.dependencies)
local React = DependenciesModule.React
local PeekView = DependenciesModule.PeekView.PeekView
local Cryo = DependenciesModule.Cryo
local PeekViewState = DependenciesModule.PeekView.PeekViewState
local UseNavigationFunction = DependenciesModule.Hooks.useNavigation
local UseStateFunction = React.useState
local UseEffectFunction = React.useEffect
local UseLocalizationFunction = DependenciesModule.Localization.Hooks.useLocalization
local UseDesignTokensFunction = DependenciesModule.Style.useDesignTokens
local UseSelectorFunction = DependenciesModule.RoactUtils.Hooks.RoactRodux.useSelector
local AccountSelectionListModule = require(script.Parent.AccountSelectionList)
local _ = require(script.Parent.AccountSelection)
local AnalyticsEventsModule = require(Parent.Analytics.AnalyticsEvents)
local MoveAccountSelectorClosingAfterOperation = game:DefineFastFlag("MoveAccountSelectorClosingAfterOperation", false)
local AccountSelectorInitialRowsShown = game:DefineFastInt("AccountSelectorInitialRowsShown", 6)
local EnableAccountSelectorPeekviewRemoveSuperBriefState = game:DefineFastFlag("EnableAccountSelectorPeekviewRemoveSuperBriefState", false)
local GetFFlagLuaAppEnableTopBannerFunction = DependenciesModule.SharedFlags.GetFFlagLuaAppEnableTopBanner
local UseStyleFunction = DependenciesModule.UIBlox.Core.Style.useStyle
local WithNavigationFocusResult = DependenciesModule.RoactNavigation.withNavigationFocus(function(p1)
	-- upvalues: UseStyleFunction (copy), UseNavigationFunction (copy), UseStateFunction (copy), PeekViewState (copy), UseDesignTokensFunction (copy), AccountSelectorInitialRowsShown (copy), UseLocalizationFunction (copy), UseSelectorFunction (copy), GetFFlagLuaAppEnableTopBannerFunction (copy), React (copy), UseEffectFunction (copy), AnalyticsEventsModule (copy), MoveAccountSelectorClosingAfterOperation (copy), PeekView (copy), EnableAccountSelectorPeekviewRemoveSuperBriefState (copy), AccountSelectionListModule (copy)
	local UseStyleResult = UseStyleFunction()
	local UseNavigationResult = UseNavigationFunction()
	local UseStateResult, UseStateResult2 = UseStateFunction(false)
	local UseStateResult1, UseStateResult2_1 = UseStateFunction(PeekViewState.Full)
	local BaseSize = UseStyleResult.Font.BaseSize
	local ScaledRelativeSize = UseStyleResult.Font.Header1.RelativeSize * BaseSize
	local CountUsers = #p1.users
	local Size1600: number = UseDesignTokensFunction().Size.Size_1600
	local ScaledSize = Size1600 * (math.min(AccountSelectorInitialRowsShown, CountUsers) + 1.25 + 1)
	local ScaledSize1 = CountUsers < 100 and Size1600 * CountUsers or Size1600 * 100.5
	local UseLocalizationResult = UseLocalizationFunction({ titleText = p1.titleTextKey, helpText = p1.helpTextKey })
	local UseSelectorResult = UseSelectorFunction(function(p2)
		return p2.ScreenSize
	end)
	local UseSelectorResult1 = if GetFFlagLuaAppEnableTopBannerFunction() then UseSelectorFunction(function(p2)
		return p2.GlobalGuiInset.top
	end) else 0
	local XDelta = UseSelectorResult.X - 48
	local UseRefResult = React.useRef(false)
	local Color = UseStyleResult.Theme.BackgroundContrast.Color
	UseEffectFunction(function()
		-- upvalues: p1 (copy), AnalyticsEventsModule (upval), UseRefResult (copy)
		local Text = ""
		
		for _, user in p1.users do
			Text ..= tostring(user.id) .. ","
		end
		AnalyticsEventsModule.sendPageLoadEvent(p1.context, p1.origin, (Text:sub(1, -2)))
		
		return function()
			-- upvalues: UseRefResult (upval), p1 (upval)
			if not UseRefResult.current then
				p1.onAccountSelectionAbandoned()
			end
		end
	end, {})
	
	return React.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = if GetFFlagLuaAppEnableTopBannerFunction() then UDim2.new(1, 0, 0, UseSelectorResult.Y - UseSelectorResult1) else UDim2.new(1, 0, 0, UseSelectorResult.Y),
		BackgroundColor3 = UseStyleResult.Theme.Overlay.Color
	}, {
		PeekView = React.createElement(PeekView, {
			hasScrim = true,
			peekHeaderClose = false,
			canDragFullViewToBrief = true,
			mountAnimation = true,
			returnToFullView = true,
			thumbstickScrollEnabled = true,
			showDraggerInClosedState = true,
			briefViewContentHeight = UDim.new(0, ScaledSize),
			superBriefViewContentHeight = if EnableAccountSelectorPeekviewRemoveSuperBriefState then nil else UDim.new(0, 40),
			style = UseStyleResult,
			stateOnMount = PeekViewState.Brief,
			peekHeaderPositionYChange = function(p2: number)
				-- upvalues: UseStateResult2_1 (copy), PeekViewState (upval)
				if p2 < 10 then
					UseStateResult2_1(PeekViewState.Closed)
				end
			end,
			viewStateChanged = function(Closed, _)
				-- upvalues: UseStateResult2_1 (copy), PeekViewState (upval), UseNavigationResult (copy)
				UseStateResult2_1(Closed)
				
				if Closed == PeekViewState.Closed or Closed == PeekViewState.Hidden then
					UseNavigationResult.goBack()
				end
			end,
			peekViewState = UseStateResult1
		}, {
			Content = React.createElement("Frame", {
				BackgroundTransparency = 0,
				Size = UDim2.new(1, 0, 0, 0),
				BorderColor3 = Color,
				BackgroundColor3 = Color,
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				ContentPadding = React.createElement("UIPadding", { PaddingBottom = UDim.new(0, 48) }),
				UIListLayout = React.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, 12),
					HorizontalAlignment = Enum.HorizontalAlignment.Center
				}),
				TitleFrame = React.createElement("Frame", {
					LayoutOrder = 0,
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				}, {
					ContentPadding = React.createElement("UIPadding", {
						PaddingLeft = UDim.new(0, 24),
						PaddingRight = UDim.new(0, 24)
					}),
					TitleText = React.createElement("TextLabel", {
						BackgroundTransparency = 1,
						TextWrapped = true,
						Text = UseLocalizationResult.titleText,
						TextSize = ScaledRelativeSize,
						TextColor3 = UseStyleResult.Theme.TextEmphasis.Color,
						TextTransparency = UseStyleResult.Theme.TextDefault.Transparency,
						Font = UseStyleResult.Font.Header2.Font,
						TextXAlignment = Enum.TextXAlignment.Center,
						Size = UDim2.new(0, XDelta, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y
					})
				}),
				Divider = React.createElement("Frame", {
					LayoutOrder = 1,
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 0, 1),
					BackgroundColor3 = UseStyleResult.Theme.Divider.Color,
					BackgroundTransparency = UseStyleResult.Theme.Divider.Transparency
				}),
				HelpText = if UseLocalizationResult.helpText then React.createElement("TextLabel", {
					LayoutOrder = 2,
					BackgroundTransparency = 1,
					TextWrapped = true,
					Text = UseLocalizationResult.helpText,
					TextSize = BaseSize,
					TextColor3 = UseStyleResult.Theme.TextDefault.Color,
					TextTransparency = UseStyleResult.Theme.TextDefault.Transparency,
					Font = UseStyleResult.Font.Body.Font,
					TextXAlignment = Enum.TextXAlignment.Left,
					Size = UDim2.new(0, XDelta, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				}) else nil,
				AccountSelectionContent = React.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 3,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				}, {
					UIListLayout = React.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Vertical,
						SortOrder = Enum.SortOrder.LayoutOrder,
						HorizontalAlignment = Enum.HorizontalAlignment.Center
					}),
					AccountSelectionList = React.createElement(AccountSelectionListModule, {
						LayoutOrder = 0,
						isScrollable = false,
						users = p1.users,
						onAccountSelection = function(p2)
							-- upvalues: MoveAccountSelectorClosingAfterOperation (upval), UseStateResult2_1 (copy), PeekViewState (upval), UseStateResult2 (copy), p1 (copy), AnalyticsEventsModule (upval), UseRefResult (copy)
							if not MoveAccountSelectorClosingAfterOperation then
								UseStateResult2_1(PeekViewState.Closed)
							end
							UseStateResult2(true)
							p1.onAccountSelection(p2)
							AnalyticsEventsModule.sendSelectEvent(p1.context, p1.origin, (tostring(p2)))
							UseRefResult.current = true
							
							if MoveAccountSelectorClosingAfterOperation then
								UseStateResult2_1(PeekViewState.Closed)
							end
						end,
						height = ScaledSize1,
						isDisabled = UseStateResult
					}),
					FooterContent = React.createElement("Frame", {
						BackgroundTransparency = 1,
						LayoutOrder = 1,
						Size = UDim2.new(1, 0, 0, 0),
						BackgroundColor3 = UseStyleResult.Theme.BackgroundUIDefault.Color,
						AutomaticSize = Enum.AutomaticSize.Y
					}, {
						Contents = if p1.renderFooterComponent then p1.renderFooterComponent() else nil
					})
				})
			})
		})
	})
end)

return React.forwardRef(function(p2, DefaultChildRef)
	-- upvalues: React (copy), WithNavigationFocusResult (ref), Cryo (copy)
	return React.createElement(WithNavigationFocusResult, Cryo.Dictionary.join(p2, { defaultChildRef = DefaultChildRef }))
end)