local Parent = script:FindFirstAncestor("AppChat").Parent
local ReactModule = require(Parent.React)
local LoadableImage = require(Parent.UIBlox).App.Loading.LoadableImage

return function(p1)
	-- upvalues: ReactModule (copy), LoadableImage (copy)
	return ReactModule.createElement(LoadableImage, {
		useShimmerAnimationWhileLoading = true,
		showFailedStateWhenLoadingFailed = true,
		Size = UDim2.fromScale(1, 1),
		Image = p1.thumbnail,
		cornerRadius = p1.cornerRadius
	})
end