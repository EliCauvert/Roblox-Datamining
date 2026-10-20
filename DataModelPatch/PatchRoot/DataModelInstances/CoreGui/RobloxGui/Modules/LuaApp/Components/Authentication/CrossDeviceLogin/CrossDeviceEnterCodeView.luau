local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local Players = game:GetService("Players")
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactModule = require(CorePackages.Packages.Roact)
local ReactModule = require(CorePackages.Packages.React)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local WithStyleFunction = UIBloxModule.Style.withStyle
local WithLocalizationModule = require(Modules.LuaApp.withLocalization)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local FoundationModule = require(CorePackages.Packages.Foundation)
local Image = FoundationModule.Image
local UseTokens = FoundationModule.Hooks.useTokens
local View = FoundationModule.View
local Text = FoundationModule.Text
local TextInput = FoundationModule.TextInput
local InputSize = FoundationModule.Enums.InputSize
local Text1 = require(CorePackages.Workspace.Packages.AppCommonLib).Text
local UseDesignTokens = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local CrossDeviceLoginModule = require(Modules.LuaApp.Thunks.Authentication.CrossDeviceLogin)
local RoactAnalyticsAuthEventsModule = require(Modules.LuaApp.Services.RoactAnalyticsAuthEvents)
local EventStreamConstantsModule = require(Modules.LuaApp.EventStreamConstants)
local GetIXPLayerParametersModule = require(Modules.LuaApp.Http.Requests.GetIXPLayerParameters)
local GetFFlagEnableCrossDeviceLoginUsingQRCodesModule = require(Modules.LuaApp.Flags.GetFFlagEnableCrossDeviceLoginUsingQRCodes)
local GetFFlagEnableCrossDeviceEnterCodeRefreshModule = require(Modules.LuaApp.Flags.GetFFlagEnableCrossDeviceEnterCodeRefresh)
local FitChildrenModule = require(Modules.LuaApp.FitChildren)
local FitTextLabelModule = require(Modules.LuaApp.Components.FitTextLabel)
local ReportCrossDeviceEnterCodeClickModule = require(Modules.LuaApp.Components.Authentication.CrossDeviceLogin.reportCrossDeviceEnterCodeClick)
local AuthCommonModule = require(CorePackages.Workspace.Packages.AuthCommon)
local TextInputBoxWithBorder = AuthCommonModule.Components.TextInputBoxWithBorder
local AuthStatefulRoundCornerBorder = AuthCommonModule.Components.AuthStatefulRoundCornerBorder
local Button = UIBloxModule.App.Button.Button
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local CrossDevicePhoneLayoutModule = require(Modules.LuaApp.Components.Authentication.CrossDeviceLogin.CrossDevicePhoneLayout)
local CrossDeviceTabletLayoutModule = require(Modules.LuaApp.Components.Authentication.CrossDeviceLogin.CrossDeviceTabletLayout)
local LoggerModule = require(Modules.LuaApp.Components.Authentication.Logger)
local GetFFlagEnableAuthsecImageUpdateFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableAuthsecImageUpdate
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local IconsGraphicLockXxlarge = UIBloxModule.App.ImageSet.Images["icons/graphic/lock_xxlarge"]

local function _(Text: string)
	return Text:gsub("[^%w]", ""):upper():sub(1, 6)
end

local _ = function()
	-- upvalues: Players (copy)
	local LocalPlayer = Players.LocalPlayer
	
	if LocalPlayer then
		local DisplayName = LocalPlayer.DisplayName
		
		return if DisplayName and DisplayName ~= "" then DisplayName else LocalPlayer.Name
	else
		return "Player"
	end
end

local _ = function(Text: string)
	return Text:gsub("&", "&amp;"):gsub("<", "&lt;"):gsub(">", "&gt;")
end

local CrossDeviceEnterCodePage = RoactModule.PureComponent:extend("CrossDeviceEnterCodePage")

function CrossDeviceEnterCodePage.init(p1)
	-- upvalues: FoundationModule (copy), LoggerModule (copy), GetFFlagEnableCrossDeviceLoginUsingQRCodesModule (copy), GetFFlagEnableCrossDeviceEnterCodeRefreshModule (copy), ReportCrossDeviceEnterCodeClickModule (copy), RoactModule (copy)
	p1.latestSanitizedCode = ""
	p1:setState({
		inputCode = "",
		inputErrorKey = "",
		placeholderTextOverride = "",
		disableSubmissionForBadCode = false,
		isConfirming = false,
		isFocused = false
	})
	
	function p1.onFocus()
		-- upvalues: p1 (copy)
		p1:setState({ inputErrorKey = "", isFocused = true })
	end
	
	function p1:onFocusLost(p2)
		-- upvalues: p1 (copy)
		if p2 and #p1.state.inputCode == 6 then
			p1.confirmButtonPressed()
			
			return
		else
			p1:setState({ isFocused = false })
		end
	end
	
	function p1.getVerifyCodeImage(Name): string
		-- upvalues: FoundationModule (upval)
		return if Name == FoundationModule.Enums.Theme.Dark then "icons/graphic/verifyCode_dark" else "icons/graphic/verifyCode_light"
	end
	
	function p1.onTextChanged(p2)
		-- upvalues: p1 (copy), LoggerModule (upval)
		local Success, Result = pcall(function()
			-- upvalues: p2 (copy), p1 (upval)
			local Segment = p2.Text:gsub("[^%w]", ""):upper():sub(1, 6)
			
			if Segment == p2.Text then
				p1:setState({ inputCode = p2.Text })
				
				return
			else
				p2.Text = Segment
			end
		end)
		
		if not Success then
			LoggerModule:warning(string.format("Text validation error in CrossDeviceEnderCodeView: %s", (tostring(Result))))
		end
	end
	
	function p1.onRefreshCodeChanged(Text)
		-- upvalues: p1 (copy), LoggerModule (upval)
		local Success, Result = pcall(function()
			-- upvalues: Text (copy), p1 (upval)
			local Segment = Text:gsub("[^%w]", ""):upper():sub(1, 6)
			p1.latestSanitizedCode = Segment
			p1.setInputText(Segment)
			p1:setState({ inputCode = Segment })
		end)
		
		if not Success then
			LoggerModule:warning(string.format("Text validation error in CrossDeviceEnderCodeView: %s", (tostring(Result))))
		end
	end
	
	p1.attemptDeeplinkCode = true
	p1.confirmingCode = false
	
	function p1.confirmButtonPressed()
		-- upvalues: p1 (copy), GetFFlagEnableCrossDeviceLoginUsingQRCodesModule (upval), GetFFlagEnableCrossDeviceEnterCodeRefreshModule (upval), ReportCrossDeviceEnterCodeClickModule (upval)
		if not p1.confirmingCode then
			p1.confirmingCode = true
			p1:setState({ isConfirming = true, isFocused = false })
			local InputCode = nil
			local v1 = nil
			
			if GetFFlagEnableCrossDeviceLoginUsingQRCodesModule() and p1.attemptDeeplinkCode and p1.props.code then
				InputCode = p1.props.code
				v1 = "qrCode"
			else
				InputCode = p1.state.inputCode
				v1 = "alphaNumericCode"
			end
			if GetFFlagEnableCrossDeviceEnterCodeRefreshModule() and v1 == "alphaNumericCode" then
				InputCode = p1.latestSanitizedCode
			end
			p1.attemptDeeplinkCode = false
			ReportCrossDeviceEnterCodeClickModule(p1.props.authAnalytics, v1)
			p1.props.validateCode(p1.props.networking, InputCode):andThen(function(Result)
				-- upvalues: p1 (upval), InputCode (ref)
				p1.acceptInputCode(InputCode, Result.DeviceInfo)
			end, p1.clearInputCode)
		end
	end
	
	p1.inputText, p1.setInputText = RoactModule.createBinding("")
	
	function p1.clearInputCode(p2)
		-- upvalues: p1 (copy)
		p1.confirmingCode = false
		p1.latestSanitizedCode = ""
		p1.setInputText("")
		p1:setState({
			inputCode = "",
			isConfirming = false,
			inputErrorKey = if p2.Body == "\"CodeInvalid\"" then "Authentication.CrossDevice.Response.InvalidCode" elseif p2.Body == "\"InvalidLocation\"" then "Authentication.CrossDevice.Label.InvalidLocationError" else "Authentication.Login.Response.SomethingWentWrong"
		})
	end
	
	function p1.acceptInputCode(Code, DeviceInfo)
		-- upvalues: p1 (copy)
		if p1.props.confirmDeviceCode then
			p1.props.confirmDeviceCode(Code, DeviceInfo)
		end
	end
end

function CrossDeviceEnterCodePage.didMount(p1)
	-- upvalues: EventStreamConstantsModule (copy), GetIXPLayerParametersModule (copy)
	if p1.props.code then
		local Segment = p1.props.code:gsub("[^%w]", ""):upper():sub(1, 6)
		p1.setInputText(Segment)
		p1.latestSanitizedCode = Segment
		p1:setState({ inputCode = Segment })
		p1.confirmButtonPressed()
	end
	p1.isMounted = true
	p1.props.authAnalytics.reportScreenLoaded(EventStreamConstantsModule.Context.QuickLogin)
	GetIXPLayerParametersModule(p1.props.networking, "PlayerApp.CrossDeviceLogin.ConfirmCode", { "HintTextOverride" }):andThen(function(Result)
		-- upvalues: p1 (copy)
		local ResponseBody = Result and Result.responseBody
		
		if ResponseBody and p1.isMounted then
			p1:setState({
				placeholderTextOverride = ResponseBody.HintTextOverride or "",
				disableSubmissionForBadCode = ResponseBody.ShouldDisableSubmissionForBadCode or false
			})
		end
	end, function() end)
end

function CrossDeviceEnterCodePage.willUnmount(p1)
	p1.isMounted = false
end

function CrossDeviceEnterCodePage.renderEnterCodeRefresh(p1, Style, p2, _)
	-- upvalues: WithLocalizationModule (copy), Text1 (copy), Players (copy), RoactModule (copy), View (copy), Text (copy), TextInput (copy), InputSize (copy), Button (copy), ButtonType (copy)
	return WithLocalizationModule({
		refreshHeadline = "Authentication.CrossDevice.Heading.SigninAnotherDevice",
		refreshIntro = "Authentication.CrossDevice.Label.SigninInstructionHeading",
		refreshStep1 = "Authentication.CrossDevice.Label.SigninInstructionOne",
		refreshStep2 = "Authentication.CrossDevice.Label.SigninInstructionTwo",
		refreshStep3 = "Authentication.CrossDevice.Label.SigninInstructionThree",
		refreshSecurityFooter = "Authentication.CrossDevice.Label.QuickSignInWarning",
		refreshContinue = "Authentication.CrossDevice.Label.Continue",
		refreshPlaceholder = "Authentication.CrossDevice.Label.EnterCodeTextBox"
	})(function(p3)
		-- upvalues: p1 (copy), Style (copy), Text1 (upval), Players (upval), RoactModule (upval), View (upval), Text (upval), TextInput (upval), InputSize (upval), Button (upval), ButtonType (upval), p2 (copy)
		local InputCode = p1.state.inputCode
		local IsInputErrorKeyMatch = p1.state.inputErrorKey == ""
		local IsConfirming = p1.state.isConfirming
		local DesignTokens = p1.props.designTokens
		local BodyTextColorColor3 = DesignTokens.LuaApps.CrossDeviceLogin.bodyTextColor.Color3
		local Transparency = DesignTokens.LuaApps.CrossDeviceLogin.headerTextColor.Transparency
		local TextAlertColorColor3 = DesignTokens.LuaApps.CrossDeviceLogin.textAlertColor.Color3
		local RefreshContinue = p3.refreshContinue
		local NewTextWidth = Text1.GetTextWidth(RefreshContinue, DesignTokens.LuaApps.CrossDeviceLogin.bodyFont.Font, Style.Font.BaseSize) + p1.props.tokens.Padding.Medium * 2
		local RefreshIntro: string = p3.refreshIntro
		local v1 = "{username}"
		local v2 = "<b>"
		local LocalPlayer = Players.LocalPlayer
		local Text2 = nil
		
		if LocalPlayer then
			local DisplayName = LocalPlayer.DisplayName
			Text2 = if DisplayName and DisplayName ~= "" then DisplayName else LocalPlayer.Name
		else
			Text2 = "Player"
		end
		local Replaced = RefreshIntro:gsub(v1, v2 .. Text2:gsub("&", "&amp;"):gsub("<", "&lt;"):gsub(">", "&gt;") .. "</b>")
		local TextStyle = {
			Color3 = TextAlertColorColor3,
			Transparency = Transparency
		}
		local Space150 = DesignTokens.Global.Space_150
		local KeyboardOffset = p1.props.keyboardOffset or 0
		
		return RoactModule.createElement(View, {
			tag = "col align-x-left gap-xsmall size-full-0 auto-y",
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			Position = if KeyboardOffset > 0 then UDim2.new(0, 0, 0, -KeyboardOffset) else nil,
			padding = { left = UDim.new(0, 0), right = UDim.new(0, 0) }
		}, {
			CopyBlock = RoactModule.createElement(View, {
				tag = "col align-x-left gap-xsmall size-full-0 auto-y",
				LayoutOrder = 1,
				BackgroundTransparency = 1,
				padding = { bottom = UDim.new(0, Space150) }
			}, {
				HeadlineWrap = RoactModule.createElement(View, {
					tag = "col size-full-0 auto-y",
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					padding = { bottom = UDim.new(0, Space150) }
				}, {
					Headline = RoactModule.createElement(Text, {
						tag = "size-full-0 auto-xy text-heading-small text-wrap text-align-x-left",
						LayoutOrder = 1,
						TextWrapped = true,
						Text = p3.refreshHeadline
					})
				}),
				Intro = RoactModule.createElement(Text, {
					tag = "size-full-0 auto-xy text-body-medium text-wrap text-align-x-left",
					LayoutOrder = 2,
					RichText = true,
					TextWrapped = true,
					Text = Replaced
				}),
				StepsIndent = RoactModule.createElement(View, {
					tag = "col gap-xxsmall size-full-0 auto-y",
					LayoutOrder = 3,
					BackgroundTransparency = 1,
					padding = { left = UDim.new(0, 18) }
				}, {
					Step1 = RoactModule.createElement(Text, {
						tag = "size-full-0 auto-xy text-body-medium text-wrap text-align-x-left",
						LayoutOrder = 1,
						TextWrapped = true,
						Text = p3.refreshStep1
					}),
					Step2 = RoactModule.createElement(Text, {
						tag = "size-full-0 auto-xy text-body-medium text-wrap text-align-x-left",
						LayoutOrder = 2,
						TextWrapped = true,
						Text = p3.refreshStep2
					}),
					Step3 = RoactModule.createElement(Text, {
						tag = "size-full-0 auto-xy text-body-medium text-wrap text-align-x-left",
						LayoutOrder = 3,
						TextWrapped = true,
						Text = p3.refreshStep3
					})
				})
			}),
			InputRow = RoactModule.createElement(View, {
				tag = "row items-stretch gap-small size-full-0 auto-y",
				LayoutOrder = 2,
				BackgroundTransparency = 1,
				padding = { bottom = UDim.new(0, Space150) }
			}, {
				InputWrap = RoactModule.createElement(View, {
					tag = "grow auto-y",
					LayoutOrder = 1,
					BackgroundTransparency = 1
				}, {
					CodeField = RoactModule.createElement(TextInput, {
						LayoutOrder = 1,
						label = "",
						text = p1.inputText,
						onChanged = p1.onRefreshCodeChanged,
						placeholder = if p1.state.placeholderTextOverride == "" then p3.refreshPlaceholder else p1.state.placeholderTextOverride or p3.refreshPlaceholder,
						width = UDim.new(1, 0),
						hasError = not IsInputErrorKeyMatch,
						size = InputSize.Medium,
						ref = p1.props.codeFieldRef,
						onFocusGained = p1.onFocus,
						onFocusLost = function()
							-- upvalues: p1 (upval)
							p1:setState({ isFocused = false })
						end,
						onReturnPressed = function()
							-- upvalues: p1 (upval)
							if #p1.state.inputCode == 6 then
								p1.confirmButtonPressed()
							end
						end
					})
				}),
				ContinueButtonWrap = RoactModule.createElement(View, {
					tag = "col",
					LayoutOrder = 2,
					BackgroundTransparency = 1,
					Size = UDim2.new(0, NewTextWidth, 0, p1.props.tokens.Size.Size_1000)
				}, {
					ContinueButton = RoactModule.createElement(Button, {
						buttonType = ButtonType.PrimarySystem,
						size = UDim2.new(1, 0, 1, 0),
						text = RefreshContinue,
						isDisabled = p1.state.disableSubmissionForBadCode and #InputCode < 6 or InputCode == "",
						isLoading = IsConfirming,
						onActivated = p1.confirmButtonPressed,
						[RoactModule.Ref] = p1.props.continueButtonRef
					})
				})
			}),
			InputError = if IsInputErrorKeyMatch then nil else RoactModule.createElement(View, {
				tag = "col size-full-0 auto-y",
				LayoutOrder = 4,
				BackgroundTransparency = 1,
				padding = { bottom = UDim.new(0, Space150) }
			}, {
				ErrorText = RoactModule.createElement(Text, {
					tag = "size-full-0 auto-xy text-body-small text-wrap text-align-x-left",
					LayoutOrder = 1,
					TextWrapped = true,
					Text = p2.inputError,
					textStyle = TextStyle
				})
			}) or nil,
			SecurityFooter = RoactModule.createElement(Text, {
				tag = "size-full-0 auto-xy text-body-small text-wrap text-align-x-left",
				LayoutOrder = 6,
				TextWrapped = true,
				Text = p3.refreshSecurityFooter,
				textStyle = {
					Color3 = BodyTextColorColor3,
					Transparency = Transparency
				}
			})
		})
	end)
end

function CrossDeviceEnterCodePage.render(p1)
	-- upvalues: WithStyleFunction (copy), WithLocalizationModule (copy), GetFFlagEnableCrossDeviceEnterCodeRefreshModule (copy), RoactModule (copy), CrossDeviceTabletLayoutModule (copy), CrossDevicePhoneLayoutModule (copy), GetFFlagEnableAuthsecImageUpdateFunction (copy), Image (copy), ImageSetLabel (copy), IconsGraphicLockXxlarge (copy), FitChildrenModule (copy), FitTextLabelModule (copy), TextInputBoxWithBorder (copy), AuthStatefulRoundCornerBorder (copy), Button (copy), ButtonType (copy), Text1 (copy)
	local IsWideView = p1.props.isWideView
	local InputCode = p1.state.inputCode
	local IsInputErrorKeyMatch = p1.state.inputErrorKey == ""
	local IsConfirming = p1.state.isConfirming
	local IsFocused = p1.state.isFocused
	
	return WithStyleFunction(function(Style)
		-- upvalues: WithLocalizationModule (upval), IsInputErrorKeyMatch (copy), p1 (copy), IsWideView (copy), GetFFlagEnableCrossDeviceEnterCodeRefreshModule (upval), RoactModule (upval), CrossDeviceTabletLayoutModule (upval), CrossDevicePhoneLayoutModule (upval), GetFFlagEnableAuthsecImageUpdateFunction (upval), Image (upval), ImageSetLabel (upval), IconsGraphicLockXxlarge (upval), FitChildrenModule (upval), FitTextLabelModule (upval), TextInputBoxWithBorder (upval), AuthStatefulRoundCornerBorder (upval), IsFocused (copy), Button (upval), ButtonType (upval), IsConfirming (copy), InputCode (copy), Text1 (upval)
		return WithLocalizationModule({
			tabletHeader = "Authentication.CrossDevice.Heading.LoginAnotherDevice",
			warningHeader = "Authentication.CrossDevice.Heading.LoginWarning",
			warning1 = "Authentication.CrossDevice.Label.Warning1",
			warning2 = "Authentication.CrossDevice.Label.Warning2",
			placeholderText = "Authentication.CrossDevice.Label.EnterOtherDeviceCode",
			enter = "Authentication.CrossDevice.Action.Enter",
			inputError = if IsInputErrorKeyMatch then nil else p1.state.inputErrorKey or nil
		})(function(p2)
			-- upvalues: p1 (upval), IsWideView (upval), Style (copy), GetFFlagEnableCrossDeviceEnterCodeRefreshModule (upval), RoactModule (upval), CrossDeviceTabletLayoutModule (upval), CrossDevicePhoneLayoutModule (upval), GetFFlagEnableAuthsecImageUpdateFunction (upval), Image (upval), ImageSetLabel (upval), IconsGraphicLockXxlarge (upval), FitChildrenModule (upval), FitTextLabelModule (upval), TextInputBoxWithBorder (upval), IsInputErrorKeyMatch (upval), AuthStatefulRoundCornerBorder (upval), IsFocused (upval), Button (upval), ButtonType (upval), IsConfirming (upval), InputCode (upval), Text1 (upval)
			local DesignTokens = p1.props.designTokens
			local ScaledSize = IsWideView and p1.props.tokens.Size.Size_2000 * 2 or p1.props.tokens.Size.Size_2000 * 4
			local Size2200 = IsWideView and p1.props.tokens.Size.Size_2200 or p1.props.tokens.Size.Size_2200 * 2
			local Size350 = if IsWideView then 0 else p1.props.tokens.Size.Size_350 or 0
			local _UDim2 = UDim2.fromOffset(DesignTokens.LuaApps.CrossDeviceLogin.iconSize, DesignTokens.LuaApps.CrossDeviceLogin.iconSize)
			local HeaderFontFont = DesignTokens.LuaApps.CrossDeviceLogin.headerFont.Font
			local FontSize = DesignTokens.LuaApps.CrossDeviceLogin.headerFont.FontSize
			local HeaderTextColorColor3 = DesignTokens.LuaApps.CrossDeviceLogin.headerTextColor.Color3
			local HeaderPadding = DesignTokens.LuaApps.CrossDeviceLogin.headerPadding
			local BodyFontFont = DesignTokens.LuaApps.CrossDeviceLogin.bodyFont.Font
			local FontSize1 = DesignTokens.LuaApps.CrossDeviceLogin.bodyFont.FontSize
			local BodyTextColorColor3 = DesignTokens.LuaApps.CrossDeviceLogin.bodyTextColor.Color3
			local Transparency = DesignTokens.LuaApps.CrossDeviceLogin.headerTextColor.Transparency
			local TextAlertFontFont = DesignTokens.LuaApps.CrossDeviceLogin.textAlertFont.Font
			local FontSize2 = DesignTokens.LuaApps.CrossDeviceLogin.textAlertFont.FontSize
			local TextAlertColorColor3 = DesignTokens.LuaApps.CrossDeviceLogin.textAlertColor.Color3
			local BaseSize = Style.Font.BaseSize
			local PlaceholderText = if p1.state.placeholderTextOverride == "" then p2.placeholderText else p1.state.placeholderTextOverride or p2.placeholderText
			
			return if GetFFlagEnableCrossDeviceEnterCodeRefreshModule() then p1:renderEnterCodeRefresh(Style, p2, IsWideView) else RoactModule.createElement(IsWideView and CrossDeviceTabletLayoutModule or CrossDevicePhoneLayoutModule, {
				TabletHeaderText = p2.tabletHeader,
				Style = Style,
				HighKeyboardMode = p1.props.highKeyboardMode,
				Icon = GetFFlagEnableAuthsecImageUpdateFunction() and RoactModule.createElement("Frame", {
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					Size = IsWideView and _UDim2 or UDim2.new(0, ScaledSize, 0, Size2200 - Size350)
				}, {
					Image = RoactModule.createElement(Image, {
						Image = p1.getVerifyCodeImage(p1.props.tokens.Config.ColorMode.Name),
						ScaleType = Enum.ScaleType.Fit,
						Size = UDim2.new(0, ScaledSize, 0, Size2200),
						Position = UDim2.new(0.5, 0, 0.5, -Size350 / 2),
						AnchorPoint = Vector2.new(0.5, 0.5)
					})
				}) or RoactModule.createElement(ImageSetLabel, {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					ImageTransparency = 0,
					Size = _UDim2,
					ScaleType = Enum.ScaleType.Fit,
					Image = IconsGraphicLockXxlarge,
					ImageColor3 = Style.Theme.UIEmphasis.Color
				}),
				WarningText = RoactModule.createElement(FitChildrenModule.FitFrame, {
					LayoutOrder = 2,
					BackgroundTransparency = 1,
					Size = UDim2.new(1, -20, 0, 0),
					fitAxis = FitChildrenModule.FitAxis.Height
				}, {
					Align = RoactModule.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Vertical,
						HorizontalAlignment = Enum.HorizontalAlignment.Right,
						Padding = UDim.new(0, 6),
						SortOrder = Enum.SortOrder.LayoutOrder
					}),
					TopWarning = RoactModule.createElement(FitTextLabelModule, {
						LayoutOrder = 1,
						TextWrapped = true,
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 0, 0),
						Text = p2.warningHeader,
						Font = HeaderFontFont,
						TextSize = FontSize,
						TextColor3 = HeaderTextColorColor3,
						TextTransparency = Transparency,
						TextXAlignment = IsWideView and Enum.TextXAlignment.Left or Enum.TextXAlignment.Center,
						fitAxis = FitChildrenModule.FitAxis.Height
					}),
					Padding = RoactModule.createElement("Frame", {
						LayoutOrder = 2,
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 0, HeaderPadding)
					}),
					BulletPoint1 = RoactModule.createElement(FitTextLabelModule, {
						LayoutOrder = 3,
						TextWrapped = true,
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 0, 0),
						Text = p2.warning1,
						Font = BodyFontFont,
						TextSize = FontSize1,
						TextColor3 = BodyTextColorColor3,
						TextTransparency = Transparency,
						TextXAlignment = Enum.TextXAlignment.Left,
						fitAxis = FitChildrenModule.FitAxis.Height
					}),
					BulletPoint2 = RoactModule.createElement(FitTextLabelModule, {
						LayoutOrder = 4,
						TextWrapped = true,
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 0, 0),
						Text = p2.warning2,
						Font = BodyFontFont,
						TextSize = FontSize1,
						TextColor3 = BodyTextColorColor3,
						TextTransparency = Transparency,
						TextXAlignment = Enum.TextXAlignment.Left,
						fitAxis = FitChildrenModule.FitAxis.Height
					})
				}),
				InputBox = RoactModule.createElement(TextInputBoxWithBorder, {
					layoutOrder = 3,
					placeholderText = PlaceholderText,
					borderState = (if IsInputErrorKeyMatch then IsFocused and AuthStatefulRoundCornerBorder.BorderState.Focused else AuthStatefulRoundCornerBorder.BorderState.Error or IsFocused and AuthStatefulRoundCornerBorder.BorderState.Focused) or AuthStatefulRoundCornerBorder.BorderState.Default,
					text = p1.inputText,
					onFocused = p1.onFocus,
					onFocusLost = p1.onFocusLost,
					onChangeTextCallback = p1.onTextChanged
				}),
				InputWarning = not IsInputErrorKeyMatch and RoactModule.createElement(FitTextLabelModule, {
					LayoutOrder = 4,
					BackgroundTransparency = 1,
					TextWrapped = true,
					Size = UDim2.new(1, -6, 0, FontSize2),
					Position = UDim2.new(0, 3, 1, 3),
					Font = TextAlertFontFont,
					TextSize = FontSize2,
					TextColor3 = TextAlertColorColor3,
					TextTransparency = Transparency,
					TextXAlignment = Enum.TextXAlignment.Left,
					Text = p2.inputError,
					fitAxis = FitChildrenModule.FitAxis.Height
				}),
				ConfirmCodeButton = RoactModule.createElement(Button, {
					buttonType = ButtonType.PrimarySystem,
					size = UDim2.new(1, 0, 1, 0),
					text = p2.enter,
					[RoactModule.Ref] = p1.props.continueButtonRef,
					onActivated = p1.confirmButtonPressed,
					isLoading = IsConfirming,
					isDisabled = p1.state.disableSubmissionForBadCode and #InputCode < 6 or InputCode == ""
				}),
				ConfirmCodeButtonWidth = Text1.GetTextWidth(p2.enter, BodyFontFont, BaseSize) + 40
			})
		end)
	end)
end

local AppUserLayers = require(CorePackages.Workspace.Packages.ExperimentLayers).AppUserLayers
local v1 = RoactRoduxModule.connect(function(p1, _)
	return { screenSize = p1.ScreenSize }
end, function(Callback)
	-- upvalues: CrossDeviceLoginModule (copy)
	return {
		validateCode = function(p1, p2)
			-- upvalues: Callback (copy), CrossDeviceLoginModule (upval)
			return Callback(CrossDeviceLoginModule.EnterCode(p1, p2))
		end
	}
end)((RoactServices.connect({
	networking = RoactNetworkingModule,
	authAnalytics = RoactAnalyticsAuthEventsModule
})((require(CorePackages.Packages.RoactAppExperiment).connectUserLayer({ AppUserLayers.ExposureLayer, AppUserLayers.AccessLayer }, function(_, _)
	return {}
end)(CrossDeviceEnterCodePage)))))

return function(p1)
	-- upvalues: UseDesignTokens (copy), UseTokens (copy), ReactModule (copy), v1 (copy), CryoModule (copy)
	return ReactModule.createElement(v1, CryoModule.Dictionary.join(p1, { designTokens = UseDesignTokens(), tokens = UseTokens() }))
end