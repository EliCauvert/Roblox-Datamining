local parent = script:FindFirstAncestor("GameTile").Parent
local roactModule = require(parent.Roact)
local userLibModule = require(parent.UserLib)
local constants = userLibModule.Utils.Constants
local getRbxthumbWithTypeSizeAndOptions = userLibModule.Utils.getRbxthumbWithTypeSizeAndOptions
local constantsModule = require(parent.AppChat.Constants)
local imageSetLabel = require(parent.UIBlox).Core.ImageSet.ImageSetLabel
local getImageData = require(parent.RobloxAppAssets).GetImageData
local friendIcon = roactModule.PureComponent:extend("FriendIcon")
friendIcon.defaultProps = {
	layoutOrder = 0,
	showBackground = true,
	maskColor = require(parent.Style).Colors.White
}

function friendIcon.render(p1)
	-- upvalues: constantsModule (ref), getRbxthumbWithTypeSizeAndOptions (ref), constants (ref), roactModule (ref), imageSetLabel (ref), getImageData (ref)
	local user = p1.props.user
	local dotSize = p1.props.dotSize
	local itemSize = p1.props.itemSize
	local layoutOrder = p1.props.layoutOrder
	local showBackground = p1.props.showBackground
	local maskColor = p1.props.maskColor
	local var1 = dotSize ~= nil
	local var2 = constantsModule:GetPresenceIndicatorSizeKey(dotSize)
	local var3 = nil
	local presence = nil
	
	if user then
		if var1 then
			presence = constantsModule.PresenceIndicatorImagesBySize[var2][user.presence]
		end
		var3 = getRbxthumbWithTypeSizeAndOptions(user.id, constants.RbxthumbTypes.AvatarHeadShot, 48)
	end
	return roactModule.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(209, 209, 209),
		BackgroundTransparency = if showBackground then 0 else 1,
		LayoutOrder = layoutOrder,
		Size = UDim2.new(0, itemSize, 0, itemSize)
	}, {
		Profile = roactModule.createElement(imageSetLabel, {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ZIndex = 1,
			Image = getImageData(var3) or var3,
			Size = UDim2.new(0, itemSize, 0, itemSize)
		}),
		Mask = showBackground and roactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Image = "rbxasset://textures/ui/LuaApp/graphic/gr-avatar-frame-36x36.png",
			ZIndex = 2,
			ImageColor3 = maskColor,
			Size = UDim2.new(0, itemSize, 0, itemSize)
		}) or nil,
		Dot = showBackground and (var1 and (roactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ZIndex = 3,
			Image = presence,
			Position = UDim2.new(1, -dotSize, 1, -dotSize),
			Size = UDim2.new(0, dotSize, 0, dotSize)
		}) or nil))
	})
end

return friendIcon