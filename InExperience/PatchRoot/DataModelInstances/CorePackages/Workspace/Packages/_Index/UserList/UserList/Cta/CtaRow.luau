local UserList = script:FindFirstAncestor("UserList")
local Parent = UserList.Parent
local _ = require(UserList.Common.Types)
local UseGetPresenceByUserIdFunction = require(Parent.FriendsCommon).Hooks.useGetPresenceByUserId
local UseJoinUserInExperienceFunction = require(Parent.SocialExperienceJoin).useJoinUserInExperience
local UseCtaForRowModule = require(UserList.Hooks.useCtaForRow)
local UseProfileCtaModule = require(UserList.Hooks.useProfileCta)
local ComposeCtaRowModule = require(script.Parent.composeCtaRow)
local FFlagUserListCanonicalCtaAnalyticsModule = require(UserList.Flags.FFlagUserListCanonicalCtaAnalytics)
local FFlagUserListComposeRenderRowWithCta = require(Parent.SharedFlags).FFlagUserListComposeRenderRowWithCta
local FFlagUserListSurfaceExtensions = require(Parent.SharedFlags).FFlagUserListSurfaceExtensions
local FFlagUserListSurfacePresenceWins = require(Parent.SharedFlags).FFlagUserListSurfacePresenceWins

return require(Parent.React).memo(function(p1) --[[ Line: 41 | Named "CtaRow" ]]
	-- upvalues: UseProfileCtaModule (copy), UseGetPresenceByUserIdFunction (copy), UseJoinUserInExperienceFunction (copy), UseCtaForRowModule (copy), FFlagUserListCanonicalCtaAnalyticsModule (copy), FFlagUserListSurfaceExtensions (copy), ComposeCtaRowModule (copy), FFlagUserListComposeRenderRowWithCta (copy), FFlagUserListSurfacePresenceWins (copy)
	local Id = p1.entity.id
	local UseProfileCtaModuleResult, UseProfileCtaModuleResult2 = UseProfileCtaModule(Id)
	local UseGetPresenceByUserIdResult = UseGetPresenceByUserIdFunction(Id)
	local UseCtaForRowModuleResult = UseCtaForRowModule(UseProfileCtaModuleResult, UseProfileCtaModuleResult2, p1.actionHandlers, Id, p1.ctaConfig, UseJoinUserInExperienceFunction(Id, { presence = UseGetPresenceByUserIdResult }), if FFlagUserListCanonicalCtaAnalyticsModule then p1.index else nil)
	
	if FFlagUserListSurfaceExtensions then
		return ComposeCtaRowModule(p1, p1.ctaConfig, UseGetPresenceByUserIdResult, UseCtaForRowModuleResult)
	end
	local CtaConfig = p1.ctaConfig
	local HasPrimaryCtaMinWidth: boolean = CtaConfig ~= nil and (CtaConfig.showLoadingPlaceholder ~= false and CtaConfig.primaryCtaMinWidth ~= nil)
	local Config = if UseCtaForRowModuleResult.isLoading and HasPrimaryCtaMinWidth and CtaConfig then {
		minWidth = CtaConfig.primaryCtaMinWidth,
		maxWidth = CtaConfig.primaryCtaMaxWidth
	} else nil
	local RenderRowFunction = p1.renderRow
	
	if FFlagUserListComposeRenderRowWithCta and RenderRowFunction then
		local CreateRowFunction = p1.createRow
		
		return RenderRowFunction(function(Tbl) --[[ Line: 78 ]]
			-- upvalues: UseGetPresenceByUserIdResult (copy), FFlagUserListSurfacePresenceWins (upval), UseCtaForRowModuleResult (copy), Config (copy), CreateRowFunction (copy)
			local Copy = table.clone(Tbl)
			Copy.presence = if UseGetPresenceByUserIdResult then UseGetPresenceByUserIdResult.userPresenceType else nil
			
			if FFlagUserListSurfacePresenceWins and Tbl.presence ~= nil then
				Copy.presence = Tbl.presence
			end
			Copy.primaryCta = UseCtaForRowModuleResult.primaryCta
			Copy.secondaryCta = UseCtaForRowModuleResult.secondaryCta
			Copy.ctaLoading = Config
			
			return CreateRowFunction(Copy)
		end, p1.entity, p1.index or 0)
	else
		return p1.createRow({
			presence = if UseGetPresenceByUserIdResult then UseGetPresenceByUserIdResult.userPresenceType else nil,
			primaryCta = UseCtaForRowModuleResult.primaryCta,
			secondaryCta = UseCtaForRowModuleResult.secondaryCta,
			ctaLoading = Config
		})
	end
end)