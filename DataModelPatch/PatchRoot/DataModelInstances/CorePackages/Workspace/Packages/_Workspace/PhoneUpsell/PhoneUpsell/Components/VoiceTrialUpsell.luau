local PhoneUpsell = script:FindFirstAncestor("PhoneUpsell")
local Parent = PhoneUpsell.Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseRefFunction = ReactModule.useRef
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local Images = UIBloxModule.App.ImageSet.Images
local CryoModule = require(Parent.Cryo)
local PostUserOptInFunction = require(Parent.VoiceChat).PostUserOptIn
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local FocusNavigableSurfaceWrapper = FocusNavigationUtilsModule.FocusNavigableSurfaceWrapper
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local ToastRoduxModule = require(Parent.ToastRodux)
local SetCurrentToastMessageFunction = ToastRoduxModule.Actions.SetCurrentToastMessage
local PostUpsellTrialOptInModule = require(PhoneUpsell.Http.Requests.PostUpsellTrialOptIn)
local t = {}

local function getButtonStackProps(Text, ButtonHeight, OnActivated, Text1, OnActivated1)
	-- upvalues: ButtonType (copy)
	local Buttons = {
		{
			buttonType = ButtonType.PrimarySystem,
			props = { onActivated = OnActivated, text = Text }
		}
	}
	
	if Text1 and Text1 ~= "" then
		table.insert(Buttons, 1, {
			buttonType = ButtonType.Secondary,
			props = { onActivated = OnActivated1, text = Text1 }
		})
	end
	return { buttonHeight = ButtonHeight, buttons = Buttons }
end

return function(p1)
	-- upvalues: CryoModule (copy), t (copy), UseDispatchFunction (copy), UseRefFunction (copy), UseStyleFunction (copy), UseLocalizationFunction (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), PostUserOptInFunction (copy), PostUpsellTrialOptInModule (copy), SetCurrentToastMessageFunction (copy), ToastRoduxModule (copy), Images (copy), ReactModule (copy), FocusNavigableSurfaceWrapper (copy), FocusNavigableSurfaceIdentifierEnum (copy), InteractiveAlert (copy), getButtonStackProps (copy)
	local UnionResult = CryoModule.Dictionary.union(t, p1)
	local UseDispatchResult = UseDispatchFunction()
	local UseRefResult = UseRefFunction(nil)
	local UseStyleResult = UseStyleFunction()
	local BaseSize = UseStyleResult.Font.BaseSize
	local UseLocalizationResult = UseLocalizationFunction({
		titleKey = "Feature.VerificationUpsell.Heading.TryVoiceChat",
		descriptionKey = "Feature.VerificationUpsell.Description.VoiceLegalConsent2",
		buttonKey = "Feature.VerificationUpsell.Action.TurnOn",
		extraButtonKey = "Feature.VerificationUpsell.Action.NotNow.2"
	})
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	
	return ReactModule.createElement(FocusNavigableSurfaceWrapper, {
		isIsolated = true,
		surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.PopUp,
		frameProps = { ref = UseRefResult }
	}, {
		Modal = ReactModule.createElement(InteractiveAlert, {
			title = UseLocalizationResult.titleKey,
			screenSize = if UseRefResult and UseRefResult.current then UseRefResult.current.AbsoluteSize else Vector2.new(500, 500),
			buttonStackInfo = getButtonStackProps(UseLocalizationResult.buttonKey, UseStyleResult.Tokens.Size.Size_1200, function()
				-- upvalues: UnionResult (copy), PostUserOptInFunction (upval), UseRoactServiceResult (copy), PostUpsellTrialOptInModule (upval), UseDispatchResult (copy), SetCurrentToastMessageFunction (upval), ToastRoduxModule (upval), Images (upval), UseStyleResult (copy)
				UnionResult.onClose()
				PostUserOptInFunction(UseRoactServiceResult, true, false):andThen(function(_)
					-- upvalues: PostUpsellTrialOptInModule (upval), UseRoactServiceResult (upval), UnionResult (upval)
					return PostUpsellTrialOptInModule(UseRoactServiceResult, UnionResult.upsellCardType)
				end):andThen(function()
					-- upvalues: UseDispatchResult (upval), SetCurrentToastMessageFunction (upval), ToastRoduxModule (upval), Images (upval), UseStyleResult (upval), UnionResult (upval)
					UseDispatchResult(SetCurrentToastMessageFunction({
						toastMessage = "Feature.VerificationUpsell.Heading.VoiceChatTurnedOn",
						isLocalized = false,
						slideIn = true,
						toastType = ToastRoduxModule.Enums.ToastType.SuccessConfirmation,
						toastIcon = Images["icons/status/success_large"],
						toastIconColorStyle = {
							Color = UseStyleResult.Tokens.Color.System.Success.Color3
						}
					}))
					UnionResult.onCompletion()
				end):catch(function()
					-- upvalues: UseDispatchResult (upval), SetCurrentToastMessageFunction (upval), ToastRoduxModule (upval), UseStyleResult (upval)
					UseDispatchResult(SetCurrentToastMessageFunction({
						toastMessage = "Feature.VerificationUpsell.Heading.VoiceChatJoinFailed",
						isLocalized = false,
						slideIn = true,
						toastType = ToastRoduxModule.Enums.ToastType.NetworkingError,
						toastIconColorStyle = { Color = UseStyleResult.Tokens.Color.System.Alert.Color3 }
					}))
				end)
			end, UseLocalizationResult.extraButtonKey, UnionResult.onClose),
			onCloseClicked = UnionResult.onClose,
			middleContent = function()
				-- upvalues: ReactModule (upval), UseLocalizationResult (copy), BaseSize (copy), UseStyleResult (copy)
				return ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					AutomaticSize = Enum.AutomaticSize.Y,
					Size = UDim2.new(1, 0, 0, 0)
				}, {
					BodyText = ReactModule.createElement("TextLabel", {
						LayoutOrder = 0,
						BackgroundTransparency = 1,
						TextWrapped = true,
						RichText = true,
						Text = UseLocalizationResult.descriptionKey,
						TextSize = BaseSize,
						TextColor3 = UseStyleResult.Theme.TextDefault.Color,
						TextTransparency = UseStyleResult.Theme.TextDefault.Transparency,
						Font = UseStyleResult.Font.Body.Font,
						TextXAlignment = Enum.TextXAlignment.Left,
						Size = UDim2.new(1, 0, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y
					})
				})
			end
		})
	})
end