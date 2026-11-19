local CoreGui = game:GetService("CoreGui")
local GuiService = game:GetService("GuiService")
local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local Tokens = require(Parent.UIBlox).App.Style.Tokens
local ColorMode = require(Parent.Foundation).Enums.ColorMode
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagSettingsHubIndependentBackgroundVisibility = SharedFlagsModule.getFFlagSettingsHubIndependentBackgroundVisibility()
local FFlagKeepSideSheetOpenBesideMenu = SharedFlagsModule.FFlagKeepSideSheetOpenBesideMenu
local GetFFlagAppChatInExperienceTabBarAdjustmentModule = require(AppChat.Flags.getFFlagAppChatInExperienceTabBarAdjustment)
local EnumScreensModule = require(AppChat.EnumScreens)
local ChatSessionRefCountModule = require(AppChat.Hooks.ChatSessionRefCount)
local InExperienceAppChatModalModule = {}
InExperienceAppChatModalModule.__index = InExperienceAppChatModalModule

local function _()
	-- upvalues: AppChat (copy)
	return require(AppChat.Stores.GetRootedNavigationStore)(false)
end

local _ = function(p1): boolean
	-- upvalues: EnumScreensModule (copy)
	local Params = p1.params
	local ConversationId = if Params then Params.conversationId else nil
	
	return p1.screen == EnumScreensModule.ChatDetails and (Params ~= nil and (Params.rooted == true and type(ConversationId) == "string" and ConversationId ~= ""))
end

function InExperienceAppChatModalModule._new()
	-- upvalues: InExperienceAppChatModalModule (copy)
	local config = {
		_visible = false,
		_wasVisible = false,
		unreadCount = 0,
		hasReceivedInitialUnreadCount = false,
		currentSquadId = "",
		requestedRoute = nil,
		_reserveChatSessionOnClose = false,
		_areaBesideSideSheetCleanup = nil,
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

function InExperienceAppChatModalModule.initialize(p1, TopMargin, SettingsHub, ViewportUtil, ChatSelector, PlayerListManager)
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

function InExperienceAppChatModalModule.setVisible(p1, _visible, EntryPoint)
	-- upvalues: AppChat (copy), ChatSessionRefCountModule (copy), CoreGui (copy), GetFFlagAppChatInExperienceTabBarAdjustmentModule (copy), GuiService (copy), FFlagKeepSideSheetOpenBesideMenu (copy), Parent (copy), FFlagSettingsHubIndependentBackgroundVisibility (copy)
	if not _visible then
		require(AppChat.Stores.GetRootedNavigationStore)(false).cancelNavigation()
	end
	if _visible == p1._visible then return end
	if not _visible and p1._reserveChatSessionOnClose then
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
			local function v23()
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
			
			p1.viewportUtil.screenSize:connect(v23)
			v23()
		end
		local SizeConstraint = Instance.new("UISizeConstraint")
		SizeConstraint.MaxSize = Vector2.new(850, 780)
		SizeConstraint.Parent = ImageButton
		local Corner = Instance.new("UICorner")
		Corner.CornerRadius = UDim.new(0, 8)
		Corner.Parent = ImageButton
		p1.frame = ImageButton
		
		if FFlagKeepSideSheetOpenBesideMenu then
			p1._standAloneLayout = {
				screenGui = InExperienceAppChatModal,
				frame = ImageButton,
				displayOrder = InExperienceAppChatModal.DisplayOrder,
				backgroundTransparency = ImageButton.BackgroundTransparency,
				uiPadding = Padding,
				uiListLayout = ListLayout,
				uiSizeConstraint = SizeConstraint
			}
			p1:_watchAreaBesideSideSheet()
		end
	else
		if FFlagKeepSideSheetOpenBesideMenu then
			p1:_stopWatchingAreaBesideSideSheet()
			require(Parent.InExperienceSideSheetStore.releaseWindowBesideSideSheet)(require(Parent.InExperienceSideSheetStore.Constants).IntegrationIds.ConnectDropdown, require(Parent.InExperienceSideSheetStore.AnalyticsConstants).Source.FriendsChatClosed)
		end
		if FFlagKeepSideSheetOpenBesideMenu then
			local StandAloneLayout = p1._standAloneLayout
			
			if StandAloneLayout then
				StandAloneLayout.uiPadding:Destroy()
				StandAloneLayout.uiListLayout:Destroy()
				StandAloneLayout.uiSizeConstraint:Destroy()
			end
			p1._standAloneLayout = nil
			p1.areaBesideSideSheet = nil
		end
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

function InExperienceAppChatModalModule._watchAreaBesideSideSheet(p1)
	-- upvalues: Parent (copy)
	p1:_stopWatchingAreaBesideSideSheet()
	local GetClaimedWindowAreaBesideSideSheetModule = require(Parent.InExperienceSideSheetStore.getClaimedWindowAreaBesideSideSheet)
	local ConnectDropdown = require(Parent.InExperienceSideSheetStore.Constants).IntegrationIds.ConnectDropdown
	p1._areaBesideSideSheetCleanup = require(Parent.Signals).createEffect(function(p2)
		-- upvalues: p1 (copy), GetClaimedWindowAreaBesideSideSheetModule (copy), ConnectDropdown (copy)
		p1:setAreaBesideSideSheet(GetClaimedWindowAreaBesideSideSheetModule(ConnectDropdown, p2))
	end)
end

function InExperienceAppChatModalModule._stopWatchingAreaBesideSideSheet(p1)
	local AreaBesideSideSheetCleanupFunction: () -> () = p1._areaBesideSideSheetCleanup
	p1._areaBesideSideSheetCleanup = nil
	
	if AreaBesideSideSheetCleanupFunction then
		AreaBesideSideSheetCleanupFunction()
	end
end

function InExperienceAppChatModalModule.setAreaBesideSideSheet(p1, AreaBesideSideSheet)
	-- upvalues: Parent (copy)
	local StandAloneLayout = p1._standAloneLayout
	
	if StandAloneLayout == nil or StandAloneLayout.frame.Parent == nil then return end
	local ScreenGui = StandAloneLayout.screenGui
	local Frame = StandAloneLayout.frame
	
	if AreaBesideSideSheet ~= nil then
		p1.areaBesideSideSheet = AreaBesideSideSheet
		ScreenGui.DisplayOrder = require(Parent.InExperienceSideSheetStore.Constants).FriendsChatFrameDisplayOrder
		ScreenGui.IgnoreGuiInset = true
		StandAloneLayout.uiPadding.Parent = nil
		StandAloneLayout.uiListLayout.Parent = nil
		StandAloneLayout.uiSizeConstraint.Parent = nil
		Frame.Modal = false
		Frame.Active = false
		Frame.BackgroundTransparency = 0
		Frame.AnchorPoint = Vector2.zero
		Frame.Position = UDim2.fromOffset(AreaBesideSideSheet.position.X, AreaBesideSideSheet.position.Y)
		Frame.Size = UDim2.fromOffset(AreaBesideSideSheet.size.X, AreaBesideSideSheet.size.Y)
		
		return
	end
	if p1.areaBesideSideSheet ~= nil then
		p1.areaBesideSideSheet = nil
		ScreenGui.DisplayOrder = StandAloneLayout.displayOrder
		ScreenGui.IgnoreGuiInset = false
		StandAloneLayout.uiPadding.Parent = ScreenGui
		StandAloneLayout.uiListLayout.Parent = ScreenGui
		StandAloneLayout.uiSizeConstraint.Parent = Frame
		Frame.Modal = true
		Frame.Active = true
		Frame.BackgroundTransparency = StandAloneLayout.backgroundTransparency
		Frame.AnchorPoint = Vector2.zero
		Frame.Position = UDim2.new()
		Frame.Size = UDim2.fromScale(1, 1)
		
		return
	end
end

function InExperienceAppChatModalModule.toggleVisibility(p1)
	if p1.default then
		p1.default:setVisible(not p1.default._visible)
	end
end

function InExperienceAppChatModalModule.getVisible(p1)
	return p1.default._visible
end

function InExperienceAppChatModalModule.setUnreadCount(p1, UnreadCount)
	p1.default.unreadCount = UnreadCount
	p1.default.unreadCountSignal:Fire(UnreadCount)
end

function InExperienceAppChatModalModule.markInitialUnreadCountReceived(p1, p2)
	if not p1.default.hasReceivedInitialUnreadCount then
		p1.default.hasReceivedInitialUnreadCount = true
		p1.default.initialUnreadCountSignal:Fire(p2)
		
		return
	end
end

function InExperienceAppChatModalModule.setCurrentSquadId(p1, CurrentSquadId)
	p1.default.currentSquadId = CurrentSquadId
	p1.default.currentSquadIdSignal:Fire(CurrentSquadId)
end

function InExperienceAppChatModalModule.reserveChatSessionOnClose(p1)
	p1._reserveChatSessionOnClose = true
end

function InExperienceAppChatModalModule.openToScreen(p1, RequestedRoute)
	-- upvalues: AppChat (copy), EnumScreensModule (copy)
	local RequestedRoute1 = RequestedRoute
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
	p1.requestedRoute = RequestedRoute1
	p1.requestedRouteSignal:Fire(RequestedRoute1)
	
	if RequestedRoute.params and RequestedRoute.params.rooted == true then
		p1:reserveChatSessionOnClose()
	end
	p1:setVisible(true, if RequestedRoute1.params then RequestedRoute1.params.entryPoint else nil)
end

function InExperienceAppChatModalModule.clearRequestedRoute(p1)
	p1.requestedRoute = nil
	p1.requestedRouteSignal:Fire(nil)
end

InExperienceAppChatModalModule.default = InExperienceAppChatModalModule._new()

return InExperienceAppChatModalModule