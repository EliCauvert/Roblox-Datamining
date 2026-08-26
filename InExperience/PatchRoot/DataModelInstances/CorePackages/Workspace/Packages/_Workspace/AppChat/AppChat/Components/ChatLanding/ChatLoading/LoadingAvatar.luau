local parent = script:FindFirstAncestor("AppChat").Parent
local roactModule = require(parent.Roact)
local withStyle = require(parent.UIBlox).Style.withStyle
local UIBloxModule = require(parent.UIBlox)
local foundationModule = require(parent.Foundation)
local radius = foundationModule.Enums.Radius
local skeleton = foundationModule.Skeleton
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local images = UIBloxModule.App.ImageSet.Images
local loadingAvatar = roactModule.PureComponent:extend("LoadingAvatar")
local appChatLoadingIndicatorTransparency = game:DefineFastFlag("AppChatLoadingIndicatorTransparency", false)
loadingAvatar.defaultProps = {
	cellHeight = 64,
	avatarSize = 36,
	LayoutOrder = 0,
	avatarImage = images["component_assets/circle_49_mask"]
}

function loadingAvatar.render(p1)
	-- upvalues: withStyle (ref), roactModule (ref), skeleton (ref), radius (ref), appChatLoadingIndicatorTransparency (ref), imageSetLabel (ref)
	local var1 = p1.props.cellHeight / 2 - p1.props.avatarSize / 2
	
	return withStyle(function(p2)
		-- upvalues: roactModule (copy), p1 (ref), skeleton (copy), var1 (ref), radius (copy), appChatLoadingIndicatorTransparency (copy), imageSetLabel (copy)
		return roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(0, p1.props.cellHeight, 0, p1.props.cellHeight),
			LayoutOrder = p1.props.LayoutOrder
		}, {
			avatarShimmer = roactModule.createElement(skeleton, {
				Size = UDim2.fromOffset(p1.props.avatarSize, p1.props.avatarSize),
				Position = UDim2.fromOffset(var1, var1),
				radius = radius.Circle
			}),
			avatarMask = if appChatLoadingIndicatorTransparency then nil else roactModule.createElement(imageSetLabel, {
				BackgroundTransparency = 1,
				Size = UDim2.fromOffset(p1.props.avatarSize, p1.props.avatarSize),
				Position = UDim2.fromOffset(var1, var1),
				Image = p1.props.avatarImage,
				ImageColor3 = p2.Theme.BackgroundDefault.Color
			})
		})
	end)
end

return loadingAvatar