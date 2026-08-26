local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local signalsModule = require(parent.Signals)
local tutilsModule = require(parent.tutils)
local createSignal = signalsModule.createSignal
local createComputed = signalsModule.createComputed
local defaultSettingsModule = require(expChat.installReducer.BubbleChat.DefaultSettings)

return function()
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
	local var1, var2 = createSignal(cloned, tutilsModule.deepEqual)
	local var3, var4 = createSignal(t, tutilsModule.deepEqual)
	local var5, var6 = createSignal(t_1, tutilsModule.deepEqual)
	local var7, var8 = createSignal(t_2, tutilsModule.deepEqual)
	
	return {
		getBubbleChatSettings = var1,
		getChatWindowSettings = var3,
		getChatInputBarSettings = var5,
		getChannelTabsSettings = var7,
		setBubbleChatSettings = var2,
		setChatWindowSettings = var4,
		setChatInputBarSettings = var6,
		setChannelTabsSettings = var8,
		mergeBubbleChatSettings = function(value)
			-- upvalues: var2 (ref)
			var2(function(p1)
				-- upvalues: value (ref)
				local cloned = table.clone(p1)
				
				for i, v in pairs(value) do
					cloned[i] = v
				end
				return cloned
			end)
		end,
		mergeChatWindowSettings = function(value)
			-- upvalues: var4 (ref)
			var4(function(p1)
				-- upvalues: value (ref)
				local cloned = table.clone(p1)
				
				for i, v in pairs(value) do
					cloned[i] = v
				end
				return cloned
			end)
		end,
		mergeChatInputBarSettings = function(value)
			-- upvalues: var6 (ref)
			var6(function(p1)
				-- upvalues: value (ref)
				local cloned = table.clone(p1)
				
				for i, v in pairs(value) do
					cloned[i] = v
				end
				return cloned
			end)
		end,
		mergeChannelTabsSettings = function(value)
			-- upvalues: var8 (ref)
			var8(function(p1)
				-- upvalues: value (ref)
				local cloned = table.clone(p1)
				
				for i, v in pairs(value) do
					cloned[i] = v
				end
				return cloned
			end)
		end,
		setBubbleChatProperty = function(value, p1)
			-- upvalues: var2 (ref)
			var2(function(p2)
				-- upvalues: value (ref), p1 (ref)
				local cloned = table.clone(p2)
				cloned[value] = p1
				
				return cloned
			end)
		end,
		setChatWindowProperty = function(value, p1)
			-- upvalues: var4 (ref)
			var4(function(p2)
				-- upvalues: value (ref), p1 (ref)
				local cloned = table.clone(p2)
				cloned[value] = p1
				
				return cloned
			end)
		end,
		setChatInputBarProperty = function(value, p1)
			-- upvalues: var6 (ref)
			var6(function(p2)
				-- upvalues: value (ref), p1 (ref)
				local cloned = table.clone(p2)
				cloned[value] = p1
				
				return cloned
			end)
		end,
		setChannelTabsProperty = function(value, p1)
			-- upvalues: var8 (ref)
			var8(function(p2)
				-- upvalues: value (ref), p1 (ref)
				local cloned = table.clone(p2)
				cloned[value] = p1
				
				return cloned
			end)
		end,
		getIsBubbleChatEnabled = createComputed(function(p1)
			-- upvalues: var1 (ref)
			return var1(p1).Enabled or false
		end)
	}
end