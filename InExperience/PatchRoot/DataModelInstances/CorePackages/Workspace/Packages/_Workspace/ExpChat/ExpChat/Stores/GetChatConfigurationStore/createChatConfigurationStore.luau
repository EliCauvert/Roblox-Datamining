local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local signalsModule = require(parent.Signals)
local tutilsModule = require(parent.tutils)
local createSignal = signalsModule.createSignal
local createComputed = signalsModule.createComputed
local defaultSettingsModule = require(expChat.installReducer.BubbleChat.DefaultSettings)

return function() --[[ line: 111 | named "createChatConfigurationStore" ]]
	-- upvalues: defaultSettingsModule (ref), expChat (ref), createSignal (ref), tutilsModule (ref), createComputed (ref)
	local cloned = table.clone(defaultSettingsModule)
	local configModule = require(expChat.Config)
	local t = {
		HeightScale = 1,
		WidthScale = 1,
		FontFace = configModule.ChatWindowFont,
		TextColor3 = configModule.ChatWindowTextColor3,
		TextSize = configModule.ChatWindowTextSize,
		TextStrokeColor3 = configModule.ChatWindowTextStrokeColor,
		TextStrokeTransparency = configModule.ChatWindowTextStrokeTransparency,
		BackgroundColor3 = configModule.ChatWindowBackgroundColor3,
		BackgroundTransparency = configModule.ChatWindowBackgroundTransparency,
		SpatialPanelTextSize = configModule.ChatWindowSpatialPanelTextSize
	}
	local t_1 = {
		BackgroundTransparency = configModule.ChatInputBarBackgroundTransparency,
		BackgroundColor3 = configModule.ChatInputBarBackgroundColor,
		TextSize = configModule.ChatInputBarTextSize,
		TextColor3 = configModule.ChatInputBarTextColor3,
		SpatialPanelTextSize = configModule.ChatInputBarSpatialPanelTextSize,
		TextStrokeColor3 = configModule.ChatInputBarTextStrokeColor,
		TextStrokeTransparency = configModule.ChatInputBarTextStrokeTransparency,
		FontFace = configModule.ChatInputBarFontFace,
		PlaceholderColor3 = configModule.ChatInputBarPlaceholderColor,
		KeyboardKeyCode = configModule.ChatInputBarDefaultFocusKeyCode,
		AutocompleteEnabled = configModule.ChatInputBarDefaultAutocompleteEnabled
	}
	local t_2 = {
		BackgroundTransparency = configModule.ChannelTabsSettings.BackgroundTransparency,
		BackgroundColor3 = configModule.ChannelTabsSettings.BackgroundColor3,
		HoverBackgroundColor3 = configModule.ChannelTabsSettings.HoverBackgroundColor3,
		FontFace = configModule.ChannelTabsSettings.FontFace,
		TextSize = configModule.ChannelTabsSettings.TextSize,
		TextColor3 = configModule.ChannelTabsSettings.TextColor3,
		SelectedTabTextColor3 = configModule.ChannelTabsSettings.SelectedTabTextColor3,
		TextStrokeColor3 = configModule.ChannelTabsSettings.TextStrokeColor3,
		TextStrokeTransparency = configModule.ChannelTabsSettings.TextStrokeTransparency
	}
	local var9, var10 = createSignal(cloned, tutilsModule.deepEqual)
	local var11, var12 = createSignal(t, tutilsModule.deepEqual)
	local var13, var14 = createSignal(t_1, tutilsModule.deepEqual)
	local var15, var16 = createSignal(t_2, tutilsModule.deepEqual)
	
	return {
		getBubbleChatSettings = var9,
		getChatWindowSettings = var11,
		getChatInputBarSettings = var13,
		getChannelTabsSettings = var15,
		setBubbleChatSettings = var10,
		setChatWindowSettings = var12,
		setChatInputBarSettings = var14,
		setChannelTabsSettings = var16,
		mergeBubbleChatSettings = function(value) --[[ line: 163 ]]
			-- upvalues: var10 (ref)
			var10(function(p0) --[[ line: 164 ]]
				-- upvalues: value (ref)
				local cloned = table.clone(p0)
				
				for i, v in pairs(value) do
					cloned[i] = v
				end
				return cloned
			end)
		end,
		mergeChatWindowSettings = function(value) --[[ line: 173 ]]
			-- upvalues: var12 (ref)
			var12(function(p1) --[[ line: 174 ]]
				-- upvalues: value (ref)
				local cloned = table.clone(p1)
				
				for i, v in pairs(value) do
					cloned[i] = v
				end
				return cloned
			end)
		end,
		mergeChatInputBarSettings = function(value) --[[ line: 183 ]]
			-- upvalues: var14 (ref)
			var14(function(p2) --[[ line: 184 ]]
				-- upvalues: value (ref)
				local cloned = table.clone(p2)
				
				for i, v in pairs(value) do
					cloned[i] = v
				end
				return cloned
			end)
		end,
		mergeChannelTabsSettings = function(value) --[[ line: 193 ]]
			-- upvalues: var16 (ref)
			var16(function(p3) --[[ line: 194 ]]
				-- upvalues: value (ref)
				local cloned = table.clone(p3)
				
				for i, v in pairs(value) do
					cloned[i] = v
				end
				return cloned
			end)
		end,
		setBubbleChatProperty = function(value, p4) --[[ line: 203 ]]
			-- upvalues: var10 (ref)
			var10(function(p5) --[[ line: 204 ]]
				-- upvalues: value (ref), p4 (ref)
				local cloned = table.clone(p5)
				cloned[value] = p4
				
				return cloned
			end)
		end,
		setChatWindowProperty = function(value, p6) --[[ line: 211 ]]
			-- upvalues: var12 (ref)
			var12(function(p7) --[[ line: 212 ]]
				-- upvalues: value (ref), p6 (ref)
				local cloned = table.clone(p7)
				cloned[value] = p6
				
				return cloned
			end)
		end,
		setChatInputBarProperty = function(value, p8) --[[ line: 219 ]]
			-- upvalues: var14 (ref)
			var14(function(p9) --[[ line: 220 ]]
				-- upvalues: value (ref), p8 (ref)
				local cloned = table.clone(p9)
				cloned[value] = p8
				
				return cloned
			end)
		end,
		setChannelTabsProperty = function(value, p10) --[[ line: 227 ]]
			-- upvalues: var16 (ref)
			var16(function(p11) --[[ line: 228 ]]
				-- upvalues: value (ref), p10 (ref)
				local cloned = table.clone(p11)
				cloned[value] = p10
				
				return cloned
			end)
		end,
		getIsBubbleChatEnabled = createComputed(function(p12) --[[ line: 157 ]]
			-- upvalues: var9 (ref)
			return var9(p12).Enabled or false
		end)
	}
end