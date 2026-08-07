local socialUpsell = script:FindFirstAncestor("SocialUpsell")
local foundationModule = require(socialUpsell.Parent.Foundation)
local _ = require(socialUpsell.Analytics.Enum.UpsellEntrySurfaceType)
local _ = require(socialUpsell.Enum.SocialUpsellType)
local _ = foundationModule.Enums.ButtonVariant

return {}