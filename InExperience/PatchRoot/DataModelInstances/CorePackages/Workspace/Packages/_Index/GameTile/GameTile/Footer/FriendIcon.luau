local Parent = script:FindFirstAncestor("GameTile").Parent
local RoactModule = require(Parent.Roact)
local UserLibModule = require(Parent.UserLib)
local Constants = UserLibModule.Utils.Constants
local GetRbxthumbWithTypeSizeAndOptionsFunction = UserLibModule.Utils.getRbxthumbWithTypeSizeAndOptions
local ConstantsModule = require(Parent.AppChat.Constants)
local ImageSetLabel = require(Parent.UIBlox).Core.ImageSet.ImageSetLabel
local GetImageDataFunction = require(Parent.RobloxAppAssets).GetImageData
local FriendIcon = RoactModule.PureComponent:extend("FriendIcon")
FriendIcon.defaultProps = {
	layoutOrder = 0,
	showBackground = true,
	maskColor = require(Parent.Style).Colors.White
}

function FriendIcon.render(p1) --[[ Line: 25 ]]
	-- upvalues: ConstantsModule (copy), GetRbxthumbWithTypeSizeAndOptionsFunction (copy), Constants (copy), RoactModule (copy), ImageSetLabel (copy), GetImageDataFunction (copy)
	local User = p1.props.user
	local DotSize = p1.props.dotSize
	local ItemSize = p1.props.itemSize
	local LayoutOrder = p1.props.layoutOrder
	local ShowBackground = p1.props.showBackground
	local MaskColor = p1.props.maskColor
	local HasDotSize = DotSize ~= nil
	local PresenceIndicatorSizeKey = ConstantsModule:GetPresenceIndicatorSizeKey(DotSize)
	local v1 = nil
	local PresenceIndicatorImagesBySizeEntry = nil
	
	if User then
		if HasDotSize then
			PresenceIndicatorImagesBySizeEntry = ConstantsModule.PresenceIndicatorImagesBySize[PresenceIndicatorSizeKey][User.presence]
		end
		v1 = GetRbxthumbWithTypeSizeAndOptionsFunction(User.id, Constants.RbxthumbTypes.AvatarHeadShot, 48)
	end
	return RoactModule.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(209, 209, 209),
		BackgroundTransparency = if ShowBackground then 0 else 1,
		LayoutOrder = LayoutOrder,
		Size = UDim2.new(0, ItemSize, 0, ItemSize)
	}, {
		Profile = RoactModule.createElement(ImageSetLabel, {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ZIndex = 1,
			Image = GetImageDataFunction(v1) or v1,
			Size = UDim2.new(0, ItemSize, 0, ItemSize)
		}),
		Mask = ShowBackground and RoactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Image = "rbxasset://textures/ui/LuaApp/graphic/gr-avatar-frame-36x36.png",
			ZIndex = 2,
			ImageColor3 = MaskColor,
			Size = UDim2.new(0, ItemSize, 0, ItemSize)
		}) or nil,
		Dot = ShowBackground and HasDotSize and RoactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ZIndex = 3,
			Image = PresenceIndicatorImagesBySizeEntry,
			Position = UDim2.new(1, -DotSize, 1, -DotSize),
			Size = UDim2.new(0, DotSize, 0, DotSize)
		}) or nil
	})
end

return FriendIcon