local TextService = game:GetService("TextService")
local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local DependenciesModule = require(Parent.dependencies)
local RoactRodux = DependenciesModule.RoactRodux
local RoactUtils = DependenciesModule.RoactUtils
local UseDispatchFunction = RoactUtils.Hooks.RoactRodux.useDispatch
local UseSelectorFunction = RoactUtils.Hooks.RoactRodux.useSelector
local UIBlox = DependenciesModule.UIBlox
local UseLocalizationFunction = DependenciesModule.Localization.Hooks.useLocalization
local React = DependenciesModule.React
local UseEffectFunction = React.useEffect
local AnalyticsEventsModule = require(Parent.Analytics.AnalyticsEvents)
local EventConstantsModule = require(Parent.Analytics.EventConstants)
local Button = UIBlox.App.Button.Button
local ButtonType = UIBlox.App.Button.Enum.ButtonType
local UseStyleFunction = UIBlox.Core.Style.useStyle
local UseNavigationFunction = DependenciesModule.Hooks.useNavigation
local AppPage = DependenciesModule.RobloxAppEnums.AppPage
local NavigateDownFunction = DependenciesModule.NavigationRodux.Thunks.NavigateDown
local FFlagSignalsNavP3Dispatch = DependenciesModule.SharedFlags.FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent1.RobloxAppNavigation).NavigationCommands else nil
local PeekView = DependenciesModule.PeekView.PeekView
local PeekViewState = DependenciesModule.PeekView.PeekViewState
local UseStateFunction = React.useState
local AppBtidLayers = DependenciesModule.ExperimentLayers.AppBtidLayers
local RoactAppExperiment = DependenciesModule.RoactAppExperiment
local EnableAddAccountPeekviewRemoveSuperBriefState = game:DefineFastFlag("EnableAddAccountPeekviewRemoveSuperBriefState", false)
local FFlagEnableLuaLoginRevamp = DependenciesModule.SharedFlags.FFlagEnableLuaLoginRevamp
local FStringLuaLoginRevampIxpLayer = DependenciesModule.SharedFlags.FStringLuaLoginRevampIxpLayer
local GetFFlagEnableMultiPageSignupFunction = DependenciesModule.SharedFlags.GetFFlagEnableMultiPageSignup
local GetFFlagLuaAppEnableTopBannerFunction = DependenciesModule.SharedFlags.GetFFlagLuaAppEnableTopBanner
local NewY = 240

local function AccountSwitchingAddAccountPeekView(p1)
	-- upvalues: UseStyleFunction (copy), UseNavigationFunction (copy), UseDispatchFunction (copy), UseStateFunction (copy), PeekViewState (copy), UseSelectorFunction (copy), GetFFlagLuaAppEnableTopBannerFunction (copy), AppPage (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy), UseLocalizationFunction (copy), FFlagEnableLuaLoginRevamp (copy), RoactAppExperiment (copy), FStringLuaLoginRevampIxpLayer (copy), TextService (copy), NewY (ref), UseEffectFunction (copy), AnalyticsEventsModule (copy), EventConstantsModule (copy), GetFFlagEnableMultiPageSignupFunction (copy), React (copy), PeekView (copy), EnableAddAccountPeekviewRemoveSuperBriefState (copy), Button (copy), ButtonType (copy)
	local UseStyleResult = UseStyleFunction()
	local UseNavigationResult = UseNavigationFunction()
	local UseDispatchResult = UseDispatchFunction()
	local Color = UseStyleResult.Theme.BackgroundContrast.Color
	local UseStateResult, UseStateResult2 = UseStateFunction(PeekViewState.Full)
	local ScaledRelativeSize = UseStyleResult.Font.Header1.RelativeSize * UseStyleResult.Font.BaseSize
	local UseSelectorResult = UseSelectorFunction(function(p2)
		return p2.ScreenSize
	end)
	local UseSelectorResult1 = if GetFFlagLuaAppEnableTopBannerFunction() then UseSelectorFunction(function(p2)
		return p2.GlobalGuiInset.top
	end) else 0
	local XDelta = UseSelectorResult.X - 48
	
	local function v34()
		-- upvalues: AppPage (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateDownFunction (upval)
		local config = {
			name = AppPage.MultiPageSignup,
			extraProps = { enforceResetState = true }
		}
		
		if FFlagSignalsNavP3Dispatch then
			NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
			
			return
		else
			UseDispatchResult(NavigateDownFunction(config))
		end
	end
	
	local UseLocalizationResult = UseLocalizationFunction({
		titleText = "Authentication.AccountSwitch.Action.AddAccount",
		loginText = "Authentication.Login.Heading.LoginRobloxAccountSwitching",
		createText = "Authentication.AccountSwitch.Action.CreateNewAccount"
	})
	local UseBrowserTrackerExperimentResult = if FFlagEnableLuaLoginRevamp then RoactAppExperiment.useBrowserTrackerExperiment({ FStringLuaLoginRevampIxpLayer }, function(p2)
		-- upvalues: FStringLuaLoginRevampIxpLayer (upval)
		return {
			showLoginRevamp = (p2[FStringLuaLoginRevampIxpLayer] or {}).showLoginRevamp
		}
	end) else { showLoginRevamp = false }
	
	if GetFFlagLuaAppEnableTopBannerFunction() then
		NewY = 193 + TextService:GetTextSize(UseLocalizationResult.titleText, ScaledRelativeSize, UseStyleResult.Font.Header1.Font, Vector2.new(0, 0)).Y
	end
	local function peekHeaderPositionYChange(p2: number)
		-- upvalues: UseStateResult2 (copy), PeekViewState (upval)
		if p2 < 10 then
			UseStateResult2(PeekViewState.Closed)
		end
	end
	
	local function viewStateChanged(Closed, _)
		-- upvalues: UseStateResult2 (copy), PeekViewState (upval), UseNavigationResult (copy)
		UseStateResult2(Closed)
		
		if Closed == PeekViewState.Closed or Closed == PeekViewState.Hidden then
			UseNavigationResult.goBack()
		end
	end
	
	UseEffectFunction(function()
		-- upvalues: AnalyticsEventsModule (upval), EventConstantsModule (upval), p1 (copy)
		AnalyticsEventsModule.sendModalShownEvent(EventConstantsModule.ctx.accountSwitcherAddAccount, p1.origin)
	end, {})
	
	return React.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = if GetFFlagLuaAppEnableTopBannerFunction() then UDim2.new(1, 0, 0, UseSelectorResult.Y - UseSelectorResult1) else UDim2.new(1, 0, 0, UseSelectorResult.Y),
		BackgroundColor3 = UseStyleResult.Theme.Overlay.Color
	}, {
		React.createElement(PeekView, {
			hasScrim = true,
			peekHeaderClose = false,
			canDragFullViewToBrief = true,
			returnToFullView = true,
			thumbstickScrollEnabled = true,
			showDraggerInClosedState = true,
			screenSize = UseSelectorResult,
			briefViewContentHeight = UDim.new(0, NewY),
			superBriefViewContentHeight = if EnableAddAccountPeekviewRemoveSuperBriefState then nil else UDim.new(0, 40),
			style = UseStyleResult,
			stateOnMount = PeekViewState.Brief,
			peekHeaderPositionYChange = peekHeaderPositionYChange,
			viewStateChanged = viewStateChanged,
			peekViewState = UseStateResult
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
				ButtonContentFrame = React.createElement("Frame", {
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
					UIPadding = React.createElement("UIPadding", { PaddingTop = UDim.new(0, 24) }),
					LoginButton = React.createElement("Frame", {
						LayoutOrder = 1,
						BackgroundTransparency = 1,
						Size = UDim2.new(1, -40, 0, 48)
					}, {
						UIPadding = React.createElement("UIPadding", { PaddingBottom = UDim.new(0, 60) }),
						Button = React.createElement(Button, {
							buttonType = ButtonType.PrimarySystem,
							size = UDim2.new(1, 0, 0, 48),
							text = UseLocalizationResult.loginText,
							onActivated = function()
								-- upvalues: AnalyticsEventsModule (upval), EventConstantsModule (upval), p1 (copy), FFlagEnableLuaLoginRevamp (upval), UseBrowserTrackerExperimentResult (ref)
								AnalyticsEventsModule.sendButtonClickEvent(EventConstantsModule.ctx.accountSwitcherAddAccount, p1.origin, EventConstantsModule.btn.login)
								
								if FFlagEnableLuaLoginRevamp and UseBrowserTrackerExperimentResult.showLoginRevamp then
									p1.navigateToLoginV2()
									
									return
								else
									p1.navigateToLogin()
								end
							end
						})
					}),
					SignupButton = React.createElement("Frame", {
						LayoutOrder = 2,
						BackgroundTransparency = 1,
						Size = UDim2.new(1, -40, 0, 48)
					}, {
						Button = React.createElement(Button, {
							buttonType = ButtonType.Secondary,
							size = UDim2.new(1, 0, 0, 48),
							text = UseLocalizationResult.createText,
							onActivated = function()
								-- upvalues: AnalyticsEventsModule (upval), EventConstantsModule (upval), p1 (copy), GetFFlagEnableMultiPageSignupFunction (upval), v34 (copy)
								AnalyticsEventsModule.sendButtonClickEvent(EventConstantsModule.ctx.accountSwitcherAddAccount, p1.origin, EventConstantsModule.btn.signup)
								
								if GetFFlagEnableMultiPageSignupFunction() and p1.shouldEnableMultiPageSignup then
									v34()
									
									return
								else
									p1.navigateToSignUp()
								end
							end
						})
					})
				})
			})
		})
	})
end

if GetFFlagEnableMultiPageSignupFunction() then
	AccountSwitchingAddAccountPeekView = RoactAppExperiment.connectBrowserTrackerLayer({ AppBtidLayers.SignupLayer }, function(p1, _)
		-- upvalues: AppBtidLayers (copy)
		return {
			shouldEnableMultiPageSignup = (p1[AppBtidLayers.SignupLayer] or {}).shouldEnableMultiPageSignup
		}
	end)(AccountSwitchingAddAccountPeekView)
end
return (RoactRodux.connect(nil, function(Callback)
	-- upvalues: AppPage (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy)
	return {
		navigateToLogin = function()
			-- upvalues: AppPage (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), Callback (copy), NavigateDownFunction (upval)
			local config = { name = AppPage.Login }
			
			if FFlagSignalsNavP3Dispatch then
				NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
				
				return
			else
				Callback(NavigateDownFunction(config))
			end
		end,
		navigateToLoginV2 = function()
			-- upvalues: AppPage (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), Callback (copy), NavigateDownFunction (upval)
			local config = { name = AppPage.LoginV2 }
			
			if FFlagSignalsNavP3Dispatch then
				NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
				
				return
			else
				Callback(NavigateDownFunction(config))
			end
		end,
		navigateToSignUp = function()
			-- upvalues: AppPage (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), Callback (copy), NavigateDownFunction (upval)
			local config = { name = AppPage.SinglePageSignUp }
			
			if FFlagSignalsNavP3Dispatch then
				NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
				
				return
			else
				Callback(NavigateDownFunction(config))
			end
		end
	}
end)(AccountSwitchingAddAccountPeekView))