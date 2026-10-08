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
local fFlagUserListCanonicalCtaAnalyticsModule = require(userList.Flags.FFlagUserListCanonicalCtaAnalytics)
local fFlagUserListComposeRenderRowWithCta = require(parent.SharedFlags).FFlagUserListComposeRenderRowWithCta
local fFlagUserListSurfacePresenceWins = require(parent.SharedFlags).FFlagUserListSurfacePresenceWins

return reactModule.memo(function(p1)
	-- upvalues: useProfileCtaModule (ref), useGetPresenceByUserId (ref), useJoinUserInExperience (ref), useCtaForRowModule (ref), fFlagUserListCanonicalCtaAnalyticsModule (ref), fFlagUserListComposeRenderRowWithCta (ref), fFlagUserListSurfacePresenceWins (ref)
	local id = p1.entity.id
	local var1, var2 = useProfileCtaModule(id)
	local var3 = useGetPresenceByUserId(id)
	local var4 = useCtaForRowModule(var1, var2, p1.actionHandlers, id, p1.ctaConfig, useJoinUserInExperience(id, { presence = var3 }), if fFlagUserListCanonicalCtaAnalyticsModule then p1.index else nil)
	local ctaConfig = p1.ctaConfig
	local var5 = if var4.isLoading and (ctaConfig ~= nil and (ctaConfig.showLoadingPlaceholder ~= false and ctaConfig.primaryCtaMinWidth ~= nil)) and ctaConfig then {
		minWidth = ctaConfig.primaryCtaMinWidth,
		maxWidth = ctaConfig.primaryCtaMaxWidth
	} else nil
	local renderRow = p1.renderRow
	
	if fFlagUserListComposeRenderRowWithCta and renderRow then
		local createRow = p1.createRow
		
		return renderRow(function(p2)
			-- upvalues: var3 (ref), fFlagUserListSurfacePresenceWins (copy), var4 (ref), var5 (ref), createRow (ref)
			local cloned = table.clone(p2)
			cloned.presence = if var3 then var3.userPresenceType else nil
			
			if fFlagUserListSurfacePresenceWins and p2.presence ~= nil then
				cloned.presence = p2.presence
			end
			cloned.primaryCta = var4.primaryCta
			cloned.secondaryCta = var4.secondaryCta
			cloned.ctaLoading = var5
			
			return createRow(cloned)
		end, p1.entity, p1.index or 0)
	end
	return p1.createRow({
		presence = if var3 then var3.userPresenceType else nil,
		primaryCta = var4.primaryCta,
		secondaryCta = var4.secondaryCta,
		ctaLoading = var5
	})
end)