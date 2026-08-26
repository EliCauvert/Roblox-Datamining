local memStorageService = game:GetService("MemStorageService")
local userInputService = game:GetService("UserInputService")
local parent = script:FindFirstAncestor("InputUi").Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local images = UIBloxModule.App.ImageSet.Images
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useDesignTokens = require(parent.Style).useDesignTokens
local _ = require(script.Parent.GamepadDisconnectTokenMapper)
local gamepadMessageKeyEngineFeature = game:GetEngineFeature("GamepadMessageKeyEngineFeature")

return function(p1)
	-- upvalues: useDesignTokens (ref), gamepadMessageKeyEngineFeature (ref), memStorageService (ref), useLocalization (ref), userInputService (ref), reactModule (ref), imageSetLabel (ref), images (ref)
	local gamepadDisconnectMessageKeyItem
	local var1 = useDesignTokens()
	local color3 = var1.Color.Content.Emphasis.Color3
	local transparency = var1.Color.Content.Emphasis.Transparency
	local gamepadDisconnect = var1.LuaApps.GamepadDisconnect
	local designWidth = gamepadDisconnect.designWidth
	local imageWidth = gamepadDisconnect.imageWidth
	local imageHeight = gamepadDisconnect.imageHeight
	local textContainerWidth = gamepadDisconnect.textContainerWidth
	local horizontalInnerPadding = gamepadDisconnect.horizontalInnerPadding
	local verticalPadding = gamepadDisconnect.verticalPadding
	local _ = ""
	
	if gamepadMessageKeyEngineFeature then
		gamepadDisconnectMessageKeyItem = memStorageService:GetItem("GamepadDisconnectMessageKey")
		
		if gamepadDisconnectMessageKeyItem == "" then
			gamepadDisconnectMessageKeyItem = "Feature.GamepadDisconnect.Label.MessageGeneric"
		end
	else
		gamepadDisconnectMessageKeyItem = "Feature.GamepadDisconnect.Label.Message"
	end
	local var2 = useLocalization({
		title = "Feature.GamepadDisconnect.Label.Title",
		message = gamepadDisconnectMessageKeyItem
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
			BackgroundTransparency = var1.Color.OverMedia.OverMedia_0.Transparency,
			BackgroundColor3 = var1.Color.OverMedia.OverMedia_0.Color3
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
						Padding = UDim.new(0, var1.Size.Size_800)
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
							Size = UDim2.fromOffset(var1.Size.Size_1200, var1.Size.Size_1200)
						}),
						Title = reactModule.createElement("TextLabel", {
							BackgroundTransparency = 1,
							LayoutOrder = 2,
							Text = var2.title,
							TextColor3 = color3,
							TextTransparency = transparency,
							TextSize = var1.Typography.HeadingLarge.FontSize,
							Font = var1.Typography.HeadingLarge.Font,
							TextXAlignment = Enum.TextXAlignment.Left
						})
					}),
					Message = reactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						LayoutOrder = 2,
						TextWrapped = true,
						Text = string.format(var2.message, p1.username, userInputService:GetStringForKeyCode(Enum.KeyCode.A)),
						AutomaticSize = Enum.AutomaticSize.XY,
						Size = UDim2.fromOffset(0, 0),
						TextColor3 = color3,
						TextTransparency = transparency,
						TextSize = var1.Typography.TitleLarge.FontSize,
						Font = var1.Typography.TitleLarge.Font,
						TextXAlignment = Enum.TextXAlignment.Left
					})
				})
			})
		})
	})
end