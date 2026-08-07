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
local t = {}
t.__index = t

local function _() --[[ line: 22 | named "getFFlagAppChatEnableRootedNavigation" ]]
	-- upvalues: appChat (ref)
	return require(appChat.Flags.getFFlagAppChatEnableRootedNavigation)()
end

local _ = function() --[[ line: 26 | named "getRootedNavigationStore" ]]
	-- upvalues: appChat (ref)
	return require(appChat.Stores.GetRootedNavigationStore)(false)
end

local _ = function(p0) --[[ line: 40 | named "isSupportedRootedRoute" ]]
	-- upvalues: enumScreensModule (ref)
	local params = p0.params
	local var9 = if params then params.conversationId else nil
	
	return p0.screen == enumScreensModule.ChatDetails and (params ~= nil and (params.rooted == true and (type(var9) == "string" and var9 ~= "")))
end

function t._new() --[[ line: 89 ]]
	-- upvalues: t (ref)
	local t_1 = {
		_visible = false,
		_wasVisible = false,
		unreadCount = 0,
		hasReceivedInitialUnreadCount = false,
		currentSquadId = "",
		requestedRoute = nil,
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

function t.initialize(p1, p2, p3, p4, p5, p6) --[[ line: 109 ]]
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

function t.setVisible(value, p7, p8) --[[ line: 133 ]]
	-- upvalues: appChat (ref), coreGuiService (ref), getFFlagAppChatInExperienceTabBarAdjustmentModule (ref), guiService (ref), fFlagSettingsHubIndependentBackgroundVisibility (ref)
	if not p7 and require(appChat.Flags.getFFlagAppChatEnableRootedNavigation)() then
		require(appChat.Stores.GetRootedNavigationStore)(false).cancelNavigation()
	end
	if p7 == value._visible then return end
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
			local var15 = function() --[[ line: 182 ]]
				-- upvalues: value (ref), UIPadding (ref), guiService (copy)
				local var18 = value.viewportUtil.screenSize:get()
				
				if not var18 or not var18.X or not var18.Y then return end
				if var18.X < var18.Y then
					UIPadding.PaddingBottom = UDim.new(0, 0)
					
					return
				end
				UIPadding.PaddingBottom = UDim.new(0, guiService:GetSafeZoneOffsets().bottom)
			end
			
			value.viewportUtil.screenSize:connect(var15)
			var15()
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

function t.toggleVisibility(p9) --[[ line: 233 ]]
	if p9.default then
		p9.default:setVisible(not p9.default._visible)
	end
end

function t.getVisible(p10) --[[ line: 241 ]]
	return p10.default._visible
end

function t.setUnreadCount(value, p11) --[[ line: 246 ]]
	value.default.unreadCount = p11
	value.default.unreadCountSignal:Fire(p11)
end

function t.markInitialUnreadCountReceived(p12, p13) --[[ line: 254 ]]
	if p12.default.hasReceivedInitialUnreadCount then
		return
	end
	p12.default.hasReceivedInitialUnreadCount = true
	p12.default.initialUnreadCountSignal:Fire(p13)
end

function t.setCurrentSquadId(value, p14) --[[ line: 262 ]]
	value.default.currentSquadId = p14
	value.default.currentSquadIdSignal:Fire(p14)
end

function t.openToScreen(p15, p16) --[[ line: 267 ]]
	-- upvalues: appChat (ref), enumScreensModule (ref), fFlagExpChatEnableFriendsTab (ref)
	local var19 = p16
	
	if require(appChat.Flags.getFFlagAppChatEnableRootedNavigation)() then
		local var20 = require(appChat.Stores.GetRootedNavigationStore)(false)
		local params = p16.params
		local var21 = if params then params.conversationId else nil
		local var22 = p16.screen == enumScreensModule.ChatDetails and (params ~= nil and (params.rooted == true and (type(var21) == "string" and var21 ~= "")))
		
		if var22 then
			var22 = table.clone(p16.params)
			var22.rootedNavigationRequestId = var20.beginNavigation()
			var19 = { screen = p16.screen, params = var22 }
		else
			var20.cancelNavigation()
		end
	end
	p15.requestedRoute = var19
	p15.requestedRouteSignal:Fire(var19)
	p15:setVisible(true, if fFlagExpChatEnableFriendsTab and var19.params then var19.params.entryPoint else nil)
end

function t.clearRequestedRoute(p17) --[[ line: 291 ]]
	p17.requestedRoute = nil
	p17.requestedRouteSignal:Fire(nil)
end

t.default = t._new()

return t