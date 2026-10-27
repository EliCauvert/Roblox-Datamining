local ReactionSizeModule = require(script.Parent.Enums.ReactionSize)
local ReactionTypeModule = require(script.Parent.Enums.ReactionType)
local config = {
	[ReactionTypeModule.ThumbsUp] = "reactions/thumbsUp",
	[ReactionTypeModule.Heart] = "reactions/heart",
	[ReactionTypeModule.LaughJoy] = "reactions/laughJoy",
	[ReactionTypeModule.Wow] = "reactions/wow",
	[ReactionTypeModule.Cry] = "reactions/crying",
	[ReactionTypeModule.Fire] = "reactions/fire",
	[ReactionTypeModule.Skull] = "reactions/skull"
}
local config1 = {
	[ReactionTypeModule.ThumbsUp] = "rbxassetid://102151092753275",
	[ReactionTypeModule.Heart] = "rbxassetid://105415768176243",
	[ReactionTypeModule.LaughJoy] = "rbxassetid://121361760010558",
	[ReactionTypeModule.Wow] = "rbxassetid://76233345530268",
	[ReactionTypeModule.Cry] = "rbxassetid://97649651487628",
	[ReactionTypeModule.Fire] = "rbxassetid://120385289308805",
	[ReactionTypeModule.Skull] = "rbxassetid://122831007756738"
}
local HasFoundIndex = table.find({ 6010436773, 6010515967 }, game.GameId) ~= nil

return {
	ReactionSize = ReactionSizeModule,
	ReactionSizePixels = {
		[ReactionSizeModule.XSmall] = 20,
		[ReactionSizeModule.Small] = 24,
		[ReactionSizeModule.Medium] = 32,
		[ReactionSizeModule.Large] = 48
	},
	PossibleReactions = {
		ReactionTypeModule.ThumbsUp, ReactionTypeModule.Heart, ReactionTypeModule.Fire,
		ReactionTypeModule.LaughJoy, ReactionTypeModule.Wow, ReactionTypeModule.Cry,
		ReactionTypeModule.Skull
	},
	ReactionIconMappings = if HasFoundIndex then config1 else config,
	EaseInOut = { 0.19, 1, 0.22, 1 },
	EaseInCubic = { 0.3, 0, 0.7, 0 }
}