local CoreGui = game:GetService("CoreGui")
local GuiService = game:GetService("GuiService")
local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local Tokens = require(Parent.UIBlox).App.Style.Tokens
local ColorMode = require(Parent.Foundation).Enums.ColorMode
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagExpChatEnableFriendsTab = SharedFlagsModule.FFlagExpChatEnableFriendsTab
local FFlagSettingsHubIndependentBackgroundVisibility = SharedFlagsModule.getFFlagSettingsHubIndependentBackgroundVisibility()
local GetFFlagAppChatInExperienceTabBarAdjustmentModule = require(AppChat.Flags.getFFlagAppChatInExperienceTabBarAdjustment)
local EnumScreensModule = require(AppChat.EnumScreens)
local ChatSessionRefCountModule = require(AppChat.Hooks.ChatSessionRefCount)
local InExperienceAppChatModalModule = {}
InExperienceAppChatModalModule.__index = InExperienceAppChatModalModule

local function _() --[[ Line: 25 | Named "getFFlagAppChatEnableRootedNavigation" ]]
	-- upvalues: AppChat (copy)
	return require(AppChat.Flags.getFFlagAppChatEnableRootedNavigation)()
end

local _ = function() --[[ Line: 29 | Named "getRootedNavigationStore" ]]
	-- upvalues: AppChat (copy)
	return require(AppChat.Stores.GetRootedNavigationStore)(false)
end

local _ = function(p1): boolean --[[ Line: 43 | Named "isSupportedRootedRoute" ]]
	-- upvalues: EnumScreensModule (copy)
	local Params = p1.params
	local ConversationId = if Params then Params.conversationId else nil
	
	return p1.screen == EnumScreensModule.ChatDetails and (Params ~= nil and (Params.rooted == true and type(ConversationId) == "string" and ConversationId ~= ""))
end

function InExperienceAppChatModalModule._new() --[[ Line: 94 ]]
	-- upvalues: InExperienceAppChatModalModule (copy)
	local config = {
		_visible = false,
		_wasVisible = false,
		unreadCount = 0,
		hasReceivedInitialUnreadCount = false,
		currentSquadId = "",
		requestedRoute = nil,
		_reserveChatSessionOnClose = false,
		topMargin = 12,
		visibilitySignal = Instance.new("BindableEvent"),
		unreadCountSignal = Instance.new("BindableEvent"),
		initialUnreadCountSignal = Instance.new("BindableEvent"),
		currentSquadIdSignal = Instance.new("BindableEvent"),
		requestedRouteSignal = Instance.new("BindableEvent")
	}
	setmetatable(config, InExperienceAppChatModalModule)
	
	return config
end

function InExperienceAppChatModalModule.initialize(p1, TopMargin, SettingsHub, ViewportUtil, ChatSelector, PlayerListManager) --[[ Line: 115 ]]
	-- upvalues: Tokens (copy), ColorMode (copy), GetFFlagAppChatInExperienceTabBarAdjustmentModule (copy)
	if TopMargin then
		p1.topMargin = TopMargin
	end
	p1.settingsHub = SettingsHub
	p1._foundationTokens = Tokens.getFoundationTokensDefaultScale(ColorMode.Dark)
	
	if GetFFlagAppChatInExperienceTabBarAdjustmentModule() then
		p1.viewportUtil = ViewportUtil
	end
	p1.chatSelector = ChatSelector
	p1.playerListManager = PlayerListManager
end

function InExperienceAppChatModalModule.setVisible(p1, _visible, EntryPoint) --[[ Line: 139 ]]
	-- upvalues: AppChat (copy), FFlagExpChatEnableFriendsTab (copy), ChatSessionRefCountModule (copy), CoreGui (copy), GetFFlagAppChatInExperienceTabBarAdjustmentModule (copy), GuiService (copy), FFlagSettingsHubIndependentBackgroundVisibility (copy)
	if not _visible and require(AppChat.Flags.getFFlagAppChatEnableRootedNavigation)() then
		require(AppChat.Stores.GetRootedNavigationStore)(false).cancelNavigation()
	end
	if _visible == p1._visible then return end
	if FFlagExpChatEnableFriendsTab and not _visible and p1._reserveChatSessionOnClose then
		p1._reserveChatSessionOnClose = false
		
		if ChatSessionRefCountModule.getReservations() == 0 then
			ChatSessionRefCountModule.reserve()
		end
	end
	p1._visible = _visible
	p1.visibilitySignal:Fire(_visible, EntryPoint)
	
	if _visible then
		if p1.chatSelector then
			p1.chatSelector:HideTemp("AppChat", true)
		end
		if p1.playerListManager then
			p1.playerListManager:HideTemp("AppChat", true)
		end
		local InExperienceAppChatModal = Instance.new("ScreenGui")
		InExperienceAppChatModal.DisplayOrder = game:DefineFastInt("AppChatInExperienceStandaloneContainerDisplayOrder", 4)
		InExperienceAppChatModal.Parent = CoreGui
		InExperienceAppChatModal.Name = "InExperienceAppChatModal"
		local Padding = Instance.new("UIPadding")
		Padding.PaddingTop = UDim.new(0, p1.topMargin)
		Padding.PaddingRight = UDim.new(0, 12)
		Padding.PaddingBottom = UDim.new(0, 0)
		Padding.PaddingLeft = UDim.new(0, 12)
		Padding.Parent = InExperienceAppChatModal
		local ListLayout = Instance.new("UIListLayout")
		ListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
		ListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
		ListLayout.Parent = InExperienceAppChatModal
		local ImageButton = Instance.new("ImageButton")
		ImageButton.BorderSizePixel = 0
		ImageButton.AutoButtonColor = false
		ImageButton.Modal = true
		ImageButton.BackgroundTransparency = p1._foundationTokens.Color.OverMedia.OverMedia_0.Transparency
		ImageButton.BackgroundColor3 = p1._foundationTokens.Color.OverMedia.OverMedia_0.Color3
		ImageButton.Size = UDim2.fromScale(1, 1)
		ImageButton.Visible = true
		ImageButton.Parent = InExperienceAppChatModal
		
		if GetFFlagAppChatInExperienceTabBarAdjustmentModule() and p1.viewportUtil then
			local function v24() --[[ Line: 200 ]]
				-- upvalues: p1 (copy), Padding (copy), GuiService (upval)
				local GetResult = p1.viewportUtil.screenSize:get()
				
				if not GetResult or not GetResult.X or not GetResult.Y then return end
				if GetResult.X < GetResult.Y then
					Padding.PaddingBottom = UDim.new(0, 0)
					
					return
				else
					Padding.PaddingBottom = UDim.new(0, GuiService:GetSafeZoneOffsets().bottom)
				end
			end
			
			p1.viewportUtil.screenSize:connect(v24)
			v24()
		end
		local SizeConstraint = Instance.new("UISizeConstraint")
		SizeConstraint.MaxSize = Vector2.new(850, 780)
		SizeConstraint.Parent = ImageButton
		local Corner = Instance.new("UICorner")
		Corner.CornerRadius = UDim.new(0, 8)
		Corner.Parent = ImageButton
		p1.frame = ImageButton
	else
		if p1.frame and p1.frame.Parent then
			p1.frame.Parent:Destroy()
			p1.frame = nil
		end
		if p1.chatSelector then
			p1.chatSelector:HideTemp("AppChat", false)
		end
		if p1.playerListManager then
			p1.playerListManager:HideTemp("AppChat", false)
		end
	end
	if p1.settingsHub and FFlagSettingsHubIndependentBackgroundVisibility then
		p1.settingsHub:SetBackgroundVisibility(_visible, false)
	end
end

function InExperienceAppChatModalModule.toggleVisibility(p1) --[[ Line: 251 ]]
	if p1.default then
		p1.default:setVisible(not p1.default._visible)
	end
end

function InExperienceAppChatModalModule.getVisible(p1) --[[ Line: 259 ]]
	return p1.default._visible
end

function InExperienceAppChatModalModule.setUnreadCount(p1, UnreadCount) --[[ Line: 264 ]]
	p1.default.unreadCount = UnreadCount
	p1.default.unreadCountSignal:Fire(UnreadCount)
end

function InExperienceAppChatModalModule.markInitialUnreadCountReceived(p1, p2) --[[ Line: 272 ]]
	if not p1.default.hasReceivedInitialUnreadCount then
		p1.default.hasReceivedInitialUnreadCount = true
		p1.default.initialUnreadCountSignal:Fire(p2)
		
		return
	end
end

function InExperienceAppChatModalModule.setCurrentSquadId(p1, CurrentSquadId) --[[ Line: 280 ]]
	p1.default.currentSquadId = CurrentSquadId
	p1.default.currentSquadIdSignal:Fire(CurrentSquadId)
end

function InExperienceAppChatModalModule.reserveChatSessionOnClose(p1) --[[ Line: 288 ]]
	p1._reserveChatSessionOnClose = true
end

function InExperienceAppChatModalModule.openToScreen(p1, RequestedRoute) --[[ Line: 292 ]]
	-- upvalues: AppChat (copy), EnumScreensModule (copy), FFlagExpChatEnableFriendsTab (copy)
	local RequestedRoute1 = RequestedRoute
	
	if require(AppChat.Flags.getFFlagAppChatEnableRootedNavigation)() then
		local v1 = require(AppChat.Stores.GetRootedNavigationStore)(false)
		local Params = RequestedRoute.params
		local ConversationId = if Params then Params.conversationId else nil
		
		if RequestedRoute.screen == EnumScreensModule.ChatDetails and (Params ~= nil and (Params.rooted == true and (type(ConversationId) == "string" and ConversationId ~= ""))) then
			local Copy = table.clone(RequestedRoute.params)
			Copy.rootedNavigationRequestId = v1.beginNavigation()
			RequestedRoute1 = { screen = RequestedRoute.screen, params = Copy }
		else
			v1.cancelNavigation()
		end
	end
	p1.requestedRoute = RequestedRoute1
	p1.requestedRouteSignal:Fire(RequestedRoute1)
	
	if FFlagExpChatEnableFriendsTab and RequestedRoute.params and RequestedRoute.params.rooted == true then
		p1:reserveChatSessionOnClose()
	end
	p1:setVisible(true, if FFlagExpChatEnableFriendsTab and RequestedRoute1.params then RequestedRoute1.params.entryPoint else nil)
end

function InExperienceAppChatModalModule.clearRequestedRoute(p1) --[[ Line: 322 ]]
	p1.requestedRoute = nil
	p1.requestedRouteSignal:Fire(nil)
end

InExperienceAppChatModalModule.default = InExperienceAppChatModalModule._new()

return InExperienceAppChatModalModule