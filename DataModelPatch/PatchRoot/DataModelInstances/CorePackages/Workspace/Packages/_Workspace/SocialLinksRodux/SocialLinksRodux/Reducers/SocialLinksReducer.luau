local SocialLinksRodux = script:FindFirstAncestor("SocialLinksRodux")
local GetSocialLinksModule = require(SocialLinksRodux.Reducers.SocialLinks.getSocialLinks)
local GetSelfSocialLinksModule = require(SocialLinksRodux.Reducers.SocialLinks.getSelfSocialLinks)
local config = { profileSocialLinks = {}, selfSocialLinks = {} }

return function(p1)
	-- upvalues: GetSocialLinksModule (copy), GetSelfSocialLinksModule (copy), config (copy)
	local SocialLinksModule = GetSocialLinksModule(p1)
	local SelfSocialLinksModule = GetSelfSocialLinksModule(p1)
	
	return function(p2, p3)
		-- upvalues: config (upval), SocialLinksModule (copy), SelfSocialLinksModule (copy)
		local P1 = p2 or config
		
		return {
			profileSocialLinks = SocialLinksModule(P1.profileSocialLinks, p3),
			selfSocialLinks = SelfSocialLinksModule(P1.selfSocialLinks, p3)
		}
	end
end