local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local roduxModule = require(parent.Rodux)
local dictionary = require(parent.llama).Dictionary
local configModule = require(expChat.Config)
local actions = expChat.Actions

return roduxModule.createReducer({
	HeightScale = 1,
	WidthScale = 1,
	Font = configModule.ChatWindowFont,
	TextColor3 = configModule.ChatWindowTextColor3,
	TextSize = configModule.ChatWindowTextSize,
	TextStrokeColor3 = configModule.ChatWindowTextStrokeColor,
	TextStrokeTransparency = configModule.ChatWindowTextStrokeTransparency,
	BackgroundColor3 = configModule.ChatWindowBackgroundColor3,
	BackgroundTransparency = configModule.ChatWindowBackgroundTransparency,
	SpatialPanelTextSize = configModule.ChatWindowSpatialPanelTextSize
}, {
	[require(actions.ConfigurationObjectsLoaded).name] = function(p0, p1)
		-- upvalues: dictionary (ref)
		return dictionary.join(p0, p1.chatWindowSettings)
	end,
	[require(actions.ChatWindowSettingsChanged).name] = function(p2, p3)
		-- upvalues: dictionary (ref)
		return if p2[p3.property] then dictionary.join(p2, { [p3.property] = p3.value }) else p2
	end
})