local Parent = script.Parent.Parent.Parent
local DashModule = require(Parent.Dash)
local Enums = require(Parent.SocialLuaAnalytics).Analytics.Enums
local Contexts = Enums.Contexts
local EventTypes = Enums.EventTypes
local EventConstantsModule = require(script.Parent.EventConstants)
local EventNamesModule = require(script.Parent.EventNames)

return {
	[EventNamesModule.ContentFeedDeleteCtaPressed] = {
		additionalInfo = {
			action = EventConstantsModule.action.DeleteCtaPressed,
			namespace = EventConstantsModule.namespace.ContentFeed
		},
		context = Contexts.SocialContentFeed,
		eventType = EventTypes.ButtonClick,
		formatRulesForAdditionalInfo = { postId = DashModule.identity }
	},
	[EventNamesModule.ContentFeedExitCtaPressed] = {
		additionalInfo = {
			action = EventConstantsModule.action.ExitCtaPressed,
			namespace = EventConstantsModule.namespace.ContentFeed
		},
		context = Contexts.SocialContentFeed,
		eventType = EventTypes.ButtonClick,
		formatRulesForAdditionalInfo = { postId = DashModule.identity }
	},
	[EventNamesModule.ContentFeedInspectCtaPressed] = {
		additionalInfo = {
			action = EventConstantsModule.action.InspectCtaPressed,
			namespace = EventConstantsModule.namespace.ContentFeed
		},
		context = Contexts.SocialContentFeed,
		eventType = EventTypes.ButtonClick,
		formatRulesForAdditionalInfo = { postId = DashModule.identity }
	},
	[EventNamesModule.ContentFeedInspectItemPressed] = {
		additionalInfo = {
			action = EventConstantsModule.action.InspectItemPressed,
			namespace = EventConstantsModule.namespace.ContentFeed
		},
		context = Contexts.SocialContentFeed,
		eventType = EventTypes.ButtonClick,
		formatRulesForAdditionalInfo = {
			itemId = DashModule.identity,
			postId = DashModule.identity
		}
	},
	[EventNamesModule.ContentFeedMoreMenuButtonPressed] = {
		additionalInfo = {
			action = EventConstantsModule.action.MoreMenuButtonPressed,
			namespace = EventConstantsModule.namespace.ContentFeed
		},
		context = Contexts.SocialContentFeed,
		eventType = EventTypes.ButtonClick,
		formatRulesForAdditionalInfo = { postId = DashModule.identity }
	},
	[EventNamesModule.ContentFeedPlayButtonPressed] = {
		additionalInfo = {
			action = EventConstantsModule.action.PlayButtonPressed,
			namespace = EventConstantsModule.namespace.ContentFeed
		},
		context = Contexts.SocialContentFeed,
		eventType = EventTypes.ButtonClick,
		formatRulesForAdditionalInfo = { postId = DashModule.identity }
	},
	[EventNamesModule.ContentFeedPostViewed] = {
		additionalInfo = {
			action = EventConstantsModule.action.PostViewed,
			namespace = EventConstantsModule.namespace.ContentFeed
		},
		context = Contexts.SocialContentFeed,
		eventType = EventTypes.ButtonClick,
		formatRulesForAdditionalInfo = { postId = DashModule.identity }
	},
	[EventNamesModule.ContentFeedReportCtaPressed] = {
		additionalInfo = {
			action = EventConstantsModule.action.ReportCtaPressed,
			namespace = EventConstantsModule.namespace.ContentFeed
		},
		context = Contexts.SocialContentFeed,
		eventType = EventTypes.ButtonClick,
		formatRulesForAdditionalInfo = { postId = DashModule.identity }
	},
	[EventNamesModule.ContentFeedShareCtaPressed] = {
		additionalInfo = {
			action = EventConstantsModule.action.ShareCtaPressed,
			namespace = EventConstantsModule.namespace.ContentFeed
		},
		context = Contexts.SocialContentFeed,
		eventType = EventTypes.ButtonClick,
		formatRulesForAdditionalInfo = { postId = DashModule.identity }
	},
	[EventNamesModule.ContentFeedZoomOccurred] = {
		additionalInfo = {
			action = EventConstantsModule.action.ZoomOccurred,
			namespace = EventConstantsModule.namespace.ContentFeed
		},
		context = Contexts.SocialContentFeed,
		eventType = EventTypes.ButtonClick,
		formatRulesForAdditionalInfo = { postId = DashModule.identity }
	}
}