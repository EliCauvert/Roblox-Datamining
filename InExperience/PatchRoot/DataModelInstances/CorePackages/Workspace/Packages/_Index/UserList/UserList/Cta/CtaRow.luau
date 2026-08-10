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

return reactModule.memo(function(p0) --[[ line: 32 | named "CtaRow" ]]
	-- upvalues: useProfileCtaModule (ref), useGetPresenceByUserId (ref), useJoinUserInExperience (ref), useCtaForRowModule (ref)
	local id = p0.entity.id
	local var6, var7 = useProfileCtaModule(id)
	local var8 = useGetPresenceByUserId(id)
	local var9 = useCtaForRowModule(var6, var7, p0.actionHandlers, id, p0.ctaConfig, useJoinUserInExperience(id, { presence = var8 }))
	local ctaConfig = p0.ctaConfig
	
	return p0.createRow({
		presence = if var8 then var8.userPresenceType else nil,
		primaryCta = var9.primaryCta,
		secondaryCta = var9.secondaryCta,
		ctaLoading = if var9.isLoading and (ctaConfig ~= nil and (ctaConfig.showLoadingPlaceholder ~= false and ctaConfig.primaryCtaMinWidth ~= nil)) and ctaConfig then {
			minWidth = ctaConfig.primaryCtaMinWidth,
			maxWidth = ctaConfig.primaryCtaMaxWidth
		} else nil
	})
end)