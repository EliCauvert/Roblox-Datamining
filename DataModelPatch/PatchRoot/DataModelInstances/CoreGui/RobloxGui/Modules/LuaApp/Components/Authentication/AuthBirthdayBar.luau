local CorePackages = game:GetService("CorePackages")
local LocalizationService = game:GetService("LocalizationService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(CorePackages.Packages.Roact)
local ReactModule = require(CorePackages.Packages.React)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local ResponsiveModule = require(CorePackages.Workspace.Packages.Responsive)
local CryoModule = require(CorePackages.Packages.Cryo)
local UseTokens = require(CorePackages.Packages.Foundation).Hooks.useTokens
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)
local ShouldEnableAuthBirthdayBarUpdates = game:DefineFastFlag("ShouldEnableAuthBirthdayBarUpdates", false)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local WithStyleFunction = UIBloxModule.Style.withStyle
local WithLocalizationModule = require(Modules.LuaApp.withLocalization)
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local RoactAppExperimentModule = require(CorePackages.Packages.RoactAppExperiment)
local AppBtidLayers = require(CorePackages.Workspace.Packages.ExperimentLayers).AppBtidLayers
local FitChildrenModule = require(Modules.LuaApp.FitChildren)
local FitTextLabelModule = require(Modules.LuaApp.Components.FitTextLabel)
local DEPRECATEDImageSetButtonModule = require(Modules.LuaApp.Components.DEPRECATED_ImageSetButton)
local AuthCommonModule = require(CorePackages.Workspace.Packages.AuthCommon)
local AuthStatefulRoundCornerBorder = AuthCommonModule.Components.AuthStatefulRoundCornerBorder
local BirthdayDropdown = require(CorePackages.Workspace.Packages.AuthSignup).Components.BirthdayDropdown
local RegisterAuditContent = AuthCommonModule.Components.RegisterAuditContent
local DateHelper = if ShouldEnableAuthBirthdayBarUpdates then require(CorePackages.Workspace.Packages.Time).DateHelper else require(Modules.LuaApp.Util.DateHelper)
local Birthday = require(CorePackages.Workspace.Packages.AuthCommon).Models.Birthday
local EventStreamConstantsModule = require(Modules.LuaApp.EventStreamConstants)
local RoactAnalyticsAuthEventsModule = require(Modules.LuaApp.Services.RoactAnalyticsAuthEvents)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local OpenCentralOverlayForSignUpBirthdayPickerModule = require(Modules.LuaApp.Thunks.OpenCentralOverlayForSignUpBirthdayPicker)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagUseBirthdayDropdownForGamepad = SharedFlagsModule.FFlagUseBirthdayDropdownForGamepad
local FIntSignupMinimumAge = SharedFlagsModule.FIntSignupMinimumAge
local GetFFlagEnableAuditForSinglePageSignUpFunction = SharedFlagsModule.GetFFlagEnableAuditForSinglePageSignUp
local GetFFlagAuthBirthdayBarFoundationColorsFunction = SharedFlagsModule.GetFFlagAuthBirthdayBarFoundationColors
local IconsActionsCalendar = UIBloxModule.App.ImageSet.Images["icons/actions/calendar"]
local AuthBirthdayBar = RoactModule.PureComponent:extend("AuthBirthdayBar")

function AuthBirthdayBar.init(p1)
	-- upvalues: FFlagUseBirthdayDropdownForGamepad (copy), ResponsiveModule (copy), ArgCheckModule (copy), Birthday (copy), EventStreamConstantsModule (copy), ShouldEnableAuthBirthdayBarUpdates (copy)
	p1.state = {
		isFocused = false,
		isHovering = false,
		selectedBirthday = nil,
		age = nil
	}
	p1.isMounted = false
	p1.showBirthdayDropdown = FFlagUseBirthdayDropdownForGamepad and p1.props.preferredInput == ResponsiveModule.Input.Directional
	
	function p1.updateState(p2)
		-- upvalues: p1 (copy)
		spawn(function()
			-- upvalues: p1 (upval), p2 (copy)
			if p1.isMounted then
				p1:setState(p2)
			end
		end)
	end
	
	function p1.onBirthdayPickerClose(SelectedBirthday)
		-- upvalues: ArgCheckModule (upval), Birthday (upval), p1 (copy), EventStreamConstantsModule (upval), ShouldEnableAuthBirthdayBarUpdates (upval)
		local config = { isFocused = false }
		
		if SelectedBirthday ~= nil then
			ArgCheckModule.assert(Birthday.is(SelectedBirthday), "CentralOverlayForSignUpBirthdayPicker should pass back a Birthday when closing.")
			local OnBirthdaySelectedFunction: (any) -> () = p1.props.onBirthdaySelected
			
			if OnBirthdaySelectedFunction then
				p1.props.analytics.reportButtonClicked(EventStreamConstantsModule.Context.SinglePageSignUpScreen, EventStreamConstantsModule.Button.ConfirmBirthday)
				OnBirthdaySelectedFunction(SelectedBirthday)
			end
			config.selectedBirthday = SelectedBirthday
			
			if ShouldEnableAuthBirthdayBarUpdates and SelectedBirthday.Day ~= nil and SelectedBirthday.Month ~= nil and SelectedBirthday.Year ~= nil then
				local AgeInYears = SelectedBirthday:GetAgeInYears()
				config.age = AgeInYears
				
				if AgeInYears ~= nil and p1.props.shouldUseBirthdayAgeLabel then
					p1.props.analytics.reportAuthFormInteraction(EventStreamConstantsModule.Context.SignupForm, EventStreamConstantsModule.Field.BirthdayAgeLabel, (tostring(AgeInYears)))
				end
			end
		end
		if p1.props.onBirthdayFocused then
			p1.props.onBirthdayFocused(false)
		end
		p1.updateState(config)
	end
	
	function p1.onBirthdaySelected(SelectedBirthday, Age, p2)
		-- upvalues: ArgCheckModule (upval), Birthday (upval), p1 (copy)
		ArgCheckModule.assert(Birthday.is(SelectedBirthday), "BirthdayDropdown should pass a Birthday.")
		local config = { selectedBirthday = SelectedBirthday, age = Age }
		local OnBirthdaySelectedFunction: (any, any) -> () = p1.props.onBirthdaySelected
		
		if OnBirthdaySelectedFunction then
			OnBirthdaySelectedFunction(SelectedBirthday, p2)
		end
		p1.updateState(config)
	end
	
	function p1.onActivated()
		-- upvalues: p1 (copy), EventStreamConstantsModule (upval)
		p1.props.analytics.reportFocus(EventStreamConstantsModule.Context.SinglePageSignUpScreen, EventStreamConstantsModule.Field.Birthday)
		p1.props.openCentralOverlayForSignUpBirthdayPicker({
			initialBirthday = p1.state.selectedBirthday,
			onClose = p1.onBirthdayPickerClose,
			navigateBackWithoutSelection = p1.props.autoFocusOnMount and not p1.state.selectedBirthday,
			forceDarkTheme = p1.props.forceDarkTheme
		})
		
		if p1.props.onBirthdayFocused then
			p1.props.onBirthdayFocused(true)
		end
		spawn(function()
			-- upvalues: p1 (upval)
			if p1.isMounted then
				p1:setState({ isFocused = true })
			end
		end)
	end
	
	function p1.onMouseEnter()
		-- upvalues: p1 (copy)
		if p1.isMounted then
			p1:setState({ isHovering = true })
		end
	end
	
	function p1.onMouseLeave()
		-- upvalues: p1 (copy)
		if p1.isMounted then
			p1:setState({ isHovering = false })
		end
	end
end

function AuthBirthdayBar.didMount(p1)
	p1.isMounted = true
	
	if p1.showBirthdayDropdown then return end
	if p1.props.autoFocusOnMount then
		spawn(p1.onActivated)
	end
end

function AuthBirthdayBar.willUnmount(p1)
	p1.isMounted = false
end

function AuthBirthdayBar.render(p1)
	-- upvalues: LocalizationService (copy), DateHelper (copy), ShouldEnableAuthBirthdayBarUpdates (copy), WithStyleFunction (copy), GetFFlagAuthBirthdayBarFoundationColorsFunction (copy), WithLocalizationModule (copy), GetFFlagEnableAuditForSinglePageSignUpFunction (copy), AuthStatefulRoundCornerBorder (copy), RoactModule (copy), FitChildrenModule (copy), FitTextLabelModule (copy), RegisterAuditContent (copy), BirthdayDropdown (copy), FIntSignupMinimumAge (copy), EventStreamConstantsModule (copy), DEPRECATEDImageSetButtonModule (copy), ImageSetLabel (copy), IconsActionsCalendar (copy)
	local RobloxLocaleId = LocalizationService.RobloxLocaleId
	local LayoutOrder = p1.props.layoutOrder
	local IsFocused = p1.state.isFocused
	local IsHovering = p1.state.isHovering
	local SelectedBirthday = p1.state.selectedBirthday
	local ButtonRef = p1.props.buttonRef
	local BirthdayContainerRef = p1.props.birthdayContainerRef
	local MonthsLocalizationKey = SelectedBirthday and DateHelper.MonthsLocalizationKeys[SelectedBirthday.Month] or nil
	local Text: string = if ShouldEnableAuthBirthdayBarUpdates then tostring(p1.state.age or 0) else ""
	
	return WithStyleFunction(function(p2)
		-- upvalues: GetFFlagAuthBirthdayBarFoundationColorsFunction (upval), p1 (copy), WithLocalizationModule (upval), MonthsLocalizationKey (copy), DateHelper (upval), ShouldEnableAuthBirthdayBarUpdates (upval), Text (copy), GetFFlagEnableAuditForSinglePageSignUpFunction (upval), AuthStatefulRoundCornerBorder (upval), SelectedBirthday (copy), RobloxLocaleId (copy), IsFocused (copy), IsHovering (copy), RoactModule (upval), FitChildrenModule (upval), LayoutOrder (copy), BirthdayContainerRef (copy), FitTextLabelModule (upval), RegisterAuditContent (upval), BirthdayDropdown (upval), FIntSignupMinimumAge (upval), EventStreamConstantsModule (upval), DEPRECATEDImageSetButtonModule (upval), ButtonRef (copy), ImageSetLabel (upval), IconsActionsCalendar (upval)
		local FoundationTokens = nil
		local HasConfig = false
		
		if GetFFlagAuthBirthdayBarFoundationColorsFunction() then
			FoundationTokens = p1.props.foundationTokens
			HasConfig = p1.props.shouldUseFoundationBirthdayBarColors and (FoundationTokens ~= nil and FoundationTokens.Config ~= nil)
		end
		return WithLocalizationModule({
			titleText = "Authentication.SignUp.Label.Birthday",
			datePlaceholder = "CommonUI.Controls.Birthdaypicker.Label.Date",
			monthText = MonthsLocalizationKey,
			dayAffix = DateHelper.DayAffixLocalizationKey,
			yearAffix = DateHelper.YearAffixLocalizationKey,
			titleTextWithAge = if ShouldEnableAuthBirthdayBarUpdates then {
				"Authentication.SignUp.Label.BirthdayWithAge",
				yearsOld = Text
			} else nil,
			titleTextWithAgeTemplate = if GetFFlagEnableAuditForSinglePageSignUpFunction() then "Authentication.SignUp.Label.BirthdayWithAge" else nil
		})(function(p3)
			-- upvalues: HasConfig (ref), FoundationTokens (ref), p2 (copy), ShouldEnableAuthBirthdayBarUpdates (upval), p1 (upval), Text (upval), AuthStatefulRoundCornerBorder (upval), SelectedBirthday (upval), DateHelper (upval), RobloxLocaleId (upval), IsFocused (upval), IsHovering (upval), RoactModule (upval), FitChildrenModule (upval), LayoutOrder (upval), BirthdayContainerRef (upval), FitTextLabelModule (upval), GetFFlagEnableAuditForSinglePageSignUpFunction (upval), RegisterAuditContent (upval), BirthdayDropdown (upval), FIntSignupMinimumAge (upval), EventStreamConstantsModule (upval), DEPRECATEDImageSetButtonModule (upval), ButtonRef (upval), ImageSetLabel (upval), IconsActionsCalendar (upval)
			local DatePlaceholder = p3.datePlaceholder
			local MutedColor3 = if HasConfig then FoundationTokens.Color.Content.Muted.Color3 else p2.Theme.TextDefault.Color
			local Transparency = if HasConfig then FoundationTokens.Color.Content.Muted.Transparency else p2.Theme.TextDefault.Transparency
			local MutedColor3_1 = if HasConfig then FoundationTokens.Color.Content.Muted.Color3 else p2.Theme.IconDefault.Color
			local Transparency1 = if HasConfig then FoundationTokens.Color.Content.Muted.Transparency else p2.Theme.IconDefault.Transparency
			local TitleText = p3.titleText
			local TranslationKey = "Authentication.SignUp.Label.Birthday"
			local Parameters = nil
			local TitleText1 = p3.titleText
			
			if ShouldEnableAuthBirthdayBarUpdates and p1.state.age ~= nil and p1.props.shouldUseBirthdayAgeLabel then
				TitleText = p3.titleTextWithAge
				TranslationKey = "Authentication.SignUp.Label.BirthdayWithAge"
				Parameters = { yearsOld = Text }
				TitleText1 = p3.titleTextWithAgeTemplate
			end
			local Default = AuthStatefulRoundCornerBorder.BorderState.Default
			
			if SelectedBirthday then
				DatePlaceholder = DateHelper:GetFormattedFullString(p3.monthText, SelectedBirthday.Day, p3.dayAffix, SelectedBirthday.Year, p3.yearAffix, " ", RobloxLocaleId)
				MutedColor3 = if HasConfig then FoundationTokens.Color.Content.Emphasis.Color3 else p2.Theme.TextDefault.Color
				Transparency = if HasConfig then FoundationTokens.Color.Content.Emphasis.Transparency else p2.Theme.TextDefault.Transparency
			end
			if IsFocused then
				MutedColor3_1 = if HasConfig then FoundationTokens.Color.Content.Emphasis.Color3 else p2.Theme.TextDefault.Color
				Transparency1 = if HasConfig then FoundationTokens.Color.Content.Emphasis.Transparency else p2.Theme.TextDefault.Transparency
				Default = AuthStatefulRoundCornerBorder.BorderState.Focused
			elseif IsHovering then
				MutedColor3_1 = if HasConfig then FoundationTokens.Color.Content.Muted.Color3 else p2.Theme.IconDefault.Color
				Transparency1 = if HasConfig then FoundationTokens.Color.Content.Muted.Transparency else p2.Theme.IconDefault.Transparency
				Default = AuthStatefulRoundCornerBorder.BorderState.Hover
			end
			local EmphasisColor3 = nil
			local Transparency2 = nil
			local YOffset = 36
			
			if HasConfig then
				YOffset = FoundationTokens.Size.Size_1200
				
				if Default == AuthStatefulRoundCornerBorder.BorderState.Focused then
					EmphasisColor3 = FoundationTokens.Color.System.Emphasis.Color3
					Transparency2 = FoundationTokens.Color.System.Emphasis.Transparency
				else
					EmphasisColor3 = FoundationTokens.Color.Stroke.Emphasis.Color3
					Transparency2 = FoundationTokens.Color.Stroke.Emphasis.Transparency
				end
			end
			return RoactModule.createElement(FitChildrenModule.FitFrame, {
				LayoutOrder = LayoutOrder,
				Size = UDim2.new(1, 0, 0, 0),
				fitAxis = FitChildrenModule.FitAxis.Height,
				BackgroundTransparency = 1,
				[RoactModule.Ref] = BirthdayContainerRef
			}, {
				UIListLayout = RoactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, 5)
				}),
				Padding = RoactModule.createElement("UIPadding", {
					PaddingTop = UDim.new(0, 5),
					PaddingBottom = UDim.new(0, 5)
				}),
				Title = RoactModule.createElement(FitTextLabelModule, {
					LayoutOrder = 0,
					BackgroundTransparency = 1,
					TextWrapped = true,
					Size = UDim2.new(1, 0, 0, 0),
					fitAxis = FitChildrenModule.FitAxis.Height,
					Text = TitleText,
					Font = p2.Font.CaptionHeader.Font,
					TextSize = p2.Font.BaseSize * p2.Font.CaptionHeader.RelativeSize,
					TextColor3 = p2.Theme.TextEmphasis.Color,
					TextTransparency = p2.Theme.TextEmphasis.Transparency,
					TextXAlignment = Enum.TextXAlignment.Left
				}),
				RegisterAuditContent = if GetFFlagEnableAuditForSinglePageSignUpFunction() and RegisterAuditContent and p1.props.enableAuditContentCapture then RoactModule.createElement(RegisterAuditContent, {
					translationKey = TranslationKey,
					translatedSourceString = TitleText1,
					parameters = Parameters
				}) else nil,
				BirthdayDropdown = p1.showBirthdayDropdown and RoactModule.createElement(BirthdayDropdown, {
					layoutOrder = 1,
					focusOnMount = true,
					localeId = RobloxLocaleId,
					onBirthdaySelected = p1.onBirthdaySelected,
					onDropdownOpened = p1.props.onBirthdayFocused,
					minAgeAllowed = FIntSignupMinimumAge,
					analyticsEventContext = EventStreamConstantsModule.Context.SinglePageSignUpScreen
				}),
				TextInput = not p1.showBirthdayDropdown and RoactModule.createElement(AuthStatefulRoundCornerBorder, {
					layoutOrder = 1,
					size = UDim2.new(1, 0, 0, YOffset),
					borderState = Default,
					borderColorOverride = EmphasisColor3,
					borderTransparencyOverride = Transparency2
				}, {
					Base = RoactModule.createElement(DEPRECATEDImageSetButtonModule, {
						Size = UDim2.new(1, 0, 1, 0),
						BackgroundTransparency = 1,
						Image = "LuaApp/buttons/buttonFill",
						ImageColor3 = if HasConfig then FoundationTokens.Color.Shift.Shift_100.Color3 else p2.Theme.BackgroundUIContrast.Color,
						ImageTransparency = if HasConfig then FoundationTokens.Color.Shift.Shift_100.Transparency else p2.Theme.BackgroundUIContrast.Transparency,
						BorderSizePixel = 0,
						ScaleType = Enum.ScaleType.Slice,
						SliceCenter = Rect.new(8, 8, 9, 9),
						[RoactModule.Ref] = ButtonRef,
						[RoactModule.Event.Activated] = p1.onActivated,
						[RoactModule.Event.MouseEnter] = p1.onMouseEnter,
						[RoactModule.Event.MouseLeave] = p1.onMouseLeave
					}, {
						UIPadding = RoactModule.createElement("UIPadding", {
							PaddingTop = UDim.new(0, 0),
							PaddingBottom = UDim.new(0, 0),
							PaddingLeft = UDim.new(0, 12),
							PaddingRight = UDim.new(0, 12)
						}),
						TextLabel = RoactModule.createElement("TextLabel", {
							BackgroundTransparency = 1,
							Size = UDim2.new(1, -16, 1, 0),
							TextXAlignment = Enum.TextXAlignment.Left,
							TextYAlignment = Enum.TextYAlignment.Center,
							Text = DatePlaceholder,
							Font = p2.Font.Body.Font,
							TextSize = p2.Font.BaseSize * p2.Font.Body.RelativeSize,
							TextColor3 = MutedColor3,
							TextTransparency = Transparency
						}),
						ImageLabel = RoactModule.createElement(ImageSetLabel, {
							BackgroundTransparency = 1,
							Size = UDim2.new(0, 16, 0, 16),
							Position = UDim2.new(1, 0, 0.5, 0),
							AnchorPoint = Vector2.new(1, 0.5),
							Image = IconsActionsCalendar,
							ImageColor3 = MutedColor3_1,
							ImageTransparency = Transparency1
						})
					})
				})
			})
		end)
	end)
end

local v1: (any) -> any = RoactRoduxModule.connect(nil, function(Callback)
	-- upvalues: OpenCentralOverlayForSignUpBirthdayPickerModule (copy)
	return {
		openCentralOverlayForSignUpBirthdayPicker = function(p1)
			-- upvalues: Callback (copy), OpenCentralOverlayForSignUpBirthdayPickerModule (upval)
			Callback(OpenCentralOverlayForSignUpBirthdayPickerModule(p1))
		end
	}
end)((RoactServices.connect({ analytics = RoactAnalyticsAuthEventsModule })(AuthBirthdayBar)))

if ShouldEnableAuthBirthdayBarUpdates then
	v1 = RoactAppExperimentModule.connectBrowserTrackerLayer({ AppBtidLayers.SignupLayer }, function(p1, _)
		-- upvalues: AppBtidLayers (copy)
		return {
			shouldUseBirthdayAgeLabel = (p1[AppBtidLayers.SignupLayer] or {}).shouldUseBirthdayAgeLabel
		}
	end)(v1)
end
if GetFFlagAuthBirthdayBarFoundationColorsFunction() then
	v1 = RoactAppExperimentModule.connectBrowserTrackerLayer({ AppBtidLayers.AuthenticationStylingLayer }, function(p1, _)
		-- upvalues: AppBtidLayers (copy)
		return {
			shouldUseFoundationBirthdayBarColors = (p1[AppBtidLayers.AuthenticationStylingLayer] or {}).shouldUseFoundationBirthdayBarColors
		}
	end)(v1)
end
if GetFFlagAuthBirthdayBarFoundationColorsFunction() then
	v1 = function(p1)
		-- upvalues: UseTokens (copy), ReactModule (copy), v1 (copy), CryoModule (copy)
		return ReactModule.createElement(v1, CryoModule.Dictionary.join(p1 or {}, { foundationTokens = UseTokens() }))
	end
end
return v1