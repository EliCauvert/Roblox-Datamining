local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local FoundationModule = require(CorePackages.Packages.Foundation)
local IconSize = FoundationModule.Enums.IconSize
local Loading = FoundationModule.Loading
local TModule = require(CorePackages.Packages.t)
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local UseDesignTokensFunction = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local IconSizeUDim2 = UIBloxModule.App.ImageSet.getIconSizeUDim2(UIBloxModule.App.ImageSet.Enum.IconSize.XLarge)
local IconsGraphicDevicesXxlarge = UIBloxModule.App.ImageSet.Images["icons/graphic/devices_xxlarge"]
local InterfaceResult = TModule.interface({ DeviceCode = TModule.string, ShortLink = TModule.string })

return function(p1)
	-- upvalues: InterfaceResult (copy), UseDesignTokensFunction (copy), UseStyleFunction (copy), UseLocalizationFunction (copy), RoactModule (copy), ImageSetLabel (copy), IconSizeUDim2 (copy), IconsGraphicDevicesXxlarge (copy), Loading (copy), IconSize (copy)
	assert(InterfaceResult(p1))
	local UseDesignTokensResult = UseDesignTokensFunction()
	local LoginView = UseDesignTokensResult.LuaApps.LoginView
	local UseStyleResult = UseStyleFunction()
	local DeviceCode = p1.DeviceCode
	local TextEmphasis = UseStyleResult.Theme.TextEmphasis
	local TextMuted = UseStyleResult.Theme.TextMuted
	local IconDefault = UseStyleResult.Theme.IconDefault
	local UseLocalizationResult = UseLocalizationFunction({
		goToText = "Authentication.CrossDevice.GoToInstruction",
		enterCodeInstruction = "Authentication.CrossDevice.EnterCodeInstruction"
	})
	
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	}, {
		UIPadding = RoactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, LoginView.quickLinkCodeViewTopPadding),
			PaddingBottom = UDim.new(0, LoginView.quickLinkCodeViewBottomPadding)
		}),
		UIListLayout = RoactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			Padding = UDim.new(0, 0)
		}),
		DeviceIcon = RoactModule.createElement(ImageSetLabel, {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			Size = IconSizeUDim2,
			ScaleType = Enum.ScaleType.Fit,
			Image = IconsGraphicDevicesXxlarge,
			ImageColor3 = IconDefault.Color,
			ImageTransparency = IconDefault.Transparency
		}),
		InstructionsPadding = RoactModule.createElement("Frame", {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 4)
		}),
		InstructionTextGroup = RoactModule.createElement("Frame", {
			LayoutOrder = 3,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			UIListLayout = RoactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center
			}),
			GotToDeviceText = RoactModule.createElement("TextLabel", {
				RichText = false,
				TextWrapped = true,
				TextXAlignment = nil,
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Text = UseLocalizationResult.goToText,
				Font = UseDesignTokensResult.Typography.TitleLarge.Font,
				TextSize = UseDesignTokensResult.Typography.TitleLarge.FontSize,
				TextColor3 = TextMuted.Color,
				TextTransparency = TextMuted.Transparency,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, 0, 0, 0)
			}),
			LinkText = RoactModule.createElement("TextLabel", {
				RichText = true,
				TextWrapped = true,
				TextXAlignment = nil,
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				Text = p1.ShortLink,
				Font = UseDesignTokensResult.Typography.HeadingLarge.Font,
				TextSize = UseDesignTokensResult.Typography.HeadingLarge.FontSize,
				TextColor3 = TextEmphasis.Color,
				TextTransparency = TextEmphasis.Transparency,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, 0, 0, 0)
			})
		}),
		QuickLoginCodePadding = RoactModule.createElement("Frame", {
			LayoutOrder = 4,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 8)
		}),
		QuickLoginCodeGroup = RoactModule.createElement("Frame", {
			LayoutOrder = 5,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			UIListLayout = RoactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center
			}),
			GoToCodeText = RoactModule.createElement("TextLabel", {
				RichText = false,
				TextWrapped = true,
				TextXAlignment = nil,
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Text = UseLocalizationResult.enterCodeInstruction,
				Font = UseDesignTokensResult.Typography.BodyLarge.Font,
				TextSize = UseDesignTokensResult.Typography.BodyLarge.FontSize,
				TextColor3 = TextMuted.Color,
				TextTransparency = TextMuted.Transparency,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, 0, 0, 0)
			}),
			CodeDisplayPadding = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				Size = UDim2.new(1, 0, 0, 8)
			}),
			CodeDisplay = RoactModule.createElement("TextLabel", {
				LayoutOrder = 3,
				BackgroundTransparency = 0.7,
				TextXAlignment = nil,
				Text = DeviceCode,
				Font = UseDesignTokensResult.Typography.HeadingLarge.Font,
				TextSize = UseDesignTokensResult.Typography.HeadingLarge.FontSize,
				TextColor3 = TextEmphasis.Color,
				TextTransparency = TextEmphasis.Transparency,
				BackgroundColor3 = Color3.new(0, 0, 0),
				Size = UDim2.new(0, UseDesignTokensResult.Typography.HeadingLarge.FontSize * 6, 0, UseDesignTokensResult.Typography.HeadingLarge.FontSize * 1.5)
			}, {
				Spinner = DeviceCode == "" and RoactModule.createElement(Loading, {
					Position = UDim2.new(0.5, 0, 0.5, 0),
					size = IconSize.Small,
					AnchorPoint = Vector2.new(0.5, 0.5)
				}),
				UICorner = RoactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }),
				UIPadding = RoactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(LoginView.quickLinkCodeViewCodeBoxHorizontalPadding, 0),
					PaddingRight = UDim.new(LoginView.quickLinkCodeViewCodeBoxHorizontalPadding, 0),
					PaddingTop = UDim.new(0, LoginView.quickLinkCodeViewCodeBoxVertialPaddingb),
					PaddingBottom = UDim.new(0, LoginView.quickLinkCodeViewCodeBoxVertialPaddingb)
				})
			})
		})
	})
end