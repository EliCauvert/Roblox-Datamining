local constantsModule = require(script.constants)

return {
	EmojiWrapper = require(script.Components.EmojiWrapper),
	AboutVerifiedBadgeModal = require(script.Components.AboutVerifiedBadgeModal),
	installReducer = require(script.installReducer),
	emoji = {
		verified = constantsModule.VERIFIED_EMOJI,
		premium = constantsModule.PREMIUM_EMOJI
	},
	appendVerifiedBadge = require(script.Utils.appendVerifiedBadge),
	appendPremiumBadge = require(script.Utils.appendPremiumBadge),
	isCreatorOfGameVerified = require(script.Utils.isCreatorOfGameVerified)
}