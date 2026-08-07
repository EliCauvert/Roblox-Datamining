local corePackagesService = game:GetService("CorePackages")
local roactModule = require(corePackagesService.Packages.Roact)
local constantsModule = require(game:GetService("CoreGui").RobloxGui.Modules.Settings.Pages.ShareGame.Constants)
local constants = require(corePackagesService.Workspace.Packages.UserLib).Utils.Constants
local getRbxthumbWithTypeSizeAndOptions = require(corePackagesService.Workspace.Packages.UserLib).Utils.getRbxthumbWithTypeSizeAndOptions
local GRAY3 = constantsModule.Color.GRAY3
local inviteAvatarThumbnailSize = constantsModule.InviteAvatarThumbnailSize
local t = {
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
local conversationThumbnail = roactModule.PureComponent:extend("ConversationThumbnail")

function conversationThumbnail.render(p0) --[[ line: 113 ]]
	-- upvalues: t (ref), constants (ref), inviteAvatarThumbnailSize (ref), getRbxthumbWithTypeSizeAndOptions (ref), constantsModule (ref), roactModule (ref), GRAY3 (ref)
	local size = p0.props.size
	local layoutOrder = p0.props.layoutOrder
	local zIndex = p0.props.zIndex
	local users = p0.props.users
	local usersCount = #users
	local t_1 = {}
	
	for i, v in ipairs(users) do
		local var7 = t[usersCount][i]
		t_1["AvatarHolder-" .. i] = roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ClipsDescendants = true,
			Size = var7.FrameSize,
			Position = var7.FramePosition,
			ZIndex = zIndex
		}, {
			Avatar = roactModule.createElement("ImageLabel", {
				BackgroundTransparency = 1,
				Size = var7.Size,
				Position = var7.Position,
				Image = (if v then getRbxthumbWithTypeSizeAndOptions(v.id, constantsModule.InviteAvatarRbxthumbType, constants.RbxThumbnailSizeToNumberSize[inviteAvatarThumbnailSize]) else nil) or "rbxasset://textures/ui/LuaApp/graphic/ph-avatar-portrait.png",
				ZIndex = zIndex
			})
		})
		
		if var7.Border then
			t_1["Border-" .. i] = roactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = var7.Border.BorderSize,
				Position = var7.Border.BorderPosition,
				BackgroundColor3 = GRAY3,
				ZIndex = zIndex
			})
		end
	end
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = size,
		LayoutOrder = layoutOrder,
		ZIndex = zIndex
	}, {
		ContentsContainer = roactModule.createElement("Frame", {
			BackgroundTransparency = 0,
			BorderSizePixel = 1,
			Size = UDim2.new(1, -1, 1, -1),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			BackgroundColor3 = constantsModule.Color.WHITE,
			BorderColor3 = GRAY3,
			ZIndex = zIndex
		}, t_1)
	})
end

return conversationThumbnail