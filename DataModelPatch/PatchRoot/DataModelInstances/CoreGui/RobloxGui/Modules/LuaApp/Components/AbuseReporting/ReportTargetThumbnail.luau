local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local LoadableImage = require(CorePackages.Packages.UIBlox).App.Loading.LoadableImage
local UseDesignTokensFunction = require(CorePackages.Workspace.Packages.Style).useDesignTokens

return function(p1)
	-- upvalues: UseDesignTokensFunction (copy), ReactModule (copy), LoadableImage (copy)
	local UseDesignTokensResult = UseDesignTokensFunction()
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 0,
		Size = UDim2.fromOffset(UseDesignTokensResult.Size.Size_2400, UseDesignTokensResult.Size.Size_2400)
	}, {
		AvatarThumbnail = ReactModule.createElement(LoadableImage, {
			BackgroundTransparency = 1,
			useShimmerAnimationWhileLoading = true,
			ZIndex = 2,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			Size = UDim2.new(0, UseDesignTokensResult.Size.Size_2400, 0, UseDesignTokensResult.Size.Size_2400),
			ScaleType = Enum.ScaleType.Fit,
			Image = p1.thumbnailUrl
		})
	})
end