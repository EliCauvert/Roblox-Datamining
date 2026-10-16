local Parent = script:FindFirstAncestor("AppChat").Parent
local RoactModule = require(Parent.Roact)
local WithStyleFunction = require(Parent.UIBlox).Style.withStyle
local UIBloxModule = require(Parent.UIBlox)
local FoundationModule = require(Parent.Foundation)
local Radius = FoundationModule.Enums.Radius
local Skeleton = FoundationModule.Skeleton
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local LoadingAvatar = RoactModule.PureComponent:extend("LoadingAvatar")
local AppChatLoadingIndicatorTransparency = game:DefineFastFlag("AppChatLoadingIndicatorTransparency", false)
LoadingAvatar.defaultProps = {
	cellHeight = 64,
	avatarSize = 36,
	LayoutOrder = 0,
	avatarImage = UIBloxModule.App.ImageSet.Images["component_assets/circle_49_mask"]
}

function LoadingAvatar.render(p1) --[[ Line: 25 ]]
	-- upvalues: WithStyleFunction (copy), RoactModule (copy), Skeleton (copy), Radius (copy), AppChatLoadingIndicatorTransparency (copy), ImageSetLabel (copy)
	local CellHeightDelta = p1.props.cellHeight / 2 - p1.props.avatarSize / 2
	
	return WithStyleFunction(function(p2) --[[ Line: 28 ]]
		-- upvalues: RoactModule (upval), p1 (copy), Skeleton (upval), CellHeightDelta (copy), Radius (upval), AppChatLoadingIndicatorTransparency (upval), ImageSetLabel (upval)
		return RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(0, p1.props.cellHeight, 0, p1.props.cellHeight),
			LayoutOrder = p1.props.LayoutOrder
		}, {
			avatarShimmer = RoactModule.createElement(Skeleton, {
				Size = UDim2.fromOffset(p1.props.avatarSize, p1.props.avatarSize),
				Position = UDim2.fromOffset(CellHeightDelta, CellHeightDelta),
				radius = Radius.Circle
			}),
			avatarMask = if AppChatLoadingIndicatorTransparency then nil else RoactModule.createElement(ImageSetLabel, {
				BackgroundTransparency = 1,
				Size = UDim2.fromOffset(p1.props.avatarSize, p1.props.avatarSize),
				Position = UDim2.fromOffset(CellHeightDelta, CellHeightDelta),
				Image = p1.props.avatarImage,
				ImageColor3 = p2.Theme.BackgroundDefault.Color
			})
		})
	end)
end

return LoadingAvatar