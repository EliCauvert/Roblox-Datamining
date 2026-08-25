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

function loadingAvatar.render(p0)
	-- upvalues: withStyle (ref), roactModule (ref), skeleton (ref), radius (ref), appChatLoadingIndicatorTransparency (ref), imageSetLabel (ref)
	local var5 = p0.props.cellHeight / 2 - p0.props.avatarSize / 2
	
	return withStyle(function(p1)
		-- upvalues: roactModule (copy), p0 (ref), skeleton (copy), var5 (ref), radius (copy), appChatLoadingIndicatorTransparency (copy), imageSetLabel (copy)
		return roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(0, p0.props.cellHeight, 0, p0.props.cellHeight),
			LayoutOrder = p0.props.LayoutOrder
		}, {
			avatarShimmer = roactModule.createElement(skeleton, {
				Size = UDim2.fromOffset(p0.props.avatarSize, p0.props.avatarSize),
				Position = UDim2.fromOffset(var5, var5),
				radius = radius.Circle
			}),
			avatarMask = if appChatLoadingIndicatorTransparency then nil else roactModule.createElement(imageSetLabel, {
				BackgroundTransparency = 1,
				Size = UDim2.fromOffset(p0.props.avatarSize, p0.props.avatarSize),
				Position = UDim2.fromOffset(var5, var5),
				Image = p0.props.avatarImage,
				ImageColor3 = p1.Theme.BackgroundDefault.Color
			})
		})
	end)
end

return loadingAvatar