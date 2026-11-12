return {
	Constants = require(script.Constants),
	Enums = {
		ReactionType = require(script.Enums.ReactionType),
		ReactionSize = require(script.Enums.ReactionSize),
		ReactionTrigger = require(script.Enums.ReactionTrigger)
	},
	Utils = {
		applyReactionTrigger = require(script.Utils.applyReactionTrigger),
		abbreviateReactionCount = require(script.Utils.abbreviateReactionCount),
		getTopReactions = require(script.Utils.getTopReactions)
	},
	Reaction = require(script.Components.Reaction),
	ReactionButton = require(script.Components.ReactionButton),
	ReactionChip = require(script.Components.ReactionChip),
	ReactionPicker = require(script.Components.ReactionPicker),
	ReactionPickerPopover = require(script.Components.ReactionPickerPopover),
	ReactionPill = require(script.Components.ReactionPill),
	ReactionExplosion = require(script.Components.ReactionExplosion),
	["jest.config"] = script["jest.config"]
}