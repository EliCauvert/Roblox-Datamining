local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local _ = require(genericAbuseReporting.BeduiV2.Utils.Translate.translate)
local useArTranslation = require(genericAbuseReporting.BeduiV2.Utils.Translate.arTranslation).useArTranslation
local badge = foundationModule.Badge
local badgeVariant = foundationModule.Enums.BadgeVariant

return reactModule.memo(function(p0) --[[ line: 23 | named "RecentlyLeftBadge" ]]
	-- upvalues: useArTranslation (ref), reactModule (ref), badge (ref), badgeVariant (ref)
	return reactModule.createElement(badge, {
		text = useArTranslation().translateIntoString(p0.text),
		variant = badgeVariant.Neutral,
		LayoutOrder = p0.layoutOrder
	})
end)