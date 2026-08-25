local corePackagesService = game:GetService("CorePackages")
local playersService = game:GetService("Players")
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local modules = game:GetService("CoreGui").RobloxGui.Modules
local roactModule = require(corePackagesService.Packages.Roact)
local themeModule = require(modules.Settings.Theme)
local shareGame = modules.Settings.Pages.ShareGame
local conversationDetailsModule = require(shareGame.Components.ConversationDetails)
local conversationThumbnailModule = require(shareGame.Components.ConversationThumbnail)
local eventStream = require(corePackagesService.Workspace.Packages.Analytics).AnalyticsReporters.EventStream
local inviteButtonModule = require(shareGame.Components.InviteButton)
local inviteStatus = require(shareGame.Constants).InviteStatus
local conversationEntry = roactModule.PureComponent:extend("ConversationEntry")

function conversationEntry.init(p0)
	-- upvalues: eventStream (ref), rbxAnalyticsService (ref), inviteStatus (ref), playersService (ref)
	p0.eventStream = eventStream.new(rbxAnalyticsService)
	
	function p0.onInvite()
		-- upvalues: p0 (ref), inviteStatus (copy), playersService (copy)
		local inviteStatus_1 = p0.props.inviteStatus
		
		if inviteStatus_1 and inviteStatus_1 ~= inviteStatus.Failed then return end
		local analytics = p0.props.analytics
		local users = p0.props.users
		local inviteUser = p0.props.inviteUser
		
		if #users == 1 then
			inviteUser(users[1].id):andThen(function(p1)
				-- upvalues: users (ref), playersService (copy), analytics (ref)
				if not p1 then return end
				local t = {}
				
				for i, v in pairs(users) do
					table.insert(t, v.id)
				end
				analytics:onActivatedInviteSent(playersService.LocalPlayer.UserId, p1.conversationId, t)
			end, function() end)
		end
	end
end

function conversationEntry.render(p2)
	-- upvalues: roactModule (ref), themeModule (ref), conversationThumbnailModule (ref), conversationDetailsModule (ref), inviteButtonModule (ref)
	local zIndex = p2.props.zIndex
	
	return roactModule.createElement("ImageButton", {
		Visible = p2.props.visible,
		Selectable = true,
		BackgroundColor3 = themeModule.color("PlayerRowFrame"),
		BackgroundTransparency = themeModule.transparency("PlayerRowFrame", 1),
		ImageTransparency = 0,
		ScaleType = Enum.ScaleType.Stretch,
		SliceCenter = Rect.new(),
		Size = p2.props.size,
		LayoutOrder = p2.props.layoutOrder,
		ZIndex = zIndex,
		[roactModule.Event.Activated] = p2.onInvite
	}, {
		UICorner = roactModule.createElement("UICorner", { CornerRadius = themeModule.MenuContainerCornerRadius }) or nil,
		UIPadding = roactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, 12),
			PaddingRight = UDim.new(0, 12),
			PaddingTop = UDim.new(0, 12),
			PaddingBottom = UDim.new(0, 12)
		}),
		UIListLayout = roactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 12)
		}),
		Thumbnail = roactModule.createElement(conversationThumbnailModule, {
			layoutOrder = 0,
			users = p2.props.users,
			size = UDim2.new(0, 32, 0, 32),
			zIndex = zIndex
		}),
		Details = roactModule.createElement(conversationDetailsModule, {
			layoutOrder = 1,
			title = p2.props.title,
			subtitle = p2.props.subtitle,
			presence = p2.props.presence,
			size = UDim2.new(1, -125, 1, 0),
			zIndex = zIndex
		}),
		InviteButton = roactModule.createElement(inviteButtonModule, {
			layoutOrder = 2,
			size = UDim2.new(0, 69, 1, 0),
			zIndex = zIndex,
			onInvite = p2.onInvite,
			inviteStatus = p2.props.inviteStatus
		})
	})
end

return conversationEntry