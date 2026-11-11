local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ButtonClickModule = require(Modules.LuaApp.Analytics.Events.buttonClick)
local FormInteractionModule = require(Modules.LuaApp.Analytics.Events.formInteraction)
local ModalActionModule = require(Modules.LuaApp.Analytics.Events.modalAction)
local CrossDeviceEnterCodeButtonClickModule = require(Modules.LuaApp.Analytics.Events.Auth.crossDeviceEnterCodeButtonClick)
local UpsellCardModalActionModule = require(Modules.LuaApp.Analytics.Events.Auth.upsellCardModalAction)
local UpsellCardButtonClickModule = require(Modules.LuaApp.Analytics.Events.Auth.upsellCardButtonClick)
local UpsellCardFormInteractionModule = require(Modules.LuaApp.Analytics.Events.Auth.upsellCardFormInteraction)
local ScreenLoadedModule = require(Modules.LuaApp.Analytics.Events.screenLoaded)
local FormFieldValidationModule = require(Modules.LuaApp.Analytics.Events.formFieldValidation)
local RoactAnalyticsModule = require(Modules.LuaApp.Services.RoactAnalytics)
local EventStreamConstantsModule = require(Modules.LuaApp.EventStreamConstants)
local UsernameSuggestionClickModule = require(Modules.LuaApp.Analytics.Events.usernameSuggestionClick)
local GetFFlagAuthNewModalSchematizationModule = require(Modules.LuaApp.Flags.GetFFlagAuthNewModalSchematization)
local ReportEphemeralCounterModule = require(Modules.LuaApp.Analytics.Events.reportEphemeralCounter)
local FFlagSignupDisplayNameLoggingModule = require(Modules.LuaApp.Components.Authentication.Flags.FFlagSignupDisplayNameLogging)
local FFlagEnableAuthButtonShownEvent = require(game:GetService("CorePackages").Workspace.Packages.SharedFlags).FFlagEnableAuthButtonShownEvent
local AuthPageLoadModule = require(Modules.LuaApp.Analytics.Events.Auth.authPageLoad)
local AuthClientErrorModule = require(Modules.LuaApp.Analytics.Events.Auth.authClientError)
local AuthModalShownModule = require(Modules.LuaApp.Analytics.Events.Auth.authModalShown)
local AuthButtonClickModule = require(Modules.LuaApp.Analytics.Events.Auth.authButtonClick)
local AuthButtonShownModule = require(Modules.LuaApp.Analytics.Events.Auth.authButtonShown)
local UsernameSuggestionShownModule = require(Modules.LuaApp.Analytics.Events.Auth.usernameSuggestionShown)
local AuthFormInteractionModule = require(Modules.LuaApp.Analytics.Events.Auth.authFormInteraction)

return {
	get = function(p1)
		-- upvalues: RoactAnalyticsModule (copy), ScreenLoadedModule (copy), AuthPageLoadModule (copy), AuthModalShownModule (copy), AuthClientErrorModule (copy), AuthButtonClickModule (copy), FFlagEnableAuthButtonShownEvent (copy), AuthButtonShownModule (copy), ModalActionModule (copy), EventStreamConstantsModule (copy), GetFFlagAuthNewModalSchematizationModule (copy), UpsellCardModalActionModule (copy), FormInteractionModule (copy), FFlagSignupDisplayNameLoggingModule (copy), AuthFormInteractionModule (copy), FormFieldValidationModule (copy), UpsellCardFormInteractionModule (copy), ButtonClickModule (copy), CrossDeviceEnterCodeButtonClickModule (copy), UpsellCardButtonClickModule (copy), UsernameSuggestionClickModule (copy), UsernameSuggestionShownModule (copy), ReportEphemeralCounterModule (copy)
		local GetResult = RoactAnalyticsModule.get(p1)
		local config = {
			reportScreenLoaded = function(p2)
				-- upvalues: ScreenLoadedModule (upval), GetResult (copy)
				ScreenLoadedModule(GetResult.EventStream, p2)
			end,
			reportAuthPageload = function(p2, p3, p4)
				-- upvalues: AuthPageLoadModule (upval), GetResult (copy)
				AuthPageLoadModule(GetResult.EventStream, p2, p3, p4)
			end,
			reportAuthModalShown = function(p2, p3)
				-- upvalues: AuthModalShownModule (upval), GetResult (copy)
				AuthModalShownModule(GetResult.EventStream, p2, p3)
			end,
			reportAuthClientError = function(p2, p3, p4)
				-- upvalues: AuthClientErrorModule (upval), GetResult (copy)
				AuthClientErrorModule(GetResult.EventStream, p2, p3, p4)
			end,
			reportAuthButtonClick = function(p2, SwitchAccounts, p3, p4, p5, p6, p7)
				-- upvalues: AuthButtonClickModule (upval), GetResult (copy)
				AuthButtonClickModule(GetResult.EventStream, p2, SwitchAccounts, p3, p4, p5, p6, p7)
			end,
			reportAuthButtonShown = function(p2, p3, p4, p5, p6)
				-- upvalues: FFlagEnableAuthButtonShownEvent (upval), AuthButtonShownModule (upval), GetResult (copy)
				if FFlagEnableAuthButtonShownEvent then
					AuthButtonShownModule(GetResult.EventStream, p2, p3, p4, p5, p6)
					
					return
				end
			end,
			reportModalShown = function(p2, Origin)
				-- upvalues: ModalActionModule (upval), GetResult (copy), EventStreamConstantsModule (upval), GetFFlagAuthNewModalSchematizationModule (upval)
				ModalActionModule(GetResult.EventStream, p2, EventStreamConstantsModule.ActionType.Shown, Origin)
				local config = { origin = Origin }
				
				if GetFFlagAuthNewModalSchematizationModule() then
					GetResult.EventStream:setRBXEventStream(p2, EventStreamConstantsModule.AuthEventName.AuthModalShown, config)
				end
			end,
			reportModalShownWithSection = function(p2, p3, p4)
				-- upvalues: UpsellCardModalActionModule (upval), GetResult (copy), EventStreamConstantsModule (upval)
				UpsellCardModalActionModule(GetResult.EventStream, p2, "", EventStreamConstantsModule.ActionType.Shown, p3, p4)
			end,
			reportModalShownWithSectionAndError = function(p2, p3, p4, p5, p6)
				-- upvalues: UpsellCardModalActionModule (upval), GetResult (copy), EventStreamConstantsModule (upval)
				UpsellCardModalActionModule(GetResult.EventStream, p2, p3, EventStreamConstantsModule.ActionType.Shown, p4, p5, p6)
			end,
			reportModalDismissed = function(p2, p3)
				-- upvalues: ModalActionModule (upval), GetResult (copy), EventStreamConstantsModule (upval)
				ModalActionModule(GetResult.EventStream, p2, EventStreamConstantsModule.ActionType.Dismiss, p3)
			end,
			reportModalDismissedWithSection = function(p2, p3, p4)
				-- upvalues: UpsellCardModalActionModule (upval), GetResult (copy), EventStreamConstantsModule (upval)
				UpsellCardModalActionModule(GetResult.EventStream, p2, "", EventStreamConstantsModule.ActionType.Dismiss, p3, p4)
			end,
			reportModalActionWithSection = function(p2, p3, p4, p5, p6, p7)
				-- upvalues: UpsellCardModalActionModule (upval), GetResult (copy)
				UpsellCardModalActionModule(GetResult.EventStream, p2, p3, p4, p5, p6, p7)
			end,
			reportBirthdaySelection = function(p2)
				-- upvalues: EventStreamConstantsModule (upval), FormInteractionModule (upval), GetResult (copy)
				local Submit = EventStreamConstantsModule.ActionType.Submit
				FormInteractionModule(GetResult.EventStream, p2, EventStreamConstantsModule.Field.BirthdayYear, Submit)
				FormInteractionModule(GetResult.EventStream, p2, EventStreamConstantsModule.Field.BirthdayMonth, Submit)
				FormInteractionModule(GetResult.EventStream, p2, EventStreamConstantsModule.Field.BirthdayDay, Submit)
			end,
			reportAgeFocus = function(p2)
				-- upvalues: FormInteractionModule (upval), GetResult (copy), EventStreamConstantsModule (upval)
				FormInteractionModule(GetResult.EventStream, p2, EventStreamConstantsModule.Field.BirthdayAge, EventStreamConstantsModule.ActionType.Focus)
			end,
			reportYearFocus = function(p2)
				-- upvalues: FormInteractionModule (upval), GetResult (copy), EventStreamConstantsModule (upval)
				FormInteractionModule(GetResult.EventStream, p2, EventStreamConstantsModule.Field.BirthdayYear, EventStreamConstantsModule.ActionType.Focus)
			end,
			reportUsernameFocus = function(p2)
				-- upvalues: FormInteractionModule (upval), GetResult (copy), EventStreamConstantsModule (upval)
				FormInteractionModule(GetResult.EventStream, p2, EventStreamConstantsModule.Field.Username, EventStreamConstantsModule.ActionType.Focus)
			end,
			reportDisplayNameFocus = function(p2)
				-- upvalues: FFlagSignupDisplayNameLoggingModule (upval), AuthFormInteractionModule (upval), GetResult (copy), EventStreamConstantsModule (upval), FormInteractionModule (upval)
				if FFlagSignupDisplayNameLoggingModule then
					AuthFormInteractionModule(GetResult.EventStream, EventStreamConstantsModule.Context.SinglePageSignUpScreen, EventStreamConstantsModule.Field.DisplayName, EventStreamConstantsModule.ActionType.Focus)
					
					return
				else
					FormInteractionModule(GetResult.EventStream, p2, EventStreamConstantsModule.Field.DisplayName, EventStreamConstantsModule.ActionType.Focus)
				end
			end,
			reportPasswordFocus = function(p2)
				-- upvalues: FormInteractionModule (upval), GetResult (copy), EventStreamConstantsModule (upval)
				FormInteractionModule(GetResult.EventStream, p2, EventStreamConstantsModule.Field.Password, EventStreamConstantsModule.ActionType.Focus)
			end,
			report2SVCodeFocus = function(p2)
				-- upvalues: FormInteractionModule (upval), GetResult (copy), EventStreamConstantsModule (upval)
				FormInteractionModule(GetResult.EventStream, p2, EventStreamConstantsModule.Field.TwoStepAuthCode, EventStreamConstantsModule.ActionType.Focus)
			end,
			reportFocus = function(p2, p3, p4)
				-- upvalues: FormInteractionModule (upval), GetResult (copy), EventStreamConstantsModule (upval)
				FormInteractionModule(GetResult.EventStream, p2, p3, EventStreamConstantsModule.ActionType.Focus, p4)
			end,
			report2SVInvalidCode = function(p2, p3)
				-- upvalues: FormFieldValidationModule (upval), GetResult (copy), EventStreamConstantsModule (upval)
				FormFieldValidationModule(GetResult.EventStream, p2, EventStreamConstantsModule.Field.TwoStepAuthCode, p3)
			end,
			reportErrorMessageShown = function(p2, p3, p4)
				-- upvalues: FormInteractionModule (upval), GetResult (copy), EventStreamConstantsModule (upval)
				FormInteractionModule(GetResult.EventStream, p2, p3, EventStreamConstantsModule.ActionType.Shown, p4)
			end,
			reportInteractWithAction = function(p2, p3, p4, p5, p6)
				-- upvalues: FormInteractionModule (upval), GetResult (copy)
				FormInteractionModule(GetResult.EventStream, p2, p3, p4, p5, p6)
			end,
			reportInteractWithActionAndSection = function(p2, p3, p4, p5, p6, p7)
				-- upvalues: UpsellCardFormInteractionModule (upval), GetResult (copy)
				UpsellCardFormInteractionModule(GetResult.EventStream, p2, p3, p4, p5, p6, p7)
			end,
			reportSignUpButtonClicked = function(p2)
				-- upvalues: ButtonClickModule (upval), GetResult (copy), EventStreamConstantsModule (upval)
				ButtonClickModule(GetResult.EventStream, p2, EventStreamConstantsModule.Button.SignUp)
			end,
			reportLogInButtonClicked = function(p2)
				-- upvalues: ButtonClickModule (upval), GetResult (copy), EventStreamConstantsModule (upval)
				ButtonClickModule(GetResult.EventStream, p2, EventStreamConstantsModule.Button.LogIn)
			end
		}
		
		function config.reportSwitchAccountButtonClicked(p2)
			-- upvalues: config (copy), EventStreamConstantsModule (upval)
			config.reportAuthButtonClick(p2, EventStreamConstantsModule.Button.SwitchAccounts, nil)
		end
		
		function config.reportContinueButtonClicked(p2)
			-- upvalues: ButtonClickModule (upval), GetResult (copy), EventStreamConstantsModule (upval)
			ButtonClickModule(GetResult.EventStream, p2, EventStreamConstantsModule.Button.Continue)
		end
		
		function config.reportDismissCornerXButtonClicked(p2)
			-- upvalues: ButtonClickModule (upval), GetResult (copy), EventStreamConstantsModule (upval)
			ButtonClickModule(GetResult.EventStream, p2, EventStreamConstantsModule.Button.DismissCornerX)
		end
		
		function config.reportForgotPasswordButtonClicked(p2)
			-- upvalues: ButtonClickModule (upval), GetResult (copy), EventStreamConstantsModule (upval)
			ButtonClickModule(GetResult.EventStream, p2, EventStreamConstantsModule.Button.ForgotPassword)
		end
		
		function config.report2SVHelpButtonClicked(p2)
			-- upvalues: ButtonClickModule (upval), GetResult (copy), EventStreamConstantsModule (upval)
			ButtonClickModule(GetResult.EventStream, p2, EventStreamConstantsModule.Button.NeedHelpLink)
		end
		
		function config.reportResendCodeButtonClicked(p2)
			-- upvalues: ButtonClickModule (upval), GetResult (copy), EventStreamConstantsModule (upval)
			ButtonClickModule(GetResult.EventStream, p2, EventStreamConstantsModule.Button.ResendCode)
		end
		
		function config.reportRememberDeviceButtonClicked(p2)
			-- upvalues: ButtonClickModule (upval), GetResult (copy), EventStreamConstantsModule (upval)
			ButtonClickModule(GetResult.EventStream, p2, EventStreamConstantsModule.Button.RememberDevice)
		end
		
		function config.reportShowPasswordButtonClicked(p2)
			-- upvalues: ButtonClickModule (upval), GetResult (copy), EventStreamConstantsModule (upval)
			ButtonClickModule(GetResult.EventStream, p2, EventStreamConstantsModule.Button.ShowPassword)
		end
		
		function config.reportHidePasswordButtonClicked(p2)
			-- upvalues: ButtonClickModule (upval), GetResult (copy), EventStreamConstantsModule (upval)
			ButtonClickModule(GetResult.EventStream, p2, EventStreamConstantsModule.Button.HidePassword)
		end
		
		function config.reportAvatarSelectedButtonClicked(p2, p3)
			-- upvalues: ButtonClickModule (upval), GetResult (copy), EventStreamConstantsModule (upval)
			ButtonClickModule(GetResult.EventStream, p2, EventStreamConstantsModule.Button.AvatarSelected, p3)
		end
		
		function config.reportWeChatButtonClicked(p2)
			-- upvalues: ButtonClickModule (upval), GetResult (copy), EventStreamConstantsModule (upval)
			ButtonClickModule(GetResult.EventStream, p2, EventStreamConstantsModule.Button.WeChat)
		end
		
		function config.reportQQButtonClicked(p2)
			-- upvalues: ButtonClickModule (upval), GetResult (copy), EventStreamConstantsModule (upval)
			ButtonClickModule(GetResult.EventStream, p2, EventStreamConstantsModule.Button.QQ)
		end
		
		function config.reportButtonClicked(p2, p3)
			-- upvalues: ButtonClickModule (upval), GetResult (copy)
			ButtonClickModule(GetResult.EventStream, p2, p3)
		end
		
		function config.reportButtonClickedWithCType(p2, p3, p4)
			-- upvalues: CrossDeviceEnterCodeButtonClickModule (upval), GetResult (copy)
			CrossDeviceEnterCodeButtonClickModule(GetResult.EventStream, p2, p3, nil, p4)
		end
		
		function config.reportButtonClickedWithSectionAndOrigin(p2, p3, p4, p5)
			-- upvalues: UpsellCardButtonClickModule (upval), GetResult (copy)
			UpsellCardButtonClickModule(GetResult.EventStream, p2, p3, nil, p4, p5)
		end
		
		function config.reportUsernameSuggestionClicked(p2, p3, p4, p5)
			-- upvalues: UsernameSuggestionClickModule (upval), GetResult (copy)
			UsernameSuggestionClickModule(GetResult.EventStream, p2, p3, p4, p5)
		end
		
		function config.reportUsernameSuggestionShown(p2, p3, p4, p5)
			-- upvalues: UsernameSuggestionShownModule (upval), GetResult (copy)
			UsernameSuggestionShownModule(GetResult.EventStream, p2, p3, p4, p5)
		end
		
		function config.reportDisplayNameFieldLoaded(p2, p3, p4)
			-- upvalues: ReportEphemeralCounterModule (upval), AuthFormInteractionModule (upval), GetResult (copy)
			ReportEphemeralCounterModule("DisplayNameFieldLoaded", 1)
			AuthFormInteractionModule(GetResult.EventStream, p2, p3, p4)
		end
		
		function config.reportDisplayNameFieldBypassed(p2, p3)
			-- upvalues: ReportEphemeralCounterModule (upval), AuthClientErrorModule (upval), GetResult (copy)
			ReportEphemeralCounterModule(p3, 1)
			AuthClientErrorModule(GetResult.EventStream, p2, p3)
		end
		
		function config.reportUsernameGenerationFailed(p2, p3)
			-- upvalues: ReportEphemeralCounterModule (upval), AuthClientErrorModule (upval), GetResult (copy)
			ReportEphemeralCounterModule(p3, 1)
			AuthClientErrorModule(GetResult.EventStream, p2, p3)
		end
		
		function config.reportAuthFormInteraction(p2, p3, p4, p5, p6)
			-- upvalues: AuthFormInteractionModule (upval), GetResult (copy)
			AuthFormInteractionModule(GetResult.EventStream, p2, p3, p4, p5, p6)
		end
		
		return config
	end
}