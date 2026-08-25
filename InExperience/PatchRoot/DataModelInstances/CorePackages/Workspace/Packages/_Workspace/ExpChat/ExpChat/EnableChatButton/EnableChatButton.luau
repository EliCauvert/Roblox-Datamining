local textChatService = game:GetService("TextChatService")
local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local reactModule = require(parent.React)
local useCursor = require(parent.UIBlox).App.SelectionCursor.useCursor
local localizationModule = require(expChat.Localization)
local configModule = require(expChat.Config)
local useInterpolatedClientSettingsModule = require(expChat.ClientSettings.useInterpolatedClientSettings)
local enableChatButtonTelemetryEnabledEngineFeature = game:GetEngineFeature("EnableChatButtonTelemetryEnabled")
local fFlagExpChatNewInputBarModule = require(expChat.Flags.FFlagExpChatNewInputBar)

local function _(value, p0)
	return p0:map(function(p1)
		-- upvalues: value (ref)
		return value + p1 * (1 - value)
	end)
end

return localizationModule.connect(function()
	return {
		EnableChatButtonText = "CoreScripts.TextChat.EnableChatButton.Label.UnlockChat"
	}
end)(function(p2)
	-- upvalues: useCursor (ref), useInterpolatedClientSettingsModule (ref), reactModule (ref), enableChatButtonTelemetryEnabledEngineFeature (ref), textChatService (ref), fFlagExpChatNewInputBarModule (ref), configModule (ref)
	local var8 = useCursor()
	local isSpatialUIEnabled = p2.isSpatialUIEnabled
	local chatWindowSettings = p2.chatWindowSettings
	local backgroundTransparency = useInterpolatedClientSettingsModule(chatWindowSettings).BackgroundTransparency
	local backgroundColor3 = useInterpolatedClientSettingsModule(chatWindowSettings).BackgroundColor3
	reactModule.useEffect(function()
		-- upvalues: enableChatButtonTelemetryEnabledEngineFeature (copy), p2 (ref), textChatService (copy)
		if enableChatButtonTelemetryEnabledEngineFeature and p2.visible then
			textChatService:SendEnableChatButtonShown()
		end
	end, { p2.visible })
	local createElement = reactModule.createElement
	local var9 = "Frame"
	local t = {
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundColor3 = backgroundColor3,
		BackgroundTransparency = if fFlagExpChatNewInputBarModule then 1 else p2.transparencyValue:map(function(p3)
			-- upvalues: backgroundTransparency (ref)
			return backgroundTransparency + p3 * (1 - backgroundTransparency)
		end),
		BorderSizePixel = 0,
		LayoutOrder = p2.LayoutOrder,
		Size = UDim2.fromScale(1, 0),
		Visible = p2.visible,
		ZIndex = 2,
		[reactModule.Event.MouseEnter] = p2.onHovered,
		[reactModule.Event.MouseLeave] = p2.onUnhovered
	}
	local t_1 = {
		UIPadding = reactModule.createElement("UIPadding", {
			PaddingLeft = if fFlagExpChatNewInputBarModule then nil else UDim.new(0, 8),
			PaddingRight = if fFlagExpChatNewInputBarModule then nil else UDim.new(0, 8),
			PaddingTop = p2.addTopPadding and UDim.new(0, 8) or UDim.new(0, 0),
			PaddingBottom = UDim.new(0, 1)
		})
	}
	local createElement_1 = reactModule.createElement
	local var12 = "TextButton"
	local t_2 = {
		AutomaticSize = Enum.AutomaticSize.XY,
		BackgroundColor3 = configModule.EnableChatButtonBackgroundColor
	}
	local enableChatButtonBackgroundTransparency = configModule.EnableChatButtonBackgroundTransparency
	t_2.BackgroundTransparency = p2.transparencyValue:map(function(p4)
		-- upvalues: enableChatButtonBackgroundTransparency (ref)
		return enableChatButtonBackgroundTransparency + p4 * (1 - enableChatButtonBackgroundTransparency)
	end)
	t_2.Size = UDim2.fromScale(1, 0)
	t_2.FontFace = configModule.EnableChatButtonFontFace
	t_2.Selectable = true
	t_2.SelectionImageObject = var8
	t_2.Text = if p2.EnableChatButtonText == nil or p2.EnableChatButtonText == "" then "Unlock chat" else p2.EnableChatButtonText
	t_2.TextColor3 = configModule.ChatInputBarTextColor3
	t_2.TextSize = if isSpatialUIEnabled then configModule.ChatInputBarSpatialPanelTextSize else configModule.ChatInputBarTextSize
	local var14 = 0
	t_2.TextTransparency = p2.transparencyValue:map(function(p5)
		-- upvalues: var14 (ref)
		return var14 + p5 * (1 - var14)
	end)
	t_2.TextWrapped = true
	t_2.TextXAlignment = Enum.TextXAlignment.Center
	t_2.TextYAlignment = Enum.TextYAlignment.Center
	t_2.ZIndex = 2
	
	t_2[reactModule.Event.Activated] = function()
		-- upvalues: enableChatButtonTelemetryEnabledEngineFeature (copy), textChatService (copy), p2 (ref)
		if enableChatButtonTelemetryEnabledEngineFeature then
			textChatService:SendEnableChatButtonClicked()
		end
		p2.onActivated()
	end
	
	t_1.EnableChatButton = createElement_1(var12, t_2, {
		Corner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }),
		UIPadding = reactModule.createElement("UIPadding", {
			PaddingBottom = UDim.new(0, 10),
			PaddingLeft = UDim.new(0, 10),
			PaddingRight = UDim.new(0, 10),
			PaddingTop = UDim.new(0, 10)
		})
	})
	
	return createElement(var9, t, t_1)
end)