local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local ReactModule = require(CorePackages.Packages.React)
local _ = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Types)
local LoadableImage = require(CorePackages.Packages.UIBlox).App.Loading.LoadableImage
local GetRbxthumbWithTypeSizeAndOptionsFunction = require(CorePackages.Workspace.Packages.UserLib).Utils.getRbxthumbWithTypeSizeAndOptions

return function(p1)
	-- upvalues: GetRbxthumbWithTypeSizeAndOptionsFunction (copy), ReactModule (copy), RoactModule (copy), LoadableImage (copy)
	local Size = p1.size
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ZIndex = 0,
		Size = UDim2.new(1, 0, 0, Size),
		SizeConstraint = Enum.SizeConstraint.RelativeXY,
		LayoutOrder = p1.layoutOrder
	}, {
		CommunityAvatarImage = RoactModule.createElement(LoadableImage, {
			BackgroundTransparency = 1,
			useShimmerAnimationWhileLoading = true,
			Image = GetRbxthumbWithTypeSizeAndOptionsFunction(p1.lookId, "Look", 420),
			AnchorPoint = Vector2.new(0.5, 0),
			Position = UDim2.fromScale(0.5, 0),
			Size = UDim2.fromOffset(Size, Size)
		})
	})
end