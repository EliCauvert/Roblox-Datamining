local PasskeyUpsell = script:FindFirstAncestor("PasskeyUpsell")
local Parent = PasskeyUpsell.Parent
local RoactAppExperimentModule = require(Parent.RoactAppExperiment)
local AppBtidLayers = require(Parent.ExperimentLayers).AppBtidLayers
local ReactModule = require(Parent.React)
local RoactUtilsModule = require(Parent.RoactUtils)
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local UIBloxModule = require(Parent.UIBlox)
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local Images = UIBloxModule.App.ImageSet.Images
local AppPage = require(Parent.RobloxAppEnums).AppPage
local WithLocalizationFunction = require(Parent.Localization).withLocalization
local HandlePasskeyRegistrationModule = require(PasskeyUpsell.Thunks.HandlePasskeyRegistration)
local PasskeyUpsellErrorModalModule = require(script.Parent.PasskeyUpsellErrorModal)
local PasskeyUpsellSuccessScreenModule = require(script.Parent.PasskeyUpsellSuccessScreen)
local PasskeyUpsellHeaderContainerModule = require(script.Parent.PasskeyUpsellHeaderContainer)
local PasskeyUpsellButtonContainerModule = require(script.Parent.PasskeyUpsellButtonContainer)
local FoundationModule = require(Parent.Foundation)
local SetCurrentToastMessageFunction = require(Parent.ToastRodux).Actions.SetCurrentToastMessage
local View = FoundationModule.View
local Image = FoundationModule.Image
local Text = FoundationModule.Text
local UseTokensFunction = FoundationModule.Hooks.useTokens
local FullscreenPageWithSafeArea = require(Parent.AppBlox).FullscreenPageWithSafeArea
local ScrollView = FoundationModule.ScrollView
local ScrollBarVisibility = FoundationModule.Enums.ScrollBarVisibility
local UpdateCooldownModule = require(PasskeyUpsell.Utils.UpdateCooldown)
local AuthAnalyticsModule = require(Parent.AuthAnalytics)
local AuthModalShownFunction = AuthAnalyticsModule.Events.authModalShown
local AuthPageloadFunction = AuthAnalyticsModule.Events.authPageload
local AuthButtonClickFunction = AuthAnalyticsModule.Events.authButtonClick
local AuthMsgShownFunction = AuthAnalyticsModule.Events.authMsgShown
local EventStreamConstants = AuthAnalyticsModule.EventStreamConstants
local PasskeyUpsellSourceModule = require(PasskeyUpsell.Enums.PasskeyUpsellSource)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment = SharedFlagsModule.FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment
local FFlagEmitPasskeyRegistrationSourceOnFinish = SharedFlagsModule.FFlagEmitPasskeyRegistrationSourceOnFinish
local DifferentiateAddAuthMethodPasskeyFlow = game:DefineFastFlag("DifferentiateAddAuthMethodPasskeyFlow", false)

return function(p1)
	-- upvalues: UseRoactServiceFunction (copy), RoactNetworking (copy), UseStyleFunction (copy), UseDispatchFunction (copy), UseTokensFunction (copy), ReactModule (copy), UseSelectorFunction (copy), RoactAppExperimentModule (copy), AppBtidLayers (copy), PasskeyUpsellSourceModule (copy), AuthPageloadFunction (copy), EventStreamConstants (copy), FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment (copy), AppPage (copy), UpdateCooldownModule (copy), AuthButtonClickFunction (copy), DifferentiateAddAuthMethodPasskeyFlow (copy), HandlePasskeyRegistrationModule (copy), AuthModalShownFunction (copy), FFlagEmitPasskeyRegistrationSourceOnFinish (copy), AuthMsgShownFunction (copy), SetCurrentToastMessageFunction (copy), Images (copy), View (copy), Image (copy), Text (copy), WithLocalizationFunction (copy), FullscreenPageWithSafeArea (copy), PasskeyUpsellSuccessScreenModule (copy), PasskeyUpsellHeaderContainerModule (copy), ScrollView (copy), ScrollBarVisibility (copy), PasskeyUpsellButtonContainerModule (copy), PasskeyUpsellErrorModalModule (copy)
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local UseStyleResult = UseStyleFunction()
	local UseDispatchResult = UseDispatchFunction()
	local UseTokensResult = UseTokensFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseSelectorResult = UseSelectorFunction(function(p2)
		return p2.ScreenSize
	end)
	
	local function _(p2): UDim2
		-- upvalues: UseSelectorResult (copy)
		return if p2 then UDim2.new(1, 0, 0, (math.clamp(math.pow(UseSelectorResult.Y / 640, 3) * 100, 75, UseSelectorResult.Y))) else UDim2.fromScale(1, 0.5)
	end
	
	local UseBrowserTrackerExperimentResult = RoactAppExperimentModule.useBrowserTrackerExperiment({ AppBtidLayers.LoginLayer }, function(p2)
		-- upvalues: AppBtidLayers (upval)
		local v1 = p2[AppBtidLayers.LoginLayer] or {}
		
		return {
			shouldShowToastNotification = v1.shouldShowPasskeyUpsellToastNotification,
			shouldShowSuccessScreen = v1.shouldShowPasskeyUpsellSuccessScreen,
			shouldRenderGraphic = v1.shouldRenderPasskeyUpsellGraphic
		}
	end)
	local Source = p1.source or PasskeyUpsellSourceModule.Login
	AuthPageloadFunction(EventStreamConstants.Context.PasskeyUpsellScreen, nil, nil, Source)
	
	local function OnCancelButtonPressed(PasskeyUpsellScreen, Close)
		-- upvalues: FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment (upval), Source (copy), PasskeyUpsellSourceModule (upval), p1 (copy), UseDispatchResult (copy), AppPage (upval), UpdateCooldownModule (upval), UseRoactServiceResult (copy), AuthButtonClickFunction (upval)
		if FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment and Source == PasskeyUpsellSourceModule.AddAuthMethodPage and p1.onDismiss then
			p1.onDismiss()
		else
			UseDispatchResult(p1.resetNavigationHistory({ { name = AppPage.Home } }))
			UpdateCooldownModule(UseRoactServiceResult, UseDispatchResult)
		end
		AuthButtonClickFunction(PasskeyUpsellScreen, Close, nil, nil, nil, Source)
	end
	
	local AddAuthMethodPagePasskeyNudge = if DifferentiateAddAuthMethodPasskeyFlow and Source == PasskeyUpsellSourceModule.AddAuthMethodPage then "addAuthMethodPagePasskeyNudge" else nil
	
	local function v44()
		-- upvalues: HandlePasskeyRegistrationModule (upval), UseRoactServiceResult (copy), AddAuthMethodPagePasskeyNudge (copy), AuthModalShownFunction (upval), EventStreamConstants (upval), Source (copy), AuthPageloadFunction (upval), FFlagEmitPasskeyRegistrationSourceOnFinish (upval), AuthMsgShownFunction (upval), FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment (upval), PasskeyUpsellSourceModule (upval), p1 (copy), UseBrowserTrackerExperimentResult (copy), UseDispatchResult (copy), AppPage (upval), SetCurrentToastMessageFunction (upval), UseTokensResult (copy), Images (upval), UseStateResult2_1 (copy), UseStateResult2 (copy)
		HandlePasskeyRegistrationModule(UseRoactServiceResult, AddAuthMethodPagePasskeyNudge):andThen(function(Result)
			-- upvalues: AuthModalShownFunction (upval), EventStreamConstants (upval), Source (upval), AuthPageloadFunction (upval), FFlagEmitPasskeyRegistrationSourceOnFinish (upval), AuthMsgShownFunction (upval), FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment (upval), PasskeyUpsellSourceModule (upval), p1 (upval), UseBrowserTrackerExperimentResult (upval), UseDispatchResult (upval), AppPage (upval), SetCurrentToastMessageFunction (upval), UseTokensResult (upval), Images (upval), UseStateResult2_1 (upval)
			if not Result then
				AuthModalShownFunction(EventStreamConstants.Context.PasskeyUpsellErrorModalShown, EventStreamConstants.State.RegisterCredentialsError, nil, Source)
				
				return
			end
			AuthPageloadFunction(EventStreamConstants.Context.PasskeyUpsellScreen, EventStreamConstants.State.PasskeyRegistrationComplete, nil, Source)
			
			if FFlagEmitPasskeyRegistrationSourceOnFinish then
				AuthMsgShownFunction(EventStreamConstants.Context.PasskeyCreationSource, EventStreamConstants.State.FinishRegistration, Source)
			end
			if FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment and Source == PasskeyUpsellSourceModule.AddAuthMethodPage then
				p1.resetNavigationHistory(nil)
				
				return
			end
			if UseBrowserTrackerExperimentResult.shouldShowToastNotification then
				UseDispatchResult(p1.resetNavigationHistory({ { name = AppPage.Home } }))
				UseDispatchResult(SetCurrentToastMessageFunction({
					toastMessage = "Authentication.Passkey.Label.UpsellToastTitle",
					slideIn = true,
					toastIconColorStyle = {
						Transparency = 0,
						Color = UseTokensResult.Color.Extended.Green.Green_500.Color3
					},
					toastIcon = Images["icons/common/check_contained_fill"]
				}))
				AuthModalShownFunction(EventStreamConstants.Context.PasskeyUpsellToastShown, EventStreamConstants.State.Success, nil, Source)
				
				return
			end
			if UseBrowserTrackerExperimentResult.shouldShowSuccessScreen then
				task.wait(0.2)
				UseStateResult2_1(true)
			end
		end):catch(function()
			-- upvalues: AuthModalShownFunction (upval), EventStreamConstants (upval), Source (upval), UseStateResult2 (upval)
			AuthModalShownFunction(EventStreamConstants.Context.PasskeyUpsellErrorModalShown, EventStreamConstants.State.Unknown, nil, Source)
			UseStateResult2(true)
		end)
	end
	
	local function IconAndText(Image1, Text1, LayoutOrder)
		-- upvalues: ReactModule (upval), View (upval), Image (upval), UseTokensResult (copy), Text (upval)
		local XOffset = 32
		local v1 = ""
		
		if Image1 == "icons/common/eye_slash" then
			XOffset = 24
			v1 = " padding-left-xsmall"
		end
		return ReactModule.createElement(View, {
			tag = "row gap-medium size-full-0 auto-y text-wrap padding-right-xxlarge" .. v1,
			LayoutOrder = LayoutOrder
		}, {
			Icon = ReactModule.createElement(Image, {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Size = UDim2.new(0, XOffset, 0, XOffset),
				imageStyle = { Color3 = UseTokensResult.Color.Content.Default.Color3 },
				Image = Image1
			}),
			RowText = ReactModule.createElement(Text, {
				LayoutOrder = 2,
				Text = Text1,
				tag = "text-body-large text-align-x-left text-wrap auto-xy padding-right-xxlarge" .. v1,
				Size = UDim2.new(1, -XOffset, 0, XOffset)
			})
		})
	end
	
	return WithLocalizationFunction({
		upsellTitleText = "Authentication.Passkey.Label.UpsellTitle",
		passkeyPurposeText = "Authentication.Passkey.Description.Purpose",
		benefitsText = "Authentication.Passkey.Description.Benefits",
		dataPolicyText = "Authentication.Passkey.Description.DataPolicy",
		createPasskeyText = "Authentication.Passkey.Action.CreatePasskey",
		keepUsingPasswordText = "Authentication.Passkey.Action.KeepUsingPassword",
		skipText = "Authentication.SignUp.Label.Skip"
	})(function(p2)
		-- upvalues: ReactModule (upval), FullscreenPageWithSafeArea (upval), UseStyleResult (copy), View (upval), UseStateResult1 (copy), PasskeyUpsellSuccessScreenModule (upval), OnCancelButtonPressed (copy), UseBrowserTrackerExperimentResult (copy), PasskeyUpsellHeaderContainerModule (upval), FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment (upval), Source (copy), PasskeyUpsellSourceModule (upval), EventStreamConstants (upval), UseStateResult (copy), ScrollView (upval), UseSelectorResult (copy), ScrollBarVisibility (upval), IconAndText (copy), PasskeyUpsellButtonContainerModule (upval), v44 (copy), AuthButtonClickFunction (upval), PasskeyUpsellErrorModalModule (upval), UseStateResult2 (copy)
		return ReactModule.createElement(FullscreenPageWithSafeArea, {
			includeStatusBar = false,
			BackgroundColor3 = UseStyleResult.Theme.BackgroundDefault.Color
		}, {
			ReactModule.createElement(View, {
				tag = "size-full-full padding-right-xxlarge padding-left-xxlarge padding-bottom-xxlarge padding-top-xxlarge"
			}, UseStateResult1 and ReactModule.createElement(PasskeyUpsellSuccessScreenModule, {
				onCancelButtonPressed = OnCancelButtonPressed,
				shouldRenderGraphic = UseBrowserTrackerExperimentResult.shouldRenderGraphic
			}) or {
				ReactModule.createElement(View, {
					tag = "col gap-small size-full-0 auto-xy",
					LayoutOrder = 1
				}, {
					PasskeyUpsellHeaderContainer = ReactModule.createElement(PasskeyUpsellHeaderContainerModule, {
						LayoutOrder = 0,
						localizedTitleText = if FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment and Source == PasskeyUpsellSourceModule.AddAuthMethodPage then p2.createPasskeyText else p2.upsellTitleText,
						onCancelButtonPressed = function()
							-- upvalues: OnCancelButtonPressed (upval), EventStreamConstants (upval)
							OnCancelButtonPressed(EventStreamConstants.Context.PasskeyUpsellScreen, EventStreamConstants.Button.DismissCornerX)
						end,
						isDisabled = UseStateResult,
						shouldRenderGraphic = UseBrowserTrackerExperimentResult.shouldRenderGraphic
					}),
					ReactModule.createElement(ScrollView, {
						LayoutOrder = 1,
						Size = if UseBrowserTrackerExperimentResult.shouldRenderGraphic then UDim2.new(1, 0, 0, (math.clamp(math.pow(UseSelectorResult.Y / 640, 3) * 100, 75, UseSelectorResult.Y))) else UDim2.fromScale(1, 0.5),
						scroll = {
							AutomaticCanvasSize = Enum.AutomaticSize.Y,
							CanvasSize = UDim2.fromScale(1, 0),
							ScrollingDirection = Enum.ScrollingDirection.Y,
							scrollBarVisibility = ScrollBarVisibility.Auto
						},
						layout = {
							FillDirection = Enum.FillDirection.Vertical,
							HorizontalAlignment = Enum.HorizontalAlignment.Center,
							VerticalAlignment = Enum.VerticalAlignment.Top,
							SortOrder = Enum.SortOrder.LayoutOrder,
							Padding = UDim.new(0, 24)
						}
					}, {
						PasskeyPurposeRow = IconAndText("icons/menu/passkey", p2.passkeyPurposeText, 1),
						PasskeyBenefitsRow = IconAndText("icons/common/safety", p2.benefitsText, 2),
						DataPolicyRow = IconAndText("icons/common/eye_slash", p2.dataPolicyText, 3)
					})
				}),
				PasskeyUpsellButtonContainer = ReactModule.createElement(PasskeyUpsellButtonContainerModule, {
					layoutOrder = 2,
					localizedContinueText = p2.createPasskeyText,
					localizedCancelText = if FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment and Source == PasskeyUpsellSourceModule.AddAuthMethodPage then p2.skipText else p2.keepUsingPasswordText,
					onContinueButtonPressed = function()
						-- upvalues: v44 (upval), AuthButtonClickFunction (upval), EventStreamConstants (upval), Source (upval)
						v44()
						AuthButtonClickFunction(EventStreamConstants.Context.PasskeyUpsellScreen, EventStreamConstants.Button.RegisterPasskey, nil, nil, nil, Source)
					end,
					onCancelButtonPressed = function()
						-- upvalues: OnCancelButtonPressed (upval), EventStreamConstants (upval)
						OnCancelButtonPressed(EventStreamConstants.Context.PasskeyUpsellScreen, EventStreamConstants.Button.Close)
					end,
					isDisabled = UseStateResult
				})
			}),
			ErrorToastContainer = UseStateResult and ReactModule.createElement(PasskeyUpsellErrorModalModule, {
				onCancel = function()
					-- upvalues: UseStateResult2 (upval), OnCancelButtonPressed (upval), EventStreamConstants (upval)
					UseStateResult2(false)
					OnCancelButtonPressed(EventStreamConstants.Context.PasskeyUpsellErrorModalShown, EventStreamConstants.Button.GoHome)
				end,
				onTryAgain = function()
					-- upvalues: UseStateResult2 (upval), AuthButtonClickFunction (upval), EventStreamConstants (upval), Source (upval), v44 (upval)
					UseStateResult2(false)
					AuthButtonClickFunction(EventStreamConstants.Context.PasskeyUpsellErrorModalShown, EventStreamConstants.Button.TryAgain, nil, nil, nil, Source)
					v44()
				end
			})
		})
	end)
end