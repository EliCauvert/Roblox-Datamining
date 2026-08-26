local userList = script:FindFirstAncestor("UserList")
local parent = userList.Parent
local reactModule = require(parent.React)
local friendsCommonModule = require(parent.FriendsCommon)
local socialExperienceJoinModule = require(parent.SocialExperienceJoin)
local _ = require(userList.Common.Types)
local useGetPresenceByUserId = friendsCommonModule.Hooks.useGetPresenceByUserId
local useJoinUserInExperience = socialExperienceJoinModule.useJoinUserInExperience
local useCtaForRowModule = require(userList.Hooks.useCtaForRow)
local useProfileCtaModule = require(userList.Hooks.useProfileCta)

return reactModule.memo(function(p1)
	-- upvalues: useProfileCtaModule (ref), useGetPresenceByUserId (ref), useJoinUserInExperience (ref), useCtaForRowModule (ref)
	local id = p1.entity.id
	local var1, var2 = useProfileCtaModule(id)
	local var3 = useGetPresenceByUserId(id)
	local var4 = useCtaForRowModule(var1, var2, p1.actionHandlers, id, p1.ctaConfig, useJoinUserInExperience(id, { presence = var3 }))
	local ctaConfig = p1.ctaConfig
	
	return p1.createRow({
		presence = if var3 then var3.userPresenceType else nil,
		primaryCta = var4.primaryCta,
		secondaryCta = var4.secondaryCta,
		ctaLoading = if var4.isLoading and (ctaConfig ~= nil and (ctaConfig.showLoadingPlaceholder ~= false and ctaConfig.primaryCtaMinWidth ~= nil)) and ctaConfig then {
			minWidth = ctaConfig.primaryCtaMinWidth,
			maxWidth = ctaConfig.primaryCtaMaxWidth
		} else nil
	})
end)