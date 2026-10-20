local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local ConstantsModule = require(game:GetService("CoreGui").RobloxGui.Modules.Settings.Pages.ShareGame.Constants)
local Constants = require(CorePackages.Workspace.Packages.UserLib).Utils.Constants
local GetRbxthumbWithTypeSizeAndOptionsFunction = require(CorePackages.Workspace.Packages.UserLib).Utils.getRbxthumbWithTypeSizeAndOptions
local GRAY3 = ConstantsModule.Color.GRAY3
local InviteAvatarThumbnailSize = ConstantsModule.InviteAvatarThumbnailSize
local config = {
	[1] = {
		{
			Size = UDim2.new(1, 0, 1, 0),
			Position = UDim2.new(0, 0, 0, 0),
			FrameSize = UDim2.new(1, 0, 1, 0),
			FramePosition = UDim2.new(0, 0, 0, 0)
		}
	},
	[2] = {
		{
			Size = UDim2.new(2, 0, 1, 0),
			Position = UDim2.new(-0.5, 0, 0, 0),
			FrameSize = UDim2.new(0.5, -1, 1, 0),
			FramePosition = UDim2.new(0, 0, 0, 0),
			Border = {
				BorderPosition = UDim2.new(0.5, -1, 0, 0),
				BorderSize = UDim2.new(0, 1, 1, 0)
			}
		},
		{
			Size = UDim2.new(2, 0, 1, 0),
			Position = UDim2.new(-0.5, 0, 0, 0),
			FrameSize = UDim2.new(0.5, -1, 1, 0),
			FramePosition = UDim2.new(0.5, 1, 0, 0)
		}
	},
	[3] = {
		{
			Size = UDim2.new(2, 0, 1, 0),
			Position = UDim2.new(-0.5, 0, 0, 0),
			FrameSize = UDim2.new(0.5, -1, 1, 0),
			FramePosition = UDim2.new(0, 0, 0, 0),
			Border = {
				BorderPosition = UDim2.new(0.5, -1, 0, 0),
				BorderSize = UDim2.new(0, 1, 1, 0)
			}
		},
		{
			Size = UDim2.new(1, 0, 1, 0),
			Position = UDim2.new(0, 0, 0, 0),
			FrameSize = UDim2.new(0.5, -1, 0.5, -1),
			FramePosition = UDim2.new(0.5, 1, 0, 0),
			Border = {
				BorderPosition = UDim2.new(0.5, 0, 0.5, -1),
				BorderSize = UDim2.new(0.5, 0, 0, 1)
			}
		},
		{
			Size = UDim2.new(1, 0, 1, 0),
			Position = UDim2.new(0, 0, 0, 0),
			FrameSize = UDim2.new(0.5, -1, 0.5, -1),
			FramePosition = UDim2.new(0.5, 1, 0.5, 1)
		}
	},
	[4] = {
		{
			Size = UDim2.new(1, 0, 1, 0),
			Position = UDim2.new(0, 0, 0, 0),
			FrameSize = UDim2.new(0.5, -1, 0.5, -1),
			FramePosition = UDim2.new(0, 0, 0, 0),
			Border = {
				BorderPosition = UDim2.new(0, 0, 0.5, -1),
				BorderSize = UDim2.new(1, 0, 0, 1)
			}
		},
		{
			Size = UDim2.new(1, 0, 1, 0),
			Position = UDim2.new(0, 0, 0, 0),
			FrameSize = UDim2.new(0.5, -1, 0.5, -1),
			FramePosition = UDim2.new(0.5, 1, 0, 0)
		},
		{
			Size = UDim2.new(1, 0, 1, 0),
			Position = UDim2.new(0, 0, 0, 0),
			FrameSize = UDim2.new(0.5, -1, 0.5, -1),
			FramePosition = UDim2.new(0, 0, 0.5, 1),
			Border = {
				BorderPosition = UDim2.new(0.5, -1, 0, 0),
				BorderSize = UDim2.new(0, 1, 1, 0)
			}
		},
		{
			Size = UDim2.new(1, 0, 1, 0),
			Position = UDim2.new(0, 0, 0, 0),
			FrameSize = UDim2.new(0.5, -1, 0.5, -1),
			FramePosition = UDim2.new(0.5, 1, 0.5, 1)
		}
	}
}
local ConversationThumbnail = RoactModule.PureComponent:extend("ConversationThumbnail")

function ConversationThumbnail.render(p1)
	-- upvalues: config (copy), Constants (copy), InviteAvatarThumbnailSize (copy), GetRbxthumbWithTypeSizeAndOptionsFunction (copy), ConstantsModule (copy), RoactModule (copy), GRAY3 (copy)
	local Size = p1.props.size
	local LayoutOrder = p1.props.layoutOrder
	local ZIndex = p1.props.zIndex
	local Users = p1.props.users
	local CountUsers = #Users
	local Frames = {}
	
	for i, user in ipairs(Users) do
		local Entry = config[CountUsers][i]
		Frames["AvatarHolder-" .. i] = RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ClipsDescendants = true,
			Size = Entry.FrameSize,
			Position = Entry.FramePosition,
			ZIndex = ZIndex
		}, {
			Avatar = RoactModule.createElement("ImageLabel", {
				BackgroundTransparency = 1,
				Size = Entry.Size,
				Position = Entry.Position,
				Image = (if user then GetRbxthumbWithTypeSizeAndOptionsFunction(user.id, ConstantsModule.InviteAvatarRbxthumbType, Constants.RbxThumbnailSizeToNumberSize[InviteAvatarThumbnailSize]) else nil) or "rbxasset://textures/ui/LuaApp/graphic/ph-avatar-portrait.png",
				ZIndex = ZIndex
			})
		})
		
		if Entry.Border then
			Frames["Border-" .. i] = RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = Entry.Border.BorderSize,
				Position = Entry.Border.BorderPosition,
				BackgroundColor3 = GRAY3,
				ZIndex = ZIndex
			})
		end
	end
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = Size,
		LayoutOrder = LayoutOrder,
		ZIndex = ZIndex
	}, {
		ContentsContainer = RoactModule.createElement("Frame", {
			BackgroundTransparency = 0,
			BorderSizePixel = 1,
			Size = UDim2.new(1, -1, 1, -1),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			BackgroundColor3 = ConstantsModule.Color.WHITE,
			BorderColor3 = GRAY3,
			ZIndex = ZIndex
		}, Frames)
	})
end

return ConversationThumbnail