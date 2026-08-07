local parent = script:FindFirstAncestor("AppChat").Parent
local reactModule = require(parent.React)
local loadableImage = require(parent.UIBlox).App.Loading.LoadableImage

return function(p0) --[[ line: 13 | named "AvatarThumbnail" ]]
	-- upvalues: reactModule (ref), loadableImage (ref)
	return reactModule.createElement(loadableImage, {
		useShimmerAnimationWhileLoading = true,
		showFailedStateWhenLoadingFailed = true,
		Size = UDim2.fromScale(1, 1),
		Image = p0.thumbnail,
		cornerRadius = p0.cornerRadius
	})
end