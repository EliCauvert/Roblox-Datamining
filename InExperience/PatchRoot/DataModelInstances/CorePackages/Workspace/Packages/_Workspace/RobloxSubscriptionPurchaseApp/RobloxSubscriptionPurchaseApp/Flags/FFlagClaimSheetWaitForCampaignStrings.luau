local FFlagTTOnboardingSheetModule = require(script.Parent.FFlagTTOnboardingSheet)
local FFlagAppIaHomeShowCampaignTab = require(script:FindFirstAncestor("RobloxSubscriptionPurchaseApp").Parent.SharedFlags).FFlagAppIaHomeShowCampaignTab

return game:DefineFastFlag("ClaimSheetWaitForCampaignStrings", false) and (FFlagTTOnboardingSheetModule and FFlagAppIaHomeShowCampaignTab)