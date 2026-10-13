local userList = script:FindFirstAncestor("UserList")
local parent = userList.Parent
local reactModule = require(parent.React)
local friendsCommonModule = require(parent.FriendsCommon)
local dataHydrationModule = require(parent.DataHydration)
local enumsModule = require(userList.Common.Enums)
local _ = require(userList.Common.Types)
local useGetPresenceByUserId = friendsCommonModule.Hooks.useGetPresenceByUserId
local inGame = dataHydrationModule.Presence.PresenceEnums.PresenceType.InGame
local useCtaForRowModule = require(userList.Hooks.useCtaForRow)
local useProfileCtaModule = require(userList.Hooks.useProfileCta)
local composeCtaRowModule = require(script.Parent.composeCtaRow)
local fFlagUserListCanonicalCtaAnalyticsModule = require(userList.Flags.FFlagUserListCanonicalCtaAnalytics)

return reactModule.memo(function(p1)
	-- upvalues: useProfileCtaModule (ref), useGetPresenceByUserId (ref), inGame (ref), reactModule (ref), useCtaForRowModule (ref), fFlagUserListCanonicalCtaAnalyticsModule (ref), enumsModule (ref), composeCtaRowModule (ref)
	local id = p1.entity.id
	local ctaConfig = p1.ctaConfig
	local join = ctaConfig.join
	local var1, var2 = useProfileCtaModule(id)
	local var3 = useGetPresenceByUserId(id)
	local var4 = if var3 then var3.universeId else nil
	local var5 = var3 ~= nil and (var3.userPresenceType == inGame and (var4 ~= nil and var4 ~= ""))
	local onActivated = join.onActivated
	local var6 = useCtaForRowModule(var1, var2, p1.actionHandlers, id, ctaConfig, reactModule.useMemo(function()
		-- upvalues: onActivated (ref), id (ref), var5 (ref)
		return {
			isLoading = false,
			joinExperience = function()
				-- upvalues: onActivated (copy), id (copy)
				onActivated(id)
			end,
			isInExperience = var5
		}
	end, { id, var5, onActivated }), if fFlagUserListCanonicalCtaAnalyticsModule then p1.index else nil)
	local primaryCta = var6.primaryCta
	
	if primaryCta and primaryCta.type == enumsModule.ButtonTypes.Join and (join.isVisible and not join.isVisible(var3)) then
		primaryCta = nil
	end
	return composeCtaRowModule(p1, ctaConfig, var3, {
		primaryCta = primaryCta,
		secondaryCta = var6.secondaryCta,
		isLoading = var6.isLoading
	})
end)