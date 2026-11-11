local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local DependenciesModule = require(Parent.dependencies)
local React = DependenciesModule.React
local RoactRodux = DependenciesModule.RoactRodux
local UseLocalizationFunction = DependenciesModule.Localization.Hooks.useLocalization
local Foundation = DependenciesModule.Foundation
local Sheet = Foundation.Sheet
local View = Foundation.View
local Text = Foundation.Text
local ButtonVariant = Foundation.Enums.ButtonVariant
local AppPage = DependenciesModule.RobloxAppEnums.AppPage
local NavigateDownFunction = DependenciesModule.NavigationRodux.Thunks.NavigateDown
local FFlagSignalsNavP3Dispatch = DependenciesModule.SharedFlags.FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent1.RobloxAppNavigation).NavigationCommands else nil
local RoactAppExperiment = DependenciesModule.RoactAppExperiment
local FFlagEnableLuaLoginRevamp = DependenciesModule.SharedFlags.FFlagEnableLuaLoginRevamp
local FStringLuaLoginRevampIxpLayer = DependenciesModule.SharedFlags.FStringLuaLoginRevampIxpLayer
local GetFFlagEnableMultiPageSignupFunction = DependenciesModule.SharedFlags.GetFFlagEnableMultiPageSignup
local AppBtidLayers = DependenciesModule.ExperimentLayers.AppBtidLayers
local AnalyticsEventsModule = require(Parent.Analytics.AnalyticsEvents)
local EventConstantsModule = require(Parent.Analytics.EventConstants)

local function AccountSwitchingAddAccount(p1)
	-- upvalues: UseLocalizationFunction (copy), React (copy), AnalyticsEventsModule (copy), EventConstantsModule (copy), FFlagEnableLuaLoginRevamp (copy), RoactAppExperiment (copy), FStringLuaLoginRevampIxpLayer (copy), GetFFlagEnableMultiPageSignupFunction (copy), Sheet (copy), Text (copy), View (copy), Foundation (copy), ButtonVariant (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		titleText = "Authentication.AccountSwitch.Action.AddAnAccount",
		loginText = "Authentication.AccountSwitch.Action.SignInToExistingAccount",
		createText = "Authentication.AccountPicker.Button.CreateAccount"
	})
	local UseStateResult, UseStateResult2 = React.useState(true)
	local UseBrowserTrackerExperimentResult = { showLoginRevamp = false }
	React.useEffect(function()
		-- upvalues: p1 (copy), AnalyticsEventsModule (upval), EventConstantsModule (upval)
		if p1.origin then
			AnalyticsEventsModule.sendModalShownEvent(EventConstantsModule.ctx.accountSwitcherAddAccount, p1.origin)
		end
	end, {})
	
	if FFlagEnableLuaLoginRevamp then
		UseBrowserTrackerExperimentResult = RoactAppExperiment.useBrowserTrackerExperiment({ FStringLuaLoginRevampIxpLayer }, function(p2)
			-- upvalues: FStringLuaLoginRevampIxpLayer (upval)
			return {
				showLoginRevamp = (p2[FStringLuaLoginRevampIxpLayer] or {}).showLoginRevamp
			}
		end)
	end
	return React.createElement(React.Fragment, nil, {
		AddAccountSheet = React.createElement(Sheet.Root, {
			preferCenterSheet = true,
			onClose = function()
				-- upvalues: UseStateResult2 (copy), p1 (copy)
				UseStateResult2(false)
				
				if p1.onClose then
					p1.onClose(true)
				end
			end,
			isOpen = UseStateResult
		}, {
			Header = React.createElement(Sheet.Header, nil, {
				Title = React.createElement(Text, {
					tag = "auto-xy text-heading-small content-emphasis",
					Text = UseLocalizationResult.titleText
				})
			}),
			StandardButtons = React.createElement(Sheet.Content, { tag = "col auto-y gap-small" }, {
				ActionList = React.createElement(View, {
					tag = "col auto-y gap-small size-full-0 padding-bottom-medium"
				}, {
					LoginButton = React.createElement(Foundation.Button, {
						tag = "col size-full-0",
						text = UseLocalizationResult.loginText,
						variant = ButtonVariant.Standard,
						onActivated = function()
							-- upvalues: p1 (copy), AnalyticsEventsModule (upval), EventConstantsModule (upval), UseStateResult2 (copy), FFlagEnableLuaLoginRevamp (upval), UseBrowserTrackerExperimentResult (ref)
							if p1.origin then
								AnalyticsEventsModule.sendButtonClickEvent(EventConstantsModule.ctx.accountSwitcherAddAccount, p1.origin, EventConstantsModule.btn.login)
							end
							UseStateResult2(false)
							
							if p1.onClose then
								p1.onClose()
							end
							if FFlagEnableLuaLoginRevamp and UseBrowserTrackerExperimentResult.showLoginRevamp then
								if p1.navigateToLoginV2 then
									p1.navigateToLoginV2()
									
									return
								end
							elseif p1.navigateToLogin then
								p1.navigateToLogin()
							end
						end,
						width = UDim.new(1, 0)
					}),
					SignUpButton = React.createElement(Foundation.Button, {
						tag = "col size-full-0",
						text = UseLocalizationResult.createText,
						variant = ButtonVariant.Standard,
						onActivated = function()
							-- upvalues: p1 (copy), AnalyticsEventsModule (upval), EventConstantsModule (upval), UseStateResult2 (copy), GetFFlagEnableMultiPageSignupFunction (upval)
							if p1.origin then
								AnalyticsEventsModule.sendButtonClickEvent(EventConstantsModule.ctx.accountSwitcherAddAccount, p1.origin, EventConstantsModule.btn.signup)
							end
							UseStateResult2(false)
							
							if p1.onClose then
								p1.onClose()
							end
							if GetFFlagEnableMultiPageSignupFunction() and p1.shouldEnableMultiPageSignup then
								if p1.navigateToMultiPageSignUp then
									p1.navigateToMultiPageSignUp()
									
									return
								end
							elseif p1.navigateToSignUp then
								p1.navigateToSignUp()
							end
						end,
						width = UDim.new(1, 0)
					})
				})
			})
		})
	})
end

if GetFFlagEnableMultiPageSignupFunction() then
	AccountSwitchingAddAccount = RoactAppExperiment.connectBrowserTrackerLayer({ AppBtidLayers.SignupLayer }, function(p1, _)
		-- upvalues: AppBtidLayers (copy)
		return {
			shouldEnableMultiPageSignup = (p1[AppBtidLayers.SignupLayer] or {}).shouldEnableMultiPageSignup
		}
	end)(AccountSwitchingAddAccount)
end
return React.memo((RoactRodux.connect(nil, function(Callback)
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
		end,
		navigateToMultiPageSignUp = function()
			-- upvalues: AppPage (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), Callback (copy), NavigateDownFunction (upval)
			local config = {
				name = AppPage.MultiPageSignup,
				extraProps = { enforceResetState = true }
			}
			
			if FFlagSignalsNavP3Dispatch then
				NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
				
				return
			else
				Callback(NavigateDownFunction(config))
			end
		end
	}
end)(AccountSwitchingAddAccount)))