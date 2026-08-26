local parent = script:FindFirstAncestor("AppChat").Parent
local reactModule = require(parent.React)
local loadableImage = require(parent.UIBlox).App.Loading.LoadableImage

return function(p1)
	-- upvalues: reactModule (ref), loadableImage (ref)
	return reactModule.createElement(loadableImage, {
		useShimmerAnimationWhileLoading = true,
		showFailedStateWhenLoadingFailed = true,
		Size = UDim2.fromScale(1, 1),
		Image = p1.thumbnail,
		cornerRadius = p1.cornerRadius
	})
end