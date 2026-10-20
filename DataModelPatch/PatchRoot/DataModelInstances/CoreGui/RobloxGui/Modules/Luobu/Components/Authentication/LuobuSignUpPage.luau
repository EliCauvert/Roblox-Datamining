local CorePackages = game:GetService("CorePackages")
local UserInputService = game:GetService("UserInputService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local RoactAnalyticsAuthEventsModule = require(Modules.LuaApp.Services.RoactAnalyticsAuthEvents)
local RoactAnalyticsModule = require(Modules.LuaApp.Services.RoactAnalytics)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local RoactAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local TModule = require(CorePackages.Packages.t)
local WithStyleFunction = UIBloxModule.Style.withStyle
local WithLocalizationModule = require(Modules.LuaApp.withLocalization)
local FormFactor = require(CorePackages.Workspace.Packages.FormFactor).Enums.FormFactor
local UserGender = require(CorePackages.Workspace.Packages.AuthCommon).Enums.UserGender
local InputValidity = require(CorePackages.Workspace.Packages.AuthCommon).Enums.InputValidity
local FullscreenPageWithSafeAreaModule = require(Modules.LuaApp.Components.FullscreenPageWithSafeArea)
local AuthCommonModule = require(CorePackages.Workspace.Packages.AuthCommon)
local BackgroundFill = AuthCommonModule.Components.BackgroundFill
local AuthBackgroundContainer = AuthCommonModule.Components.AuthBackgroundContainer
local AuthBackgroundGate = AuthCommonModule.Components.AuthBackgroundGate
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local GetImageDataFunction = require(CorePackages.Workspace.Packages.RobloxAppAssets).GetImageData
local ImageSetButton = UIBloxModule.Core.ImageSet.ImageSetButton
local AuthBirthdayBarModule = require(Modules.LuaApp.Components.Authentication.AuthBirthdayBar)
local CollapsingTextInputValidatorModule = require(Modules.LuaApp.Components.Authentication.CollapsingTextInputValidator)
local SignUpGenderSelectorModule = require(Modules.LuaApp.Components.Authentication.SignUpGenderSelector)
local Button = UIBloxModule.App.Button.Button
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local EventStreamConstantsModule = require(Modules.LuaApp.EventStreamConstants)
local Birthday = require(CorePackages.Workspace.Packages.AuthCommon).Models.Birthday
local BackDisableStoreModule = require(CorePackages.Workspace.Packages.BackDisableStore)
local NavigateBackModule = require(Modules.LuaApp.Thunks.NavigateBack)
local FFlagSignalsNavP3Dispatch = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(CorePackages.Workspace.Packages.RobloxAppNavigation).NavigationCommands else nil
local DisplayNameValidatorModule = require(Modules.LuaApp.Thunks.Authentication.DisplayNameValidator)
local RequestSignUpModule = require(Modules.Luobu.Thunks.RequestSignUp)
local SetSignUpInProgressModule = require(Modules.Luobu.Actions.SetSignUpInProgress)
local SetSignUpInfoModule = require(Modules.Luobu.Actions.SetSignUpInfo)
local SetBackNavigationDisabledModule = require(Modules.LuaApp.Actions.SetBackNavigationDisabled)
local FFlagUseBackDisableSignalStore = require(CorePackages.Workspace.Packages.SharedFlags).FFlagUseBackDisableSignalStore
local _Vector2 = Vector2.new(540, 1080)
local _UDim2 = UDim2.new(0, 36, 0, 36)
local IconsNavigationClose = UIBloxModule.App.ImageSet.Images["icons/navigation/close"]
local LuobuSignUpPage = RoactModule.PureComponent:extend("LuobuSignUpPage")
LuobuSignUpPage.validateProps = TModule.strictInterface({
	formFactor = TModule.string,
	isSignUpInProgress = TModule.boolean,
	prefilledDisplayName = TModule.string,
	voucher = TModule.string,
	authMethod = TModule.string,
	channelId = TModule.number,
	agreedUserAgreements = TModule.array(TModule.strictInterface({
		id = TModule.string,
		agreementType = TModule.string,
		clientType = TModule.string,
		displayUrl = TModule.string,
		regulationType = TModule.string
	})),
	setSignUpInProgress = TModule.callback,
	resetSignUpInfo = TModule.callback,
	navigateBack = TModule.callback,
	setBackNavigationDisabled = TModule.callback,
	requestSignUp = TModule.callback,
	networking = TModule.callback,
	authEventAnalytics = TModule.table,
	analytics = TModule.table,
	appPolicy = TModule.table
})

local function _(p1)
	-- upvalues: UserGender (copy)
	return ({
		[UserGender.Unknown] = 1,
		[UserGender.Male] = 2,
		[UserGender.Female] = 3
	})[p1]
end

function LuobuSignUpPage.init(p1)
	-- upvalues: UserGender (copy), InputValidity (copy), ArgCheckModule (copy), Birthday (copy), EventStreamConstantsModule (copy)
	p1.state = {
		birthday = nil,
		displayName = "",
		onScreenKeyboardHeight = 0,
		gender = UserGender.Unknown,
		displayNameValid = InputValidity.Unvalidated
	}
	p1.isMounted = false
	
	function p1.onBirthdaySelected(Birthday1)
		-- upvalues: ArgCheckModule (upval), Birthday (upval), p1 (copy)
		ArgCheckModule.assert(Birthday.is(Birthday1), "CentralOverlayForSignUpBirthdayPicker should pass back a Birthday when closing.")
		p1:setState({ birthday = Birthday1 })
	end
	
	function p1.onDisplayNameTextChanged(DisplayName, DisplayNameValid)
		-- upvalues: p1 (copy)
		p1:setState({
			displayName = DisplayName,
			displayNameValid = DisplayNameValid
		})
	end
	
	function p1.onDisplayNameTextBoxFocused()
		-- upvalues: p1 (copy), EventStreamConstantsModule (upval)
		p1.props.authEventAnalytics.reportDisplayNameFocus(EventStreamConstantsModule.Context.LuobuSignUpPage)
	end
	
	function p1.onGenderChanged(Gender)
		-- upvalues: p1 (copy)
		if p1.isMounted then
			p1:setState({ gender = Gender })
		end
	end
	
	function p1.onSignUpClick()
		-- upvalues: p1 (copy), EventStreamConstantsModule (upval), UserGender (upval)
		local SetSignUpInProgressFunction: (any) -> () = p1.props.setSignUpInProgress
		local SetBackNavigationDisabledFunction: (any) -> () = p1.props.setBackNavigationDisabled
		SetSignUpInProgressFunction(true)
		SetBackNavigationDisabledFunction(true)
		local RequestSignUpFunction = p1.props.requestSignUp
		local Networking = p1.props.networking
		local Analytics = p1.props.analytics
		local AppPolicy = p1.props.appPolicy
		p1.props.authEventAnalytics.reportSignUpButtonClicked(EventStreamConstantsModule.Context.LuobuSignUpPage)
		local v1, _ = RequestSignUpFunction(Networking, Analytics, AppPolicy, p1.props.authMethod, {
			birthday = p1.state.birthday:FormatForEndpoint(),
			displayName = p1.state.displayName,
			gender = ({
				[UserGender.Unknown] = 1,
				[UserGender.Male] = 2,
				[UserGender.Female] = 3
			})[p1.state.gender],
			voucher = p1.props.voucher,
			channelId = p1.props.channelId,
			agreementIds = p1.props.agreedUserAgreements
		}):await()
		SetBackNavigationDisabledFunction(false)
		
		if not v1 then
			SetSignUpInProgressFunction(false)
		end
	end
end

function LuobuSignUpPage.didMount(p1)
	-- upvalues: UserInputService (copy)
	p1.isMounted = true
	p1.keyboardVisibleChanged = UserInputService:GetPropertyChangedSignal("OnScreenKeyboardVisible"):Connect(function()
		-- upvalues: UserInputService (upval), p1 (copy)
		p1:setState({
			onScreenKeyboardHeight = UserInputService.OnScreenKeyboardVisible and UserInputService.OnScreenKeyboardSize.Y or 0
		})
	end)
end

function LuobuSignUpPage.willUnmount(p1)
	p1.props.resetSignUpInfo()
	p1.props.setSignUpInProgress(false)
	p1.isMounted = false
	
	if p1.keyboardVisibleChanged then
		p1.keyboardVisibleChanged:disconnect()
		p1.keyboardVisibleChanged = nil
	end
end

function LuobuSignUpPage.render(p1)
	-- upvalues: FormFactor (copy), InputValidity (copy), WithStyleFunction (copy), WithLocalizationModule (copy), RoactModule (copy), FullscreenPageWithSafeAreaModule (copy), AuthBackgroundGate (copy), AuthBackgroundContainer (copy), BackgroundFill (copy), ImageSetLabel (copy), GetImageDataFunction (copy), _Vector2 (copy), ImageSetButton (copy), _UDim2 (copy), IconsNavigationClose (copy), AuthBirthdayBarModule (copy), CollapsingTextInputValidatorModule (copy), DisplayNameValidatorModule (copy), SignUpGenderSelectorModule (copy), Button (copy), ButtonType (copy)
	local NewOnScreenKeyboardHeight = 0
	local YOffset = 0
	local IsFormFactorMatch = p1.props.formFactor == FormFactor.WIDE
	local IsOnScreenKeyboardHeightAbove = p1.state.onScreenKeyboardHeight > 0
	
	if IsFormFactorMatch then
		if IsOnScreenKeyboardHeightAbove then
			NewOnScreenKeyboardHeight = p1.state.onScreenKeyboardHeight + 10
		else
			NewOnScreenKeyboardHeight = 48
			YOffset = 24
		end
	end
	local IsSignUpInProgress = p1.props.isSignUpInProgress
	local Birthday = p1.state.birthday
	local Gender = p1.state.gender
	local DisplayName = p1.state.displayName
	local DisplayNameValid = p1.state.displayNameValid
	local IsDisplayNameValidMatch: boolean = Birthday and (DisplayName and DisplayNameValid == InputValidity.Valid)
	local AuthenticationSignUpLabelErrorsWithUsername: string = if Birthday then "Authentication.SignUp.Label.ErrorsWithUsername" else "Authentication.SignUp.Response.BirthdayMustBeSetFirst"
	local PrefilledDisplayName = p1.props.prefilledDisplayName
	
	return WithStyleFunction(function(p2)
		-- upvalues: WithLocalizationModule (upval), RoactModule (upval), FullscreenPageWithSafeAreaModule (upval), AuthBackgroundGate (upval), AuthBackgroundContainer (upval), IsFormFactorMatch (copy), BackgroundFill (upval), IsSignUpInProgress (copy), ImageSetLabel (upval), NewOnScreenKeyboardHeight (ref), YOffset (ref), GetImageDataFunction (upval), _Vector2 (upval), ImageSetButton (upval), _UDim2 (upval), IconsNavigationClose (upval), p1 (copy), AuthBirthdayBarModule (upval), CollapsingTextInputValidatorModule (upval), AuthenticationSignUpLabelErrorsWithUsername (ref), Birthday (copy), DisplayNameValidatorModule (upval), PrefilledDisplayName (copy), SignUpGenderSelectorModule (upval), Gender (copy), Button (upval), ButtonType (upval), IsDisplayNameValidMatch (copy)
		return WithLocalizationModule({
			signUpText = "Authentication.SignUp.Action.CreateAccount"
		})(function(p3)
			-- upvalues: RoactModule (upval), FullscreenPageWithSafeAreaModule (upval), AuthBackgroundGate (upval), AuthBackgroundContainer (upval), IsFormFactorMatch (upval), p2 (copy), BackgroundFill (upval), IsSignUpInProgress (upval), ImageSetLabel (upval), NewOnScreenKeyboardHeight (upval), YOffset (upval), GetImageDataFunction (upval), _Vector2 (upval), ImageSetButton (upval), _UDim2 (upval), IconsNavigationClose (upval), p1 (upval), AuthBirthdayBarModule (upval), CollapsingTextInputValidatorModule (upval), AuthenticationSignUpLabelErrorsWithUsername (upval), Birthday (upval), DisplayNameValidatorModule (upval), PrefilledDisplayName (upval), SignUpGenderSelectorModule (upval), Gender (upval), Button (upval), ButtonType (upval), IsDisplayNameValidMatch (upval)
			return RoactModule.createElement(FullscreenPageWithSafeAreaModule, {
				BackgroundTransparency = 1,
				includeStatusBar = true,
				renderFullscreenBackground = function()
					-- upvalues: RoactModule (upval), AuthBackgroundGate (upval), AuthBackgroundContainer (upval), IsFormFactorMatch (upval), p2 (upval), BackgroundFill (upval)
					return RoactModule.createElement(AuthBackgroundGate, {
						renderTreatment = function()
							-- upvalues: RoactModule (upval), AuthBackgroundContainer (upval), IsFormFactorMatch (upval), p2 (upval)
							return RoactModule.createElement(AuthBackgroundContainer, {
								showImage = IsFormFactorMatch,
								fallbackBackgroundColor = p2.Theme.BackgroundUIDefault.Color
							})
						end,
						renderLegacy = function()
							-- upvalues: RoactModule (upval), IsFormFactorMatch (upval), p2 (upval), BackgroundFill (upval)
							return RoactModule.createElement("Frame", {
								Size = UDim2.new(1, 0, 1, 0),
								BackgroundTransparency = if IsFormFactorMatch then 1 else 0,
								BackgroundColor3 = p2.Theme.BackgroundUIDefault.Color
							}, {
								Background = IsFormFactorMatch and RoactModule.createElement(BackgroundFill, {
									Image = "rbxasset://textures/ui/LuaApp/graphic/Auth/GridBackground.jpg"
								}),
								Mask = IsFormFactorMatch and RoactModule.createElement("ImageLabel", {
									ZIndex = 2,
									BackgroundTransparency = 0.5,
									Size = UDim2.new(1, 0, 1, 0),
									BackgroundColor3 = Color3.new(0, 0, 0)
								})
							})
						end
					})
				end
			}, {
				UserInputSink = IsSignUpInProgress and RoactModule.createElement("ImageButton", {
					ZIndex = 2,
					BackgroundTransparency = 1,
					Image = "",
					Size = UDim2.new(1, 0, 1, 0)
				}),
				Container = RoactModule.createElement(ImageSetLabel, {
					BackgroundTransparency = 1,
					ClipsDescendants = true,
					Size = UDim2.new(1, 0, 1, -NewOnScreenKeyboardHeight),
					Position = UDim2.new(0.5, 0, 0, YOffset),
					AnchorPoint = Vector2.new(0.5, 0),
					ScaleType = Enum.ScaleType.Slice,
					SliceCenter = Rect.new(9, 9, 9, 9),
					Image = GetImageDataFunction("LuaApp/buttons/buttonFill") or "LuaApp/buttons/buttonFill",
					ImageColor3 = p2.Theme.BackgroundUIDefault.Color
				}, {
					SizeConstraint = RoactModule.createElement("UISizeConstraint", { MaxSize = _Vector2 }),
					HeaderFrame = RoactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 0, 48),
						Position = UDim2.new(0.5, 0, 0, 0),
						AnchorPoint = Vector2.new(0.5, 0)
					}, {
						BackButton = RoactModule.createElement(ImageSetButton, {
							Size = _UDim2,
							AutoButtonColor = false,
							BorderSizePixel = 0,
							BackgroundTransparency = 1,
							Position = UDim2.new(0, 12, 0.5, 0),
							AnchorPoint = Vector2.new(0, 0.5),
							ScaleType = Enum.ScaleType.Fit,
							Image = IconsNavigationClose,
							ImageColor3 = p2.Theme.UIEmphasis.Color,
							ImageTransparency = p2.Theme.BackgroundUIDefault.Transparency,
							[RoactModule.Event.Activated] = p1.props.navigateBack
						}),
						Title = p3.signUpText and RoactModule.createElement("TextLabel", {
							BackgroundTransparency = 1,
							TextWrapped = true,
							Position = UDim2.new(0, 0, 0.5, 0),
							Size = UDim2.new(1, 0, 0, 0),
							AnchorPoint = Vector2.new(0, 0.5),
							Text = p3.signUpText or "",
							Font = p2.Font.CaptionHeader.Font,
							TextSize = p2.Font.BaseSize * p2.Font.Header1.RelativeSize,
							TextColor3 = p2.Theme.TextEmphasis.Color,
							TextTransparency = p2.Theme.TextEmphasis.Transparency,
							TextXAlignment = Enum.TextXAlignment.Center
						})
					}),
					Divider = RoactModule.createElement("Frame", {
						BackgroundTransparency = 0,
						Size = UDim2.new(1, 0, 0, 1),
						Position = UDim2.new(0.5, 0, 0, 48),
						AnchorPoint = Vector2.new(0.5, 0),
						BackgroundColor3 = p2.Theme.UIEmphasis.Color
					}),
					ContentFrame = RoactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						Size = UDim2.new(1, 0, 1, -49),
						Position = UDim2.new(0.5, 0, 0, 49),
						AnchorPoint = Vector2.new(0.5, 0),
						AutomaticSize = Enum.AutomaticSize.XY
					}, {
						ContentPadding = RoactModule.createElement("UIPadding", {
							PaddingLeft = UDim.new(0, 24),
							PaddingRight = UDim.new(0, 24),
							PaddingTop = UDim.new(0, if IsFormFactorMatch then 25 else 48)
						}),
						ListLayout = RoactModule.createElement("UIListLayout", {
							SortOrder = Enum.SortOrder.LayoutOrder,
							HorizontalAlignment = Enum.HorizontalAlignment.Center,
							Padding = UDim.new(0, 5)
						}),
						BirthdayBar = RoactModule.createElement(AuthBirthdayBarModule, {
							layoutOrder = 1,
							autoFocusOnMount = false,
							onBirthdaySelected = p1.onBirthdaySelected
						}),
						DisplayNameValidator = RoactModule.createElement(CollapsingTextInputValidatorModule, {
							layoutOrder = 2,
							titleTextKey = "Authentication.Login.Label.Username",
							summaryErrorTextKey = AuthenticationSignUpLabelErrorsWithUsername,
							prerequisiteMet = if Birthday then true else false,
							onInputTextChanged = p1.onDisplayNameTextChanged,
							onInputTextValidated = p1.onDisplayNameTextChanged,
							validator = DisplayNameValidatorModule,
							validatorAdditionalProps = {
								birthday = Birthday and Birthday:FormatForEndpoint() or ""
							},
							returnKeyType = Enum.ReturnKeyType.Next,
							prefilledText = PrefilledDisplayName
						}),
						GenderSelector = RoactModule.createElement(SignUpGenderSelectorModule, {
							layoutOrder = 3,
							gender = Gender,
							onGenderChanged = p1.onGenderChanged
						}),
						Spacing = RoactModule.createElement("Frame", {
							LayoutOrder = 4,
							BackgroundTransparency = 1,
							Size = UDim2.new(1, 0, 0, 38)
						}),
						SignUpButton = RoactModule.createElement(Button, {
							layoutOrder = 5,
							buttonType = ButtonType.PrimaryContextual,
							size = UDim2.new(1, 0, 0, 36),
							text = p3.signUpText,
							isDisabled = not IsDisplayNameValidMatch,
							isLoading = IsSignUpInProgress,
							onActivated = p1.onSignUpClick
						})
					})
				})
			})
		end)
	end)
end

return (RoactAppPolicy.connect(function(AppPolicy, _)
	return { appPolicy = AppPolicy }
end)((RoactServices.connect({
	networking = RoactNetworkingModule,
	authEventAnalytics = RoactAnalyticsAuthEventsModule,
	analytics = RoactAnalyticsModule
})((RoactRoduxModule.connect(function(p1, _)
	return {
		formFactor = p1.FormFactor,
		isSignUpInProgress = p1.Luobu.SignUp.signUpInProgress,
		prefilledDisplayName = p1.Luobu.SignUp.prefilledDisplayName,
		voucher = p1.Luobu.SignUp.signUpVoucher,
		authMethod = p1.Luobu.SignUp.authMethod,
		channelId = p1.Luobu.SignUp.channelId,
		agreedUserAgreements = p1.Luobu.SignUp.agreedUserAgreements
	}
end, function(Callback)
	-- upvalues: SetSignUpInProgressModule (copy), SetSignUpInfoModule (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateBackModule (copy), FFlagUseBackDisableSignalStore (copy), BackDisableStoreModule (copy), SetBackNavigationDisabledModule (copy), RequestSignUpModule (copy)
	return {
		setSignUpInProgress = function(p1)
			-- upvalues: Callback (copy), SetSignUpInProgressModule (upval)
			return Callback(SetSignUpInProgressModule(p1))
		end,
		resetSignUpInfo = function()
			-- upvalues: Callback (copy), SetSignUpInfoModule (upval)
			return Callback(SetSignUpInfoModule("", "", "", ""))
		end,
		navigateBack = function()
			-- upvalues: FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), Callback (copy), NavigateBackModule (upval)
			return if FFlagSignalsNavP3Dispatch then NavigationCommands.back() else Callback(NavigateBackModule())
		end,
		setBackNavigationDisabled = function(p1)
			-- upvalues: FFlagUseBackDisableSignalStore (upval), BackDisableStoreModule (upval), Callback (copy), SetBackNavigationDisabledModule (upval)
			return if FFlagUseBackDisableSignalStore then BackDisableStoreModule.setDisabled(p1) else Callback(SetBackNavigationDisabledModule(p1))
		end,
		requestSignUp = function(p1, p2, p3, p4, p5)
			-- upvalues: Callback (copy), RequestSignUpModule (upval)
			return Callback(RequestSignUpModule(p1, p2, p3, p4, p5))
		end
	}
end)(LuobuSignUpPage))))))