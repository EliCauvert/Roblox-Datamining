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

local function getButtonStackProps(p0, p1, p2, p3, p4) --[[ line: 32 ]]
	-- upvalues: buttonType (ref)
	local list = {
		{
			buttonType = buttonType.PrimarySystem,
			props = { onActivated = p2, text = p0 }
		}
	}
	
	if p3 and p3 ~= "" then
		table.insert(list, 1, {
			buttonType = buttonType.Secondary,
			props = { onActivated = p4, text = p3 }
		})
	end
	return { buttonHeight = p1, buttons = list }
end

return function(p5) --[[ line: 64 | named "VoiceTrialUpsell" ]]
	-- upvalues: cryoModule (ref), t (ref), useDispatch (ref), useRef (ref), useStyle (ref), useLocalization (ref), useRoactService (ref), roactNetworking (ref), postUserOptIn (ref), postUpsellTrialOptInModule (ref), setCurrentToastMessage (ref), toastRoduxModule (ref), images (ref), reactModule (ref), focusNavigableSurfaceWrapper (ref), focusNavigableSurfaceIdentifierEnum (ref), interactiveAlert (ref), getButtonStackProps (ref)
	local var10 = cryoModule.Dictionary.union(t, p5)
	local t_1 = {
		titleKey = "Feature.VerificationUpsell.Heading.TryVoiceChat",
		descriptionKey = "Feature.VerificationUpsell.Description.VoiceLegalConsent2",
		buttonKey = "Feature.VerificationUpsell.Action.TurnOn",
		extraButtonKey = "Feature.VerificationUpsell.Action.NotNow.2"
	}
	local var12 = useDispatch()
	local var13 = useRef(nil)
	local var14 = useStyle()
	local baseSize = var14.Font.BaseSize
	local var15 = useLocalization(t_1)
	local var16 = useRoactService(roactNetworking)
	
	return reactModule.createElement(focusNavigableSurfaceWrapper, {
		isIsolated = true,
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp,
		frameProps = { ref = var13 }
	}, {
		Modal = reactModule.createElement(interactiveAlert, {
			title = var15.titleKey,
			screenSize = if var13 and var13.current then var13.current.AbsoluteSize else Vector2.new(500, 500),
			buttonStackInfo = getButtonStackProps(var15.buttonKey, var14.Tokens.Size.Size_1200, function() --[[ line: 81 | named "handleTurnOn" ]]
				-- upvalues: var10 (ref), postUserOptIn (copy), var16 (ref), postUpsellTrialOptInModule (copy), var12 (ref), setCurrentToastMessage (copy), toastRoduxModule (copy), images (copy), var14 (ref)
				var10.onClose()
				postUserOptIn(var16, true, false):andThen(function(_) --[[ line: 84 ]]
					-- upvalues: postUpsellTrialOptInModule (copy), var16 (copy), var10 (copy)
					return postUpsellTrialOptInModule(var16, var10.upsellCardType)
				end):andThen(function() --[[ line: 87 ]]
					-- upvalues: var12 (copy), setCurrentToastMessage (copy), toastRoduxModule (copy), images (copy), var14 (copy), var10 (copy)
					var12(setCurrentToastMessage({
						toastMessage = "Feature.VerificationUpsell.Heading.VoiceChatTurnedOn",
						isLocalized = false,
						slideIn = true,
						toastType = toastRoduxModule.Enums.ToastType.SuccessConfirmation,
						toastIcon = images["icons/status/success_large"],
						toastIconColorStyle = { Color = var14.Tokens.Color.System.Success.Color3 }
					}))
					var10.onCompletion()
				end):catch(function() --[[ line: 100 ]]
					-- upvalues: var12 (copy), setCurrentToastMessage (copy), toastRoduxModule (copy), var14 (copy)
					var12(setCurrentToastMessage({
						toastMessage = "Feature.VerificationUpsell.Heading.VoiceChatJoinFailed",
						isLocalized = false,
						slideIn = true,
						toastType = toastRoduxModule.Enums.ToastType.NetworkingError,
						toastIconColorStyle = { Color = var14.Tokens.Color.System.Alert.Color3 }
					}))
				end)
			end, var15.extraButtonKey, var10.onClose),
			onCloseClicked = var10.onClose,
			middleContent = function() --[[ line: 132 ]]
				-- upvalues: reactModule (copy), var15 (ref), baseSize (ref), var14 (ref)
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
						Text = var15.descriptionKey,
						TextSize = baseSize,
						TextColor3 = var14.Theme.TextDefault.Color,
						TextTransparency = var14.Theme.TextDefault.Transparency,
						Font = var14.Font.Body.Font,
						TextXAlignment = Enum.TextXAlignment.Left,
						Size = UDim2.new(1, 0, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y
					})
				})
			end
		})
	})
end