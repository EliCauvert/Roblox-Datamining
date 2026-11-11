local CorePackages = game:GetService("CorePackages")
local LocalizationService = game:GetService("LocalizationService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(Modules.Common.Roact)
local RoactRoduxModule = require(Modules.Common.RoactRodux)
local FoundationModule = require(CorePackages.Packages.Foundation)
local Button = FoundationModule.Button
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local ButtonSize = FoundationModule.Enums.ButtonSize
local CryoModule = require(CorePackages.Packages.Cryo)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local WithStyleFunction = UIBloxModule.Style.withStyle
local Constants = UIBloxModule.App.Style.Constants
local UiModeStyleProvider = require(CorePackages.Workspace.Packages.Style).UiModeStyleProvider
local WithLocalizationModule = require(Modules.LuaApp.withLocalization)
local Birthday = require(CorePackages.Workspace.Packages.AuthCommon).Models.Birthday
local FitChildrenModule = require(Modules.LuaApp.FitChildren)
local BirthdayPicker = require(CorePackages.Workspace.Packages.AuthSignup).Components.BirthdayPicker
local UseSignUpPageNavigationBindingsFunction = require(CorePackages.Workspace.Packages.AuthCommon).Hooks.useSignUpPageNavigationBindings
local CloseCentralOverlayModule = require(Modules.LuaApp.Thunks.CloseCentralOverlay)
local NavigateBackModule = require(Modules.LuaApp.Thunks.NavigateBack)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagSignalsNavP3Dispatch = SharedFlagsModule.FFlagSignalsNavP3Dispatch
local GetFFlagSignUpBirthdayPickerShowAgeCalculatorFunction = SharedFlagsModule.GetFFlagSignUpBirthdayPickerShowAgeCalculator
local GetFFlagSignUpBirthdayPickerRequireManualSelectionFunction = SharedFlagsModule.GetFFlagSignUpBirthdayPickerRequireManualSelection
local GetFIntSignUpBirthdayPickerManualSelectVariantOverrideFunction = SharedFlagsModule.GetFIntSignUpBirthdayPickerManualSelectVariantOverride
local GetFFlagSignUpBirthdayPickerRemoveBottomBarOffsetFunction = SharedFlagsModule.GetFFlagSignUpBirthdayPickerRemoveBottomBarOffset
local GetFFlagEnableBirthdayOverlayAnalyticsFunction = SharedFlagsModule.GetFFlagEnableBirthdayOverlayAnalytics
local RoactAppExperimentModule = require(CorePackages.Packages.RoactAppExperiment)
local AppBtidLayers = require(CorePackages.Workspace.Packages.ExperimentLayers).AppBtidLayers
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(CorePackages.Workspace.Packages.RobloxAppNavigation).NavigationCommands else nil
local EventStreamConstantsModule = require(Modules.LuaApp.EventStreamConstants)
local RoactAnalyticsAuthEventsModule = require(Modules.LuaApp.Services.RoactAnalyticsAuthEvents)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local FitTextLabelModule = require(Modules.LuaApp.Components.FitTextLabel)
local FormFactor = require(CorePackages.Workspace.Packages.FormFactor).Enums.FormFactor
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local GetImageDataFunction = require(CorePackages.Workspace.Packages.RobloxAppAssets).GetImageData
local ImageSetButton = UIBloxModule.Core.ImageSet.ImageSetButton
local OtterModule = require(CorePackages.Packages.Otter)
local ConstantsModule = require(Modules.LuaApp.Constants)
local SinglePageSignupMinimumAge = game:DefineFastInt("SinglePageSignupMinimumAge", 5)
local DateHelper = require(CorePackages.Workspace.Packages.Time).DateHelper
local _UDim2 = UDim2.new(0, 36, 0, 36)
local IconsNavigationClose = UIBloxModule.App.ImageSet.Images["icons/navigation/close"]
local _Vector2 = Vector2.new(540, 360)
local _Vector2_1 = Vector2.new(100, 340)
local SignUpBirthdayPickerOverlay = RoactModule.PureComponent:extend("SignUpBirthdayPickerOverlay")

function SignUpBirthdayPickerOverlay.init(p1)
	-- upvalues: RoactModule (copy), GetFFlagSignUpBirthdayPickerRemoveBottomBarOffsetFunction (copy), ConstantsModule (copy), GetFFlagEnableBirthdayOverlayAnalyticsFunction (copy), EventStreamConstantsModule (copy), OtterModule (copy), Birthday (copy), DateHelper (copy), SinglePageSignupMinimumAge (copy)
	local InitialBirthday = p1.props.initialBirthday
	local Month = nil
	local Day = nil
	local Year = nil
	
	if InitialBirthday then
		Month = InitialBirthday.Month
		Day = InitialBirthday.Day
		Year = InitialBirthday.Year
	end
	local ScreenSize = p1.props.screenSize
	p1.state = {
		hasValidDate = false,
		closingOverlay = false,
		shouldReturnBirthdayOnClose = false,
		month = Month,
		day = Day,
		year = Year
	}
	p1.backButtonRef = RoactModule.createRef()
	p1.confirmButtonRef = RoactModule.createRef()
	p1.firedAnalytics = {
		opened = false,
		allPicked = false,
		ageSummaryShown = false,
		closedWithoutConfirm = false
	}
	p1.currentYOffset, p1.updateCurrentYOffset = RoactModule.createBinding(ScreenSize.Y)
	
	function p1.updatePositionFromAnimation(p2: number)
		-- upvalues: GetFFlagSignUpBirthdayPickerRemoveBottomBarOffsetFunction (upval), ConstantsModule (upval), p1 (copy), ScreenSize (copy)
		p1.updateCurrentYOffset((1 - p2) * ScreenSize.Y - (if GetFFlagSignUpBirthdayPickerRemoveBottomBarOffsetFunction() then 0 else ConstantsModule.BOTTOM_BAR_SIZE))
	end
	
	function p1.onCloseOverlay(ShouldReturnBirthdayOnClose)
		-- upvalues: p1 (copy), GetFFlagEnableBirthdayOverlayAnalyticsFunction (upval), EventStreamConstantsModule (upval), OtterModule (upval)
		if p1.isMounted and not p1.state.closingOverlay then
			if GetFFlagEnableBirthdayOverlayAnalyticsFunction() and not ShouldReturnBirthdayOnClose and not p1.firedAnalytics.closedWithoutConfirm and p1.props.analytics then
				p1.firedAnalytics.closedWithoutConfirm = true
				p1.props.analytics.reportAuthFormInteraction(EventStreamConstantsModule.Context.SinglePageSignUpScreen, EventStreamConstantsModule.Field.BirthdayPicker, EventStreamConstantsModule.State.BirthdayPickerClosedWithoutConfirm)
			end
			if p1.props.navigateBackWithoutSelection and not ShouldReturnBirthdayOnClose then
				p1.isMounted = false
				p1.props.closeCentralOverlay()
				p1.props.navigateBack()
				
				return
			else
				p1.motor:setGoal(OtterModule.spring(0, p1.springOptions))
				spawn(function()
					-- upvalues: p1 (upval), ShouldReturnBirthdayOnClose (copy)
					if p1.isMounted then
						p1:setState({
							closingOverlay = true,
							shouldReturnBirthdayOnClose = ShouldReturnBirthdayOnClose
						})
					end
				end)
			end
		end
	end
	
	function p1.onOverlayAnimatedOut()
		-- upvalues: p1 (copy), Birthday (upval), OtterModule (upval)
		local OnCloseFunction: (any) -> () = p1.props.onClose
		local CloseCentralOverlayFunction: () -> () = p1.props.closeCentralOverlay
		local Month = p1.state.month
		local Day = p1.state.day
		local Year = p1.state.year
		local HasValidDate = p1.state.hasValidDate
		local NewBirthday = p1.state.shouldReturnBirthdayOnClose and HasValidDate and Birthday.new({ Month = Month, Day = Day, Year = Year }) or nil
		p1.motor:setGoal(OtterModule.spring(0, p1.springOptions))
		
		if OnCloseFunction then
			OnCloseFunction(NewBirthday)
		end
		CloseCentralOverlayFunction()
	end
	
	function p1.updateBirthday(Month, Day, Year)
		-- upvalues: p1 (copy), DateHelper (upval), SinglePageSignupMinimumAge (upval), Birthday (upval), GetFFlagEnableBirthdayOverlayAnalyticsFunction (upval), EventStreamConstantsModule (upval)
		if Month == nil or Day == nil or Year == nil then
			spawn(function()
				-- upvalues: p1 (upval), Month (copy), Day (copy), Year (copy)
				if p1.isMounted then
					p1:setState({
						hasValidDate = false,
						month = Month,
						day = Day,
						year = Year
					})
				end
			end)
			
			return
		end
		local IsValidDate = DateHelper:isValidDate(Month, Day, Year)
		local AgeInYears = Birthday.new({ Month = Month, Day = Day, Year = Year }):GetAgeInYears()
		
		if AgeInYears < SinglePageSignupMinimumAge then
			IsValidDate = false
		end
		if GetFFlagEnableBirthdayOverlayAnalyticsFunction() and not p1.firedAnalytics.allPicked and p1.props.analytics then
			p1.firedAnalytics.allPicked = true
			p1.props.analytics.reportAuthFormInteraction(EventStreamConstantsModule.Context.SinglePageSignUpScreen, EventStreamConstantsModule.Field.BirthdayPicker, EventStreamConstantsModule.State.BirthdayPickerAllPicked)
		end
		if GetFFlagEnableBirthdayOverlayAnalyticsFunction() and p1:shouldShowAgeCalculator() and IsValidDate and not p1.firedAnalytics.ageSummaryShown and p1.props.analytics then
			p1.firedAnalytics.ageSummaryShown = true
			p1.props.analytics.reportAuthFormInteraction(EventStreamConstantsModule.Context.SinglePageSignUpScreen, EventStreamConstantsModule.Field.BirthdayPickerAgeCalculatorShown, (tostring(AgeInYears)))
		end
		spawn(function()
			-- upvalues: p1 (upval), Month (copy), Day (copy), Year (copy), IsValidDate (ref)
			if p1.isMounted then
				p1:setState({
					month = Month,
					day = Day,
					year = Year,
					hasValidDate = IsValidDate
				})
			end
		end)
	end
	
	p1.springOptions = { frequency = 3 }
	p1.isMounted = false
end

function SignUpBirthdayPickerOverlay.getManualSelectVariant(p1)
	-- upvalues: GetFIntSignUpBirthdayPickerManualSelectVariantOverrideFunction (copy)
	local FIntSignUpBirthdayPickerManualSelectVariantOverride: number = GetFIntSignUpBirthdayPickerManualSelectVariantOverrideFunction()
	
	return if FIntSignUpBirthdayPickerManualSelectVariantOverride >= 0 then FIntSignUpBirthdayPickerManualSelectVariantOverride else p1.props.birthdayManualSelectVariant or 0
end

function SignUpBirthdayPickerOverlay.shouldRequireManualSelection(p1): boolean
	-- upvalues: GetFFlagSignUpBirthdayPickerRequireManualSelectionFunction (copy)
	return GetFFlagSignUpBirthdayPickerRequireManualSelectionFunction() and p1:getManualSelectVariant() >= 1
end

function SignUpBirthdayPickerOverlay.shouldShowAgeCalculator(p1): boolean
	-- upvalues: GetFFlagSignUpBirthdayPickerShowAgeCalculatorFunction (copy)
	return GetFFlagSignUpBirthdayPickerShowAgeCalculatorFunction() and p1:getManualSelectVariant() >= 2
end

function SignUpBirthdayPickerOverlay.didMount(p1)
	-- upvalues: GetFFlagEnableBirthdayOverlayAnalyticsFunction (copy), EventStreamConstantsModule (copy), OtterModule (copy)
	p1.isMounted = true
	
	if GetFFlagEnableBirthdayOverlayAnalyticsFunction() and not p1.firedAnalytics.opened and p1.props.analytics then
		p1.firedAnalytics.opened = true
		p1.props.analytics.reportAuthFormInteraction(EventStreamConstantsModule.Context.SinglePageSignUpScreen, EventStreamConstantsModule.Field.BirthdayPicker, EventStreamConstantsModule.State.BirthdayPickerOpened)
	end
	p1.motor = OtterModule.createSingleMotor(0)
	p1.motor:onStep(function(p2: number)
		-- upvalues: p1 (copy)
		p1.updatePositionFromAnimation(p2)
		
		if p1.state.closingOverlay and p2 <= 0.1 then
			spawn(function()
				-- upvalues: p1 (upval)
				if p1.isMounted then
					p1:setState({ closingOverlay = false })
				end
			end)
			p1.onOverlayAnimatedOut()
		end
	end)
	delay(0, function()
		-- upvalues: p1 (copy), OtterModule (upval)
		p1.motor:setGoal(OtterModule.spring(1, p1.springOptions))
	end)
end

function SignUpBirthdayPickerOverlay.willUnmount(p1)
	p1.isMounted = false
	p1.motor:destroy()
end

function SignUpBirthdayPickerOverlay.renderContent(p1)
	-- upvalues: _Vector2 (copy), DateHelper (copy), Birthday (copy), WithStyleFunction (copy), WithLocalizationModule (copy), LocalizationService (copy), FormFactor (copy), SinglePageSignupMinimumAge (copy), RoactModule (copy), ImageSetLabel (copy), GetImageDataFunction (copy), _Vector2_1 (copy), ImageSetButton (copy), _UDim2 (copy), IconsNavigationClose (copy), FitTextLabelModule (copy), FitChildrenModule (copy), BirthdayPicker (copy), Button (copy), ButtonVariant (copy), ButtonSize (copy)
	local HasValidDate = p1.state.hasValidDate
	local Month = p1.state.month
	local Day = p1.state.day
	local Year = p1.state.year
	local ShouldShowAgeCalculator = p1:shouldShowAgeCalculator()
	local _Vector2_2 = if ShouldShowAgeCalculator then Vector2.new(_Vector2.X, _Vector2.Y + 44) else _Vector2
	local MonthsLocalizationKey = Month and DateHelper.MonthsLocalizationKeys[Month] or nil
	local Year1 = ShouldShowAgeCalculator and (HasValidDate and (Month and (Day and Year)))
	local AgeInYears = if Year1 then Birthday.new({ Month = Month, Day = Day, Year = Year }):GetAgeInYears() else nil
	
	return WithStyleFunction(function(p2)
		-- upvalues: WithLocalizationModule (upval), MonthsLocalizationKey (copy), DateHelper (upval), Year1 (copy), Day (copy), Year (copy), LocalizationService (upval), AgeInYears (copy), p1 (copy), FormFactor (upval), SinglePageSignupMinimumAge (upval), RoactModule (upval), ImageSetLabel (upval), _Vector2_2 (copy), GetImageDataFunction (upval), _Vector2_1 (upval), ImageSetButton (upval), _UDim2 (upval), IconsNavigationClose (upval), FitTextLabelModule (upval), FitChildrenModule (upval), BirthdayPicker (upval), ShouldShowAgeCalculator (copy), Button (upval), ButtonVariant (upval), ButtonSize (upval), HasValidDate (copy)
		return WithLocalizationModule({
			monthText = MonthsLocalizationKey,
			dayAffix = DateHelper.DayAffixLocalizationKey,
			yearAffix = DateHelper.YearAffixLocalizationKey
		})(function(p3)
			-- upvalues: Year1 (upval), DateHelper (upval), Day (upval), Year (upval), LocalizationService (upval), WithLocalizationModule (upval), AgeInYears (upval), p1 (upval), FormFactor (upval), SinglePageSignupMinimumAge (upval), RoactModule (upval), ImageSetLabel (upval), _Vector2_2 (upval), GetImageDataFunction (upval), p2 (copy), _Vector2_1 (upval), ImageSetButton (upval), _UDim2 (upval), IconsNavigationClose (upval), FitTextLabelModule (upval), FitChildrenModule (upval), BirthdayPicker (upval), ShouldShowAgeCalculator (upval), Button (upval), ButtonVariant (upval), ButtonSize (upval), HasValidDate (upval)
			local Date = if Year1 and p3.monthText then DateHelper:GetFormattedFullString(p3.monthText, Day, p3.dayAffix or "", Year, p3.yearAffix or "", " ", LocalizationService.RobloxLocaleId) else nil
			
			return WithLocalizationModule({
				confirmBirthdayText = "Authentication.SignUp.Label.ConfirmBirthday",
				titleText = "Authentication.SignUp.Label.Birthday",
				ageSummaryText = if Date then {
					"Authentication.SignUp.Label.BirthdayPickerWithDateAndAge",
					date = Date,
					yearsOld = tostring(AgeInYears or 0)
				} else nil
			})(function(p4)
				-- upvalues: p1 (upval), FormFactor (upval), SinglePageSignupMinimumAge (upval), RoactModule (upval), ImageSetLabel (upval), _Vector2_2 (upval), GetImageDataFunction (upval), p2 (upval), _Vector2_1 (upval), ImageSetButton (upval), _UDim2 (upval), IconsNavigationClose (upval), FitTextLabelModule (upval), FitChildrenModule (upval), BirthdayPicker (upval), ShouldShowAgeCalculator (upval), Year1 (upval), Button (upval), ButtonVariant (upval), ButtonSize (upval), HasValidDate (upval)
				local IsFormFactorMatch = p1.props.formFactor == FormFactor.WIDE
				local YScale: number = if IsFormFactorMatch then 0.5 else 1
				
				return RoactModule.createElement(ImageSetLabel, {
					BackgroundTransparency = 1,
					ClipsDescendants = true,
					Size = UDim2.new(1, 0, 0, _Vector2_2.Y),
					Position = p1.currentYOffset:map(function(YOffset): UDim2
						-- upvalues: YScale (copy)
						return UDim2.new(0.5, 0, YScale, YOffset)
					end),
					AnchorPoint = Vector2.new(0.5, if IsFormFactorMatch then 0.5 else 1),
					ScaleType = Enum.ScaleType.Slice,
					SliceCenter = Rect.new(9, 9, 9, 9),
					Image = GetImageDataFunction("LuaApp/buttons/buttonFill") or "LuaApp/buttons/buttonFill",
					ImageColor3 = p2.Theme.BackgroundUIDefault.Color,
					ref = p1.props.eventHandlerRef
				}, {
					SizeConstraint = IsFormFactorMatch and RoactModule.createElement("UISizeConstraint", { MaxSize = _Vector2_2, MinSize = _Vector2_1 }),
					HeaderFrame = RoactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						Text = nil,
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
							ImageTransparency = 0,
							[RoactModule.Ref] = p1.backButtonRef,
							[RoactModule.Event.Activated] = function()
								-- upvalues: p1 (upval)
								p1.onCloseOverlay(false)
							end
						}),
						Title = p4.titleText and RoactModule.createElement(FitTextLabelModule, {
							BackgroundTransparency = 1,
							TextWrapped = true,
							Position = UDim2.new(0, 0, 0.5, 0),
							Size = UDim2.new(1, 0, 0, 0),
							AnchorPoint = Vector2.new(0, 0.5),
							fitAxis = FitChildrenModule.FitAxis.Height,
							Text = p4.titleText or "",
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
					ContentFrame = RoactModule.createElement(FitChildrenModule.FitFrame, {
						BackgroundTransparency = 1,
						Text = nil,
						Size = UDim2.new(1, 0, 1, -49),
						Position = UDim2.new(0.5, 0, 0, 49),
						AnchorPoint = Vector2.new(0.5, 0),
						fitAxis = FitChildrenModule.FitAxis.Height
					}, {
						ListLayout = RoactModule.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder }),
						Padding = RoactModule.createElement("UIPadding", {
							PaddingLeft = UDim.new(0, 20),
							PaddingRight = UDim.new(0, 20),
							PaddingTop = UDim.new(0, 20),
							PaddingBottom = UDim.new(0, 20)
						}),
						Content = RoactModule.createElement(BirthdayPicker, {
							layoutOrder = 1,
							minAgeAllowed = SinglePageSignupMinimumAge,
							updateBirthday = p1.updateBirthday,
							initialMonth = p1.state.month,
							initialDay = p1.state.day,
							initialYear = p1.state.year,
							NextSelectionUp = p1.backButtonRef,
							NextSelectionDown = p1.confirmButtonRef,
							requireManualSelection = p1:shouldRequireManualSelection()
						}),
						Spacing = RoactModule.createElement("Frame", {
							LayoutOrder = 2,
							BackgroundTransparency = 1,
							Size = UDim2.new(1, 0, 0, 30)
						}),
						AgeSummary = if ShouldShowAgeCalculator then RoactModule.createElement("Frame", {
							LayoutOrder = 3,
							BackgroundTransparency = 1,
							Size = UDim2.new(1, 0, 0, 14)
						}, {
							Label = if Year1 then RoactModule.createElement("TextLabel", {
								BackgroundTransparency = 1,
								BorderSizePixel = 0,
								TextWrapped = true,
								Size = UDim2.new(1, 0, 1, 0),
								Text = p4.ageSummaryText or "",
								Font = p2.Tokens.Typography.LabelMedium.Font,
								TextSize = p2.Tokens.Typography.LabelMedium.FontSize,
								TextColor3 = p2.Theme.TextDefault.Color,
								TextTransparency = p2.Theme.TextDefault.Transparency,
								TextXAlignment = Enum.TextXAlignment.Center,
								TextYAlignment = Enum.TextYAlignment.Center
							}) else nil
						}) else nil,
						ConfirmButtonSpacing = if ShouldShowAgeCalculator then RoactModule.createElement("Frame", {
							LayoutOrder = 4,
							BackgroundTransparency = 1,
							Size = UDim2.new(1, 0, 0, 30)
						}) else nil,
						ConfirmBirthdayButton = RoactModule.createElement(Button, {
							LayoutOrder = 5,
							variant = ButtonVariant.SubEmphasis,
							size = ButtonSize.Medium,
							text = p4.confirmBirthdayText,
							isDisabled = not HasValidDate,
							onActivated = function()
								-- upvalues: HasValidDate (upval), p1 (upval)
								if HasValidDate then
									p1.onCloseOverlay(true)
								end
							end,
							width = UDim.new(1, 0),
							ref = p1.confirmButtonRef
						})
					})
				})
			end)
		end)
	end)
end

function SignUpBirthdayPickerOverlay.render(p1)
	-- upvalues: RoactModule (copy), UiModeStyleProvider (copy), Constants (copy)
	local RenderContentResult = p1:renderContent()
	
	return if p1.props.forceDarkTheme then RoactModule.createElement(UiModeStyleProvider, {
		style = {
			themeName = Constants.ThemeName.Dark,
			fontName = Constants.FontName.Gotham
		}
	}, { Child = RenderContentResult }) else RenderContentResult
end

local v1 = RoactServices.connect({ analytics = RoactAnalyticsAuthEventsModule })((RoactRoduxModule.connect(function(p1, _)
	return { screenSize = p1.ScreenSize, formFactor = p1.FormFactor }
end, function(Callback)
	-- upvalues: CloseCentralOverlayModule (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateBackModule (copy)
	return {
		closeCentralOverlay = function()
			-- upvalues: Callback (copy), CloseCentralOverlayModule (upval)
			Callback(CloseCentralOverlayModule())
		end,
		navigateBack = function()
			-- upvalues: FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), Callback (copy), NavigateBackModule (upval)
			return if FFlagSignalsNavP3Dispatch then NavigationCommands.back() else Callback(NavigateBackModule())
		end
	}
end)(SignUpBirthdayPickerOverlay)))

if GetFFlagSignUpBirthdayPickerRequireManualSelectionFunction() or GetFFlagSignUpBirthdayPickerShowAgeCalculatorFunction() then
	v1 = RoactAppExperimentModule.connectBrowserTrackerLayer({ AppBtidLayers.SignupLayer }, function(p1, _)
		-- upvalues: AppBtidLayers (copy)
		return {
			birthdayManualSelectVariant = (p1[AppBtidLayers.SignupLayer] or {}).birthdayManualSelectVariant
		}
	end)(v1)
end
return function(p1)
	-- upvalues: UseSignUpPageNavigationBindingsFunction (copy), RoactModule (copy), v1 (ref), CryoModule (copy)
	return RoactModule.createElement(v1, CryoModule.Dictionary.join(p1, {
		eventHandlerRef = UseSignUpPageNavigationBindingsFunction()
	}))
end