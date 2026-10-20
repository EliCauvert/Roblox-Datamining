local MemStorageService = game:GetService("MemStorageService")
local UserInputService = game:GetService("UserInputService")
local Parent = script:FindFirstAncestor("InputUi").Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local FoundationModule = require(Parent.Foundation)
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local Images = UIBloxModule.App.ImageSet.Images
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local _ = require(script.Parent.GamepadDisconnectTokenMapper)
local GamepadMessageKeyEngineFeature = game:GetEngineFeature("GamepadMessageKeyEngineFeature")

return function(p1)
	-- upvalues: UseDesignTokensFunction (copy), GamepadMessageKeyEngineFeature (copy), MemStorageService (copy), UseLocalizationFunction (copy), UserInputService (copy), ReactModule (copy), ImageSetLabel (copy), Images (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy)
	local UseDesignTokensResult = UseDesignTokensFunction()
	local EmphasisColor3 = UseDesignTokensResult.Color.Content.Emphasis.Color3
	local Transparency = UseDesignTokensResult.Color.Content.Emphasis.Transparency
	local GamepadDisconnect = UseDesignTokensResult.LuaApps.GamepadDisconnect
	local DesignWidth = GamepadDisconnect.designWidth
	local ImageWidth: number = GamepadDisconnect.imageWidth
	local ImageHeight: number = GamepadDisconnect.imageHeight
	local TextContainerWidth: number = GamepadDisconnect.textContainerWidth
	local HorizontalInnerPadding = GamepadDisconnect.horizontalInnerPadding
	local VerticalPadding = GamepadDisconnect.verticalPadding
	local GamepadDisconnectMessageKeyItem = nil
	
	if GamepadMessageKeyEngineFeature then
		GamepadDisconnectMessageKeyItem = MemStorageService:GetItem("GamepadDisconnectMessageKey")
		
		if GamepadDisconnectMessageKeyItem == "" then
			GamepadDisconnectMessageKeyItem = "Feature.GamepadDisconnect.Label.MessageGeneric"
		end
	else
		GamepadDisconnectMessageKeyItem = "Feature.GamepadDisconnect.Label.Message"
	end
	local UseLocalizationResult = UseLocalizationFunction({
		title = "Feature.GamepadDisconnect.Label.Title",
		message = GamepadDisconnectMessageKeyItem
	})
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Active = true,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		Size = UDim2.new(1, 0, 1, 0)
	}, {
		Modal = ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.new(1, 0, 1, -VerticalPadding * 2),
			BackgroundTransparency = UseDesignTokensResult.Color.OverMedia.OverMedia_0.Transparency,
			BackgroundColor3 = UseDesignTokensResult.Color.OverMedia.OverMedia_0.Color3
		}, {
			Content = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				Size = UDim2.new(1, 0, 0, ImageHeight)
			}, {
				UIListLayout = ReactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					Padding = UDim.new(HorizontalInnerPadding / DesignWidth, 0)
				}),
				ControllerImage = ReactModule.createElement("ImageLabel", {
					Image = "rbxasset://textures/ui/Gamepad/Controller.png",
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					Size = UDim2.new(ImageWidth / DesignWidth, 0, 0, ImageHeight),
					ScaleType = Enum.ScaleType.Fit
				}, {
					UIAspectRatioConstraint = ReactModule.createElement("UIAspectRatioConstraint", { AspectRatio = ImageWidth / ImageHeight }),
					UISizeConstraint = ReactModule.createElement("UISizeConstraint", {
						MaxSize = Vector2.new(ImageWidth, ImageHeight),
						MinSize = Vector2.new(ImageWidth * 0.5, ImageHeight * 0.5)
					})
				}),
				TextContainer = ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					AutomaticSize = Enum.AutomaticSize.Y,
					Size = UDim2.new(TextContainerWidth / DesignWidth, 0, 0, ImageHeight)
				}, {
					UIListLayout = ReactModule.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Vertical,
						SortOrder = Enum.SortOrder.LayoutOrder,
						HorizontalAlignment = Enum.HorizontalAlignment.Left,
						VerticalAlignment = Enum.VerticalAlignment.Center,
						Padding = UDim.new(0, UseDesignTokensResult.Size.Size_800)
					}),
					TitleRow = ReactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						LayoutOrder = 1,
						AutomaticSize = Enum.AutomaticSize.Y,
						Size = UDim2.fromScale(1, 0)
					}, {
						UIListLayout = ReactModule.createElement("UIListLayout", {
							FillDirection = Enum.FillDirection.Horizontal,
							SortOrder = Enum.SortOrder.LayoutOrder,
							VerticalAlignment = Enum.VerticalAlignment.Center,
							HorizontalAlignment = Enum.HorizontalAlignment.Left,
							Padding = UDim.new(24 / TextContainerWidth, 0)
						}),
						Icon = ReactModule.createElement(ImageSetLabel, {
							BackgroundTransparency = 1,
							LayoutOrder = 1,
							Image = Images["icons/menu/about_large"],
							Size = UDim2.fromOffset(UseDesignTokensResult.Size.Size_1200, UseDesignTokensResult.Size.Size_1200)
						}),
						Title = ReactModule.createElement("TextLabel", {
							BackgroundTransparency = 1,
							LayoutOrder = 2,
							Text = UseLocalizationResult.title,
							TextColor3 = EmphasisColor3,
							TextTransparency = Transparency,
							TextSize = UseDesignTokensResult.Typography.HeadingLarge.FontSize,
							Font = if FoundationFontFaceMigration then nil else UseDesignTokensResult.Typography.HeadingLarge.Font,
							FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(UseDesignTokensResult.Typography.HeadingLarge.Font) else nil,
							TextXAlignment = Enum.TextXAlignment.Left
						})
					}),
					Message = ReactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						LayoutOrder = 2,
						TextWrapped = true,
						Text = string.format(UseLocalizationResult.message, p1.username, UserInputService:GetStringForKeyCode(Enum.KeyCode.A)),
						AutomaticSize = Enum.AutomaticSize.XY,
						Size = UDim2.fromOffset(0, 0),
						TextColor3 = EmphasisColor3,
						TextTransparency = Transparency,
						TextSize = UseDesignTokensResult.Typography.TitleLarge.FontSize,
						Font = if FoundationFontFaceMigration then nil else UseDesignTokensResult.Typography.TitleLarge.Font,
						FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(UseDesignTokensResult.Typography.TitleLarge.Font) else nil,
						TextXAlignment = Enum.TextXAlignment.Left
					})
				})
			})
		})
	})
end