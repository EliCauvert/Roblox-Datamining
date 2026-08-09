local coreGuiService = game:GetService("CoreGui")
local guiService = game:GetService("GuiService")
local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local UIBloxModule = require(parent.UIBlox)
local tokens = UIBloxModule.App.Style.Tokens
local constants = UIBloxModule.App.Style.Constants
local fFlagSettingsHubIndependentBackgroundVisibility = require(parent.SharedFlags).getFFlagSettingsHubIndependentBackgroundVisibility()
local getFFlagAppChatInExperienceTabBarAdjustmentModule = require(appChat.Flags.getFFlagAppChatInExperienceTabBarAdjustment)
local t = {}
t.__index = t

function t._new() --[[ line: 52 ]]
	-- upvalues: t (ref)
	local t_1 = {
		_visible = false,
		_wasVisible = false,
		unreadCount = 0,
		currentSquadId = "",
		topMargin = 12,
		visibilitySignal = Instance.new("BindableEvent"),
		unreadCountSignal = Instance.new("BindableEvent"),
		currentSquadIdSignal = Instance.new("BindableEvent")
	}
	setmetatable(t_1, t)
	
	return t_1
end

function t.initialize(p0, p1, p2, p3, p4, p5) --[[ line: 68 ]]
	-- upvalues: tokens (ref), constants (ref), getFFlagAppChatInExperienceTabBarAdjustmentModule (ref)
	if p1 then
		p0.topMargin = p1
	end
	p0.settingsHub = p2
	p0._foundationTokens = tokens.getFoundationTokensDefaultScale(constants.ThemeName.Dark)
	
	if getFFlagAppChatInExperienceTabBarAdjustmentModule() then
		p0.viewportUtil = p3
	end
	p0.chatSelector = p4
	p0.playerListManager = p5
end

function t.setVisible(value, p6) --[[ line: 92 ]]
	-- upvalues: coreGuiService (ref), getFFlagAppChatInExperienceTabBarAdjustmentModule (ref), guiService (ref), fFlagSettingsHubIndependentBackgroundVisibility (ref)
	if p6 == value._visible then return end
	value._visible = p6
	value.visibilitySignal:Fire(p6)
	
	if p6 then
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
			local var12 = function() --[[ line: 137 ]]
				-- upvalues: value (ref), UIPadding (ref), guiService (copy)
				local var15 = value.viewportUtil.screenSize:get()
				
				if not var15 or not var15.X or not var15.Y then return end
				if var15.X < var15.Y then
					UIPadding.PaddingBottom = UDim.new(0, 0)
					
					return
				end
				UIPadding.PaddingBottom = UDim.new(0, guiService:GetSafeZoneOffsets().bottom)
			end
			
			value.viewportUtil.screenSize:connect(var12)
			var12()
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
		value.settingsHub:SetBackgroundVisibility(p6, false)
	end
end

function t.toggleVisibility(p7) --[[ line: 188 ]]
	if p7.default then
		p7.default:setVisible(not p7.default._visible)
	end
end

function t.getVisible(p8) --[[ line: 196 ]]
	return p8.default._visible
end

function t.setUnreadCount(value, p9) --[[ line: 201 ]]
	value.default.unreadCount = p9
	value.default.unreadCountSignal:Fire(p9)
end

function t.setCurrentSquadId(value, p10) --[[ line: 206 ]]
	value.default.currentSquadId = p10
	value.default.currentSquadIdSignal:Fire(p10)
end

t.default = t._new()

return t