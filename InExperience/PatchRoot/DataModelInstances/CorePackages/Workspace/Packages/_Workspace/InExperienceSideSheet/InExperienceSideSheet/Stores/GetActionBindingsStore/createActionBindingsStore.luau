local contextActionService = game:GetService("ContextActionService")
local inExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local signalsModule = require(inExperienceSideSheet.Parent.Signals)
local analyticsConstantsModule = require(inExperienceSideSheet.Analytics.AnalyticsConstants)
local sidesheetAnalyticsModule = require(inExperienceSideSheet.Analytics.SidesheetAnalytics)
local enumsModule = require(inExperienceSideSheet.Common.Enums)
local getIntegrationsStoreModule = require(inExperienceSideSheet.Stores.GetIntegrationsStore)
local getSideSheetVisibilityModule = require(inExperienceSideSheet.Utils.getSideSheetVisibility)
local toggleSideSheetModule = require(inExperienceSideSheet.Utils.toggleSideSheet)

local function createActionBinding(p0) --[[ line: 31 ]]
	-- upvalues: signalsModule (ref)
	local var10, var11 = signalsModule.createSignal(true)
	local var12, var13 = signalsModule.createSignal(function() --[[ line: 33 ]]
		return function() --[[ line: 34 ]] end
	end)
	
	return {
		keyCodes = p0,
		getOnActivated = var12,
		setOnActivated = var13,
		getIsEnabled = var10,
		setIsEnabled = var11
	}
end

return function() --[[ line: 46 | named "createActionBindingsStore" ]]
	-- upvalues: enumsModule (ref), createActionBinding (ref), signalsModule (ref), getIntegrationsStoreModule (ref), toggleSideSheetModule (ref), sidesheetAnalyticsModule (ref), analyticsConstantsModule (ref), getSideSheetVisibilityModule (ref), contextActionService (ref)
	local t = {
		[enumsModule.ActionBinding.Leave] = createActionBinding({ Enum.KeyCode.L, Enum.KeyCode.ButtonX }),
		[enumsModule.ActionBinding.Respawn] = createActionBinding({ Enum.KeyCode.R, Enum.KeyCode.ButtonY })
	}
	local var15 = signalsModule.createEffect(function(p1) --[[ line: 53 ]]
		-- upvalues: getIntegrationsStoreModule (copy), t (ref), toggleSideSheetModule (copy), sidesheetAnalyticsModule (copy), analyticsConstantsModule (copy)
		for i, v in getIntegrationsStoreModule(p1).getSessionActionIntegrations(p1) do
			local id = t[v.id]
			
			if id then
				id.setOnActivated(function() --[[ line: 61 ]]
					-- upvalues: v (ref), toggleSideSheetModule (copy), sidesheetAnalyticsModule (copy), analyticsConstantsModule (copy)
					return function() --[[ line: 62 ]]
						-- upvalues: v (copy), toggleSideSheetModule (copy), sidesheetAnalyticsModule (copy), analyticsConstantsModule (copy)
						v.activated()
						toggleSideSheetModule(false)
						sidesheetAnalyticsModule.logSidesheetClosed(analyticsConstantsModule.Source.ItemSelected)
					end
				end)
			end
		end
	end)
	local var16 = signalsModule.createEffect(function(p2) --[[ line: 73 ]]
		-- upvalues: getSideSheetVisibilityModule (copy), t (ref), contextActionService (copy)
		if getSideSheetVisibilityModule(p2) then
			for i, v in t do
				local var17 = function(_, p3, _) --[[ line: 76 ]]
					-- upvalues: v (ref)
					if p3 == Enum.UserInputState.Begin then
						v.getOnActivated()()
					end
				end
				
				if v.getIsEnabled(p2) then
					contextActionService:BindCoreAction(i, var17, false, unpack(v.keyCodes))
				else
					contextActionService:UnbindCoreAction(i)
				end
			end
			return
		else
			for i in t do
				contextActionService:UnbindCoreAction(i)
			end
		end
	end)
	
	return {
		sessionActionBindings = t,
		cleanUp = function() --[[ line: 96 ]]
			-- upvalues: var16 (ref), var15 (ref)
			var16()
			var15()
		end
	}
end