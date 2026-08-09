local memStorageService = game:GetService("MemStorageService")
local userInputService = game:GetService("UserInputService")
local parent = script:FindFirstAncestor("InputUi").Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local fFlagRenameDeprecatedUIBloxTokens = require(parent.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local images = UIBloxModule.App.ImageSet.Images
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useDesignTokens = require(parent.Style).useDesignTokens
local _ = require(script.Parent.GamepadDisconnectTokenMapper)
local gamepadMessageKeyEngineFeature = game:GetEngineFeature("GamepadMessageKeyEngineFeature")

return function(p0) --[[ line: 25 ]]
	-- upvalues: useDesignTokens (ref), fFlagRenameDeprecatedUIBloxTokens (ref), gamepadMessageKeyEngineFeature (ref), memStorageService (ref), useLocalization (ref), userInputService (ref), reactModule (ref), imageSetLabel (ref), images (ref)
	local var6
	local var5 = useDesignTokens()
	local color3 = (if fFlagRenameDeprecatedUIBloxTokens then var5.Color.Content.Emphasis else var5.Semantic.Color.Text.Emphasis).Color3
	local transparency = (if fFlagRenameDeprecatedUIBloxTokens then var5.Color.Content.Emphasis else var5.Semantic.Color.Text.Emphasis).Transparency
	local gamepadDisconnect = var5.LuaApps.GamepadDisconnect
	local designWidth = gamepadDisconnect.designWidth
	local imageWidth = gamepadDisconnect.imageWidth
	local imageHeight = gamepadDisconnect.imageHeight
	local textContainerWidth = gamepadDisconnect.textContainerWidth
	local horizontalInnerPadding = gamepadDisconnect.horizontalInnerPadding
	local verticalPadding = gamepadDisconnect.verticalPadding
	local _ = ""
	
	if gamepadMessageKeyEngineFeature then
		var6 = memStorageService:GetItem("GamepadDisconnectMessageKey")
		
		if var6 == "" then
			var6 = "Feature.GamepadDisconnect.Label.MessageGeneric"
		end
	else
		var6 = "Feature.GamepadDisconnect.Label.Message"
	end
	local var7 = useLocalization({
		title = "Feature.GamepadDisconnect.Label.Title",
		message = var6
	})
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Active = true,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		Size = UDim2.new(1, 0, 1, 0)
	}, {
		Modal = reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.new(1, 0, 1, -verticalPadding * 2),
			BackgroundTransparency = (if fFlagRenameDeprecatedUIBloxTokens then var5.Color.OverMedia.OverMedia_0 else var5.Semantic.Color.BackgroundUi.Contrast).Transparency,
			BackgroundColor3 = (if fFlagRenameDeprecatedUIBloxTokens then var5.Color.OverMedia.OverMedia_0 else var5.Semantic.Color.BackgroundUi.Contrast).Color3
		}, {
			Content = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				Size = UDim2.new(1, 0, 0, imageHeight)
			}, {
				UIListLayout = reactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					Padding = UDim.new(horizontalInnerPadding / designWidth, 0)
				}),
				ControllerImage = reactModule.createElement("ImageLabel", {
					Image = "rbxasset://textures/ui/Gamepad/Controller.png",
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					Size = UDim2.new(imageWidth / designWidth, 0, 0, imageHeight),
					ScaleType = Enum.ScaleType.Fit
				}, {
					UIAspectRatioConstraint = reactModule.createElement("UIAspectRatioConstraint", { AspectRatio = imageWidth / imageHeight }),
					UISizeConstraint = reactModule.createElement("UISizeConstraint", {
						MaxSize = Vector2.new(imageWidth, imageHeight),
						MinSize = Vector2.new(imageWidth * 0.5, imageHeight * 0.5)
					})
				}),
				TextContainer = reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					AutomaticSize = Enum.AutomaticSize.Y,
					Size = UDim2.new(textContainerWidth / designWidth, 0, 0, imageHeight)
				}, {
					UIListLayout = reactModule.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Vertical,
						SortOrder = Enum.SortOrder.LayoutOrder,
						HorizontalAlignment = Enum.HorizontalAlignment.Left,
						VerticalAlignment = Enum.VerticalAlignment.Center,
						Padding = UDim.new(0, if fFlagRenameDeprecatedUIBloxTokens then var5.Size.Size_800 else var5.Global.Space_400)
					}),
					TitleRow = reactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						LayoutOrder = 1,
						AutomaticSize = Enum.AutomaticSize.Y,
						Size = UDim2.fromScale(1, 0)
					}, {
						UIListLayout = reactModule.createElement("UIListLayout", {
							FillDirection = Enum.FillDirection.Horizontal,
							SortOrder = Enum.SortOrder.LayoutOrder,
							VerticalAlignment = Enum.VerticalAlignment.Center,
							HorizontalAlignment = Enum.HorizontalAlignment.Left,
							Padding = UDim.new(24 / textContainerWidth, 0)
						}),
						Icon = reactModule.createElement(imageSetLabel, {
							BackgroundTransparency = 1,
							LayoutOrder = 1,
							Image = images["icons/menu/about_large"],
							Size = UDim2.fromOffset(if fFlagRenameDeprecatedUIBloxTokens then var5.Size.Size_1200 else var5.Global.Size_600, if fFlagRenameDeprecatedUIBloxTokens then var5.Size.Size_1200 else var5.Global.Size_600)
						}),
						Title = reactModule.createElement("TextLabel", {
							BackgroundTransparency = 1,
							LayoutOrder = 2,
							Text = var7.title,
							TextColor3 = color3,
							TextTransparency = transparency,
							TextSize = if fFlagRenameDeprecatedUIBloxTokens then var5.Typography.HeadingLarge.FontSize else var5.Semantic.Typography.Title.FontSize,
							Font = if fFlagRenameDeprecatedUIBloxTokens then var5.Typography.HeadingLarge.Font else var5.Semantic.Typography.Title.Font,
							TextXAlignment = Enum.TextXAlignment.Left
						})
					}),
					Message = reactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						LayoutOrder = 2,
						TextWrapped = true,
						Text = string.format(var7.message, p0.username, userInputService:GetStringForKeyCode(Enum.KeyCode.A)),
						AutomaticSize = Enum.AutomaticSize.XY,
						Size = UDim2.fromOffset(0, 0),
						TextColor3 = color3,
						TextTransparency = transparency,
						TextSize = if fFlagRenameDeprecatedUIBloxTokens then var5.Typography.TitleLarge.FontSize else var5.Semantic.Typography.Subheader.FontSize,
						Font = if fFlagRenameDeprecatedUIBloxTokens then var5.Typography.TitleLarge.Font else var5.Semantic.Typography.Subheader.Font,
						TextXAlignment = Enum.TextXAlignment.Left
					})
				})
			})
		})
	})
end