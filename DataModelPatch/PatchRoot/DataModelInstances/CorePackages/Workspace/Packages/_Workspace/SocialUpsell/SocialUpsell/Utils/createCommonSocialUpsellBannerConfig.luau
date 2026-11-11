local SocialUpsell = script:FindFirstAncestor("SocialUpsell")
local FoundationModule = require(SocialUpsell.Parent.Foundation)
local _ = require(SocialUpsell.Types)
local SocialUpsellTypeModule = require(SocialUpsell.Enum.SocialUpsellType)
local IsCompactUpsellBannerModule = require(script.Parent.isCompactUpsellBanner)
local ShieldCheck = FoundationModule.Enums.IconName.ShieldCheck
local SpeechBubbleAlignCenter = FoundationModule.Enums.IconName.SpeechBubbleAlignCenter

local function _(p1)
	-- upvalues: SocialUpsellTypeModule (copy), IsCompactUpsellBannerModule (copy), ShieldCheck (copy), SpeechBubbleAlignCenter (copy)
	return if p1.image then nil elseif p1.icon then p1.icon elseif p1.type == SocialUpsellTypeModule.FacialAgeEstimation then if IsCompactUpsellBannerModule(p1) then ShieldCheck else SpeechBubbleAlignCenter elseif p1.type == SocialUpsellTypeModule.ConversationFacialAgeEstimation then nil else nil
end

return function(p1)
	-- upvalues: SocialUpsellTypeModule (copy), IsCompactUpsellBannerModule (copy), ShieldCheck (copy), SpeechBubbleAlignCenter (copy)
	p1.icon = if p1.image then nil elseif p1.icon then p1.icon elseif p1.type == SocialUpsellTypeModule.FacialAgeEstimation then if IsCompactUpsellBannerModule(p1) then ShieldCheck else SpeechBubbleAlignCenter elseif p1.type == SocialUpsellTypeModule.ConversationFacialAgeEstimation then nil else nil
	
	return p1
end