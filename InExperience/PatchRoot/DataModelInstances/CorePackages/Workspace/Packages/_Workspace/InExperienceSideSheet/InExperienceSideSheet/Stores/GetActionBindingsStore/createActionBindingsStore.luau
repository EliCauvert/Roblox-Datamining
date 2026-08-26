local contextActionService = game:GetService("ContextActionService")
local inExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local signalsModule = require(inExperienceSideSheet.Parent.Signals)
local analyticsConstantsModule = require(inExperienceSideSheet.Analytics.AnalyticsConstants)
local sidesheetAnalyticsModule = require(inExperienceSideSheet.Analytics.SidesheetAnalytics)
local enumsModule = require(inExperienceSideSheet.Common.Enums)
local getIntegrationsStoreModule = require(inExperienceSideSheet.Stores.GetIntegrationsStore)
local getSideSheetVisibilityModule = require(inExperienceSideSheet.Utils.getSideSheetVisibility)
local toggleSideSheetModule = require(inExperienceSideSheet.Utils.toggleSideSheet)

local function createActionBinding(p1)
	-- upvalues: signalsModule (ref)
	local var1, var2 = signalsModule.createSignal(true)
	local var3, var4 = signalsModule.createSignal(function()
		return function() end
	end)
	
	return {
		keyCodes = p1,
		getOnActivated = var3,
		setOnActivated = var4,
		getIsEnabled = var1,
		setIsEnabled = var2
	}
end

return function()
	-- upvalues: enumsModule (ref), createActionBinding (ref), signalsModule (ref), getIntegrationsStoreModule (ref), toggleSideSheetModule (ref), sidesheetAnalyticsModule (ref), analyticsConstantsModule (ref), getSideSheetVisibilityModule (ref), contextActionService (ref)
	local t = {
		[enumsModule.ActionBinding.Leave] = createActionBinding({ Enum.KeyCode.L, Enum.KeyCode.ButtonX }),
		[enumsModule.ActionBinding.Respawn] = createActionBinding({ Enum.KeyCode.R, Enum.KeyCode.ButtonY })
	}
	local var1 = signalsModule.createEffect(function(p1)
		-- upvalues: getIntegrationsStoreModule (copy), t (ref), toggleSideSheetModule (copy), sidesheetAnalyticsModule (copy), analyticsConstantsModule (copy)
		for i, v in getIntegrationsStoreModule(p1).getSessionActionIntegrations(p1) do
			local id = t[v.id]
			
			if id then
				id.setOnActivated(function()
					-- upvalues: v (ref), toggleSideSheetModule (copy), sidesheetAnalyticsModule (copy), analyticsConstantsModule (copy)
					return function()
						-- upvalues: v (copy), toggleSideSheetModule (copy), sidesheetAnalyticsModule (copy), analyticsConstantsModule (copy)
						v.activated()
						toggleSideSheetModule(false)
						sidesheetAnalyticsModule.logSidesheetClosed(analyticsConstantsModule.Source.ItemSelected)
					end
				end)
			end
		end
	end)
	local var2 = signalsModule.createEffect(function(p2)
		-- upvalues: getSideSheetVisibilityModule (copy), t (ref), contextActionService (copy)
		if getSideSheetVisibilityModule(p2) then
			for i, v in t do
				local var3 = function(_, p3, _)
					-- upvalues: v (ref)
					if p3 == Enum.UserInputState.Begin then
						v.getOnActivated()()
					end
				end
				
				if v.getIsEnabled(p2) then
					contextActionService:BindCoreAction(i, var3, false, unpack(v.keyCodes))
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
		cleanUp = function()
			-- upvalues: var2 (ref), var1 (ref)
			var2()
			var1()
		end
	}
end