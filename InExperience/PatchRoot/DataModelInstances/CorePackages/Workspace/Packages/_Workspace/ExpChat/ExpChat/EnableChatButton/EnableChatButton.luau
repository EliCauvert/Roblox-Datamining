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

local function _(value, p1)
	return p1:map(function(p2)
		-- upvalues: value (ref)
		return value + p2 * (1 - value)
	end)
end

return localizationModule.connect(function()
	return {
		EnableChatButtonText = "CoreScripts.TextChat.EnableChatButton.Label.UnlockChat"
	}
end)(function(p1)
	-- upvalues: useCursor (ref), useInterpolatedClientSettingsModule (ref), reactModule (ref), enableChatButtonTelemetryEnabledEngineFeature (ref), textChatService (ref), fFlagExpChatNewInputBarModule (ref), configModule (ref)
	local var1 = useCursor()
	local isSpatialUIEnabled = p1.isSpatialUIEnabled
	local chatWindowSettings = p1.chatWindowSettings
	local backgroundTransparency = useInterpolatedClientSettingsModule(chatWindowSettings).BackgroundTransparency
	local backgroundColor3 = useInterpolatedClientSettingsModule(chatWindowSettings).BackgroundColor3
	reactModule.useEffect(function()
		-- upvalues: enableChatButtonTelemetryEnabledEngineFeature (copy), p1 (ref), textChatService (copy)
		if enableChatButtonTelemetryEnabledEngineFeature and p1.visible then
			textChatService:SendEnableChatButtonShown()
		end
	end, { p1.visible })
	local createElement = reactModule.createElement
	local var2 = "Frame"
	local t = {
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundColor3 = backgroundColor3,
		BackgroundTransparency = if fFlagExpChatNewInputBarModule then 1 else p1.transparencyValue:map(function(p2)
			-- upvalues: backgroundTransparency (ref)
			return backgroundTransparency + p2 * (1 - backgroundTransparency)
		end),
		BorderSizePixel = 0,
		LayoutOrder = p1.LayoutOrder,
		Size = UDim2.fromScale(1, 0),
		Visible = p1.visible,
		ZIndex = 2,
		[reactModule.Event.MouseEnter] = p1.onHovered,
		[reactModule.Event.MouseLeave] = p1.onUnhovered
	}
	local t_1 = {
		UIPadding = reactModule.createElement("UIPadding", {
			PaddingLeft = if fFlagExpChatNewInputBarModule then nil else UDim.new(0, 8),
			PaddingRight = if fFlagExpChatNewInputBarModule then nil else UDim.new(0, 8),
			PaddingTop = p1.addTopPadding and UDim.new(0, 8) or UDim.new(0, 0),
			PaddingBottom = UDim.new(0, 1)
		})
	}
	local createElement_1 = reactModule.createElement
	local var3 = "TextButton"
	local t_2 = {
		AutomaticSize = Enum.AutomaticSize.XY,
		BackgroundColor3 = configModule.EnableChatButtonBackgroundColor
	}
	local enableChatButtonBackgroundTransparency = configModule.EnableChatButtonBackgroundTransparency
	t_2.BackgroundTransparency = p1.transparencyValue:map(function(p2)
		-- upvalues: enableChatButtonBackgroundTransparency (ref)
		return enableChatButtonBackgroundTransparency + p2 * (1 - enableChatButtonBackgroundTransparency)
	end)
	t_2.Size = UDim2.fromScale(1, 0)
	t_2.FontFace = configModule.EnableChatButtonFontFace
	t_2.Selectable = true
	t_2.SelectionImageObject = var1
	t_2.Text = if p1.EnableChatButtonText == nil or p1.EnableChatButtonText == "" then "Unlock chat" else p1.EnableChatButtonText
	t_2.TextColor3 = configModule.ChatInputBarTextColor3
	t_2.TextSize = if isSpatialUIEnabled then configModule.ChatInputBarSpatialPanelTextSize else configModule.ChatInputBarTextSize
	local var4 = 0
	t_2.TextTransparency = p1.transparencyValue:map(function(p2)
		-- upvalues: var4 (ref)
		return var4 + p2 * (1 - var4)
	end)
	t_2.TextWrapped = true
	t_2.TextXAlignment = Enum.TextXAlignment.Center
	t_2.TextYAlignment = Enum.TextYAlignment.Center
	t_2.ZIndex = 2
	
	t_2[reactModule.Event.Activated] = function()
		-- upvalues: enableChatButtonTelemetryEnabledEngineFeature (copy), textChatService (copy), p1 (ref)
		if enableChatButtonTelemetryEnabledEngineFeature then
			textChatService:SendEnableChatButtonClicked()
		end
		p1.onActivated()
	end
	
	t_1.EnableChatButton = createElement_1(var3, t_2, {
		Corner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }),
		UIPadding = reactModule.createElement("UIPadding", {
			PaddingBottom = UDim.new(0, 10),
			PaddingLeft = UDim.new(0, 10),
			PaddingRight = UDim.new(0, 10),
			PaddingTop = UDim.new(0, 10)
		})
	})
	
	return createElement(var2, t, t_1)
end)