local userList = script:FindFirstAncestor("UserList")
local parent = userList.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local dataHydrationModule = require(parent.DataHydration)
local enumsModule = require(userList.Common.Enums)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local navigateDown = require(parent.NavigationRodux).Thunks.NavigateDown
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local fFlagUserListCtaAnalyticsEnabled = require(parent.SharedFlags).FFlagUserListCtaAnalyticsEnabled
local fFlagGameJoinCardSourceAttribution = require(parent.SharedFlags).FFlagGameJoinCardSourceAttribution
local fFlagUserListCanonicalCtaAnalyticsModule = require(userList.Flags.FFlagUserListCanonicalCtaAnalytics)
local fFlagUserListViewCtaAnalyticsModule = require(userList.Flags.FFlagUserListViewCtaAnalytics)
local reportCtaActivatedModule = require(userList.Analytics.reportCtaActivated)
local reportViewCtaModule = require(userList.Analytics.reportViewCta)
local navigationCommands = require(parent.RobloxAppNavigation).NavigationCommands
local appPage = require(parent.RobloxAppEnums).AppPage
local dataStatus = dataHydrationModule.DataStatus
local buttonTypes = enumsModule.ButtonTypes
local buttonVariant = foundationModule.Enums.ButtonVariant
local mapServerActionsToRowCtaModule = require(userList.Cta.mapServerActionsToRowCta)
local _ = require(userList.Common.Types)
local t = { primaryCta = nil, secondaryCta = nil, isLoading = true }

local function _(p1, p2, p3)
	local cloned = table.clone(p1)
	cloned.onActivated = p3
	cloned.isDisabled = not p2.isInExperience
	cloned.isLoading = p2.isLoading
	
	return cloned
end

return function(p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: useDispatch (ref), useLocalUserId (ref), reactModule (ref), appPage (ref), fFlagGameJoinCardSourceAttribution (ref), fFlagSignalsNavP3Dispatch (ref), navigationCommands (ref), navigateDown (ref), enumsModule (ref), fFlagUserListViewCtaAnalyticsModule (ref), reportViewCtaModule (ref), buttonTypes (ref), buttonVariant (ref), dataStatus (ref), t (ref), mapServerActionsToRowCtaModule (ref), fFlagUserListCanonicalCtaAnalyticsModule (ref), fFlagUserListCtaAnalyticsEnabled (ref), reportCtaActivatedModule (ref)
	local var1 = useDispatch()
	local var2 = useLocalUserId()
	local var3 = reactModule.useCallback(function(p8, p9)
		-- upvalues: appPage (copy), fFlagGameJoinCardSourceAttribution (copy), fFlagSignalsNavP3Dispatch (copy), navigationCommands (copy), var1 (ref), navigateDown (copy)
		local t = {
			name = appPage.GameJoinCard,
			userId = p8,
			joinSource = if fFlagGameJoinCardSourceAttribution then p9 else nil
		}
		
		if fFlagSignalsNavP3Dispatch then
			navigationCommands.down(navigationCommands.fromLegacyPage(t))
			
			return
		end
		var1(navigateDown(t))
	end, { var1 })
	local var4 = reactModule.useCallback(function()
		-- upvalues: appPage (copy), p4 (ref), enumsModule (copy), fFlagSignalsNavP3Dispatch (copy), navigationCommands (copy), var1 (ref), navigateDown (copy)
		local t = {
			name = appPage.ProfilePlatform,
			detail = p4,
			extraProps = { profileType = enumsModule.EntityType.User }
		}
		
		if fFlagSignalsNavP3Dispatch then
			navigationCommands.down(navigationCommands.fromLegacyPage(t))
			
			return
		end
		var1(navigateDown(t))
	end, { var1, p4 })
	
	return reactModule.useMemo(function()
		-- upvalues: p5 (ref), p4 (ref), var2 (ref), var4 (ref), fFlagUserListViewCtaAnalyticsModule (copy), reportViewCtaModule (copy), buttonTypes (copy), buttonVariant (copy), p2 (ref), dataStatus (copy), t (copy), mapServerActionsToRowCtaModule (copy), p1 (ref), p3 (ref), fFlagUserListCanonicalCtaAnalyticsModule (copy), p7 (ref), p6 (ref), fFlagUserListCtaAnalyticsEnabled (copy), reportCtaActivatedModule (copy), var3 (ref), fFlagGameJoinCardSourceAttribution (copy)
		if p5 and p5.showSelfProfileCta and p4 == var2 then
			local var5 = var4
			
			if fFlagUserListViewCtaAnalyticsModule then
				local analytics = p5.analytics
				
				var5 = function()
					-- upvalues: reportViewCtaModule (copy), analytics (ref), var4 (copy)
					reportViewCtaModule(analytics)
					var4()
				end
			end
			return {
				secondaryCta = nil,
				primaryCta = {
					type = buttonTypes.View,
					onActivated = var5,
					variant = buttonVariant.Standard,
					minWidth = p5.primaryCtaMinWidth,
					maxWidth = p5.primaryCtaMaxWidth
				}
			}
		elseif p2 == nil or p2 == dataStatus.NotReady then
			return t
		end
		local var6 = mapServerActionsToRowCtaModule(p1, p3, p4, p5, if fFlagUserListCanonicalCtaAnalyticsModule then p7 else nil)
		local primaryCta = var6.primaryCta
		
		if primaryCta and primaryCta.type == buttonTypes.Join and p6 then
			local t_1 = {}
			local var7 = p6
			local cloned = table.clone(primaryCta)
			
			function cloned.onActivated()
				-- upvalues: fFlagUserListCtaAnalyticsEnabled (copy), p5 (copy), buttonTypes (copy), p4 (copy), fFlagUserListCanonicalCtaAnalyticsModule (copy), reportCtaActivatedModule (copy), p7 (copy), var3 (copy), fFlagGameJoinCardSourceAttribution (copy)
				if fFlagUserListCtaAnalyticsEnabled then
					local var8 = if p5 then p5.onCtaActivated else nil
					
					if var8 ~= nil then
						var8({ buttonType = buttonTypes.Join, userId = p4 })
					end
				end
				local var9 = if p5 then p5.analytics else nil
				
				if fFlagUserListCanonicalCtaAnalyticsModule then
					reportCtaActivatedModule(var9, buttonTypes.Join, p4, p7)
				end
				var3(p4, if fFlagGameJoinCardSourceAttribution then var9 else nil)
			end
			
			cloned.isDisabled = not var7.isInExperience
			cloned.isLoading = var7.isLoading
			t_1.primaryCta = cloned
			t_1.secondaryCta = var6.secondaryCta
			
			return t_1
		end
		return var6
	end, {
		p1, p2, p3, p4, p5, p6, var3, var2, var4,
		if fFlagUserListCanonicalCtaAnalyticsModule then p7 else nil
	})
end