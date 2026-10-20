local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local ConstantsModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Constants)
local ImageSetLabel = require(CorePackages.Packages.UIBlox).Core.ImageSet.ImageSetLabel
local GetImageDataFunction = require(CorePackages.Workspace.Packages.RobloxAppAssets).GetImageData
local UserThumbnail = RoactModule.PureComponent:extend("UserThumbnail")

function UserThumbnail.render(p1)
	-- upvalues: RoactModule (copy), ConstantsModule (copy), ImageSetLabel (copy), GetImageDataFunction (copy)
	local SizeConstraint = p1.props.SizeConstraint
	local MaskColor = p1.props.MaskColor
	local PhAvatarPortrait = if p1.props.Url == "" then "LuaApp/graphic/ph-avatar-portrait" else p1.props.Url or "LuaApp/graphic/ph-avatar-portrait"
	
	return RoactModule.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundColor3 = ConstantsModule.Color.GRAY_AVATAR_BACKGROUND,
		Size = p1.props.Size,
		Position = p1.props.Position,
		AnchorPoint = p1.props.AnchorPoint,
		SizeConstraint = SizeConstraint,
		BackgroundTransparency = if MaskColor then 0 else 1
	}, {
		Thumbnail = RoactModule.createElement(ImageSetLabel, {
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			AnchorPoint = Vector2.new(0.5, 0.5),
			SizeConstraint = SizeConstraint,
			Image = GetImageDataFunction(PhAvatarPortrait) or PhAvatarPortrait
		}),
		Mask = MaskColor and RoactModule.createElement(ImageSetLabel, {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ZIndex = 2,
			Image = GetImageDataFunction("rbxasset://textures/ui/LuaApp/graphic/profilemask.png") or "rbxasset://textures/ui/LuaApp/graphic/profilemask.png",
			ImageColor3 = MaskColor,
			Size = UDim2.new(1, 0, 1, 0)
		}) or nil
	})
end

return UserThumbnail