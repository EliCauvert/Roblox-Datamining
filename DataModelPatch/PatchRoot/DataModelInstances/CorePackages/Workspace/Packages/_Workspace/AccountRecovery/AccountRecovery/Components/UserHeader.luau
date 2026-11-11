local Parent = script:FindFirstAncestor("AccountRecovery").Parent
local ReactModule = require(Parent.React)
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local GetStandardSizeAvatarHeadShotRbxthumbFunction = require(Parent.UserLib).Utils.getStandardSizeAvatarHeadShotRbxthumb
local LoadableImage = require(Parent.UIBlox).App.Loading.LoadableImage
local FoundationModule = require(Parent.Foundation)
local Text = FoundationModule.Text
local UseTokensFunction = FoundationModule.Hooks.useTokens

return function(Frame)
	-- upvalues: UseTokensFunction (copy), UseDesignTokensFunction (copy), ReactModule (copy), LoadableImage (copy), GetStandardSizeAvatarHeadShotRbxthumbFunction (copy), Text (copy)
	local UseTokensResult = UseTokensFunction()
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = Frame.LayoutOrder,
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.new(1, 0, 0, 0)
	}, {
		VerticalLayout = ReactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			Padding = UDim.new(0, UseDesignTokensFunction().Size.Size_50)
		}),
		AvatarImage = ReactModule.createElement(LoadableImage, {
			LayoutOrder = 1,
			useShimmerAnimationWhileLoading = true,
			shouldHandleReloads = true,
			Size = UDim2.new(0, 96, 0, 96),
			Image = GetStandardSizeAvatarHeadShotRbxthumbFunction(Frame.userId),
			cornerRadius = UDim.new(0.5, 0)
		}),
		AvatarImageSpacing = ReactModule.createElement("Frame", {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, UseTokensResult.Size.Size_400)
		}),
		DisplayName = ReactModule.createElement(Text, {
			LayoutOrder = 3,
			Text = Frame.displayName,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			fontStyle = UseTokensResult.Typography.HeadingSmall,
			textStyle = UseTokensResult.Color.Content.Emphasis,
			TextXAlignment = Enum.TextXAlignment.Center,
			TextYAlignment = Enum.TextYAlignment.Center
		}),
		Username = ReactModule.createElement(Text, {
			LayoutOrder = 4,
			Text = `@{Frame.username}`,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			fontStyle = UseTokensResult.Typography.BodyMedium,
			textStyle = UseTokensResult.Color.Content.Default,
			TextXAlignment = Enum.TextXAlignment.Center,
			TextYAlignment = Enum.TextYAlignment.Center
		})
	})
end