local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local SignalsModule = require(Parent.Signals)
local TutilsModule = require(Parent.tutils)
local CreateSignalFunction = SignalsModule.createSignal
local CreateComputedFunction = SignalsModule.createComputed
local DefaultSettingsModule = require(ExpChat.installReducer.BubbleChat.DefaultSettings)

return function() --[[ Line: 111 | Named "createChatConfigurationStore" ]]
	-- upvalues: DefaultSettingsModule (copy), ExpChat (copy), CreateSignalFunction (copy), TutilsModule (copy), CreateComputedFunction (copy)
	local ConfigModule = require(ExpChat.Config)
	local config = {
		HeightScale = 1,
		WidthScale = 1,
		FontFace = ConfigModule.ChatWindowFont,
		TextColor3 = ConfigModule.ChatWindowTextColor3,
		TextSize = ConfigModule.ChatWindowTextSize,
		TextStrokeColor3 = ConfigModule.ChatWindowTextStrokeColor,
		TextStrokeTransparency = ConfigModule.ChatWindowTextStrokeTransparency,
		BackgroundColor3 = ConfigModule.ChatWindowBackgroundColor3,
		BackgroundTransparency = ConfigModule.ChatWindowBackgroundTransparency,
		SpatialPanelTextSize = ConfigModule.ChatWindowSpatialPanelTextSize
	}
	local config1 = {
		BackgroundTransparency = ConfigModule.ChatInputBarBackgroundTransparency,
		BackgroundColor3 = ConfigModule.ChatInputBarBackgroundColor,
		TextSize = ConfigModule.ChatInputBarTextSize,
		TextColor3 = ConfigModule.ChatInputBarTextColor3,
		SpatialPanelTextSize = ConfigModule.ChatInputBarSpatialPanelTextSize,
		TextStrokeColor3 = ConfigModule.ChatInputBarTextStrokeColor,
		TextStrokeTransparency = ConfigModule.ChatInputBarTextStrokeTransparency,
		FontFace = ConfigModule.ChatInputBarFontFace,
		PlaceholderColor3 = ConfigModule.ChatInputBarPlaceholderColor,
		KeyboardKeyCode = ConfigModule.ChatInputBarDefaultFocusKeyCode,
		AutocompleteEnabled = ConfigModule.ChatInputBarDefaultAutocompleteEnabled
	}
	local config2 = {
		BackgroundTransparency = ConfigModule.ChannelTabsSettings.BackgroundTransparency,
		BackgroundColor3 = ConfigModule.ChannelTabsSettings.BackgroundColor3,
		HoverBackgroundColor3 = ConfigModule.ChannelTabsSettings.HoverBackgroundColor3,
		FontFace = ConfigModule.ChannelTabsSettings.FontFace,
		TextSize = ConfigModule.ChannelTabsSettings.TextSize,
		TextColor3 = ConfigModule.ChannelTabsSettings.TextColor3,
		SelectedTabTextColor3 = ConfigModule.ChannelTabsSettings.SelectedTabTextColor3,
		TextStrokeColor3 = ConfigModule.ChannelTabsSettings.TextStrokeColor3,
		TextStrokeTransparency = ConfigModule.ChannelTabsSettings.TextStrokeTransparency
	}
	local Signal, Signal2 = CreateSignalFunction(table.clone(DefaultSettingsModule), TutilsModule.deepEqual)
	local Signal1, Signal2_1 = CreateSignalFunction(config, TutilsModule.deepEqual)
	local Signal3, Signal2_2 = CreateSignalFunction(config1, TutilsModule.deepEqual)
	local Signal4, Signal2_3 = CreateSignalFunction(config2, TutilsModule.deepEqual)
	
	return {
		getBubbleChatSettings = Signal,
		getChatWindowSettings = Signal1,
		getChatInputBarSettings = Signal3,
		getChannelTabsSettings = Signal4,
		setBubbleChatSettings = Signal2,
		setChatWindowSettings = Signal2_1,
		setChatInputBarSettings = Signal2_2,
		setChannelTabsSettings = Signal2_3,
		mergeBubbleChatSettings = function(p1) --[[ Line: 163 ]]
			-- upvalues: Signal2 (copy)
			Signal2(function(Tbl) --[[ Line: 164 ]]
				-- upvalues: p1 (copy)
				local Copy = table.clone(Tbl)
				
				for i, value in pairs(p1) do
					Copy[i] = value
				end
				return Copy
			end)
		end,
		mergeChatWindowSettings = function(p2) --[[ Line: 173 ]]
			-- upvalues: Signal2_1 (copy)
			Signal2_1(function(Tbl) --[[ Line: 174 ]]
				-- upvalues: p2 (copy)
				local Copy = table.clone(Tbl)
				
				for i, value in pairs(p2) do
					Copy[i] = value
				end
				return Copy
			end)
		end,
		mergeChatInputBarSettings = function(p3) --[[ Line: 183 ]]
			-- upvalues: Signal2_2 (copy)
			Signal2_2(function(Tbl) --[[ Line: 184 ]]
				-- upvalues: p3 (copy)
				local Copy = table.clone(Tbl)
				
				for i, value in pairs(p3) do
					Copy[i] = value
				end
				return Copy
			end)
		end,
		mergeChannelTabsSettings = function(p4) --[[ Line: 193 ]]
			-- upvalues: Signal2_3 (copy)
			Signal2_3(function(Tbl) --[[ Line: 194 ]]
				-- upvalues: p4 (copy)
				local Copy = table.clone(Tbl)
				
				for i, value in pairs(p4) do
					Copy[i] = value
				end
				return Copy
			end)
		end,
		setBubbleChatProperty = function(p5, p6) --[[ Line: 203 ]]
			-- upvalues: Signal2 (copy)
			Signal2(function(Tbl) --[[ Line: 204 ]]
				-- upvalues: p5 (copy), p6 (copy)
				local Copy = table.clone(Tbl)
				Copy[p5] = p6
				
				return Copy
			end)
		end,
		setChatWindowProperty = function(p5, p6) --[[ Line: 211 ]]
			-- upvalues: Signal2_1 (copy)
			Signal2_1(function(Tbl) --[[ Line: 212 ]]
				-- upvalues: p5 (copy), p6 (copy)
				local Copy = table.clone(Tbl)
				Copy[p5] = p6
				
				return Copy
			end)
		end,
		setChatInputBarProperty = function(p5, p6) --[[ Line: 219 ]]
			-- upvalues: Signal2_2 (copy)
			Signal2_2(function(Tbl) --[[ Line: 220 ]]
				-- upvalues: p5 (copy), p6 (copy)
				local Copy = table.clone(Tbl)
				Copy[p5] = p6
				
				return Copy
			end)
		end,
		setChannelTabsProperty = function(p5, p6) --[[ Line: 227 ]]
			-- upvalues: Signal2_3 (copy)
			Signal2_3(function(Tbl) --[[ Line: 228 ]]
				-- upvalues: p5 (copy), p6 (copy)
				local Copy = table.clone(Tbl)
				Copy[p5] = p6
				
				return Copy
			end)
		end,
		getIsBubbleChatEnabled = CreateComputedFunction(function(p5) --[[ Line: 157 ]]
			-- upvalues: Signal (copy)
			return Signal(p5).Enabled or false
		end)
	}
end