local UserList = script:FindFirstAncestor("UserList")
local Parent = UserList.Parent
local ReactModule = require(Parent.React)
local EnumsModule = require(UserList.Common.Enums)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local FFlagUserListCtaAnalyticsEnabled = require(Parent.SharedFlags).FFlagUserListCtaAnalyticsEnabled
local FFlagGameJoinCardSourceAttribution = require(Parent.SharedFlags).FFlagGameJoinCardSourceAttribution
local FFlagUserListSurfaceExtensions = require(Parent.SharedFlags).FFlagUserListSurfaceExtensions
local FFlagUserListCanonicalCtaAnalyticsModule = require(UserList.Flags.FFlagUserListCanonicalCtaAnalytics)
local FFlagUserListViewCtaAnalyticsModule = require(UserList.Flags.FFlagUserListViewCtaAnalytics)
local ReportCtaActivatedModule = require(UserList.Analytics.reportCtaActivated)
local ReportViewCtaModule = require(UserList.Analytics.reportViewCta)
local NavigationCommands = require(Parent.RobloxAppNavigation).NavigationCommands
local AppPage = require(Parent.RobloxAppEnums).AppPage
local DataStatus = require(Parent.DataHydration).DataStatus
local ButtonTypes = EnumsModule.ButtonTypes
local ButtonVariant = require(Parent.Foundation).Enums.ButtonVariant
local MapServerActionsToRowCtaModule = require(UserList.Cta.mapServerActionsToRowCta)
local _ = require(UserList.Common.Types)
local config = { primaryCta = nil, secondaryCta = nil, isLoading = true }

local function _(Tbl, p1, OnActivated) --[[ Line: 50 | Named "buildJoinCta" ]]
	local Copy = table.clone(Tbl)
	Copy.onActivated = OnActivated
	Copy.isDisabled = not p1.isInExperience
	Copy.isLoading = p1.isLoading
	
	return Copy
end

return function(p1, NotReady, p2, Detail, p3, p4, p5) --[[ Line: 62 | Named "useCtaForRow" ]]
	-- upvalues: UseDispatchFunction (copy), UseLocalUserIdFunction (copy), ReactModule (copy), AppPage (copy), FFlagGameJoinCardSourceAttribution (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy), EnumsModule (copy), FFlagUserListViewCtaAnalyticsModule (copy), ReportViewCtaModule (copy), ButtonTypes (copy), ButtonVariant (copy), DataStatus (copy), config (copy), MapServerActionsToRowCtaModule (copy), FFlagUserListCanonicalCtaAnalyticsModule (copy), FFlagUserListCtaAnalyticsEnabled (copy), ReportCtaActivatedModule (copy), FFlagUserListSurfaceExtensions (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseLocalUserIdResult = UseLocalUserIdFunction()
	local UseResult = ReactModule.useCallback(function(UserId, p6) --[[ Line: 76 ]]
		-- upvalues: AppPage (upval), FFlagGameJoinCardSourceAttribution (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateDownFunction (upval)
		local config = {
			name = AppPage.GameJoinCard,
			userId = UserId,
			joinSource = if FFlagGameJoinCardSourceAttribution then p6 else nil
		}
		
		if FFlagSignalsNavP3Dispatch then
			NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
			
			return
		else
			UseDispatchResult(NavigateDownFunction(config))
		end
	end, { UseDispatchResult })
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 89 ]]
		-- upvalues: AppPage (upval), Detail (copy), EnumsModule (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateDownFunction (upval)
		local config = {
			name = AppPage.ProfilePlatform,
			detail = Detail,
			extraProps = { profileType = EnumsModule.EntityType.User }
		}
		
		if FFlagSignalsNavP3Dispatch then
			NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
			
			return
		else
			UseDispatchResult(NavigateDownFunction(config))
		end
	end, { UseDispatchResult, Detail })
	
	return ReactModule.useMemo(function() --[[ Line: 103 ]]
		-- upvalues: p3 (copy), Detail (copy), UseLocalUserIdResult (copy), UseResult1 (copy), FFlagUserListViewCtaAnalyticsModule (upval), ReportViewCtaModule (upval), ButtonTypes (upval), ButtonVariant (upval), NotReady (copy), DataStatus (upval), config (upval), MapServerActionsToRowCtaModule (upval), p1 (copy), p2 (copy), FFlagUserListCanonicalCtaAnalyticsModule (upval), p5 (copy), p4 (copy), FFlagUserListCtaAnalyticsEnabled (upval), ReportCtaActivatedModule (upval), FFlagUserListSurfaceExtensions (upval), UseResult (copy), FFlagGameJoinCardSourceAttribution (upval)
		if p3 and p3.showSelfProfileCta and Detail == UseLocalUserIdResult then
			local OnActivated: () -> () = UseResult1
			
			if FFlagUserListViewCtaAnalyticsModule then
				local Analytics = p3.analytics
				
				OnActivated = function() --[[ Line: 111 ]]
					-- upvalues: ReportViewCtaModule (upval), Analytics (copy), UseResult1 (upval)
					ReportViewCtaModule(Analytics)
					UseResult1()
				end
			end
			return {
				secondaryCta = nil,
				primaryCta = {
					type = ButtonTypes.View,
					onActivated = OnActivated,
					variant = ButtonVariant.Standard,
					minWidth = p3.primaryCtaMinWidth,
					maxWidth = p3.primaryCtaMaxWidth
				}
			}
		elseif NotReady == nil or NotReady == DataStatus.NotReady then
			return config
		else
			local MapServerActionsToRowCtaModuleResult = MapServerActionsToRowCtaModule(p1, p2, Detail, p3, if FFlagUserListCanonicalCtaAnalyticsModule then p5 else nil)
			local PrimaryCta = MapServerActionsToRowCtaModuleResult.primaryCta
			
			if PrimaryCta and PrimaryCta.type == ButtonTypes.Join and p4 then
				local Copy = table.clone(PrimaryCta)
				
				function Copy.onActivated() --[[ Line: 143 ]]
					-- upvalues: FFlagUserListCtaAnalyticsEnabled (upval), p3 (upval), ButtonTypes (upval), Detail (upval), FFlagUserListCanonicalCtaAnalyticsModule (upval), ReportCtaActivatedModule (upval), p5 (upval), FFlagUserListSurfaceExtensions (upval), UseResult (upval), FFlagGameJoinCardSourceAttribution (upval)
					if FFlagUserListCtaAnalyticsEnabled then
						local OnCtaActivated: (any) -> () = if p3 then p3.onCtaActivated else nil
						
						if OnCtaActivated ~= nil then
							OnCtaActivated({ buttonType = ButtonTypes.Join, userId = Detail })
						end
					end
					local Analytics = if p3 then p3.analytics else nil
					
					if FFlagUserListCanonicalCtaAnalyticsModule then
						ReportCtaActivatedModule(Analytics, ButtonTypes.Join, Detail, p5)
					end
					if FFlagUserListSurfaceExtensions and p3 and p3.join then
						p3.join.onActivated(Detail)
						
						return
					else
						UseResult(Detail, if FFlagGameJoinCardSourceAttribution then Analytics else nil)
					end
				end
				
				Copy.isDisabled = not p4.isInExperience
				Copy.isLoading = p4.isLoading
				
				return {
					primaryCta = Copy,
					secondaryCta = MapServerActionsToRowCtaModuleResult.secondaryCta
				}
			else
				return MapServerActionsToRowCtaModuleResult
			end
		end
	end, {
		p1, NotReady, p2, Detail, p3, p4, UseResult, UseLocalUserIdResult, UseResult1,
		if FFlagUserListCanonicalCtaAnalyticsModule then p5 else nil
	})
end