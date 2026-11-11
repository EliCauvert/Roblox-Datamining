local ChallengeDialog = script:FindFirstAncestor("ChallengeDialog")
local Parent = ChallengeDialog.Parent
local ReactModule = require(Parent.React)
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local NavigateFromWebViewFunction = require(Parent.NavigationRodux).Thunks.NavigateFromWebView
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil
local AppPage = require(Parent.RobloxAppEnums).AppPage
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local FullPageModalWrapperModule = require(ChallengeDialog.Common.FullPageModalWrapper)
local LockModule = require(ChallengeDialog.Common.Lock)
local ModalTextComponentModule = require(ChallengeDialog.Common.ModalTextComponent)
local ModalButtonConfigModule = require(ChallengeDialog.Common.ModalButtonConfig)
local ModalFooterModule = require(ChallengeDialog.Common.ModalFooter)
local ModalTextSizesModule = require(ChallengeDialog.Common.ModalTextSizes)
local ButtonType = require(Parent.UIBlox).App.Button.Enum.ButtonType
local Text = require(Parent.Http).Url.BASE_URL .. "my/account#!/info"
local config = {
	changePassword = "Authentication.TwoStepVerification.Action.ChangePassword",
	header = "Authentication.TwoStepVerification.Header.AttemptDenied",
	passwordWarning = "Authentication.TwoStepVerification.Label.SomeoneMightHavePassword",
	passwordChangeRecommended = "Authentication.TwoStepVerification.Label.PasswordChangeRecommended",
	helpMessage = "Authentication.TwoStepVerification.Label.NeedHelpMessage"
}

return require(Parent.RoactRodux).connect(function(_, _)
	return {}
end, function(Callback)
	-- upvalues: FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy), NavigateFromWebViewFunction (copy)
	return {
		navigateToPage = function(p1)
			-- upvalues: FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), Callback (copy), NavigateDownFunction (upval)
			return if FFlagSignalsNavP3Dispatch then NavigationCommands.down(NavigationCommands.fromLegacyPage(p1)) else Callback(NavigateDownFunction(p1))
		end,
		navigateFromWebView = function(p1)
			-- upvalues: FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), Callback (copy), NavigateFromWebViewFunction (upval)
			return if FFlagSignalsNavP3Dispatch then NavigationCommands.fromWebView(NavigationCommands.fromLegacyPage(p1)) else Callback(NavigateFromWebViewFunction(p1))
		end
	}
end)(function(p1)
	-- upvalues: ReactModule (copy), UseLocalizationFunction (copy), config (copy), AppPage (copy), Text (copy), FullPageModalWrapperModule (copy), LockModule (copy), ModalTextComponentModule (copy), ModalButtonConfigModule (copy), ButtonType (copy), ModalFooterModule (copy), ModalTextSizesModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseLocalizationResult = UseLocalizationFunction(config)
	
	return ReactModule.createElement(FullPageModalWrapperModule, {
		title = UseLocalizationResult.header,
		closeModal = p1.closeModal,
		makeBodyFragment = function(ContentWidth)
			-- upvalues: ReactModule (upval), LockModule (upval), ModalTextComponentModule (upval), UseLocalizationResult (copy)
			return ReactModule.createElement(ReactModule.Fragment, nil, {
				Lock = ReactModule.createElement(LockModule, { layoutOrder = 1 }),
				SomeoneMightHaveYourPassword = ReactModule.createElement(ModalTextComponentModule, {
					layoutOrder = 2,
					useBold = true,
					useEmphasis = true,
					contentWidth = ContentWidth,
					text = UseLocalizationResult.passwordWarning
				}),
				ChangeYourPassword = ReactModule.createElement(ModalTextComponentModule, {
					layoutOrder = 3,
					useBold = true,
					useEmphasis = true,
					contentWidth = ContentWidth,
					text = UseLocalizationResult.passwordChangeRecommended
				})
			})
		end,
		buttonConfig = ModalButtonConfigModule({
			{
				isDisabled = UseStateResult,
				isLoading = UseStateResult,
				onActivated = function()
					-- upvalues: UseStateResult2 (copy), p1 (copy), AppPage (upval), Text (upval)
					UseStateResult2(true)
					p1.navigateFromWebView({
						name = AppPage.SettingsSubPage,
						detail = Text,
						extraProps = {
							titleKey = "Feature.AccountSettings.Heading.Tab.Security.AccountInfo"
						}
					})
				end,
				text = UseLocalizationResult.changePassword,
				type = ButtonType.Secondary
			}
		}),
		footerContent = ModalFooterModule(function(ContentWidth)
			-- upvalues: ReactModule (upval), ModalTextComponentModule (upval), UseLocalizationResult (copy), ModalTextSizesModule (upval), p1 (copy), AppPage (upval)
			return ReactModule.createElement(ModalTextComponentModule, {
				BackgroundTransparency = 0,
				layoutOrder = 1,
				text = UseLocalizationResult.helpMessage,
				contentWidth = ContentWidth,
				size = ModalTextSizesModule.Footer,
				onActivated = function()
					-- upvalues: p1 (upval), AppPage (upval)
					p1.navigateToPage({
						detail = "https://en.help.roblox.com/hc/en-us/articles/212459863-Add-2-Step-Verification-to-Your-Account",
						name = AppPage.GenericWebPage,
						extraProps = { title = "" }
					})
				end
			})
		end)
	})
end)