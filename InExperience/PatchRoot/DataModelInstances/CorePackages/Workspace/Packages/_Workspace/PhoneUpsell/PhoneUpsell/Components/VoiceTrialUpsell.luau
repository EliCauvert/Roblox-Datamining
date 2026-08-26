local phoneUpsell = script:FindFirstAncestor("PhoneUpsell")
local parent = phoneUpsell.Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local useStyle = UIBloxModule.Core.Style.useStyle
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useRef = reactModule.useRef
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local interactiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local images = UIBloxModule.App.ImageSet.Images
local cryoModule = require(parent.Cryo)
local postUserOptIn = require(parent.VoiceChat).PostUserOptIn
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local roactNetworking = require(parent.RoactServiceTags).RoactNetworking
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local focusNavigableSurfaceWrapper = focusNavigationUtilsModule.FocusNavigableSurfaceWrapper
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local toastRoduxModule = require(parent.ToastRodux)
local setCurrentToastMessage = toastRoduxModule.Actions.SetCurrentToastMessage
local postUpsellTrialOptInModule = require(phoneUpsell.Http.Requests.PostUpsellTrialOptIn)
local t = {}

local function getButtonStackProps(p1, p2, p3, p4, p5)
	-- upvalues: buttonType (ref)
	local list = {
		{
			buttonType = buttonType.PrimarySystem,
			props = { onActivated = p3, text = p1 }
		}
	}
	
	if p4 and p4 ~= "" then
		table.insert(list, 1, {
			buttonType = buttonType.Secondary,
			props = { onActivated = p5, text = p4 }
		})
	end
	return { buttonHeight = p2, buttons = list }
end

return function(p1)
	-- upvalues: cryoModule (ref), t (ref), useDispatch (ref), useRef (ref), useStyle (ref), useLocalization (ref), useRoactService (ref), roactNetworking (ref), postUserOptIn (ref), postUpsellTrialOptInModule (ref), setCurrentToastMessage (ref), toastRoduxModule (ref), images (ref), reactModule (ref), focusNavigableSurfaceWrapper (ref), focusNavigableSurfaceIdentifierEnum (ref), interactiveAlert (ref), getButtonStackProps (ref)
	local var1 = cryoModule.Dictionary.union(t, p1)
	local t_1 = {
		titleKey = "Feature.VerificationUpsell.Heading.TryVoiceChat",
		descriptionKey = "Feature.VerificationUpsell.Description.VoiceLegalConsent2",
		buttonKey = "Feature.VerificationUpsell.Action.TurnOn",
		extraButtonKey = "Feature.VerificationUpsell.Action.NotNow.2"
	}
	local var2 = useDispatch()
	local var3 = useRef(nil)
	local var4 = useStyle()
	local baseSize = var4.Font.BaseSize
	local var5 = useLocalization(t_1)
	local var6 = useRoactService(roactNetworking)
	
	return reactModule.createElement(focusNavigableSurfaceWrapper, {
		isIsolated = true,
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp,
		frameProps = { ref = var3 }
	}, {
		Modal = reactModule.createElement(interactiveAlert, {
			title = var5.titleKey,
			screenSize = if var3 and var3.current then var3.current.AbsoluteSize else Vector2.new(500, 500),
			buttonStackInfo = getButtonStackProps(var5.buttonKey, var4.Tokens.Size.Size_1200, function()
				-- upvalues: var1 (ref), postUserOptIn (copy), var6 (ref), postUpsellTrialOptInModule (copy), var2 (ref), setCurrentToastMessage (copy), toastRoduxModule (copy), images (copy), var4 (ref)
				var1.onClose()
				postUserOptIn(var6, true, false):andThen(function(_)
					-- upvalues: postUpsellTrialOptInModule (copy), var6 (copy), var1 (copy)
					return postUpsellTrialOptInModule(var6, var1.upsellCardType)
				end):andThen(function()
					-- upvalues: var2 (copy), setCurrentToastMessage (copy), toastRoduxModule (copy), images (copy), var4 (copy), var1 (copy)
					var2(setCurrentToastMessage({
						toastMessage = "Feature.VerificationUpsell.Heading.VoiceChatTurnedOn",
						isLocalized = false,
						slideIn = true,
						toastType = toastRoduxModule.Enums.ToastType.SuccessConfirmation,
						toastIcon = images["icons/status/success_large"],
						toastIconColorStyle = { Color = var4.Tokens.Color.System.Success.Color3 }
					}))
					var1.onCompletion()
				end):catch(function()
					-- upvalues: var2 (copy), setCurrentToastMessage (copy), toastRoduxModule (copy), var4 (copy)
					var2(setCurrentToastMessage({
						toastMessage = "Feature.VerificationUpsell.Heading.VoiceChatJoinFailed",
						isLocalized = false,
						slideIn = true,
						toastType = toastRoduxModule.Enums.ToastType.NetworkingError,
						toastIconColorStyle = { Color = var4.Tokens.Color.System.Alert.Color3 }
					}))
				end)
			end, var5.extraButtonKey, var1.onClose),
			onCloseClicked = var1.onClose,
			middleContent = function()
				-- upvalues: reactModule (copy), var5 (ref), baseSize (ref), var4 (ref)
				return reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					AutomaticSize = Enum.AutomaticSize.Y,
					Size = UDim2.new(1, 0, 0, 0)
				}, {
					BodyText = reactModule.createElement("TextLabel", {
						LayoutOrder = 0,
						BackgroundTransparency = 1,
						TextWrapped = true,
						RichText = true,
						Text = var5.descriptionKey,
						TextSize = baseSize,
						TextColor3 = var4.Theme.TextDefault.Color,
						TextTransparency = var4.Theme.TextDefault.Transparency,
						Font = var4.Font.Body.Font,
						TextXAlignment = Enum.TextXAlignment.Left,
						Size = UDim2.new(1, 0, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y
					})
				})
			end
		})
	})
end