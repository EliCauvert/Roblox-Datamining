local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local RoactAnalyticsAuthEventsModule = require(Modules.LuaApp.Services.RoactAnalyticsAuthEvents)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local UseDefaultFocusBehaviorFunction = require(CorePackages.Packages.ReactFocusNavigation).useDefaultFocusBehavior
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local Button = UIBloxModule.App.Button.Button
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local WithStyleFunction = UIBloxModule.Style.withStyle
local WithLocalizationModule = require(Modules.LuaApp.withLocalization)
local AppPageModule = require(Modules.LuaApp.AppPage)
local NavigateBackModule = require(Modules.LuaApp.Thunks.NavigateBack)
local NavigateSidewaysModule = require(Modules.LuaApp.Thunks.NavigateSideways)
local FFlagSignalsNavP3Dispatch = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(CorePackages.Workspace.Packages.RobloxAppNavigation).NavigationCommands else nil
local FormFactor = require(CorePackages.Workspace.Packages.FormFactor).Enums.FormFactor
local FitChildrenModule = require(Modules.LuaApp.FitChildren)
local BirthdayPicker = require(CorePackages.Workspace.Packages.AuthSignup).Components.BirthdayPicker
local SignUpLayoutModule = require(Modules.LuaApp.Components.Authentication.SignUpLayout)
local AuthBackAndNextButtonModule = require(Modules.LuaApp.Components.Authentication.AuthBackAndNextButton)
local DateHelper = require(CorePackages.Workspace.Packages.Time).DateHelper
local FullscreenPageWithSafeAreaModule = require(Modules.LuaApp.Components.FullscreenPageWithSafeArea)
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local GetImageDataFunction = require(CorePackages.Workspace.Packages.RobloxAppAssets).GetImageData
local ImageSetButton = UIBloxModule.Core.ImageSet.ImageSetButton
local MultiPageSignupTextModule = require(Modules.LuaApp.Components.Authentication.MultiPageSignupText)
local Birthday = require(CorePackages.Workspace.Packages.AuthCommon).Models.Birthday
local SetSignUpBirthdayModule = require(Modules.LuaApp.Actions.Authentication.SetSignUpBirthday)
local FFlagRemoveUnusedSignUpInfoRoduxSlice = require(CorePackages.Workspace.Packages.SharedFlags).FFlagRemoveUnusedSignUpInfoRoduxSlice
local EventStreamConstantsModule = require(Modules.LuaApp.EventStreamConstants)
local GetFFlagEnableMultiPageSignupExperimentModule = require(Modules.LuaApp.Flags.GetFFlagEnableMultiPageSignupExperiment)
local _UDim2 = UDim2.new(0, 36, 0, 36)
local IconsNavigationClose = UIBloxModule.App.ImageSet.Images["icons/navigation/close"]
local _Vector2 = Vector2.new(540, 1080)
local BirthdayPage = RoactModule.PureComponent:extend("BirthdayPage")

function BirthdayPage.init(p1)
	-- upvalues: RoactModule (copy), Birthday (copy), EventStreamConstantsModule (copy), DateHelper (copy)
	p1.state = {
		month = 0,
		day = 0,
		year = 0,
		continueButtonEnabled = false
	}
	p1.isMounted = false
	p1.closeButtonRef = p1.props.defaultRef
	p1.confirmButtonRef = RoactModule.createRef()
	
	function p1.onContinueButtonActivated()
		-- upvalues: p1 (copy), Birthday (upval), EventStreamConstantsModule (upval)
		local AuthAnalytics = p1.props.authAnalytics
		local SetSignUpBirthdayFunction: (any) -> () = p1.props.setSignUpBirthday
		local Month = p1.state.month
		local Day = p1.state.day
		local Year = p1.state.year
		
		if p1.state.continueButtonEnabled then
			local NewBirthday = Birthday.new({ Month = Month, Day = Day, Year = Year })
			AuthAnalytics.reportBirthdaySelection(EventStreamConstantsModule.Context.BirthdayScreen)
			SetSignUpBirthdayFunction(NewBirthday)
			AuthAnalytics.reportContinueButtonClicked(EventStreamConstantsModule.Context.BirthdayScreen)
			AuthAnalytics.reportAuthButtonClick(EventStreamConstantsModule.Context.BirthdayScreen, EventStreamConstantsModule.Button.Continue, (tostring(Year)))
			p1.props.navigateToSinglePageSignUp(NewBirthday)
		end
	end
	
	function p1.onCloseButtonClicked()
		-- upvalues: p1 (copy), EventStreamConstantsModule (upval)
		p1.props.authAnalytics.reportAuthButtonClick(EventStreamConstantsModule.Context.BirthdayScreen, EventStreamConstantsModule.Button.Close)
		p1.props.navigateBack()
	end
	
	function p1.updateBirthday(Month, Day, Year)
		-- upvalues: DateHelper (upval), p1 (copy)
		local IsValidDate = DateHelper:isValidDate(Month, Day, Year)
		spawn(function()
			-- upvalues: p1 (upval), Month (copy), Day (copy), Year (copy), IsValidDate (copy)
			if p1.isMounted then
				p1:setState({
					month = Month,
					day = Day,
					year = Year,
					continueButtonEnabled = IsValidDate
				})
			end
		end)
	end
	
	function p1.renderCharacter()
		-- upvalues: RoactModule (upval)
		return RoactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
			Character = RoactModule.createElement("ImageLabel", {
				BackgroundTransparency = 1,
				Image = "rbxasset://textures/ui/LuaApp/graphic/Auth/builderman.png",
				ZIndex = 2,
				Size = UDim2.new(0.9, 0, 0.9, 0),
				Position = UDim2.new(0.5, 0, 0, 0),
				AnchorPoint = Vector2.new(0.5, 0)
			}),
			Shadow = RoactModule.createElement("ImageLabel", {
				Image = "rbxasset://textures/ui/LuaApp/graphic/Auth/CharacterShadow.png",
				BackgroundTransparency = 1,
				BorderSizePixel = 1,
				Size = UDim2.new(1, 0, 0.25, 0),
				Position = UDim2.new(0.5, 0, 1, 0),
				AnchorPoint = Vector2.new(0.5, 1)
			})
		})
	end
	
	p1.props.authAnalytics.reportScreenLoaded(EventStreamConstantsModule.Context.BirthdayScreen)
end

function BirthdayPage.didMount(p1)
	-- upvalues: EventStreamConstantsModule (copy)
	p1.isMounted = true
	p1.props.authAnalytics.reportAuthPageload(EventStreamConstantsModule.Context.BirthdayScreen)
end

function BirthdayPage.willUnmount(p1)
	p1.isMounted = false
end

function BirthdayPage.render(p1)
	-- upvalues: GetFFlagEnableMultiPageSignupExperimentModule (copy), WithStyleFunction (copy), WithLocalizationModule (copy), RoactModule (copy), FullscreenPageWithSafeAreaModule (copy), ImageSetLabel (copy), GetImageDataFunction (copy), _Vector2 (copy), ImageSetButton (copy), _UDim2 (copy), IconsNavigationClose (copy), MultiPageSignupTextModule (copy), BirthdayPicker (copy), Button (copy), ButtonType (copy), SignUpLayoutModule (copy), FormFactor (copy), FitChildrenModule (copy), AuthBackAndNextButtonModule (copy)
	return if GetFFlagEnableMultiPageSignupExperimentModule() then WithStyleFunction(function(p2)
		-- upvalues: WithLocalizationModule (upval), RoactModule (upval), FullscreenPageWithSafeAreaModule (upval), ImageSetLabel (upval), GetImageDataFunction (upval), p1 (copy), _Vector2 (upval), ImageSetButton (upval), _UDim2 (upval), IconsNavigationClose (upval), MultiPageSignupTextModule (upval), BirthdayPicker (upval), Button (upval), ButtonType (upval)
		return WithLocalizationModule({
			continueText = "Authentication.SignUp.Label.Continue",
			signUpText = "Authentication.SignUp.Action.CreateAccount",
			helpText = "Authentication.SignUp.Description.BirthdayHelp",
			headerText = "Authentication.SignUp.Heading.WhatsYourBirthday"
		})(function(p3)
			-- upvalues: RoactModule (upval), FullscreenPageWithSafeAreaModule (upval), p2 (copy), ImageSetLabel (upval), GetImageDataFunction (upval), p1 (upval), _Vector2 (upval), ImageSetButton (upval), _UDim2 (upval), IconsNavigationClose (upval), MultiPageSignupTextModule (upval), BirthdayPicker (upval), Button (upval), ButtonType (upval)
			return RoactModule.createElement(FullscreenPageWithSafeAreaModule, {
				BackgroundTransparency = 1,
				includeStatusBar = true,
				renderFullscreenBackground = function()
					-- upvalues: RoactModule (upval), p2 (upval)
					return RoactModule.createElement("Frame", {
						BackgroundTransparency = 0,
						Size = UDim2.new(1, 0, 1, 0),
						BackgroundColor3 = p2.Theme.BackgroundUIDefault.Color
					})
				end
			}, {
				Container = RoactModule.createElement(ImageSetLabel, {
					Size = UDim2.new(1, 0, 1, 0),
					Position = UDim2.new(0.5, 0, 0, 0),
					AnchorPoint = Vector2.new(0.5, 0),
					BackgroundTransparency = 1,
					ScaleType = Enum.ScaleType.Slice,
					SliceCenter = Rect.new(9, 9, 9, 9),
					Image = GetImageDataFunction("LuaApp/buttons/buttonFill") or "LuaApp/buttons/buttonFill",
					ImageColor3 = p2.Theme.BackgroundUIDefault.Color,
					ClipsDescendants = true,
					[RoactModule.Ref] = p1.props.containerRef
				}, {
					SizeConstraint = RoactModule.createElement("UISizeConstraint", { MaxSize = _Vector2 }),
					HeaderFrame = RoactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 0, 48),
						Position = UDim2.new(0.5, 0, 0, 0),
						AnchorPoint = Vector2.new(0.5, 0)
					}, {
						CloseButton = RoactModule.createElement(ImageSetButton, {
							Size = _UDim2,
							AutoButtonColor = false,
							BorderSizePixel = 0,
							BackgroundTransparency = 1,
							Position = UDim2.new(0, 12, 0.5, 0),
							AnchorPoint = Vector2.new(0, 0.5),
							ScaleType = Enum.ScaleType.Fit,
							Image = IconsNavigationClose,
							ImageColor3 = p2.Theme.UIEmphasis.Color,
							ImageTransparency = 0,
							[RoactModule.Ref] = p1.closeButtonRef,
							[RoactModule.Event.Activated] = p1.onCloseButtonClicked
						}),
						Title = RoactModule.createElement("TextLabel", {
							BackgroundTransparency = 1,
							TextWrapped = true,
							Position = UDim2.new(0, 0, 0.5, 0),
							Size = UDim2.new(1, 0, 0, 0),
							AnchorPoint = Vector2.new(0, 0.5),
							AutomaticSize = Enum.AutomaticSize.Y,
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
						Size = UDim2.new(1, 0, 1, -49),
						Position = UDim2.new(0.5, 0, 0, 49),
						AnchorPoint = Vector2.new(0.5, 0)
					}, {
						Padding = RoactModule.createElement("UIPadding", {
							PaddingLeft = UDim.new(0, 24),
							PaddingRight = UDim.new(0, 24),
							PaddingTop = UDim.new(0, 24)
						}),
						ListLayout = RoactModule.createElement("UIListLayout", {
							SortOrder = Enum.SortOrder.LayoutOrder,
							Padding = UDim.new(0, 8)
						}),
						MultiPageSignupText = RoactModule.createElement(MultiPageSignupTextModule, {
							layoutOrder = 1,
							titleText = p3.headerText,
							helpText = p3.helpText
						}),
						PickerFrame = RoactModule.createElement("Frame", {
							BackgroundTransparency = 1,
							LayoutOrder = 2,
							Size = UDim2.new(1, 0, 0, 0),
							AutomaticSize = Enum.AutomaticSize.Y
						}, {
							BirthdayPadding = RoactModule.createElement("UIPadding", {
								PaddingTop = UDim.new(0, 20),
								PaddingBottom = UDim.new(0, 20)
							}),
							BirthdayPicker = RoactModule.createElement(BirthdayPicker, {
								updateBirthday = p1.updateBirthday,
								NextSelectionUp = p1.closeButtonRef,
								NextSelectionDown = p1.confirmButtonRef
							})
						}),
						ButtonPadding = RoactModule.createElement("Frame", {
							BackgroundTransparency = 1,
							LayoutOrder = 3,
							Size = UDim2.new(1, 0, 0, 10)
						}),
						ConfirmBirthdayButton = RoactModule.createElement(Button, {
							layoutOrder = 4,
							buttonType = ButtonType.PrimaryContextual,
							isDisabled = not p1.state.continueButtonEnabled,
							size = UDim2.new(1, 0, 0, 36),
							text = p3.continueText,
							onActivated = p1.onContinueButtonActivated,
							[RoactModule.Ref] = p1.confirmButtonRef
						})
					})
				})
			})
		end)
	end) else RoactModule.createElement(SignUpLayoutModule, {
		titleTextKey = "Authentication.SignUp.Label.WhensYourBirthday",
		widgetHeightIsDrivenByLayout = false,
		showDisclaimerLinks = true,
		renderWidget = function(p2)
			-- upvalues: p1 (copy), WithStyleFunction (upval), WithLocalizationModule (upval), FormFactor (upval), RoactModule (upval), FitChildrenModule (upval), BirthdayPicker (upval), AuthBackAndNextButtonModule (upval)
			local FormFactor1 = p2.formFactor
			local ContinueButtonEnabled = p1.state.continueButtonEnabled
			
			return WithStyleFunction(function(p3)
				-- upvalues: WithLocalizationModule (upval), FormFactor1 (copy), FormFactor (upval), RoactModule (upval), FitChildrenModule (upval), p1 (upval), BirthdayPicker (upval), AuthBackAndNextButtonModule (upval), ContinueButtonEnabled (copy)
				return WithLocalizationModule({ continueText = "Authentication.SignUp.Label.Continue" })(function(p4)
					-- upvalues: FormFactor1 (upval), FormFactor (upval), p3 (copy), RoactModule (upval), FitChildrenModule (upval), p1 (upval), BirthdayPicker (upval), AuthBackAndNextButtonModule (upval), ContinueButtonEnabled (upval)
					return RoactModule.createElement(FitChildrenModule.FitImageLabel, {
						Size = UDim2.new(1, 0, 0, 0),
						fitAxis = FitChildrenModule.FitAxis.Height,
						BackgroundColor3 = p3.Theme.BackgroundDefault.Color,
						BackgroundTransparency = if FormFactor1 == FormFactor.COMPACT then p3.Theme.BackgroundDefault.Transparency else 1,
						BorderSizePixel = 0,
						ScaleType = Enum.ScaleType.Slice,
						SliceCenter = Rect.new(9, 9, 9, 9),
						ClipsDescendants = true,
						Image = "LuaApp/buttons/buttonFill",
						ImageColor3 = p3.Theme.BackgroundDefault.Color,
						ImageTransparency = p3.Theme.BackgroundDefault.Transparency,
						[RoactModule.Ref] = p1.props.containerRef
					}, {
						ListLayout = RoactModule.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder }),
						Padding = RoactModule.createElement("UIPadding", {
							PaddingLeft = UDim.new(0, 20),
							PaddingRight = UDim.new(0, 20),
							PaddingTop = UDim.new(0, 20),
							PaddingBottom = UDim.new(0, 20)
						}),
						BirthdayPicker = RoactModule.createElement(BirthdayPicker, {
							layoutOrder = 1,
							updateBirthday = p1.updateBirthday,
							NextSelectionUp = p1.closeButtonRef,
							NextSelectionDown = p1.confirmButtonRef
						}),
						AuthBackAndNextButton = RoactModule.createElement(AuthBackAndNextButtonModule, {
							layoutOrder = 2,
							size = UDim2.new(1, 0, 0, 36),
							nextButtonText = p4.continueText,
							nextButtonIsDisabled = not ContinueButtonEnabled,
							nextButtonOnActivated = p1.onContinueButtonActivated,
							[RoactModule.Ref] = p1.confirmButtonRef
						})
					})
				end)
			end)
		end,
		renderCharacter = p1.renderCharacter
	})
end

local v1 = RoactServices.connect({ authAnalytics = RoactAnalyticsAuthEventsModule })((RoactRoduxModule.connect(nil, function(Callback)
	-- upvalues: FFlagRemoveUnusedSignUpInfoRoduxSlice (copy), SetSignUpBirthdayModule (copy), AppPageModule (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateSidewaysModule (copy), NavigateBackModule (copy)
	return {
		setSignUpBirthday = function(p1)
			-- upvalues: FFlagRemoveUnusedSignUpInfoRoduxSlice (upval), Callback (copy), SetSignUpBirthdayModule (upval)
			return if FFlagRemoveUnusedSignUpInfoRoduxSlice then nil else Callback(SetSignUpBirthdayModule(p1))
		end,
		navigateToSinglePageSignUp = function(Birthday)
			-- upvalues: AppPageModule (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), Callback (copy), NavigateSidewaysModule (upval)
			local config = {
				name = AppPageModule.SinglePageSignUp,
				extraProps = { birthday = Birthday }
			}
			
			return if FFlagSignalsNavP3Dispatch then NavigationCommands.sideways(NavigationCommands.fromLegacyPage(config)) else Callback(NavigateSidewaysModule(config))
		end,
		navigateBack = function()
			-- upvalues: FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), Callback (copy), NavigateBackModule (upval)
			return if FFlagSignalsNavP3Dispatch then NavigationCommands.back() else Callback(NavigateBackModule())
		end
	}
end)(BirthdayPage)))

return function(p1)
	-- upvalues: UseDefaultFocusBehaviorFunction (copy), RoactModule (copy), v1 (ref), CryoModule (copy)
	local UseDefaultFocusBehaviorResult, UseDefaultFocusBehaviorResult2 = UseDefaultFocusBehaviorFunction()
	
	return RoactModule.createElement(v1, CryoModule.Dictionary.join(p1, {
		defaultRef = UseDefaultFocusBehaviorResult,
		containerRef = UseDefaultFocusBehaviorResult2
	}))
end