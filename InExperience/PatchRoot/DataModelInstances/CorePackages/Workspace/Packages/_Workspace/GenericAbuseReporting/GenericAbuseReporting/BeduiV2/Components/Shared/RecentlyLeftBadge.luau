local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local Parent = GenericAbuseReporting.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local _ = require(GenericAbuseReporting.BeduiV2.Utils.Translate.translate)
local UseArTranslationFunction = require(GenericAbuseReporting.BeduiV2.Utils.Translate.arTranslation).useArTranslation
local Badge = FoundationModule.Badge
local BadgeVariant = FoundationModule.Enums.BadgeVariant

return ReactModule.memo(function(p1)
	-- upvalues: UseArTranslationFunction (copy), ReactModule (copy), Badge (copy), BadgeVariant (copy)
	return ReactModule.createElement(Badge, {
		text = UseArTranslationFunction().translateIntoString(p1.text),
		variant = BadgeVariant.Neutral,
		LayoutOrder = p1.layoutOrder
	})
end)