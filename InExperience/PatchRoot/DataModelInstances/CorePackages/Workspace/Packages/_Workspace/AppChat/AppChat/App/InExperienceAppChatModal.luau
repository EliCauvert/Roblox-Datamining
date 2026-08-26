local coreGuiService = game:GetService("CoreGui")
local guiService = game:GetService("GuiService")
local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local tokens = require(parent.UIBlox).App.Style.Tokens
local colorMode = require(parent.Foundation).Enums.ColorMode
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagExpChatEnableFriendsTab = sharedFlagsModule.FFlagExpChatEnableFriendsTab
local fFlagSettingsHubIndependentBackgroundVisibility = sharedFlagsModule.getFFlagSettingsHubIndependentBackgroundVisibility()
local getFFlagAppChatInExperienceTabBarAdjustmentModule = require(appChat.Flags.getFFlagAppChatInExperienceTabBarAdjustment)
local enumScreensModule = require(appChat.EnumScreens)
local chatSessionRefCountModule = require(appChat.Hooks.ChatSessionRefCount)
local t = {}
t.__index = t

local function _()
	-- upvalues: appChat (ref)
	return require(appChat.Flags.getFFlagAppChatEnableRootedNavigation)()
end

local _ = function()
	-- upvalues: appChat (ref)
	return require(appChat.Stores.GetRootedNavigationStore)(false)
end

local _ = function(p1)
	-- upvalues: enumScreensModule (ref)
	local params = p1.params
	local var1 = if params then params.conversationId else nil
	
	return p1.screen == enumScreensModule.ChatDetails and (params ~= nil and (params.rooted == true and (type(var1) == "string" and var1 ~= "")))
end

function t._new()
	-- upvalues: t (ref)
	local t_1 = {
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
	setmetatable(t_1, t)
	
	return t_1
end

function t.initialize(p1, p2, p3, p4, p5, p6)
	-- upvalues: tokens (ref), colorMode (ref), getFFlagAppChatInExperienceTabBarAdjustmentModule (ref)
	if p2 then
		p1.topMargin = p2
	end
	p1.settingsHub = p3
	p1._foundationTokens = tokens.getFoundationTokensDefaultScale(colorMode.Dark)
	
	if getFFlagAppChatInExperienceTabBarAdjustmentModule() then
		p1.viewportUtil = p4
	end
	p1.chatSelector = p5
	p1.playerListManager = p6
end

function t.setVisible(value, p1, p2)
	-- upvalues: appChat (ref), fFlagExpChatEnableFriendsTab (ref), chatSessionRefCountModule (ref), coreGuiService (ref), getFFlagAppChatInExperienceTabBarAdjustmentModule (ref), guiService (ref), fFlagSettingsHubIndependentBackgroundVisibility (ref)
	if not p1 and require(appChat.Flags.getFFlagAppChatEnableRootedNavigation)() then
		require(appChat.Stores.GetRootedNavigationStore)(false).cancelNavigation()
	end
	if p1 == value._visible then return end
	if fFlagExpChatEnableFriendsTab and not p1 and value._reserveChatSessionOnClose then
		value._reserveChatSessionOnClose = false
		
		if chatSessionRefCountModule.getReservations() == 0 then
			chatSessionRefCountModule.reserve()
		end
	end
	value._visible = p1
	value.visibilitySignal:Fire(p1, p2)
	
	if p1 then
		if value.chatSelector then
			value.chatSelector:HideTemp("AppChat", true)
		end
		if value.playerListManager then
			value.playerListManager:HideTemp("AppChat", true)
		end
		local inExperienceAppChatModal = Instance.new("ScreenGui")
		inExperienceAppChatModal.DisplayOrder = game:DefineFastInt("AppChatInExperienceStandaloneContainerDisplayOrder", 4)
		inExperienceAppChatModal.Parent = coreGuiService
		inExperienceAppChatModal.Name = "InExperienceAppChatModal"
		local UIPadding = Instance.new("UIPadding")
		UIPadding.PaddingTop = UDim.new(0, value.topMargin)
		UIPadding.PaddingRight = UDim.new(0, 12)
		UIPadding.PaddingBottom = UDim.new(0, 0)
		UIPadding.PaddingLeft = UDim.new(0, 12)
		UIPadding.Parent = inExperienceAppChatModal
		local UIListLayout = Instance.new("UIListLayout")
		UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
		UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
		UIListLayout.Parent = inExperienceAppChatModal
		local imageButton = Instance.new("ImageButton")
		imageButton.BorderSizePixel = 0
		imageButton.AutoButtonColor = false
		imageButton.Modal = true
		imageButton.BackgroundTransparency = value._foundationTokens.Color.OverMedia.OverMedia_0.Transparency
		imageButton.BackgroundColor3 = value._foundationTokens.Color.OverMedia.OverMedia_0.Color3
		imageButton.Size = UDim2.fromScale(1, 1)
		imageButton.Visible = true
		imageButton.Parent = inExperienceAppChatModal
		
		if getFFlagAppChatInExperienceTabBarAdjustmentModule() and value.viewportUtil then
			local var1 = function()
				-- upvalues: value (ref), UIPadding (ref), guiService (copy)
				local var2 = value.viewportUtil.screenSize:get()
				
				if not var2 or not var2.X or not var2.Y then return end
				if var2.X < var2.Y then
					UIPadding.PaddingBottom = UDim.new(0, 0)
					
					return
				end
				UIPadding.PaddingBottom = UDim.new(0, guiService:GetSafeZoneOffsets().bottom)
			end
			
			value.viewportUtil.screenSize:connect(var1)
			var1()
		end
		local UISizeConstraint = Instance.new("UISizeConstraint")
		UISizeConstraint.MaxSize = Vector2.new(850, 780)
		UISizeConstraint.Parent = imageButton
		local UICorner = Instance.new("UICorner")
		UICorner.CornerRadius = UDim.new(0, 8)
		UICorner.Parent = imageButton
		value.frame = imageButton
	elseif value.frame and value.frame.Parent then
		value.frame.Parent:Destroy()
		value.frame = nil
	end
	if value.chatSelector then
		value.chatSelector:HideTemp("AppChat", false)
	end
	if value.playerListManager then
		value.playerListManager:HideTemp("AppChat", false)
	end
	if value.settingsHub and fFlagSettingsHubIndependentBackgroundVisibility then
		value.settingsHub:SetBackgroundVisibility(p1, false)
	end
end

function t.toggleVisibility(p1)
	if p1.default then
		p1.default:setVisible(not p1.default._visible)
	end
end

function t.getVisible(p1)
	return p1.default._visible
end

function t.setUnreadCount(value, p1)
	value.default.unreadCount = p1
	value.default.unreadCountSignal:Fire(p1)
end

function t.markInitialUnreadCountReceived(p1, p2)
	if p1.default.hasReceivedInitialUnreadCount then
		return
	end
	p1.default.hasReceivedInitialUnreadCount = true
	p1.default.initialUnreadCountSignal:Fire(p2)
end

function t.setCurrentSquadId(value, p1)
	value.default.currentSquadId = p1
	value.default.currentSquadIdSignal:Fire(p1)
end

function t.reserveChatSessionOnClose(p1)
	p1._reserveChatSessionOnClose = true
end

function t.openToScreen(p1, p2)
	-- upvalues: appChat (ref), enumScreensModule (ref), fFlagExpChatEnableFriendsTab (ref)
	local var1 = p2
	
	if require(appChat.Flags.getFFlagAppChatEnableRootedNavigation)() then
		local var2 = require(appChat.Stores.GetRootedNavigationStore)(false)
		local params = p2.params
		local var3 = if params then params.conversationId else nil
		local var4 = p2.screen == enumScreensModule.ChatDetails and (params ~= nil and (params.rooted == true and (type(var3) == "string" and var3 ~= "")))
		
		if var4 then
			var4 = table.clone(p2.params)
			var4.rootedNavigationRequestId = var2.beginNavigation()
			var1 = { screen = p2.screen, params = var4 }
		else
			var2.cancelNavigation()
		end
	end
	p1.requestedRoute = var1
	p1.requestedRouteSignal:Fire(var1)
	
	if fFlagExpChatEnableFriendsTab and p2.params and p2.params.rooted == true then
		p1:reserveChatSessionOnClose()
	end
	p1:setVisible(true, if fFlagExpChatEnableFriendsTab and var1.params then var1.params.entryPoint else nil)
end

function t.clearRequestedRoute(p1)
	p1.requestedRoute = nil
	p1.requestedRouteSignal:Fire(nil)
end

t.default = t._new()

return t