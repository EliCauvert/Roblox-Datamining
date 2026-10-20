local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local Dictionary = require(Parent.llama).Dictionary
local ConfigModule = require(ExpChat.Config)
local Actions = ExpChat.Actions

return require(Parent.Rodux).createReducer({
	HeightScale = 1,
	WidthScale = 1,
	Font = ConfigModule.ChatWindowFont,
	TextColor3 = ConfigModule.ChatWindowTextColor3,
	TextSize = ConfigModule.ChatWindowTextSize,
	TextStrokeColor3 = ConfigModule.ChatWindowTextStrokeColor,
	TextStrokeTransparency = ConfigModule.ChatWindowTextStrokeTransparency,
	BackgroundColor3 = ConfigModule.ChatWindowBackgroundColor3,
	BackgroundTransparency = ConfigModule.ChatWindowBackgroundTransparency,
	SpatialPanelTextSize = ConfigModule.ChatWindowSpatialPanelTextSize
}, {
	[require(Actions.ConfigurationObjectsLoaded).name] = function(p1, p2)
		-- upvalues: Dictionary (copy)
		return Dictionary.join(p1, p2.chatWindowSettings)
	end,
	[require(Actions.ChatWindowSettingsChanged).name] = function(p1, p2)
		-- upvalues: Dictionary (copy)
		return if p1[p2.property] then Dictionary.join(p1, { [p2.property] = p2.value }) else p1
	end
})