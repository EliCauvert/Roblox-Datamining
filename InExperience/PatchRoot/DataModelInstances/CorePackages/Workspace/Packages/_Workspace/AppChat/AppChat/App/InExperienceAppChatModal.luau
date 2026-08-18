local coreGuiService = game:GetService("CoreGui")
local guiService = game:GetService("GuiService")
local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local UIBloxModule = require(parent.UIBlox)
local tokens = UIBloxModule.App.Style.Tokens
local constants = UIBloxModule.App.Style.Constants
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagExpChatEnableFriendsTab = sharedFlagsModule.FFlagExpChatEnableFriendsTab
local fFlagSettingsHubIndependentBackgroundVisibility = sharedFlagsModule.getFFlagSettingsHubIndependentBackgroundVisibility()
local getFFlagAppChatInExperienceTabBarAdjustmentModule = require(appChat.Flags.getFFlagAppChatInExperienceTabBarAdjustment)
local enumScreensModule = require(appChat.EnumScreens)
local chatSessionRefCountModule = require(appChat.Hooks.ChatSessionRefCount)
local t = {}
t.__index = t

local function _() --[[ line: 24 | named "getFFlagAppChatEnableRootedNavigation" ]]
	-- upvalues: appChat (ref)
	return require(appChat.Flags.getFFlagAppChatEnableRootedNavigation)()
end

local _ = function() --[[ line: 28 | named "getRootedNavigationStore" ]]
	-- upvalues: appChat (ref)
	return require(appChat.Stores.GetRootedNavigationStore)(false)
end

local _ = function(p0) --[[ line: 42 | named "isSupportedRootedRoute" ]]
	-- upvalues: enumScreensModule (ref)
	local params = p0.params
	local var10 = if params then params.conversationId else nil
	
	return p0.screen == enumScreensModule.ChatDetails and (params ~= nil and (params.rooted == true and (type(var10) == "string" and var10 ~= "")))
end

function t._new() --[[ line: 93 ]]
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

function t.initialize(p1, p2, p3, p4, p5, p6) --[[ line: 114 ]]
	-- upvalues: tokens (ref), constants (ref), getFFlagAppChatInExperienceTabBarAdjustmentModule (ref)
	if p2 then
		p1.topMargin = p2
	end
	p1.settingsHub = p3
	p1._foundationTokens = tokens.getFoundationTokensDefaultScale(constants.ThemeName.Dark)
	
	if getFFlagAppChatInExperienceTabBarAdjustmentModule() then
		p1.viewportUtil = p4
	end
	p1.chatSelector = p5
	p1.playerListManager = p6
end

function t.setVisible(value, p7, p8) --[[ line: 138 ]]
	-- upvalues: appChat (ref), fFlagExpChatEnableFriendsTab (ref), chatSessionRefCountModule (ref), coreGuiService (ref), getFFlagAppChatInExperienceTabBarAdjustmentModule (ref), guiService (ref), fFlagSettingsHubIndependentBackgroundVisibility (ref)
	if not p7 and require(appChat.Flags.getFFlagAppChatEnableRootedNavigation)() then
		require(appChat.Stores.GetRootedNavigationStore)(false).cancelNavigation()
	end
	if p7 == value._visible then return end
	if fFlagExpChatEnableFriendsTab and not p7 and value._reserveChatSessionOnClose then
		value._reserveChatSessionOnClose = false
		
		if chatSessionRefCountModule.getReservations() == 0 then
			chatSessionRefCountModule.reserve()
		end
	end
	value._visible = p7
	value.visibilitySignal:Fire(p7, p8)
	
	if p7 then
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
			local var16 = function() --[[ line: 199 ]]
				-- upvalues: value (ref), UIPadding (ref), guiService (copy)
				local var19 = value.viewportUtil.screenSize:get()
				
				if not var19 or not var19.X or not var19.Y then return end
				if var19.X < var19.Y then
					UIPadding.PaddingBottom = UDim.new(0, 0)
					
					return
				end
				UIPadding.PaddingBottom = UDim.new(0, guiService:GetSafeZoneOffsets().bottom)
			end
			
			value.viewportUtil.screenSize:connect(var16)
			var16()
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
		value.settingsHub:SetBackgroundVisibility(p7, false)
	end
end

function t.toggleVisibility(p9) --[[ line: 250 ]]
	if p9.default then
		p9.default:setVisible(not p9.default._visible)
	end
end

function t.getVisible(p10) --[[ line: 258 ]]
	return p10.default._visible
end

function t.setUnreadCount(value, p11) --[[ line: 263 ]]
	value.default.unreadCount = p11
	value.default.unreadCountSignal:Fire(p11)
end

function t.markInitialUnreadCountReceived(p12, p13) --[[ line: 271 ]]
	if p12.default.hasReceivedInitialUnreadCount then
		return
	end
	p12.default.hasReceivedInitialUnreadCount = true
	p12.default.initialUnreadCountSignal:Fire(p13)
end

function t.setCurrentSquadId(value, p14) --[[ line: 279 ]]
	value.default.currentSquadId = p14
	value.default.currentSquadIdSignal:Fire(p14)
end

function t.reserveChatSessionOnClose(p15) --[[ line: 287 ]]
	p15._reserveChatSessionOnClose = true
end

function t.openToScreen(p16, p17) --[[ line: 291 ]]
	-- upvalues: appChat (ref), enumScreensModule (ref), fFlagExpChatEnableFriendsTab (ref)
	local var20 = p17
	
	if require(appChat.Flags.getFFlagAppChatEnableRootedNavigation)() then
		local var21 = require(appChat.Stores.GetRootedNavigationStore)(false)
		local params = p17.params
		local var22 = if params then params.conversationId else nil
		local var23 = p17.screen == enumScreensModule.ChatDetails and (params ~= nil and (params.rooted == true and (type(var22) == "string" and var22 ~= "")))
		
		if var23 then
			var23 = table.clone(p17.params)
			var23.rootedNavigationRequestId = var21.beginNavigation()
			var20 = { screen = p17.screen, params = var23 }
		else
			var21.cancelNavigation()
		end
	end
	p16.requestedRoute = var20
	p16.requestedRouteSignal:Fire(var20)
	
	if fFlagExpChatEnableFriendsTab and p17.params and p17.params.rooted == true then
		p16:reserveChatSessionOnClose()
	end
	p16:setVisible(true, if fFlagExpChatEnableFriendsTab and var20.params then var20.params.entryPoint else nil)
end

function t.clearRequestedRoute(p18) --[[ line: 321 ]]
	p18.requestedRoute = nil
	p18.requestedRouteSignal:Fire(nil)
end

t.default = t._new()

return t