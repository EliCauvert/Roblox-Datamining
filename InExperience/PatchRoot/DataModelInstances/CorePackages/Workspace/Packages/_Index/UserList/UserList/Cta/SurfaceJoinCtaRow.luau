local UserList = script:FindFirstAncestor("UserList")
local Parent = UserList.Parent
local ReactModule = require(Parent.React)
local EnumsModule = require(UserList.Common.Enums)
local _ = require(UserList.Common.Types)
local UseGetPresenceByUserIdFunction = require(Parent.FriendsCommon).Hooks.useGetPresenceByUserId
local InGame = require(Parent.DataHydration).Presence.PresenceEnums.PresenceType.InGame
local UseCtaForRowModule = require(UserList.Hooks.useCtaForRow)
local UseProfileCtaModule = require(UserList.Hooks.useProfileCta)
local ComposeCtaRowModule = require(script.Parent.composeCtaRow)
local FFlagUserListCanonicalCtaAnalyticsModule = require(UserList.Flags.FFlagUserListCanonicalCtaAnalytics)

return ReactModule.memo(function(p1) --[[ Line: 36 | Named "SurfaceJoinCtaRow" ]]
	-- upvalues: UseProfileCtaModule (copy), UseGetPresenceByUserIdFunction (copy), InGame (copy), ReactModule (copy), UseCtaForRowModule (copy), FFlagUserListCanonicalCtaAnalyticsModule (copy), EnumsModule (copy), ComposeCtaRowModule (copy)
	local Id = p1.entity.id
	local CtaConfig = p1.ctaConfig
	local Join = CtaConfig.join
	local UseProfileCtaModuleResult, UseProfileCtaModuleResult2 = UseProfileCtaModule(Id)
	local UseGetPresenceByUserIdResult = UseGetPresenceByUserIdFunction(Id)
	local UniverseId = if UseGetPresenceByUserIdResult then UseGetPresenceByUserIdResult.universeId else nil
	local IsNotUniverseIdMatch: boolean = UseGetPresenceByUserIdResult ~= nil and (UseGetPresenceByUserIdResult.userPresenceType == InGame and (UniverseId ~= nil and UniverseId ~= ""))
	local OnActivatedFunction = Join.onActivated
	local UseCtaForRowModuleResult = UseCtaForRowModule(UseProfileCtaModuleResult, UseProfileCtaModuleResult2, p1.actionHandlers, Id, CtaConfig, ReactModule.useMemo(function() --[[ Line: 49 ]]
		-- upvalues: OnActivatedFunction (copy), Id (copy), IsNotUniverseIdMatch (copy)
		return {
			isLoading = false,
			joinExperience = function() --[[ Line: 51 ]]
				-- upvalues: OnActivatedFunction (upval), Id (upval)
				OnActivatedFunction(Id)
			end,
			isInExperience = IsNotUniverseIdMatch
		}
	end, { Id, IsNotUniverseIdMatch, OnActivatedFunction }), if FFlagUserListCanonicalCtaAnalyticsModule then p1.index else nil)
	local PrimaryCta = UseCtaForRowModuleResult.primaryCta
	
	if PrimaryCta and PrimaryCta.type == EnumsModule.ButtonTypes.Join and Join.isVisible and not Join.isVisible(UseGetPresenceByUserIdResult) then
		PrimaryCta = nil
	end
	local IsLoading = UseCtaForRowModuleResult.isLoading
	
	if IsLoading and Join.isJoinExpected and not Join.isJoinExpected(Id, UseGetPresenceByUserIdResult) then
		IsLoading = false
	end
	return ComposeCtaRowModule(p1, CtaConfig, UseGetPresenceByUserIdResult, {
		primaryCta = PrimaryCta,
		secondaryCta = UseCtaForRowModuleResult.secondaryCta,
		isLoading = IsLoading
	})
end)