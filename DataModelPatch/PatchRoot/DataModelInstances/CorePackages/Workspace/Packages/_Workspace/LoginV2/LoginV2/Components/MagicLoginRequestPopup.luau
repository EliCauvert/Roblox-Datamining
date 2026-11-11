local LoginV2 = script:FindFirstAncestor("LoginV2")
local Parent = LoginV2.Parent
local AccountService = game:GetService("AccountService")
local MagicLoginEngineFeature = game:GetEngineFeature("MagicLogin")
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Text = FoundationModule.Text
local ModalWindow = require(Parent.UIBlox).App.Dialog.Modal.ModalWindow
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local IconButton = FoundationModule.IconButton
local IconSize = FoundationModule.Enums.IconSize
local Button = FoundationModule.Button
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local CrossDeviceLogin = require(Parent.AuthCommon).Thunks.CrossDeviceLogin
local PollMagicLoginStatusFunction = require(LoginV2.Thunks).PollMagicLoginStatus
local HttpService = game:GetService("HttpService")
local ConstantsModule = require(script.Parent.Constants)
local MagicLoginPhaseType = require(LoginV2.Enums).MagicLoginPhaseType
local Logger = require(Parent.Loggers).Logger

return function(p1)
	-- upvalues: ReactModule (copy), MagicLoginPhaseType (copy), UseSelectorFunction (copy), UseDispatchFunction (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), PollMagicLoginStatusFunction (copy), CrossDeviceLogin (copy), AccountService (copy), MagicLoginEngineFeature (copy), HttpService (copy), ConstantsModule (copy), Logger (copy), Text (copy), View (copy), Button (copy), ButtonVariant (copy), InputSize (copy), ModalWindow (copy), IconButton (copy), IconSize (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState("")
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(MagicLoginPhaseType.WAITING_FOR_APPROVAL)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(nil)
	local UseSelectorResult = UseSelectorFunction(function(p2)
		return p2.ScreenSize
	end)
	local UseDispatchResult = UseDispatchFunction()
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local UseRefResult = ReactModule.useRef(true)
	
	local function _(p2, p3)
		-- upvalues: UseDispatchResult (copy), PollMagicLoginStatusFunction (upval), UseRoactServiceResult (copy), UseRefResult (copy), p1 (copy), UseStateResult2_1 (copy), MagicLoginPhaseType (upval)
		UseDispatchResult(PollMagicLoginStatusFunction(UseRoactServiceResult, p2, p3, UseRefResult, p1.launchApp, function()
			-- upvalues: UseStateResult2_1 (upval), MagicLoginPhaseType (upval)
			UseStateResult2_1(MagicLoginPhaseType.ERROR_OR_EXPIRED)
		end))
	end
	
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseDispatchResult (copy), p1 (copy), UseStateResult1 (copy), MagicLoginPhaseType (upval), CrossDeviceLogin (upval), UseRoactServiceResult (copy), UseStateResult3 (copy)
		UseDispatchResult(p1.closeCentralOverlayThunk())
		
		if UseStateResult1 == MagicLoginPhaseType.WAITING_FOR_APPROVAL then
			CrossDeviceLogin.CancelLoginCode(UseRoactServiceResult, UseStateResult3)(UseDispatchResult)
		end
	end, {
		p1.closeCentralOverlayThunk,
		UseStateResult3,
		UseStateResult1
	})
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2 (copy), UseDispatchResult (copy), CrossDeviceLogin (upval), UseRoactServiceResult (copy), UseRefResult (copy), AccountService (upval), MagicLoginEngineFeature (upval), HttpService (upval), ConstantsModule (upval), p1 (copy), UseStateResult2_2 (copy), PollMagicLoginStatusFunction (upval), UseStateResult2_1 (copy), MagicLoginPhaseType (upval), Logger (upval)
		math.randomseed(os.time())
		local Text = tostring(math.random(10, 99))
		UseStateResult2(Text)
		UseDispatchResult(CrossDeviceLogin.FetchDeviceCode(UseRoactServiceResult)):andThen(function(Result)
			-- upvalues: UseRefResult (upval), AccountService (upval), MagicLoginEngineFeature (upval), HttpService (upval), ConstantsModule (upval), p1 (upval), Text (copy), UseStateResult2_2 (upval), UseDispatchResult (upval), PollMagicLoginStatusFunction (upval), UseRoactServiceResult (upval), UseStateResult2_1 (upval), MagicLoginPhaseType (upval)
			if UseRefResult.current then
				if AccountService and MagicLoginEngineFeature then
					AccountService:MagicLogin((HttpService:JSONEncode({
						magicLoginActionKey = ConstantsModule.REQUEST_CONNECTION,
						endpointId = p1.endpointId,
						code = Result.DeviceCode,
						authenticationDigits = Text
					})))
				end
				UseStateResult2_2(Result.DeviceCode)
				UseDispatchResult(PollMagicLoginStatusFunction(UseRoactServiceResult, Result.DeviceCode, Result.PrivateKey, UseRefResult, p1.launchApp, function()
					-- upvalues: UseStateResult2_1 (upval), MagicLoginPhaseType (upval)
					UseStateResult2_1(MagicLoginPhaseType.ERROR_OR_EXPIRED)
				end))
			end
		end):catch(function(Err)
			-- upvalues: UseRefResult (upval), Logger (upval), UseStateResult2_1 (upval), MagicLoginPhaseType (upval)
			if UseRefResult.current then
				Logger:warning("Magic login Failed : " .. Err)
				UseStateResult2_1(MagicLoginPhaseType.ERROR_OR_EXPIRED)
			end
		end)
		
		return function()
			-- upvalues: UseRefResult (upval)
			UseRefResult.current = false
		end
	end, {})
	
	return ReactModule.createElement(View, { tag = "size-full bg-action-alert padding-large" }, {
		ContentModal = ReactModule.createElement(ModalWindow, {
			isFullHeight = false,
			position = UDim2.new(0.5, 0, 0.5, 0),
			screenSize = UseSelectorResult + Vector2.new(-30, 0),
			anchorPoint = Vector2.new(0.5, 0.5)
		}, {
			OverlayContent = ReactModule.createElement(View, { tag = "auto-y size-full-0" }, {
				VisibilityText = ReactModule.createElement(Text, { Text = "", tag = "size-full-0 text-body" }),
				CloseButtonContainer = if UseStateResult1 == MagicLoginPhaseType.WAITING_FOR_APPROVAL then ReactModule.createElement(View, {
					tag = "auto-xy position-top-right padding-large anchor-top-right"
				}, {
					CloseButton = ReactModule.createElement(IconButton, {
						icon = "icons/navigation/close",
						tag = "",
						size = IconSize.Medium,
						onActivated = UseResult
					})
				}) else nil,
				ContentContainer = ReactModule.createElement(View, {
					tag = "col gap-medium auto-y size-full-0 padding-xxlarge"
				}, if UseStateResult1 == MagicLoginPhaseType.WAITING_FOR_APPROVAL then {
					TitleText = ReactModule.createElement(Text, {
						tag = "auto-xy text-heading-large text-wrap text-align-x-left padding-right-xxlarge",
						LayoutOrder = 0,
						Text = string.format("Check your %s", p1.endpointType)
					}),
					DescriptionText = ReactModule.createElement(Text, {
						RichText = true,
						tag = "auto-xy text-body-large text-wrap text-align-x-left",
						LayoutOrder = 1,
						Text = string.format("A request has been sent to <b>%s (%s)</b>. Approve the request by tapping yes, then tap the following number on your device.", p1.endpointName, p1.endpointType)
					}),
					NumberContainer = ReactModule.createElement(View, {
						tag = "auto-y size-full-0 position-center-center padding-xxlarge bg-action-alert radius-medium",
						LayoutOrder = 2
					}, {
						NumberText = ReactModule.createElement(Text, {
							tag = "auto-y size-full-0 text-display-small text-wrap text-align-x-center",
							Text = UseStateResult
						})
					})
				} elseif UseStateResult1 == MagicLoginPhaseType.ERROR_OR_EXPIRED then {
					TitleText = ReactModule.createElement(Text, {
						Text = "Couldn't sign you in",
						tag = "auto-xy text-heading-large text-wrap text-align-x-left padding-right-xxlarge",
						LayoutOrder = 0
					}),
					DescriptionText = ReactModule.createElement(Text, {
						Text = "If you still want to sign in, try again.",
						tag = "auto-xy text-body-large text-wrap text-align-x-left",
						LayoutOrder = 1
					}),
					OkayButton = ReactModule.createElement(Button, {
						text = "Okay",
						LayoutOrder = 2,
						variant = ButtonVariant.Emphasis,
						onActivated = UseResult,
						size = InputSize.Medium,
						width = UDim.new(1, 1)
					})
				} else {})
			})
		})
	})
end