local TextChatService = game:GetService("TextChatService")
local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local ReactModule = require(Parent.React)
local UseCursorFunction = require(Parent.UIBlox).App.SelectionCursor.useCursor
local ConfigModule = require(ExpChat.Config)
local UseInterpolatedClientSettingsModule = require(ExpChat.ClientSettings.useInterpolatedClientSettings)
local EnableChatButtonTelemetryEnabledEngineFeature = game:GetEngineFeature("EnableChatButtonTelemetryEnabled")
local FFlagExpChatNewInputBarModule = require(ExpChat.Flags.FFlagExpChatNewInputBar)

local function _(p1, p2)
	return p2:map(function(p3): number
		-- upvalues: p1 (copy)
		return p1 + p3 * (1 - p1)
	end)
end

return require(ExpChat.Localization).connect(function()
	return {
		EnableChatButtonText = "CoreScripts.TextChat.EnableChatButton.Label.UnlockChat"
	}
end)(function(Frame)
	-- upvalues: UseCursorFunction (copy), UseInterpolatedClientSettingsModule (copy), ReactModule (copy), EnableChatButtonTelemetryEnabledEngineFeature (copy), TextChatService (copy), FFlagExpChatNewInputBarModule (copy), ConfigModule (copy)
	local UseCursorResult = UseCursorFunction()
	local IsSpatialUIEnabled = Frame.isSpatialUIEnabled
	local ChatWindowSettings = Frame.chatWindowSettings
	local BackgroundTransparency = UseInterpolatedClientSettingsModule(ChatWindowSettings).BackgroundTransparency
	local BackgroundColor3 = UseInterpolatedClientSettingsModule(ChatWindowSettings).BackgroundColor3
	ReactModule.useEffect(function()
		-- upvalues: EnableChatButtonTelemetryEnabledEngineFeature (upval), Frame (copy), TextChatService (upval)
		if EnableChatButtonTelemetryEnabledEngineFeature and Frame.visible then
			TextChatService:SendEnableChatButtonShown()
		end
	end, { Frame.visible })
	local EnableChatButtonBackgroundTransparency = ConfigModule.EnableChatButtonBackgroundTransparency
	local v1 = 0
	
	return ReactModule.createElement("Frame", {
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundColor3 = BackgroundColor3,
		BackgroundTransparency = if FFlagExpChatNewInputBarModule then 1 else Frame.transparencyValue:map(function(p1): number
			-- upvalues: BackgroundTransparency (copy)
			return BackgroundTransparency + p1 * (1 - BackgroundTransparency)
		end),
		BorderSizePixel = 0,
		LayoutOrder = Frame.LayoutOrder,
		Size = UDim2.fromScale(1, 0),
		Visible = Frame.visible,
		ZIndex = 2,
		[ReactModule.Event.MouseEnter] = Frame.onHovered,
		[ReactModule.Event.MouseLeave] = Frame.onUnhovered
	}, {
		UIPadding = ReactModule.createElement("UIPadding", {
			PaddingLeft = if FFlagExpChatNewInputBarModule then nil else UDim.new(0, 8),
			PaddingRight = if FFlagExpChatNewInputBarModule then nil else UDim.new(0, 8),
			PaddingTop = Frame.addTopPadding and UDim.new(0, 8) or UDim.new(0, 0),
			PaddingBottom = UDim.new(0, 1)
		}),
		EnableChatButton = ReactModule.createElement("TextButton", {
			AutomaticSize = Enum.AutomaticSize.XY,
			BackgroundColor3 = ConfigModule.EnableChatButtonBackgroundColor,
			BackgroundTransparency = Frame.transparencyValue:map(function(p1): number
				-- upvalues: EnableChatButtonBackgroundTransparency (copy)
				return EnableChatButtonBackgroundTransparency + p1 * (1 - EnableChatButtonBackgroundTransparency)
			end),
			Size = UDim2.fromScale(1, 0),
			FontFace = ConfigModule.EnableChatButtonFontFace,
			Selectable = true,
			SelectionImageObject = UseCursorResult,
			Text = if Frame.EnableChatButtonText == nil or Frame.EnableChatButtonText == "" then "Unlock chat" else Frame.EnableChatButtonText,
			TextColor3 = ConfigModule.ChatInputBarTextColor3,
			TextSize = if IsSpatialUIEnabled then ConfigModule.ChatInputBarSpatialPanelTextSize else ConfigModule.ChatInputBarTextSize,
			TextTransparency = Frame.transparencyValue:map(function(p1): number
				-- upvalues: v1 (copy)
				return v1 + p1 * (1 - v1)
			end),
			TextWrapped = true,
			TextXAlignment = Enum.TextXAlignment.Center,
			TextYAlignment = Enum.TextYAlignment.Center,
			ZIndex = 2,
			[ReactModule.Event.Activated] = function()
				-- upvalues: EnableChatButtonTelemetryEnabledEngineFeature (upval), TextChatService (upval), Frame (copy)
				if EnableChatButtonTelemetryEnabledEngineFeature then
					TextChatService:SendEnableChatButtonClicked()
				end
				Frame.onActivated()
			end
		}, {
			Corner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }),
			UIPadding = ReactModule.createElement("UIPadding", {
				PaddingBottom = UDim.new(0, 10),
				PaddingLeft = UDim.new(0, 10),
				PaddingRight = UDim.new(0, 10),
				PaddingTop = UDim.new(0, 10)
			})
		})
	})
end)