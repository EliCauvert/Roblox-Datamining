local userList = script:FindFirstAncestor("UserList")
local parent = userList.Parent
local reactModule = require(parent.React)
local dataHydrationModule = require(parent.DataHydration)
local enumsModule = require(userList.Common.Enums)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local navigateDown = require(parent.NavigationRodux).Thunks.NavigateDown
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local fFlagUserListCtaAnalyticsEnabled = require(parent.SharedFlags).FFlagUserListCtaAnalyticsEnabled
local navigationCommands = require(parent.RobloxAppNavigation).NavigationCommands
local appPage = require(parent.RobloxAppEnums).AppPage
local dataStatus = dataHydrationModule.DataStatus
local buttonTypes = enumsModule.ButtonTypes
local mapServerActionsToRowCtaModule = require(userList.Cta.mapServerActionsToRowCta)
local _ = require(userList.Common.Types)
local t = { primaryCta = nil, secondaryCta = nil, isLoading = true }

local function _(p0, p1, p2) --[[ line: 40 | named "buildJoinCta" ]]
	local cloned = table.clone(p0)
	cloned.onActivated = p2
	cloned.isDisabled = not p1.isInExperience
	cloned.isLoading = p1.isLoading
	
	return cloned
end

return function(p3, p4, p5, p6, p7, p8) --[[ line: 52 | named "useCtaForRow" ]]
	-- upvalues: useDispatch (ref), reactModule (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), navigationCommands (ref), navigateDown (ref), dataStatus (ref), t (ref), mapServerActionsToRowCtaModule (ref), buttonTypes (ref), fFlagUserListCtaAnalyticsEnabled (ref)
	local var7 = useDispatch()
	local var8 = reactModule.useCallback(function(p9) --[[ line: 61 ]]
		-- upvalues: appPage (copy), fFlagSignalsNavP3Dispatch (copy), navigationCommands (copy), var7 (ref), navigateDown (copy)
		local t = { name = appPage.GameJoinCard, userId = p9 }
		
		if fFlagSignalsNavP3Dispatch then
			navigationCommands.down(navigationCommands.fromLegacyPage(t))
			
			return
		end
		var7(navigateDown(t))
	end, { var7 })
	
	return reactModule.useMemo(function() --[[ line: 73 ]]
		-- upvalues: p4 (ref), dataStatus (copy), t (copy), mapServerActionsToRowCtaModule (copy), p3 (ref), p5 (ref), p6 (ref), p7 (ref), buttonTypes (copy), p8 (ref), fFlagUserListCtaAnalyticsEnabled (copy), var8 (ref)
		if p4 == nil or p4 == dataStatus.NotReady then
			return t
		end
		local var10 = mapServerActionsToRowCtaModule(p3, p5, p6, p7)
		local primaryCta = var10.primaryCta
		
		if primaryCta and primaryCta.type == buttonTypes.Join and p8 then
			local t_1 = {}
			local var12 = p8
			local cloned = table.clone(primaryCta)
			
			function cloned.onActivated() --[[ line: 83 ]]
				-- upvalues: fFlagUserListCtaAnalyticsEnabled (copy), p7 (copy), buttonTypes (copy), p6 (copy), var8 (copy)
				if fFlagUserListCtaAnalyticsEnabled then
					local var14 = if p7 then p7.onCtaActivated else nil
					
					if var14 ~= nil then
						var14({ buttonType = buttonTypes.Join, userId = p6 })
					end
				end
				var8(p6)
			end
			
			cloned.isDisabled = not var12.isInExperience
			cloned.isLoading = var12.isLoading
			t_1.primaryCta = cloned
			t_1.secondaryCta = var10.secondaryCta
			
			return t_1
		end
		return var10
	end, {
		p3, p4, p5, p6, p7, p8, var8
	})
end