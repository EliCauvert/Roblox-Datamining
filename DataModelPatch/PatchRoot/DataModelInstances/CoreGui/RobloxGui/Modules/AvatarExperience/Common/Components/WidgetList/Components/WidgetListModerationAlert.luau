local CorePackages = game:GetService("CorePackages")
local UseDesignTokensFunction = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local ReactModule = require(CorePackages.Packages.React)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local FFlagRenameDeprecatedUIBloxTokens = require(CorePackages.Workspace.Packages.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local IconsStatusAlert = UIBloxModule.App.ImageSet.Images["icons/status/alert"]

local function mapTokens(p1)
	-- upvalues: FFlagRenameDeprecatedUIBloxTokens (copy)
	return {
		alertHeight = if FFlagRenameDeprecatedUIBloxTokens then p1.Size.Size_2600 else p1.Global.Size_1300,
		alertPadding = if FFlagRenameDeprecatedUIBloxTokens then p1.Size.Size_300 else p1.Global.Size_150,
		alertImageSize = if FFlagRenameDeprecatedUIBloxTokens then p1.Size.Size_900 else p1.Global.Size_450,
		cornerRadius = if FFlagRenameDeprecatedUIBloxTokens then p1.Radius.Medium else p1.Semantic.Radius.Medium,
		backgroundColor = if FFlagRenameDeprecatedUIBloxTokens then p1.Color.Surface.Surface_300 else p1.Semantic.Color.BackgroundUi.Default,
		alertTitleColor = if FFlagRenameDeprecatedUIBloxTokens then p1.Color.Content.Muted else p1.Semantic.Color.Text.Muted,
		alertMessageColor = if FFlagRenameDeprecatedUIBloxTokens then p1.Color.Content.Default else p1.Semantic.Color.Text.Default,
		alertTitleFont = if FFlagRenameDeprecatedUIBloxTokens then p1.Typography.TitleLarge else p1.Semantic.Typography.Subheader,
		alertMessageFont = if FFlagRenameDeprecatedUIBloxTokens then p1.Typography.BodyLarge else p1.Semantic.Typography.Body
	}
end

return function(_)
	-- upvalues: UseDesignTokensFunction (copy), mapTokens (copy), UseStyleFunction (copy), UseLocalizationFunction (copy), ReactModule (copy), ImageSetLabel (copy), IconsStatusAlert (copy)
	local UseDesignTokensResult = UseDesignTokensFunction(mapTokens)
	local UseStyleResult = UseStyleFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		alertTitle = "Feature.Avatar.Label.ModerationFailed",
		alertMessage = "Feature.Avatar.Message.ModerationFailed"
	})
	local Theme = UseStyleResult.Theme
	
	return ReactModule.createElement("Frame", {
		Size = UDim2.new(1, 0, 0, 0),
		BackgroundTransparency = UseDesignTokensResult.backgroundColor.Transparency,
		BackgroundColor3 = UseDesignTokensResult.backgroundColor.Color3,
		AutomaticSize = Enum.AutomaticSize.Y
	}, {
		UICornoer = ReactModule.createElement("UICorner", {
			CornerRadius = UDim.new(0, UseDesignTokensResult.cornerRadius)
		}),
		UIPadding = ReactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, UseDesignTokensResult.alertPadding),
			PaddingBottom = UDim.new(0, UseDesignTokensResult.alertPadding),
			PaddingLeft = UDim.new(0, UseDesignTokensResult.alertPadding),
			PaddingRight = UDim.new(0, UseDesignTokensResult.alertPadding)
		}),
		UIListLayout = ReactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, 8)
		}),
		LeftContent = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.new(0, UseDesignTokensResult.alertImageSize, 1, 0)
		}, {
			AlertImage = ReactModule.createElement(ImageSetLabel, {
				BackgroundTransparency = 1,
				Image = IconsStatusAlert,
				Size = UDim2.new(0, UseDesignTokensResult.alertImageSize, 0, UseDesignTokensResult.alertImageSize),
				ImageColor3 = Theme.IconDefault.Color,
				ImageTransparency = Theme.IconDefault.Transparency,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.new(0.5, 0, 0.5, 0)
			})
		}),
		RightContent = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.new(1, -1 * UseDesignTokensResult.alertImageSize, 1, 0)
		}, {
			UIPadding = ReactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, UseDesignTokensResult.alertPadding),
				PaddingBottom = UDim.new(0, UseDesignTokensResult.alertPadding),
				PaddingLeft = UDim.new(0, UseDesignTokensResult.alertPadding),
				PaddingRight = UDim.new(0, UseDesignTokensResult.alertPadding)
			}),
			UIListLayout = ReactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				Padding = UDim.new(0, UseDesignTokensResult.alertPadding)
			}),
			AlertTitle = ReactModule.createElement("TextLabel", {
				TextWrapped = true,
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Size = UDim2.new(1, 0, 0, 0),
				Text = UseLocalizationResult.alertTitle,
				TextSize = UseDesignTokensResult.alertTitleFont.FontSize,
				Font = UseDesignTokensResult.alertTitleFont.Font,
				TextColor3 = UseDesignTokensResult.alertTitleColor.Color3,
				AutomaticSize = Enum.AutomaticSize.Y,
				TextXAlignment = Enum.TextXAlignment.Left
			}),
			AlertMessage = ReactModule.createElement("TextLabel", {
				TextWrapped = true,
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				Size = UDim2.new(1, 0, 0, 0),
				Text = UseLocalizationResult.alertMessage,
				TextSize = UseDesignTokensResult.alertMessageFont.FontSize,
				Font = UseDesignTokensResult.alertMessageFont.Font,
				TextColor3 = UseDesignTokensResult.alertMessageColor.Color3,
				AutomaticSize = Enum.AutomaticSize.Y,
				TextXAlignment = Enum.TextXAlignment.Left
			})
		})
	})
end