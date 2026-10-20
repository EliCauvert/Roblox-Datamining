local Parent = script:FindFirstAncestor("LandingPage").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local PeekView = require(Parent.PeekView).PeekView
local PeekViewState = require(Parent.PeekView).PeekViewState
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local DebounceFunction = require(Parent.AuthCommon).Utils.debounce
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local AccountPickerPeekViewCloseOffset = game:DefineFastInt("AccountPickerPeekViewCloseOffset", 10)
local AuthAnalyticsModule = require(Parent.AuthAnalytics)
local GetFFlagEnableAccountCarouselEventsFunction = require(Parent.SharedFlags).GetFFlagEnableAccountCarouselEvents
local EventStreamConstants = AuthAnalyticsModule.EventStreamConstants
local AuthButtonClickFunction = AuthAnalyticsModule.Events.authButtonClick
local ScaledAccountPickerPeekViewBriefViewSize = game:DefineFastInt("AccountPickerPeekViewBriefViewSize", 80) * 3

local function v9(Frame)
	-- upvalues: ReactModule (copy), FoundationModule (copy)
	return ReactModule.createElement(FoundationModule.View, {
		tag = "size-full-0 auto-y align-y-center text-align-x-left align-x-left padding-y-medium",
		onActivated = Frame.onActivated,
		LayoutOrder = Frame.LayoutOrder
	}, {
		ButtonText = ReactModule.createElement(FoundationModule.Text, {
			tag = "auto-xy text-title-large content-emphasis text-align-x-left padding-left-xlarge",
			Text = Frame.text
		})
	})
end

return function(p1)
	-- upvalues: UseSelectorFunction (copy), UseLocalizationFunction (copy), DebounceFunction (copy), AccountPickerPeekViewCloseOffset (copy), PeekViewState (copy), ReactModule (copy), FoundationModule (copy), PeekView (copy), ScaledAccountPickerPeekViewBriefViewSize (copy), v9 (copy), GetFFlagEnableAccountCarouselEventsFunction (copy), AuthButtonClickFunction (copy), EventStreamConstants (copy)
	local UseSelectorResult = UseSelectorFunction(function(p2)
		return p2.ScreenSize
	end)
	local UseLocalizationResult = UseLocalizationFunction({
		signInToAnotherAccount = "Authentication.AccountPicker.Button.SignIntoAnotherAccount",
		moreOptions = "Authentication.AccountPicker.Label.MoreOptions",
		createAccount = "Authentication.AccountPicker.Button.CreateAccount",
		manageAccounts = "Authentication.AccountPicker.Label.ManageAccounts"
	})
	local DebounceResult = DebounceFunction(function(p2)
		-- upvalues: AccountPickerPeekViewCloseOffset (upval), p1 (copy), PeekViewState (upval)
		if p2 < AccountPickerPeekViewCloseOffset then
			p1.setPeekViewState(PeekViewState.Closed)
		end
	end, 0.03)
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = "anchor-bottom-center position-bottom-center bg-over-media",
		Size = UDim2.new(1, 0, 0, UseSelectorResult.Y)
	}, {
		ReactModule.createElement(PeekView, {
			hasScrim = true,
			superBriefViewContentHeight = nil,
			peekHeaderClose = false,
			canDragFullViewToBrief = true,
			returnToFullView = true,
			thumbstickScrollEnabled = true,
			showDraggerInClosedState = true,
			screenSize = UseSelectorResult,
			briefViewContentHeight = UDim.new(0, ScaledAccountPickerPeekViewBriefViewSize),
			stateOnMount = PeekViewState.Brief,
			peekHeaderPositionYChange = function(p2)
				-- upvalues: DebounceResult (copy)
				DebounceResult(p2)
			end,
			peekViewState = p1.peekViewState
		}, {
			PeekViewContent = ReactModule.createElement(FoundationModule.View, {
				tag = "size-full-0 auto-y col gap-small align-x-left padding-bottom-xlarge"
			}, {
				Title = ReactModule.createElement(FoundationModule.Text, {
					tag = "auto-xy text-heading-medium content-emphasis text-align-x-left padding-left-xlarge padding-bottom-small",
					LayoutOrder = 1,
					Text = UseLocalizationResult.moreOptions
				}),
				ManageAccountsButton = ReactModule.createElement(v9, {
					LayoutOrder = 2,
					onActivated = function()
						-- upvalues: p1 (copy)
						p1.navigateToManageAccounts()
					end,
					text = UseLocalizationResult.manageAccounts
				}),
				LoginButton = ReactModule.createElement(v9, {
					LayoutOrder = 3,
					onActivated = function()
						-- upvalues: GetFFlagEnableAccountCarouselEventsFunction (upval), AuthButtonClickFunction (upval), EventStreamConstants (upval), p1 (copy), PeekViewState (upval)
						if GetFFlagEnableAccountCarouselEventsFunction() then
							AuthButtonClickFunction(EventStreamConstants.Context.AccountPickerLandingScreen, EventStreamConstants.Button.AccountPickerSignInAnotherAccount, nil, nil)
						end
						p1.setPeekViewState(PeekViewState.Closed)
						p1.navigateToLogin()
					end,
					text = UseLocalizationResult.signInToAnotherAccount
				}),
				SignupButton = ReactModule.createElement(v9, {
					LayoutOrder = 4,
					onActivated = function()
						-- upvalues: GetFFlagEnableAccountCarouselEventsFunction (upval), AuthButtonClickFunction (upval), EventStreamConstants (upval), p1 (copy), PeekViewState (upval)
						if GetFFlagEnableAccountCarouselEventsFunction() then
							AuthButtonClickFunction(EventStreamConstants.Context.AccountPickerLandingScreen, EventStreamConstants.Button.AccountPickerCreateAccount, nil, nil)
						end
						p1.setPeekViewState(PeekViewState.Closed)
						p1.navigateToSignup()
					end,
					text = UseLocalizationResult.createAccount
				})
			})
		})
	})
end