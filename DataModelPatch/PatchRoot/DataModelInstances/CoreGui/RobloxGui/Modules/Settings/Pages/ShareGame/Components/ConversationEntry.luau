local CorePackages = game:GetService("CorePackages")
local Players = game:GetService("Players")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(CorePackages.Packages.Roact)
local ThemeModule = require(Modules.Settings.Theme)
local ShareGame = Modules.Settings.Pages.ShareGame
local ConversationDetailsModule = require(ShareGame.Components.ConversationDetails)
local ConversationThumbnailModule = require(ShareGame.Components.ConversationThumbnail)
local EventStream = require(CorePackages.Workspace.Packages.Analytics).AnalyticsReporters.EventStream
local InviteButtonModule = require(ShareGame.Components.InviteButton)
local InviteStatus = require(ShareGame.Constants).InviteStatus
local ConversationEntry = RoactModule.PureComponent:extend("ConversationEntry")

function ConversationEntry.init(p1)
	-- upvalues: EventStream (copy), RbxAnalyticsService (copy), InviteStatus (copy), Players (copy)
	p1.eventStream = EventStream.new(RbxAnalyticsService)
	
	function p1.onInvite()
		-- upvalues: p1 (copy), InviteStatus (upval), Players (upval)
		local InviteStatus1 = p1.props.inviteStatus
		
		if InviteStatus1 and InviteStatus1 ~= InviteStatus.Failed then return end
		local Analytics = p1.props.analytics
		local Users = p1.props.users
		local InviteUserFunction = p1.props.inviteUser
		
		if #Users == 1 then
			InviteUserFunction(Users[1].id):andThen(function(Result)
				-- upvalues: Users (copy), Players (upval), Analytics (copy)
				if not Result then return end
				local Ids = {}
				
				for _, user in pairs(Users) do
					table.insert(Ids, user.id)
				end
				Analytics:onActivatedInviteSent(Players.LocalPlayer.UserId, Result.conversationId, Ids)
			end, function() end)
		end
	end
end

function ConversationEntry.render(p2)
	-- upvalues: RoactModule (copy), ThemeModule (copy), ConversationThumbnailModule (copy), ConversationDetailsModule (copy), InviteButtonModule (copy)
	local ZIndex = p2.props.zIndex
	
	return RoactModule.createElement("ImageButton", {
		Visible = p2.props.visible,
		Selectable = true,
		BackgroundColor3 = ThemeModule.color("PlayerRowFrame"),
		BackgroundTransparency = ThemeModule.transparency("PlayerRowFrame", 1),
		ImageTransparency = 0,
		ScaleType = Enum.ScaleType.Stretch,
		SliceCenter = Rect.new(),
		Size = p2.props.size,
		LayoutOrder = p2.props.layoutOrder,
		ZIndex = ZIndex,
		[RoactModule.Event.Activated] = p2.onInvite
	}, {
		UICorner = RoactModule.createElement("UICorner", { CornerRadius = ThemeModule.MenuContainerCornerRadius }) or nil,
		UIPadding = RoactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, 12),
			PaddingRight = UDim.new(0, 12),
			PaddingTop = UDim.new(0, 12),
			PaddingBottom = UDim.new(0, 12)
		}),
		UIListLayout = RoactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 12)
		}),
		Thumbnail = RoactModule.createElement(ConversationThumbnailModule, {
			layoutOrder = 0,
			users = p2.props.users,
			size = UDim2.new(0, 32, 0, 32),
			zIndex = ZIndex
		}),
		Details = RoactModule.createElement(ConversationDetailsModule, {
			layoutOrder = 1,
			title = p2.props.title,
			subtitle = p2.props.subtitle,
			presence = p2.props.presence,
			size = UDim2.new(1, -125, 1, 0),
			zIndex = ZIndex
		}),
		InviteButton = RoactModule.createElement(InviteButtonModule, {
			layoutOrder = 2,
			size = UDim2.new(0, 69, 1, 0),
			zIndex = ZIndex,
			onInvite = p2.onInvite,
			inviteStatus = p2.props.inviteStatus
		})
	})
end

return ConversationEntry