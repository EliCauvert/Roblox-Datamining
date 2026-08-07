local socialUpsell = script:FindFirstAncestor("SocialUpsell")
local foundationModule = require(socialUpsell.Parent.Foundation)
local _ = require(socialUpsell.Types)
local socialUpsellTypeModule = require(socialUpsell.Enum.SocialUpsellType)
local isCompactUpsellBannerModule = require(script.Parent.isCompactUpsellBanner)
local shieldCheck = foundationModule.Enums.IconName.ShieldCheck
local speechBubbleAlignCenter = foundationModule.Enums.IconName.SpeechBubbleAlignCenter

local function _(p0) --[[ line: 16 | named "getBannerIcon" ]]
	-- upvalues: socialUpsellTypeModule (ref), isCompactUpsellBannerModule (ref), shieldCheck (ref), speechBubbleAlignCenter (ref)
	return if p0.image then nil elseif p0.icon then p0.icon elseif p0.type == socialUpsellTypeModule.FacialAgeEstimation then if isCompactUpsellBannerModule(p0) then shieldCheck else speechBubbleAlignCenter elseif p0.type == socialUpsellTypeModule.ConversationFacialAgeEstimation then nil else nil
end

return function(p1) --[[ line: 32 ]]
	-- upvalues: socialUpsellTypeModule (ref), isCompactUpsellBannerModule (ref), shieldCheck (ref), speechBubbleAlignCenter (ref)
	p1.icon = if p1.image then nil elseif p1.icon then p1.icon elseif p1.type == socialUpsellTypeModule.FacialAgeEstimation then if isCompactUpsellBannerModule(p1) then shieldCheck else speechBubbleAlignCenter elseif p1.type == socialUpsellTypeModule.ConversationFacialAgeEstimation then nil else nil
	
	return p1
end