local MultiPageSignup = script:FindFirstAncestor("MultiPageSignup")
local Parent = MultiPageSignup.Parent
local RobloxLocaleId = game:GetService("LocalizationService").RobloxLocaleId
local ReactModule = require(Parent.React)
local UserActivationFrameworkModule = require(Parent.UserActivationFramework)
local AuthCommonModule = require(Parent.AuthCommon)
local UIBloxModule = require(Parent.UIBlox)
local DebounceModule = require(MultiPageSignup.Utils.debounce)
local Birthday = AuthCommonModule.Models.Birthday
local BirthdayPicker = require(Parent.AuthSignup).Components.BirthdayPicker
local FullPageActivationFrameworkContext = UserActivationFrameworkModule.Context.FullPageActivationFrameworkContext
local ActivationFrameworkWrapper = UserActivationFrameworkModule.Components.ActivationFrameworkWrapper
local CallbackStatus = UserActivationFrameworkModule.Enums.CallbackStatus
local PayloadKey = UserActivationFrameworkModule.Enums.PayloadKey
local StyledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local TitleAndParagraph = AuthCommonModule.Components.TitleAndParagraph
local DisclaimerLinks = AuthCommonModule.Components.DisclaimerLinks
local GetFFlagEnableSignupFoundationTextFunction = require(Parent.SharedFlags).GetFFlagEnableSignupFoundationText
local FoundationModule = require(Parent.Foundation)
local Text = FoundationModule.Text
local SharedFlagsModule = require(Parent.SharedFlags)
local FIntSignupMinimumAge = SharedFlagsModule.FIntSignupMinimumAge
local MultiPageSignupConstantsModule = require(MultiPageSignup.Analytics.MultiPageSignupConstants)
local AuthAnalyticsModule = require(Parent.AuthAnalytics)
local EventStreamConstants = AuthAnalyticsModule.EventStreamConstants
local AuthMsgShownFunction = AuthAnalyticsModule.Events.authMsgShown
local AuthFormInteractionFunction = AuthAnalyticsModule.Events.authFormInteraction
local GetFFlagEnableMultiPageSignupV2UpdatesFunction = SharedFlagsModule.GetFFlagEnableMultiPageSignupV2Updates
local DateHelper = require(Parent.Time).DateHelper

return function(p1)
	-- upvalues: ReactModule (copy), FullPageActivationFrameworkContext (copy), DateHelper (copy), UseLocalizationFunction (copy), UseStyleFunction (copy), UseDesignTokensFunction (copy), Birthday (copy), AuthFormInteractionFunction (copy), MultiPageSignupConstantsModule (copy), GetFFlagEnableMultiPageSignupV2UpdatesFunction (copy), RobloxLocaleId (copy), DebounceModule (copy), AuthMsgShownFunction (copy), EventStreamConstants (copy), FIntSignupMinimumAge (copy), ActivationFrameworkWrapper (copy), PayloadKey (copy), CallbackStatus (copy), TitleAndParagraph (copy), DisclaimerLinks (copy), BirthdayPicker (copy), GetFFlagEnableSignupFoundationTextFunction (copy), Text (copy), StyledTextLabel (copy), FoundationModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(nil)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(false)
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState("")
	local ActivationFrameworkState = ReactModule.useContext(FullPageActivationFrameworkContext).activationFrameworkState
	local UseLocalizationResult = UseLocalizationFunction({
		birthdayHint = "Authentication.SignUp.Label.SelectYourBirthday",
		birthdayLabel = "Authentication.SignUp.Label.Birthday",
		invalidBirthdayText = "Authentication.SignUp.Label.Error.MinimumAge5",
		nextButtonText = "Authentication.SignUp.Action.NextWord",
		monthText = UseStateResult and DateHelper.MonthsLocalizationKeys[UseStateResult.Month] or nil,
		dayAffix = DateHelper.DayAffixLocalizationKey,
		yearAffix = DateHelper.YearAffixLocalizationKey,
		ageText = {
			"Authentication.SignUp.Label.YearsOld",
			yearsOld = if UseStateResult1 then tostring(UseStateResult1) else ""
		}
	})
	local UseLocalizationResult1 = UseLocalizationFunction({
		fullDateString = {
			"Authentication.SignUp.Label.FullDateString",
			Month = UseLocalizationResult.monthText,
			Day = if UseStateResult then tostring(UseStateResult.Day) else "",
			Year = if UseStateResult then tostring(UseStateResult.Year) else ""
		}
	})
	local UseStyleResult = UseStyleFunction()
	local UseDesignTokensResult = UseDesignTokensFunction()
	local UseResult = ReactModule.useCallback(function(Month, Day, Year)
		-- upvalues: UseStateResult (copy), DateHelper (upval), Birthday (upval), AuthFormInteractionFunction (upval), MultiPageSignupConstantsModule (upval), UseStateResult2 (copy), UseStateResult2_1 (copy)
		if (UseStateResult == nil or UseStateResult.Month ~= Month or UseStateResult.Day ~= Day or UseStateResult.Year ~= Year) and DateHelper:isValidDate(Month, Day, Year) then
			local NewBirthday = Birthday.new({ Month = Month, Day = Day, Year = Year })
			AuthFormInteractionFunction(MultiPageSignupConstantsModule.ctx.multiPageSignup, MultiPageSignupConstantsModule.field.updateBirthday, MultiPageSignupConstantsModule.state.enterBirthdayComponent)
			UseStateResult2(NewBirthday)
			UseStateResult2_1(NewBirthday:GetAgeInYears())
		end
	end, { UseStateResult })
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult (copy), UseStateResult2_3 (copy), UseLocalizationResult (copy), GetFFlagEnableMultiPageSignupV2UpdatesFunction (upval), UseLocalizationResult1 (copy), DateHelper (upval), RobloxLocaleId (upval)
		if UseStateResult == nil then
			UseStateResult2_3(UseLocalizationResult.birthdayHint)
			
			return
		end
		if GetFFlagEnableMultiPageSignupV2UpdatesFunction() then
			UseStateResult2_3(UseLocalizationResult1.fullDateString .. " " .. UseLocalizationResult.ageText)
			
			return
		else
			UseStateResult2_3((if UseStateResult then DateHelper:GetFormattedFullString(UseLocalizationResult.monthText, UseStateResult.Day, UseLocalizationResult.dayAffix, UseStateResult.Year, UseLocalizationResult.yearAffix, " ", RobloxLocaleId) else "") .. " " .. UseLocalizationResult.ageText)
		end
	end, {
		UseLocalizationResult.monthText,
		UseLocalizationResult.dayAffix,
		UseLocalizationResult.yearAffix,
		UseStateResult
	})
	local UseResult1 = ReactModule.useCallback(DebounceModule(function(p2)
		-- upvalues: AuthMsgShownFunction (upval), p1 (copy), ActivationFrameworkState (copy), EventStreamConstants (upval)
		if p2 then
			AuthMsgShownFunction(p1.namespace, ActivationFrameworkState.currentState, EventStreamConstants.Field.InvalidBirthday)
		end
	end, 1), {})
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult1 (copy), FIntSignupMinimumAge (upval), UseStateResult2_2 (copy), UseResult1 (copy)
		if UseStateResult1 ~= nil then
			local IsUseStateResultBelow = UseStateResult1 < FIntSignupMinimumAge
			UseStateResult2_2(IsUseStateResultBelow)
			UseResult1(IsUseStateResultBelow)
			
			return
		end
	end, { UseStateResult1 })
	
	return ReactModule.createElement(ActivationFrameworkWrapper, {
		titleTextKey = "Authentication.SignUp.Label.BirthdayHeaderB",
		bodyTextKey = "Authentication.SignUp.Description.BirthdayHelp3",
		headingTextKey = "Authentication.SignUp.Action.CreateAccount",
		shouldExpandMiddleContent = true,
		namespace = p1.namespace,
		primaryButton = {
			buttonTextKey = "Authentication.SignUp.Action.NextWord",
			shouldShowButton = true,
			isButtonEnabled = UseStateResult and not UseStateResult3 or false,
			onButtonClicked = function()
				-- upvalues: PayloadKey (upval), Birthday (upval), UseStateResult (copy), UseStateResult1 (copy), CallbackStatus (upval)
				return {
					payloadAddendum = {
						[PayloadKey.SignupBirthdayTimestampUtc] = Birthday.FormatForEndpoint(UseStateResult),
						[PayloadKey.SignupAge] = tostring(UseStateResult1)
					},
					status = CallbackStatus.Success
				}
			end
		},
		subFooterContent = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			UIListLayout = ReactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Bottom,
				Padding = UDim.new(0, UseDesignTokensResult.Size.Size_100)
			}),
			DisclaimerText = ReactModule.createElement(TitleAndParagraph, {
				LayoutOrder = 1,
				textXAlignment = Enum.TextXAlignment.Left,
				paragraphTextKeys = {
					"Authentication.SignUp.Description.ClickNextAgreeToTerms"
				},
				paragraphTextArgs = { {} }
			}),
			DisclaimerLinks = ReactModule.createElement(DisclaimerLinks, {
				LayoutOrder = 2,
				ctx = p1.namespace,
				state = ActivationFrameworkState.currentState
			})
		}),
		navigation = p1.navigation
	}, {
		Content = ReactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
			UIListLayout = ReactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical,
				Padding = UDim.new(0, UseDesignTokensResult.Size.Size_100)
			}),
			BirthdayPicker = ReactModule.createElement(BirthdayPicker, {
				LayoutOrder = 1,
				skipUpdateOnMount = false,
				shouldExpandTapTarget = true,
				tapTargetExpansionSize = 200,
				minAgeAllowed = FIntSignupMinimumAge,
				updateBirthday = UseResult
			}),
			ErrorSpacing = ReactModule.createElement("Frame", {
				LayoutOrder = 2,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, UseDesignTokensResult.Size.Size_200)
			}),
			ErrorTextLabel = if GetFFlagEnableSignupFoundationTextFunction() then ReactModule.createElement(Text, {
				LayoutOrder = 3,
				tag = "text-body-small text-align-x-center size-full-0 auto-y",
				TextWrapped = true,
				Text = if UseStateResult3 then UseLocalizationResult.invalidBirthdayText else "",
				textStyle = {
					Color3 = UseStyleResult.Theme.Alert.Color,
					Transparency = UseStyleResult.Theme.Alert.Transparency
				}
			}) else ReactModule.createElement(StyledTextLabel, {
				layoutOrder = 3,
				textWrapped = true,
				text = if UseStateResult3 then UseLocalizationResult.invalidBirthdayText else "",
				fontStyle = UseStyleResult.Font.BodySmall,
				colorStyle = UseStyleResult.Theme.Alert,
				automaticSize = Enum.AutomaticSize.XY
			})
		}),
		SelectedBirthdayText = ReactModule.createElement(FoundationModule.Text, {
			tag = "text-label-medium text-align-x-center size-full-0 auto-y position-bottom-center anchor-bottom-center",
			Text = UseStateResult4
		})
	})
end