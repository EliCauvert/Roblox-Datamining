local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local Dictionary = require(Parent.llama).Dictionary
local ConfigModule = require(ExpChat.Config)
local None = require(Parent.llama).None
local Actions = ExpChat.Actions

return require(Parent.Rodux).createReducer({
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
}, {
	[require(Actions.ConfigurationObjectsLoaded).name] = function(p1, p2)
		-- upvalues: Dictionary (copy)
		return Dictionary.join(p1, p2.chatInputBarSettings)
	end,
	[require(Actions.ChatInputBarSettingsChanged).name] = function(p1, p2)
		-- upvalues: None (copy), Dictionary (copy)
		local _ = p2.value
		
		return if p1[p2.property] == nil and p2.property ~= "TextBox" then p1 else Dictionary.join(p1, {
			[p2.property] = if p2.property == "TextBox" and p2.value == nil then None else p2.value
		})
	end
})