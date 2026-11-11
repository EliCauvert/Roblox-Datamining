local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local ReactModule = require(CorePackages.Packages.React)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local WithStyleFunction = UIBloxModule.Style.withStyle
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local LinkButton = UIBloxModule.App.Button.LinkButton
local PartialPageModal = UIBloxModule.App.Dialog.Modal.PartialPageModal
local GetPartialPageModalMiddleContentWidthFunction = UIBloxModule.App.Dialog.Modal.getPartialPageModalMiddleContentWidth
local AuthCommonModule = require(CorePackages.Workspace.Packages.AuthCommon)
local AuthStatefulRoundCornerBorder = AuthCommonModule.Components.AuthStatefulRoundCornerBorder
local TextInputBoxWithBorder = AuthCommonModule.Components.TextInputBoxWithBorder
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local GetImageDataFunction = require(CorePackages.Workspace.Packages.RobloxAppAssets).GetImageData
local FoundationModule = require(CorePackages.Packages.Foundation)
local UseTokens = FoundationModule.Hooks.useTokens
local CryoModule = require(CorePackages.Packages.Cryo)
local FitChildrenModule = require(Modules.LuaApp.FitChildren)
local FitTextLabelModule = require(Modules.LuaApp.Components.FitTextLabel)
local GetFFlagEnableAuthsecImageUpdateFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableAuthsecImageUpdate
local UserInputService = game:GetService("UserInputService")
local EmailVerificationUpsellLinkModule = require(script.Parent.EmailVerificationUpsellLink)
local ExtendResult = RoactModule.PureComponent:extend(script.Name)
local Images = UIBloxModule.App.ImageSet.Images
local IconsGraphicLockXxlarge = Images["icons/graphic/lock_xxlarge"]
local IconSizeUDim2 = UIBloxModule.App.ImageSet.getIconSizeUDim2(UIBloxModule.App.ImageSet.Enum.IconSize.XLarge)
ExtendResult.defaultProps = {
	shouldShowPrivacyPolicyLink = function(): boolean
		return false
	end,
	primaryButtonType = ButtonType.PrimarySystem,
	secondaryButtonType = ButtonType.Secondary
}

function ExtendResult.init(p1)
	-- upvalues: CryoModule (copy), RoactModule (copy), EmailVerificationUpsellLinkModule (copy), FoundationModule (copy), AuthStatefulRoundCornerBorder (copy), ReactModule (copy), FitTextLabelModule (copy), FitChildrenModule (copy), TextInputBoxWithBorder (copy), GetFFlagEnableAuthsecImageUpdateFunction (copy), ImageSetLabel (copy), Images (copy), GetImageDataFunction (copy)
	p1.state = { onScreenKeyboardHeight = 0 }
	
	function p1.getLinks()
		-- upvalues: CryoModule (upval), p1 (copy), RoactModule (upval), EmailVerificationUpsellLinkModule (upval)
		return RoactModule.createFragment((CryoModule.List.map(p1.props.links, function(p2, LayoutOrder)
			-- upvalues: RoactModule (upval), EmailVerificationUpsellLinkModule (upval)
			return RoactModule.createElement(EmailVerificationUpsellLinkModule, {
				textKey = p2.textKey,
				layoutOrder = LayoutOrder,
				onActivatedCallback = p2.onClicked,
				isPrimaryLink = p2.isPrimaryLink
			})
		end)))
	end
	
	function p1.getEnvelopeIconImage(Name): string
		-- upvalues: FoundationModule (upval)
		return if Name == FoundationModule.Enums.Theme.Dark then "icons/graphic/envelope_dark" else "icons/graphic/envelope_light"
	end
	
	function p1.getButtonStackProps()
		-- upvalues: p1 (copy), CryoModule (upval)
		local JoinResult = {}
		local PrimaryButtonText = p1.props.primaryButtonText
		local SecondaryButtonText = p1.props.secondaryButtonText
		local OnPrimaryButtonActivated = p1.props.onPrimaryButtonActivated
		local OnSecondaryButtonActivated = p1.props.onSecondaryButtonActivated
		local PrimaryButtonType = p1.props.primaryButtonType
		local SecondaryButtonType = p1.props.secondaryButtonType
		local IsPrimaryButtonDisabled = p1.state.isPrimaryButtonDisabled
		
		if PrimaryButtonText then
			JoinResult = {
				{
					buttonType = PrimaryButtonType,
					props = {
						onActivated = OnPrimaryButtonActivated,
						text = PrimaryButtonText,
						isDisabled = IsPrimaryButtonDisabled
					}
				}
			}
		end
		if SecondaryButtonText then
			JoinResult = CryoModule.List.join({
				{
					buttonType = SecondaryButtonType,
					props = {
						onActivated = OnSecondaryButtonActivated,
						text = SecondaryButtonText
					}
				}
			}, JoinResult)
		end
		return {
			buttonHeight = 48,
			forcedFillDirection = Enum.FillDirection.Vertical,
			buttons = JoinResult
		}
	end
	
	function p1.getUpdatedModalMiddleContent(p2, XOffset)
		-- upvalues: p1 (copy), AuthStatefulRoundCornerBorder (upval), ReactModule (upval), FitTextLabelModule (upval), FitChildrenModule (upval), TextInputBoxWithBorder (upval), EmailVerificationUpsellLinkModule (upval)
		local ErrorMessage = p1.props.errorMessage
		local Default = AuthStatefulRoundCornerBorder.BorderState.Default
		
		return ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			ContentPadding = ReactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, 24) }),
			ListLayout = ReactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				Padding = UDim.new(0, 24)
			}),
			BodyText = ReactModule.createElement(FitTextLabelModule, {
				LayoutOrder = 2,
				BackgroundTransparency = 1,
				TextWrapped = true,
				Text = p1.props.bodyText,
				TextSize = p2.Font.Body.RelativeSize * p2.Font.BaseSize,
				TextColor3 = p2.Theme.TextDefault.Color,
				TextTransparency = p2.Theme.TextDefault.Transparency,
				Font = p2.Font.Body.Font,
				TextXAlignment = Enum.TextXAlignment.Left,
				fitAxis = FitChildrenModule.FitAxis.Height,
				Size = UDim2.new(0, XOffset, 0, 0)
			}),
			TextBox = p1.props.textInputType and ReactModule.createElement(TextInputBoxWithBorder, {
				textInputHeight = 48,
				layoutOrder = 3,
				textInputType = p1.props.textInputType,
				borderState = Default,
				textBarColor = p2.Theme.BackgroundMuted.Color,
				placeholderText = p1.props.textFieldPlaceholderText,
				placeholderTextColor = p2.Theme.TextMuted.Color,
				onChangeTextCallback = p1.props.onChangeTextCallback,
				onFocused = p1.props.onEmailFocused,
				labelText = p1.props.textFieldLabelText,
				labelTextColor = p2.Theme.TextDefault.Color,
				errorText = ErrorMessage and ErrorMessage ~= "" and ErrorMessage,
				Size = UDim2.new(1, 0, 0, 0)
			}),
			LegalLinks = if p1.props.shouldShowPrivacyPolicyLink() then ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 4,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				Padding = ReactModule.createElement("UIPadding", { PaddingBottom = UDim.new(0, 12) }),
				LinksList = ReactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					FillDirection = Enum.FillDirection.Horizontal,
					Padding = UDim.new(0, 24)
				}),
				TermsButton = ReactModule.createElement(EmailVerificationUpsellLinkModule, {
					isPrimaryLink = false,
					textPadding = 0,
					layoutOrder = 1,
					shouldUseAutomaticSize = true,
					textKey = p1.props.termsOfServiceLinkKey,
					onActivatedCallback = p1.props.onTermsOfServiceLinkActivated
				}),
				PrivacyPolicyButton = p1.props.shouldShowPrivacyPolicyLink() and ReactModule.createElement(EmailVerificationUpsellLinkModule, {
					isPrimaryLink = false,
					textPadding = 0,
					layoutOrder = 2,
					shouldUseAutomaticSize = true,
					textKey = p1.props.privacyPolicyLinkKey,
					onActivatedCallback = p1.props.onPrivacyPolicyLinkActivated
				})
			}) else nil,
			Links = p1.props.links and ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 5,
				Size = UDim2.new(1, 0, 0, #p1.props.links * 36)
			}, {
				LinksList = ReactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					Padding = UDim.new(0, 12)
				}),
				p1.getLinks()
			})
		})
	end
	
	function p1.getIcon(XOffset, YOffset, Size)
		-- upvalues: GetFFlagEnableAuthsecImageUpdateFunction (upval), RoactModule (upval), ImageSetLabel (upval), Images (upval), p1 (copy), GetImageDataFunction (upval)
		return if GetFFlagEnableAuthsecImageUpdateFunction() then RoactModule.createElement("Frame", {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			Size = UDim2.new(0, XOffset, 0, YOffset - Size)
		}, {
			Image = RoactModule.createElement(ImageSetLabel, {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.new(0.5, 0, 0.5, 0),
				Size = UDim2.new(0, XOffset, 0, YOffset),
				ScaleType = Enum.ScaleType.Fit,
				Image = Images[p1.getEnvelopeIconImage(p1.props.tokens.Config.ColorMode.Name)]
			})
		}) else RoactModule.createElement(ImageSetLabel, {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			Size = UDim2.new(0, 100, 0, 100),
			ScaleType = Enum.ScaleType.Fit,
			Image = GetImageDataFunction("LuaApp/graphic/verificationUpsellModal") or "LuaApp/graphic/verificationUpsellModal"
		})
	end
end

function ExtendResult.didMount(p1)
	-- upvalues: UserInputService (copy)
	p1.keyboardVisibleChanged = UserInputService:GetPropertyChangedSignal("OnScreenKeyboardVisible"):connect(function()
		-- upvalues: UserInputService (upval), p1 (copy)
		p1:setState({
			onScreenKeyboardHeight = UserInputService.OnScreenKeyboardVisible and UserInputService.OnScreenKeyboardSize.Y or 0
		})
	end)
end

function ExtendResult.willUnmount(p1)
	if p1.keyboardVisibleChanged then
		p1.keyboardVisibleChanged:disconnect()
	end
	p1.keyboardVisibleChanged = nil
end

function ExtendResult.render(p1)
	-- upvalues: GetPartialPageModalMiddleContentWidthFunction (copy), AuthStatefulRoundCornerBorder (copy), WithStyleFunction (copy), RoactModule (copy), PartialPageModal (copy), FitChildrenModule (copy), ImageSetLabel (copy), IconSizeUDim2 (copy), IconsGraphicLockXxlarge (copy), FitTextLabelModule (copy), TextInputBoxWithBorder (copy), LinkButton (copy)
	local ScreenSize = p1.props.screenSize
	local PartialPageModalMiddleContentWidth = GetPartialPageModalMiddleContentWidthFunction(ScreenSize.X)
	local IsOnScreenKeyboardHeightAbove = p1.state.onScreenKeyboardHeight > 0
	local ScaledSize = p1.props.tokens.Size.Size_2000 * 4
	local ScaledSize1 = p1.props.tokens.Size.Size_2200 * 2
	local Size1200 = p1.props.tokens.Size.Size_1200
	local Title = p1.props.title
	local BodyText = p1.props.bodyText
	local TextInputType = p1.props.textInputType
	local TextFieldLabelText = p1.props.textFieldLabelText
	local TextFieldPlaceholderText = p1.props.textFieldPlaceholderText
	local ErrorMessage = p1.props.errorMessage
	local Links = p1.props.links
	local OnEmailFocused = p1.props.onEmailFocused
	local OnChangeTextCallback = p1.props.onChangeTextCallback
	local OnCloseClickedCallback = p1.props.onCloseClickedCallback
	local IsEmailModalCalledFromHomePage = p1.props.isEmailModalCalledFromHomePage
	local IsNotErrorMessageMatch: boolean = ErrorMessage and ErrorMessage ~= ""
	local Error = if IsNotErrorMessageMatch then AuthStatefulRoundCornerBorder.BorderState.Error else AuthStatefulRoundCornerBorder.BorderState.Default
	
	return WithStyleFunction(function(p2)
		-- upvalues: RoactModule (upval), PartialPageModal (upval), Title (copy), ScreenSize (copy), IsOnScreenKeyboardHeightAbove (copy), p1 (copy), OnCloseClickedCallback (copy), PartialPageModalMiddleContentWidth (copy), FitChildrenModule (upval), IsEmailModalCalledFromHomePage (copy), ImageSetLabel (upval), IconSizeUDim2 (upval), IconsGraphicLockXxlarge (upval), ScaledSize (copy), ScaledSize1 (copy), Size1200 (copy), FitTextLabelModule (upval), BodyText (copy), TextInputType (copy), TextInputBoxWithBorder (upval), Error (ref), TextFieldPlaceholderText (copy), OnChangeTextCallback (copy), OnEmailFocused (copy), TextFieldLabelText (copy), IsNotErrorMessageMatch (copy), ErrorMessage (copy), LinkButton (upval), Links (copy)
		return RoactModule.createElement(PartialPageModal, {
			title = Title,
			screenSize = ScreenSize,
			position = IsOnScreenKeyboardHeightAbove and UDim2.new(0.5, 0, 1, -p1.state.onScreenKeyboardHeight) or nil,
			anchorPoint = IsOnScreenKeyboardHeightAbove and Vector2.new(0.5, 1) or nil,
			buttonStackProps = p1.getButtonStackProps(),
			onCloseClicked = OnCloseClickedCallback
		}, {
			Middle = if p1.props.useUpdatedModalDesign then p1.getUpdatedModalMiddleContent(p2, PartialPageModalMiddleContentWidth) else RoactModule.createElement(FitChildrenModule.FitFrame, {
				BackgroundTransparency = 1,
				fitAxis = FitChildrenModule.FitAxis.Height,
				Size = UDim2.new(1, 0, 0, 0)
			}, {
				ContentPadding = RoactModule.createElement("UIPadding", {
					PaddingTop = UDim.new(0, 24),
					PaddingBottom = UDim.new(0, 24)
				}),
				ListLayout = RoactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					Padding = UDim.new(0, 24)
				}),
				UIBloxLockImage = IsEmailModalCalledFromHomePage and RoactModule.createElement(ImageSetLabel, {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					ImageTransparency = 0,
					Size = IconSizeUDim2,
					ScaleType = Enum.ScaleType.Fit,
					Image = IconsGraphicLockXxlarge,
					ImageColor3 = p2.Theme.UIEmphasis.Color
				}),
				Icon = not IsEmailModalCalledFromHomePage and p1.getIcon(ScaledSize, ScaledSize1, Size1200),
				BodyText = RoactModule.createElement(FitTextLabelModule, {
					LayoutOrder = 2,
					BackgroundTransparency = 1,
					TextWrapped = true,
					Text = BodyText,
					TextSize = p2.Font.Body.RelativeSize * p2.Font.BaseSize,
					TextColor3 = p2.Theme.TextDefault.Color,
					TextTransparency = p2.Theme.TextDefault.Transparency,
					Font = p2.Font.Body.Font,
					TextXAlignment = Enum.TextXAlignment.Center,
					fitAxis = FitChildrenModule.FitAxis.Height,
					Size = UDim2.new(0, PartialPageModalMiddleContentWidth, 0, 0)
				}),
				TextBox = TextInputType and RoactModule.createElement(TextInputBoxWithBorder, {
					textInputHeight = 36,
					layoutOrder = 3,
					textInputType = TextInputType,
					borderState = Error,
					placeholderText = TextFieldPlaceholderText,
					onChangeTextCallback = OnChangeTextCallback,
					onFocused = OnEmailFocused,
					labelText = TextFieldLabelText,
					errorText = IsNotErrorMessageMatch and ErrorMessage,
					Size = UDim2.new(1, 0, 0, 0)
				}),
				PrivacyPolicyButton = p1.props.shouldShowPrivacyPolicyLink() and RoactModule.createElement(LinkButton, {
					layoutOrder = 4,
					fontStyle = "CaptionBody",
					text = p1.props.privacyPolicyLinkText,
					onActivated = p1.props.onPrivacyPolicyLinkActivated
				}),
				Links = Links and RoactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 5,
					Size = UDim2.new(1, 0, 0, #Links * 36)
				}, {
					LinksList = RoactModule.createElement("UIListLayout", {
						SortOrder = Enum.SortOrder.LayoutOrder,
						HorizontalAlignment = Enum.HorizontalAlignment.Center,
						Padding = UDim.new(0, 12)
					}),
					TopPadding = RoactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, 24) }),
					p1.getLinks()
				})
			})
		})
	end)
end

local v1 = RoactRoduxModule.connect(function(p1, _)
	return { screenSize = p1.ScreenSize }
end)(ExtendResult)

return function(p1)
	-- upvalues: UseTokens (copy), ReactModule (copy), v1 (copy), CryoModule (copy)
	return ReactModule.createElement(v1, CryoModule.Dictionary.join(p1, { tokens = UseTokens() }))
end