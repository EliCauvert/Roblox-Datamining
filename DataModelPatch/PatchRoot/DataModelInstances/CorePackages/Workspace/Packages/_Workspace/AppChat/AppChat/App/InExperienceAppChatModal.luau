local CoreGui = game:GetService("CoreGui")
local GuiService = game:GetService("GuiService")
local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local UIBloxModule = require(Parent.UIBlox)
local Tokens = UIBloxModule.App.Style.Tokens
local Constants = UIBloxModule.App.Style.Constants
local FFlagSettingsHubIndependentBackgroundVisibility = require(Parent.SharedFlags).getFFlagSettingsHubIndependentBackgroundVisibility()
local GetFFlagAppChatInExperienceTabBarAdjustmentModule = require(AppChat.Flags.getFFlagAppChatInExperienceTabBarAdjustment)
local InExperienceAppChatModalModule = {}
InExperienceAppChatModalModule.__index = InExperienceAppChatModalModule

function InExperienceAppChatModalModule._new()
	-- upvalues: InExperienceAppChatModalModule (copy)
	local config = {
		_visible = false,
		_wasVisible = false,
		unreadCount = 0,
		currentSquadId = "",
		requestedRoute = nil,
		topMargin = 12,
		visibilitySignal = Instance.new("BindableEvent"),
		unreadCountSignal = Instance.new("BindableEvent"),
		currentSquadIdSignal = Instance.new("BindableEvent"),
		requestedRouteSignal = Instance.new("BindableEvent")
	}
	setmetatable(config, InExperienceAppChatModalModule)
	
	return config
end

function InExperienceAppChatModalModule.initialize(p1, TopMargin, SettingsHub, ViewportUtil, ChatSelector, PlayerListManager)
	-- upvalues: Tokens (copy), Constants (copy), GetFFlagAppChatInExperienceTabBarAdjustmentModule (copy)
	if TopMargin then
		p1.topMargin = TopMargin
	end
	p1.settingsHub = SettingsHub
	p1._foundationTokens = Tokens.getFoundationTokensDefaultScale(Constants.ThemeName.Dark)
	
	if GetFFlagAppChatInExperienceTabBarAdjustmentModule() then
		p1.viewportUtil = ViewportUtil
	end
	p1.chatSelector = ChatSelector
	p1.playerListManager = PlayerListManager
end

function InExperienceAppChatModalModule.setVisible(p1, _visible)
	-- upvalues: CoreGui (copy), GetFFlagAppChatInExperienceTabBarAdjustmentModule (copy), GuiService (copy), FFlagSettingsHubIndependentBackgroundVisibility (copy)
	if _visible == p1._visible then return end
	p1._visible = _visible
	p1.visibilitySignal:Fire(_visible)
	
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
			local function v16()
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
			
			p1.viewportUtil.screenSize:connect(v16)
			v16()
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

function InExperienceAppChatModalModule.setCurrentSquadId(p1, CurrentSquadId)
	p1.default.currentSquadId = CurrentSquadId
	p1.default.currentSquadIdSignal:Fire(CurrentSquadId)
end

function InExperienceAppChatModalModule.openToScreen(p1, RequestedRoute)
	p1.requestedRoute = RequestedRoute
	p1.requestedRouteSignal:Fire(RequestedRoute)
	p1:setVisible(true)
end

function InExperienceAppChatModalModule.clearRequestedRoute(p1)
	p1.requestedRoute = nil
	p1.requestedRouteSignal:Fire(nil)
end

InExperienceAppChatModalModule.default = InExperienceAppChatModalModule._new()

return InExperienceAppChatModalModule