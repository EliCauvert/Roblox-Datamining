local FFlagBuildAdUpsellModule = require(script.Parent.FFlagBuildAdUpsell)
local FFlagEnableBuildAdPromotionModule = require(script.Parent.FFlagEnableBuildAdPromotion)

return game:DefineFastFlag("EnablePaidAds4", false) and (FFlagBuildAdUpsellModule and FFlagEnableBuildAdPromotionModule)