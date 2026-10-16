local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local Dictionary = require(Parent.llama).Dictionary
local ConfigModule = require(ExpChat.Config)
local Actions = ExpChat.Actions

return require(Parent.Rodux).createReducer({
	BackgroundTransparency = ConfigModule.ChannelTabsSettings.BackgroundTransparency,
	BackgroundColor3 = ConfigModule.ChannelTabsSettings.BackgroundColor3,
	HoverBackgroundColor3 = ConfigModule.ChannelTabsSettings.HoverBackgroundColor3,
	FontFace = ConfigModule.ChannelTabsSettings.FontFace,
	TextSize = ConfigModule.ChannelTabsSettings.TextSize,
	TextColor3 = ConfigModule.ChannelTabsSettings.TextColor3,
	SelectedTabTextColor3 = ConfigModule.ChannelTabsSettings.SelectedTabTextColor3,
	TextStrokeColor3 = ConfigModule.ChannelTabsSettings.TextStrokeColor3,
	TextStrokeTransparency = ConfigModule.ChannelTabsSettings.TextStrokeTransparency
}, {
	[require(Actions.ConfigurationObjectsLoaded).name] = function(p1, p2) --[[ Line: 25 ]]
		-- upvalues: Dictionary (copy)
		return Dictionary.join(p1, p2.channelTabsSettings)
	end,
	[require(Actions.ChannelTabsSettingsChanged).name] = function(p1, p2) --[[ Line: 29 ]]
		-- upvalues: Dictionary (copy)
		return if p1[p2.property] then Dictionary.join(p1, { [p2.property] = p2.value }) else p1
	end
})