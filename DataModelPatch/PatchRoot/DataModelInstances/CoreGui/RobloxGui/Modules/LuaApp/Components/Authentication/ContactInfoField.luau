local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local UserInputService = game:GetService("UserInputService")
local RoactModule = require(CorePackages.Packages.Roact)
local AuthCommonModule = require(CorePackages.Workspace.Packages.AuthCommon)
local Text = require(CorePackages.Workspace.Packages.AppCommonLib).Text
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local WithStyleFunction = UIBloxModule.Style.withStyle
local WithLocalizationModule = require(Modules.LuaApp.withLocalization)
local IsStringEmailModule = require(Modules.LuaApp.Util.isStringEmail)
local IsStringPhoneFunction = AuthCommonModule.Utils.isStringPhone
local DebounceModule = require(Modules.LuaApp.Util.debounce)
local Images = UIBloxModule.App.ImageSet.Images
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local TextBoxStateWrapper = AuthCommonModule.Components.TextBoxStateWrapper
local GenericTextBox = AuthCommonModule.Components.GenericTextBox
local PhoneNumberTextBox = AuthCommonModule.Components.PhoneNumberTextBox
local CredentialTypeModule = require(Modules.LuaApp.Enum.CredentialType)
local RoactAnalyticsAuthEventsModule = require(Modules.LuaApp.Services.RoactAnalyticsAuthEvents)
local EventStreamConstantsModule = require(Modules.LuaApp.EventStreamConstants)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local IconsNavigationPushRight = Images["icons/navigation/pushRight"]
local IconsActionsAcceptSmall = Images["icons/actions/accept_small"]
local _UDim2 = UDim2.new(0, 18, 0, 18)
local ContactInfoField = RoactModule.Component:extend("ContactInfoField")
ContactInfoField.defaultProps = { TextBoxHeight = 36 }

function ContactInfoField.init(p1)
	-- upvalues: UserInputService (copy), CredentialTypeModule (copy), EventStreamConstantsModule (copy), DebounceModule (copy), IsStringEmailModule (copy), IsStringPhoneFunction (copy)
	local Platform = UserInputService:GetPlatform()
	p1:setState({
		LinkHover = false,
		EmailInput = "",
		EmailValid = false,
		PhoneInput = "",
		PhoneValid = false,
		Type = (Platform == Enum.Platform.IOS or Platform == Enum.Platform.Android) and CredentialTypeModule.PhoneNumber or CredentialTypeModule.Email,
		CountryCode = { code = "US", name = "United States", prefix = "1" }
	})
	
	function p1.MouseEnterLink()
		-- upvalues: p1 (copy)
		p1:setState({ LinkHover = true })
	end
	
	function p1.MouseLeaveLink()
		-- upvalues: p1 (copy)
		p1:setState({ LinkHover = false })
	end
	
	function p1.LinkActivated()
		-- upvalues: p1 (copy), CredentialTypeModule (upval), EventStreamConstantsModule (upval)
		p1:setState({
			Focused = false,
			Type = p1.state.Type == CredentialTypeModule.Email and CredentialTypeModule.PhoneNumber or CredentialTypeModule.Email
		})
		p1.props.authAnalytics.reportInteractWithAction(EventStreamConstantsModule.Context.SinglePageSignUpScreen, if p1.state.Type == CredentialTypeModule.Email then EventStreamConstantsModule.Field.UseEmail elseif p1.state.Type == CredentialTypeModule.PhoneNumber then EventStreamConstantsModule.Field.UsePhone else nil, EventStreamConstantsModule.ActionType.Click, "", "")
	end
	
	function p1.UpdateEmailInput(EmailInput, EmailValid)
		-- upvalues: p1 (copy)
		p1:setState({ EmailInput = EmailInput, EmailValid = EmailValid })
		
		if p1.props.SetEmail then
			p1.props.SetEmail(EmailInput, EmailValid)
		end
	end
	
	function p1.UpdatePhoneInput(PhoneInput, PhoneValid)
		-- upvalues: p1 (copy)
		p1:setState({ PhoneInput = PhoneInput, PhoneValid = PhoneValid })
		
		if p1.props.SetPhoneNumber then
			p1.props.SetPhoneNumber(p1.state.CountryCode, PhoneInput, PhoneValid)
		end
	end
	
	function p1:InputFocused()
		-- upvalues: p1 (copy), CredentialTypeModule (upval), EventStreamConstantsModule (upval)
		p1:setState({ Focused = true })
		p1.props.authAnalytics.reportInteractWithAction(EventStreamConstantsModule.Context.SinglePageSignUpScreen, if p1.state.Type == CredentialTypeModule.Email then EventStreamConstantsModule.Field.Email elseif p1.state.Type == CredentialTypeModule.PhoneNumber then EventStreamConstantsModule.Field.Phone else nil, EventStreamConstantsModule.ActionType.Focus, "", "")
	end
	
	p1.EmailInputChanged = DebounceModule(function(p2)
		-- upvalues: p1 (copy), IsStringEmailModule (upval)
		p1.UpdateEmailInput(p2.Text, IsStringEmailModule(p2.Text))
	end, 1.5)
	
	function p1.EmailInputFocusLost(p2)
		-- upvalues: p1 (copy), IsStringEmailModule (upval)
		p1:setState({ Focused = false })
		p1.UpdateEmailInput(p2.Text, IsStringEmailModule(p2.Text))
	end
	
	p1.PhoneInputChanged = DebounceModule(function(p2)
		-- upvalues: p1 (copy), IsStringPhoneFunction (upval)
		p1.UpdatePhoneInput(p2.Text, IsStringPhoneFunction(p2.Text))
	end, 1.5)
	
	function p1.PhoneInputFocusLost(p2)
		-- upvalues: p1 (copy), IsStringPhoneFunction (upval)
		p1:setState({ Focused = false })
		p1.UpdatePhoneInput(p2.Text, IsStringPhoneFunction(p2.Text))
	end
	
	function p1.SetCountryCode(CountryCode)
		-- upvalues: p1 (copy)
		p1:setState({ CountryCode = CountryCode })
		
		if p1.props.SetPhoneNumber then
			p1.props.SetPhoneNumber(CountryCode, p1.state.PhoneInput, p1.state.PhoneValid)
		end
	end
end

function ContactInfoField.didMount(p1)
	p1.mounted = true
	
	if p1.props.SetContactMethod then
		p1.props.SetContactMethod(p1.state.Type)
	end
end

function ContactInfoField.didUpdate(p1, p2, p3)
	local ContactMethod = p1.props.contactMethod
	
	if ContactMethod and ContactMethod ~= p2.contactMethod and ContactMethod ~= p1.state.Type then
		p1:setState({ Type = ContactMethod })
	end
	if p1.state.Type ~= p3.Type and p1.props.SetContactMethod then
		p1.props.SetContactMethod(p1.state.Type)
	end
end

function ContactInfoField.willUnmount(p1)
	p1.mounted = false
end

function ContactInfoField.getDerivedStateFromProps(p1, p2)
	-- upvalues: CredentialTypeModule (copy)
	return if p1.Under13 and p2.Type ~= CredentialTypeModule.Email then { Type = CredentialTypeModule.Email } else nil
end

function ContactInfoField.render(p1)
	-- upvalues: CredentialTypeModule (copy), WithLocalizationModule (copy), WithStyleFunction (copy), Text (copy), RoactModule (copy), TextBoxStateWrapper (copy), GenericTextBox (copy), PhoneNumberTextBox (copy), IconsActionsAcceptSmall (copy), _UDim2 (copy), ImageSetLabel (copy), IconsNavigationPushRight (copy)
	local IsTypeMatch = p1.state.Type == CredentialTypeModule.Email
	local AuthenticationSignUpLabelEmailAddress: string = if IsTypeMatch then "Authentication.SignUp.Label.EmailAddress" else "Authentication.SignUp.Label.PhoneNumber"
	local IsNotEmailInputMatch: boolean = IsTypeMatch and not p1.state.EmailValid and not p1.state.Focused and p1.state.EmailInput ~= "" or not IsTypeMatch and (not p1.state.PhoneValid and (not p1.state.Focused and p1.state.PhoneInput ~= ""))
	
	return WithLocalizationModule({
		Title = if p1.props.Under13 then "Authentication.SignUp.Label.ParentEmailAddress" else AuthenticationSignUpLabelEmailAddress,
		Placeholder = AuthenticationSignUpLabelEmailAddress,
		Error = IsNotEmailInputMatch and (if IsTypeMatch then "Authentication.SignUp.Response.InvalidEmail" else "Authentication.SignUp.Response.InvalidPhoneNumber") or nil,
		LinkText = if IsTypeMatch then "Authentication.SignUp.Action.UsePhoneNumber" else "Authentication.SignUp.Action.UseEmail"
	})(function(p2)
		-- upvalues: WithStyleFunction (upval), Text (upval), p1 (copy), RoactModule (upval), TextBoxStateWrapper (upval), IsTypeMatch (copy), GenericTextBox (upval), PhoneNumberTextBox (upval), IsNotEmailInputMatch (copy), IconsActionsAcceptSmall (upval), _UDim2 (upval), ImageSetLabel (upval), IconsNavigationPushRight (upval)
		return WithStyleFunction(function(p3)
			-- upvalues: Text (upval), p2 (copy), p1 (upval), RoactModule (upval), TextBoxStateWrapper (upval), IsTypeMatch (upval), GenericTextBox (upval), PhoneNumberTextBox (upval), IsNotEmailInputMatch (upval), IconsActionsAcceptSmall (upval), _UDim2 (upval), ImageSetLabel (upval), IconsNavigationPushRight (upval)
			local BodyFont = p3.Font.Body.Font
			local ScaledBaseSize = p3.Font.BaseSize * p3.Font.Body.RelativeSize
			local Color = p3.Theme.TextDefault.Color
			local Transparency = p3.Theme.TextDefault.Transparency
			local Color1 = p3.Theme.BackgroundUIContrast.Color
			local Transparency1 = p3.Theme.BackgroundUIContrast.Transparency
			local Color2 = p3.Theme.UIDefault.Color
			local ScaledBaseSize1 = p3.Font.BaseSize * p3.Font.CaptionBody.RelativeSize
			local Text1 = p2.LinkText .. string.rep(" ", math.ceil(ScaledBaseSize1 / math.max(1, Text.GetTextWidth(" ", BodyFont, ScaledBaseSize1))) + 1)
			local TextWidth: number = Text.GetTextWidth(Text1, BodyFont, ScaledBaseSize1)
			local NoUnder13 = not p1.props.Under13
			
			if p1.state.LinkHover then
				Text1 = "<u>" .. Text1 .. "</u>"
			end
			return RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = p1.props.layoutOrder,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				UIListLayout = RoactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, 0)
				}),
				Padding = RoactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, 5) }),
				Title = RoactModule.createElement("TextLabel", {
					LayoutOrder = 0,
					BackgroundTransparency = 1,
					TextWrapped = true,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y,
					Text = p2.Title,
					Font = p3.Font.CaptionHeader.Font,
					TextSize = p3.Font.BaseSize * p3.Font.CaptionHeader.RelativeSize,
					TextColor3 = p3.Theme.TextEmphasis.Color,
					TextTransparency = p3.Theme.TextEmphasis.Transparency,
					TextXAlignment = Enum.TextXAlignment.Left
				}),
				Spacer = RoactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					Size = UDim2.new(0, 0, 0, 5)
				}),
				CValue = RoactModule.createElement(TextBoxStateWrapper, {
					LayoutOrder = 2,
					ChildClass = IsTypeMatch and GenericTextBox or PhoneNumberTextBox,
					ErrorState = IsNotEmailInputMatch,
					Icon = if IsTypeMatch and p1.state.EmailValid then IconsActionsAcceptSmall else not IsTypeMatch and (p1.state.PhoneValid and IconsActionsAcceptSmall),
					IconSize = _UDim2,
					Size = UDim2.new(1, 0, 0, p1.props.TextBoxHeight),
					ChildProps = {
						ClearTextOnFocus = false,
						PaddingX = 12,
						CountryCode = if IsTypeMatch then nil else p1.state.CountryCode or nil,
						SetCountryCode = if IsTypeMatch then nil else p1.SetCountryCode or nil,
						Text = IsTypeMatch and p1.state.EmailInput or p1.state.PhoneInput,
						PlaceholderText = p2.Placeholder,
						Font = BodyFont,
						TextSize = ScaledBaseSize,
						TextXAlignment = Enum.TextXAlignment.Left,
						Color = Color1,
						Transparency = Transparency1,
						TextColor = Color,
						PlaceholderColor = Color2,
						TextTransparency = Transparency,
						onChangeText = IsTypeMatch and p1.EmailInputChanged or p1.PhoneInputChanged,
						onFocused = p1.InputFocused,
						onFocusLost = IsTypeMatch and p1.EmailInputFocusLost or p1.PhoneInputFocusLost,
						phoneCountryCodeSelectorCallback = p1.props.phoneCountryCodeSelectorCallback
					}
				}),
				Footer = RoactModule.createElement("Frame", {
					LayoutOrder = 3,
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, ScaledBaseSize1 + 10)
				}, {
					ErrorText = IsNotEmailInputMatch and RoactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						TextWrapped = true,
						Size = UDim2.new(1, -12 - TextWidth, 1, 0),
						Position = UDim2.new(0, 12, 0, 0),
						Text = p2.Error,
						Font = BodyFont,
						TextSize = ScaledBaseSize1,
						TextColor3 = p3.Theme.Alert.Color,
						TextTransparency = p1.issueSummaryTextTransparency,
						TextXAlignment = Enum.TextXAlignment.Left
					}),
					Arrow = NoUnder13 and RoactModule.createElement(ImageSetLabel, {
						BackgroundTransparency = 1,
						Size = UDim2.new(0, ScaledBaseSize1, 0, ScaledBaseSize1),
						Position = UDim2.new(1, 0, 0.5, 0),
						AnchorPoint = Vector2.new(1, 0.5),
						Image = IconsNavigationPushRight,
						ImageColor3 = p3.Theme.IconEmphasis.Color,
						ImageTransparency = p3.Theme.IconEmphasis.Transparency
					}),
					Link = NoUnder13 and RoactModule.createElement("TextButton", {
						Text = Text1,
						Size = UDim2.new(0, TextWidth, 1, 0),
						TextSize = ScaledBaseSize1,
						Position = UDim2.new(1, 0, 0, 0),
						AnchorPoint = Vector2.new(1, 0),
						RichText = true,
						BackgroundTransparency = 1,
						TextColor3 = Color,
						Font = BodyFont,
						[RoactModule.Event.MouseEnter] = p1.MouseEnterLink,
						[RoactModule.Event.MouseLeave] = p1.MouseLeaveLink,
						[RoactModule.Event.Activated] = p1.LinkActivated
					})
				})
			})
		end)
	end)
end

return (RoactServices.connect({ authAnalytics = RoactAnalyticsAuthEventsModule })(ContactInfoField))