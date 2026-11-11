local LoginV2 = script:FindFirstAncestor("LoginV2")
local Parent = LoginV2.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Button = FoundationModule.Button
local View = FoundationModule.View
local Text = FoundationModule.Text
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize
local ModalWindow = require(Parent.UIBlox).App.Dialog.Modal.ModalWindow
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local IconButton = FoundationModule.IconButton
local IconSize = FoundationModule.Enums.IconSize
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local CrossDeviceLogin = require(Parent.AuthCommon).Thunks.CrossDeviceLogin
local MagicLoginPhaseType = require(LoginV2.Enums).MagicLoginPhaseType
local SetMagicLoginAdvertisementFunction = require(LoginV2.Thunks).SetMagicLoginAdvertisement
local Logger = require(Parent.Loggers).Logger

return function(p1)
	-- upvalues: ReactModule (copy), MagicLoginPhaseType (copy), UseSelectorFunction (copy), UseDispatchFunction (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), SetMagicLoginAdvertisementFunction (copy), CrossDeviceLogin (copy), Logger (copy), Button (copy), ButtonVariant (copy), InputSize (copy), Text (copy), View (copy), ModalWindow (copy), IconButton (copy), IconSize (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(p1.phase or MagicLoginPhaseType.WAITING_FOR_APPROVAL)
	local IfYouStillWantToSignInTryAgainFromYourOtherDevice, IfYouStillWantToSignInTryAgainFromYourOtherDevice2 = ReactModule.useState("If you still want to sign in, try again from your other device.")
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState({})
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(false)
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(false)
	local UseSelectorResult = UseSelectorFunction(function(p2)
		return p2.ScreenSize
	end)
	local UseDispatchResult = UseDispatchFunction()
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local Config = {}
	ReactModule.useEffect(function()
		-- upvalues: SetMagicLoginAdvertisementFunction (upval)
		SetMagicLoginAdvertisementFunction(false)
		
		return function()
			-- upvalues: SetMagicLoginAdvertisementFunction (upval)
			SetMagicLoginAdvertisementFunction(true)
		end
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), UseStateResult2_1 (copy)
		local t = {}
		local List = {}
		math.randomseed(os.time())
		local RandomValue = math.random(1, 3)
		t[p1.authenticationDigits] = true
		
		for i = 1, 3 do
			local Text = nil
			if i == RandomValue then
				table.insert(List, p1.authenticationDigits)
			else
				repeat
					Text = tostring(math.random(10, 99))
				until not t[Text]
				t[Text] = true
				table.insert(List, Text)
			end
		end
		UseStateResult2_1(List)
	end, { p1.authenticationDigits })
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2_2 (copy), CrossDeviceLogin (upval), UseRoactServiceResult (copy), p1 (copy), UseDispatchResult (copy), UseStateResult2 (copy), MagicLoginPhaseType (upval), Logger (upval)
		UseStateResult2_2(true)
		CrossDeviceLogin.EnterCode(UseRoactServiceResult, p1.authCode)(UseDispatchResult):andThen(function(Result)
			-- upvalues: UseStateResult2 (upval), MagicLoginPhaseType (upval), UseStateResult2_2 (upval)
			if Result and Result.DeviceInfo then
				UseStateResult2(MagicLoginPhaseType.MATCH_CHALLENGE)
			else
				UseStateResult2(MagicLoginPhaseType.ERROR_OR_EXPIRED)
			end
			UseStateResult2_2(false)
		end, function(p2)
			-- upvalues: Logger (upval), UseStateResult2 (upval), MagicLoginPhaseType (upval), UseStateResult2_2 (upval)
			Logger:warning("Magic login enter code failed: " .. tostring(p2))
			UseStateResult2(MagicLoginPhaseType.ERROR_OR_EXPIRED)
			UseStateResult2_2(false)
		end)
	end, { p1.authCode })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2_2 (copy), CrossDeviceLogin (upval), UseRoactServiceResult (copy), p1 (copy), UseDispatchResult (copy), Logger (upval)
		UseStateResult2_2(true)
		CrossDeviceLogin.CancelLoginCode(UseRoactServiceResult, p1.authCode)(UseDispatchResult):andThen(function(_)
			-- upvalues: UseStateResult2_2 (upval)
			UseStateResult2_2(false)
		end, function(p2)
			-- upvalues: Logger (upval), UseStateResult2_2 (upval)
			Logger:warning("Magic login cancel failed: " .. tostring(p2))
			UseStateResult2_2(false)
		end)
		
		if p1.closeCentralOverlayThunk then
			UseDispatchResult(p1.closeCentralOverlayThunk())
		end
	end, { p1.authCode, UseStateResult3 })
	local UseResult2 = ReactModule.useCallback(function(AuthenticationDigits)
		-- upvalues: UseStateResult2_3 (copy), p1 (copy), CrossDeviceLogin (upval), UseRoactServiceResult (copy), UseDispatchResult (copy), UseStateResult2 (copy), MagicLoginPhaseType (upval), Logger (upval), IfYouStillWantToSignInTryAgainFromYourOtherDevice2 (copy)
		UseStateResult2_3(true)
		
		if AuthenticationDigits == p1.authenticationDigits then
			CrossDeviceLogin.ConfirmDeviceAccess(UseRoactServiceResult, p1.authCode)(UseDispatchResult):andThen(function()
				-- upvalues: UseStateResult2 (upval), MagicLoginPhaseType (upval)
				UseStateResult2(MagicLoginPhaseType.SUCCESS)
			end, function(p2)
				-- upvalues: Logger (upval), UseStateResult2 (upval), MagicLoginPhaseType (upval), UseStateResult2_3 (upval)
				Logger:warning("Magic login confirm failed: " .. tostring(p2))
				UseStateResult2(MagicLoginPhaseType.ERROR_OR_EXPIRED)
				UseStateResult2_3(false)
			end)
			
			return
		else
			IfYouStillWantToSignInTryAgainFromYourOtherDevice2("The number you selected does not match the number on your other device. If you still want to sign in, try again from your other device.")
			UseStateResult2(MagicLoginPhaseType.ERROR_OR_EXPIRED)
			UseStateResult2_3(false)
			CrossDeviceLogin.CancelLoginCode(UseRoactServiceResult, p1.authCode)(UseDispatchResult)
		end
	end, { p1.authCode, p1.authenticationDigits })
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: UseDispatchResult (copy), p1 (copy), UseStateResult (copy), MagicLoginPhaseType (upval), CrossDeviceLogin (upval), UseRoactServiceResult (copy)
		UseDispatchResult(p1.closeCentralOverlayThunk())
		
		if UseStateResult == MagicLoginPhaseType.MATCH_CHALLENGE then
			CrossDeviceLogin.CancelLoginCode(UseRoactServiceResult, p1.authCode)(UseDispatchResult)
		end
	end, { p1.closeCentralOverlayThunk, p1.authCode, UseStateResult })
	local UseResult4 = ReactModule.useCallback(function()
		-- upvalues: ReactModule (upval), Button (upval), UseStateResult1 (copy), ButtonVariant (upval), UseResult2 (copy), UseStateResult4 (copy), InputSize (upval)
		local Elements = {}
		
		for i = 1, 3 do
			table.insert(Elements, ReactModule.createElement(Button, {
				LayoutOrder = 0,
				text = tostring(UseStateResult1[i]),
				variant = ButtonVariant.Standard,
				onActivated = function()
					-- upvalues: UseResult2 (upval), UseStateResult1 (upval), i (copy)
					UseResult2(UseStateResult1[i])
				end,
				isLoading = UseStateResult4,
				size = InputSize.Large,
				width = UDim.new(0.315, 1)
			}))
		end
		return Elements
	end, { UseStateResult1, UseStateResult4 })
	
	if UseStateResult == MagicLoginPhaseType.WAITING_FOR_APPROVAL then
		Config = {
			TitleText = ReactModule.createElement(Text, {
				Text = "Trying to sign in from another device?",
				tag = "auto-xy text-heading-large text-wrap text-align-x-left ",
				LayoutOrder = 0
			}),
			DescriptionText = ReactModule.createElement(Text, {
				RichText = true,
				tag = "auto-xy text-body-large text-wrap text-align-x-left",
				LayoutOrder = 1,
				Text = string.format("Someone is requesting to sign in on <b>%s (%s)</b>. If it's you, press Yes to continue.", p1.endpointName, p1.endpointType)
			}),
			PositiveButton = ReactModule.createElement(Button, {
				text = "Yes",
				LayoutOrder = 2,
				variant = ButtonVariant.Emphasis,
				onActivated = UseResult,
				isLoading = UseStateResult3,
				size = InputSize.Medium,
				width = UDim.new(1, 1)
			}),
			NegativeButton = ReactModule.createElement(Button, {
				text = "No",
				LayoutOrder = 3,
				variant = ButtonVariant.Standard,
				onActivated = UseResult1,
				isLoading = UseStateResult3,
				size = InputSize.Medium,
				width = UDim.new(1, 1)
			})
		}
	elseif UseStateResult == MagicLoginPhaseType.MATCH_CHALLENGE then
		Config = {
			TitleText = ReactModule.createElement(Text, {
				Text = "Which number do you see on your other device?",
				tag = "auto-xy text-heading-large text-wrap text-align-x-left padding-right-xxlarge",
				LayoutOrder = 0
			}),
			DescriptionText = ReactModule.createElement(Text, {
				RichText = true,
				tag = "auto-xy text-body-large text-wrap text-align-x-left",
				LayoutOrder = 1,
				Text = string.format("Click the number that matches what is shown on <b>%s (%s)</b>.", p1.endpointName, p1.endpointType)
			}),
			ButtonContainer = ReactModule.createElement(View, {
				tag = "row gap-small auto-y size-full-0",
				LayoutOrder = 2
			}, (UseResult4()))
		}
	elseif UseStateResult == MagicLoginPhaseType.SUCCESS then
		Config = {
			TitleText = ReactModule.createElement(Text, {
				tag = "auto-xy text-heading-large text-wrap text-align-x-left padding-right-xxlarge",
				LayoutOrder = 0,
				Text = string.format("You're signed in on %s", p1.endpointName)
			}),
			DescriptionText = ReactModule.createElement(Text, {
				Text = "Feel free to explore Roblox.",
				tag = "auto-xy text-body-large text-wrap text-align-x-left",
				LayoutOrder = 1
			}),
			DoneButton = ReactModule.createElement(Button, {
				text = "Done",
				LayoutOrder = 2,
				variant = ButtonVariant.Emphasis,
				onActivated = UseResult3,
				size = InputSize.Medium,
				width = UDim.new(1, 1)
			})
		}
	elseif UseStateResult == MagicLoginPhaseType.ERROR_OR_EXPIRED then
		Config = {
			TitleText = ReactModule.createElement(Text, {
				Text = "Couldn't sign you in",
				tag = "auto-xy text-heading-large text-wrap text-align-x-left padding-right-xxlarge",
				LayoutOrder = 0
			}),
			DescriptionText = ReactModule.createElement(Text, {
				tag = "auto-xy text-body-large text-wrap text-align-x-left",
				LayoutOrder = 1,
				Text = IfYouStillWantToSignInTryAgainFromYourOtherDevice
			}),
			OkayButton = ReactModule.createElement(Button, {
				text = "Okay",
				LayoutOrder = 2,
				variant = ButtonVariant.Emphasis,
				onActivated = UseResult3,
				size = InputSize.Medium,
				width = UDim.new(1, 1)
			})
		}
	end
	return ReactModule.createElement(View, { tag = "size-full bg-action-alert padding-large" }, {
		ContentModal = ReactModule.createElement(ModalWindow, {
			isFullHeight = false,
			position = UDim2.new(0.5, 0, 0.5, 0),
			screenSize = UseSelectorResult + Vector2.new(-30, 0),
			anchorPoint = Vector2.new(0.5, 0.5)
		}, {
			OverlayContent = ReactModule.createElement(View, { tag = "auto-y size-full-0" }, {
				CloseButtonContainer = if UseStateResult == MagicLoginPhaseType.MATCH_CHALLENGE then ReactModule.createElement(View, {
					tag = "auto-xy position-top-right padding-large anchor-top-right"
				}, {
					CloseButton = ReactModule.createElement(IconButton, {
						icon = "icons/navigation/close",
						tag = "",
						size = IconSize.Medium,
						onActivated = UseResult3
					})
				}) else nil,
				ContentContainer = ReactModule.createElement(View, {
					tag = "col gap-medium auto-y size-full-0 padding-xxlarge"
				}, Config)
			})
		})
	})
end