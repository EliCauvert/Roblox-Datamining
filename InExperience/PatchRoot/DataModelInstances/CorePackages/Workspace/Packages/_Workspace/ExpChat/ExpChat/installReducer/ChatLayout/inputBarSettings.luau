local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local roduxModule = require(parent.Rodux)
local dictionary = require(parent.llama).Dictionary
local configModule = require(expChat.Config)
local none = require(parent.llama).None
local actions = expChat.Actions

return roduxModule.createReducer({
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
}, {
	[require(actions.ConfigurationObjectsLoaded).name] = function(p1, p2)
		-- upvalues: dictionary (ref)
		return dictionary.join(p1, p2.chatInputBarSettings)
	end,
	[require(actions.ChatInputBarSettingsChanged).name] = function(p1, p2)
		-- upvalues: none (ref), dictionary (ref)
		local _ = p2.value
		
		return if p1[p2.property] == nil and p2.property ~= "TextBox" then p1 else dictionary.join(p1, {
			[p2.property] = if p2.property == "TextBox" and p2.value == nil then none else p2.value
		})
	end
})