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
local navigationCommands = require(parent.RobloxAppNavigation).NavigationCommands
local appPage = require(parent.RobloxAppEnums).AppPage
local dataStatus = dataHydrationModule.DataStatus
local buttonTypes = enumsModule.ButtonTypes
local buttonVariant = foundationModule.Enums.ButtonVariant
local mapServerActionsToRowCtaModule = require(userList.Cta.mapServerActionsToRowCta)
local _ = require(userList.Common.Types)
local t = { primaryCta = nil, secondaryCta = nil, isLoading = true }

local function _(p0, p1, p2) --[[ line: 43 | named "buildJoinCta" ]]
	local cloned = table.clone(p0)
	cloned.onActivated = p2
	cloned.isDisabled = not p1.isInExperience
	cloned.isLoading = p1.isLoading
	
	return cloned
end

return function(p3, p4, p5, p6, p7, p8) --[[ line: 55 | named "useCtaForRow" ]]
	-- upvalues: useDispatch (ref), useLocalUserId (ref), reactModule (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), navigationCommands (ref), navigateDown (ref), enumsModule (ref), buttonTypes (ref), buttonVariant (ref), dataStatus (ref), t (ref), mapServerActionsToRowCtaModule (ref), fFlagUserListCtaAnalyticsEnabled (ref)
	local var8 = useDispatch()
	local var9 = useLocalUserId()
	local var10 = reactModule.useCallback(function(p9) --[[ line: 65 ]]
		-- upvalues: appPage (copy), fFlagSignalsNavP3Dispatch (copy), navigationCommands (copy), var8 (ref), navigateDown (copy)
		local t = { name = appPage.GameJoinCard, userId = p9 }
		
		if fFlagSignalsNavP3Dispatch then
			navigationCommands.down(navigationCommands.fromLegacyPage(t))
			
			return
		end
		var8(navigateDown(t))
	end, { var8 })
	local var11 = reactModule.useCallback(function() --[[ line: 77 ]]
		-- upvalues: appPage (copy), p6 (ref), enumsModule (copy), fFlagSignalsNavP3Dispatch (copy), navigationCommands (copy), var8 (ref), navigateDown (copy)
		local t = {
			name = appPage.ProfilePlatform,
			detail = p6,
			extraProps = { profileType = enumsModule.EntityType.User }
		}
		
		if fFlagSignalsNavP3Dispatch then
			navigationCommands.down(navigationCommands.fromLegacyPage(t))
			
			return
		end
		var8(navigateDown(t))
	end, { var8, p6 })
	
	return reactModule.useMemo(function() --[[ line: 91 ]]
		-- upvalues: p7 (ref), p6 (ref), var9 (ref), buttonTypes (copy), var11 (ref), buttonVariant (copy), p4 (ref), dataStatus (copy), t (copy), mapServerActionsToRowCtaModule (copy), p3 (ref), p5 (ref), p8 (ref), fFlagUserListCtaAnalyticsEnabled (copy), var10 (ref)
		if p7 and p7.showSelfProfileCta and p6 == var9 then
			return {
				secondaryCta = nil,
				primaryCta = {
					type = buttonTypes.View,
					onActivated = var11,
					variant = buttonVariant.Standard,
					minWidth = p7.primaryCtaMinWidth,
					maxWidth = p7.primaryCtaMaxWidth
				}
			}
		elseif p4 == nil or p4 == dataStatus.NotReady then
			return t
		end
		local var14 = mapServerActionsToRowCtaModule(p3, p5, p6, p7)
		local primaryCta = var14.primaryCta
		
		if primaryCta and primaryCta.type == buttonTypes.Join and p8 then
			local t_1 = {}
			local var16 = p8
			local cloned = table.clone(primaryCta)
			
			function cloned.onActivated() --[[ line: 117 ]]
				-- upvalues: fFlagUserListCtaAnalyticsEnabled (copy), p7 (copy), buttonTypes (copy), p6 (copy), var10 (copy)
				if fFlagUserListCtaAnalyticsEnabled then
					local var18 = if p7 then p7.onCtaActivated else nil
					
					if var18 ~= nil then
						var18({ buttonType = buttonTypes.Join, userId = p6 })
					end
				end
				var10(p6)
			end
			
			cloned.isDisabled = not var16.isInExperience
			cloned.isLoading = var16.isLoading
			t_1.primaryCta = cloned
			t_1.secondaryCta = var14.secondaryCta
			
			return t_1
		end
		return var14
	end, {
		p3, p4, p5, p6, p7, p8, var10, var9, var11
	})
end