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
	[require(actions.ConfigurationObjectsLoaded).name] = function(p0, p1)
		-- upvalues: dictionary (ref)
		return dictionary.join(p0, p1.chatInputBarSettings)
	end,
	[require(actions.ChatInputBarSettingsChanged).name] = function(p2, p3)
		-- upvalues: none (ref), dictionary (ref)
		local _ = p3.value
		
		return if p2[p3.property] == nil and p3.property ~= "TextBox" then p2 else dictionary.join(p2, {
			[p3.property] = if p3.property == "TextBox" and p3.value == nil then none else p3.value
		})
	end
})