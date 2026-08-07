local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local roduxModule = require(parent.Rodux)
local dictionary = require(parent.llama).Dictionary
local configModule = require(expChat.Config)
local actions = expChat.Actions

return roduxModule.createReducer({
	BackgroundTransparency = configModule.ChannelTabsSettings.BackgroundTransparency,
	BackgroundColor3 = configModule.ChannelTabsSettings.BackgroundColor3,
	HoverBackgroundColor3 = configModule.ChannelTabsSettings.HoverBackgroundColor3,
	FontFace = configModule.ChannelTabsSettings.FontFace,
	TextSize = configModule.ChannelTabsSettings.TextSize,
	TextColor3 = configModule.ChannelTabsSettings.TextColor3,
	SelectedTabTextColor3 = configModule.ChannelTabsSettings.SelectedTabTextColor3,
	TextStrokeColor3 = configModule.ChannelTabsSettings.TextStrokeColor3,
	TextStrokeTransparency = configModule.ChannelTabsSettings.TextStrokeTransparency
}, {
	[require(actions.ConfigurationObjectsLoaded).name] = function(p0, p1) --[[ line: 25 ]]
		-- upvalues: dictionary (ref)
		return dictionary.join(p0, p1.channelTabsSettings)
	end,
	[require(actions.ChannelTabsSettingsChanged).name] = function(p2, p3) --[[ line: 29 ]]
		-- upvalues: dictionary (ref)
		return if p2[p3.property] then dictionary.join(p2, { [p3.property] = p3.value }) else p2
	end
})