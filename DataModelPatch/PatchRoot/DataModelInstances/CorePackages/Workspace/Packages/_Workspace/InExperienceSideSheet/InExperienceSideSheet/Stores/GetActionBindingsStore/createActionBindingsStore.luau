local ContextActionService = game:GetService("ContextActionService")
local InExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local SignalsModule = require(InExperienceSideSheet.Parent.Signals)
local AnalyticsConstantsModule = require(InExperienceSideSheet.Analytics.AnalyticsConstants)
local SidesheetAnalyticsModule = require(InExperienceSideSheet.Analytics.SidesheetAnalytics)
local EnumsModule = require(InExperienceSideSheet.Common.Enums)
local GetIntegrationsStoreModule = require(InExperienceSideSheet.Stores.GetIntegrationsStore)
local GetSideSheetVisibilityModule = require(InExperienceSideSheet.Utils.getSideSheetVisibility)
local ToggleSideSheetModule = require(InExperienceSideSheet.Utils.toggleSideSheet)

local function createActionBinding(KeyCodes)
	-- upvalues: SignalsModule (copy)
	local Signal, Signal2 = SignalsModule.createSignal(true)
	local Signal1, Signal2_1 = SignalsModule.createSignal(function()
		return function() end
	end)
	
	return {
		keyCodes = KeyCodes,
		getOnActivated = Signal1,
		setOnActivated = Signal2_1,
		getIsEnabled = Signal,
		setIsEnabled = Signal2
	}
end

return function()
	-- upvalues: EnumsModule (copy), createActionBinding (copy), SignalsModule (copy), GetIntegrationsStoreModule (copy), ToggleSideSheetModule (copy), SidesheetAnalyticsModule (copy), AnalyticsConstantsModule (copy), GetSideSheetVisibilityModule (copy), ContextActionService (copy)
	local SessionActionBindings = {
		[EnumsModule.ActionBinding.Leave] = createActionBinding({ Enum.KeyCode.L, Enum.KeyCode.ButtonX }),
		[EnumsModule.ActionBinding.Respawn] = createActionBinding({ Enum.KeyCode.R, Enum.KeyCode.ButtonY })
	}
	local Effect = SignalsModule.createEffect(function(p1)
		-- upvalues: GetIntegrationsStoreModule (upval), SessionActionBindings (copy), ToggleSideSheetModule (upval), SidesheetAnalyticsModule (upval), AnalyticsConstantsModule (upval)
		for _, value in GetIntegrationsStoreModule(p1).getSessionActionIntegrations(p1) do
			local SessionActionBinding = SessionActionBindings[value.id]
			
			if SessionActionBinding then
				SessionActionBinding.setOnActivated(function()
					-- upvalues: value (copy), ToggleSideSheetModule (upval), SidesheetAnalyticsModule (upval), AnalyticsConstantsModule (upval)
					return function()
						-- upvalues: value (upval), ToggleSideSheetModule (upval), SidesheetAnalyticsModule (upval), AnalyticsConstantsModule (upval)
						value.activated()
						ToggleSideSheetModule(false)
						SidesheetAnalyticsModule.logSidesheetClosed(AnalyticsConstantsModule.Source.ItemSelected)
					end
				end)
			end
		end
	end)
	local Effect1 = SignalsModule.createEffect(function(p2)
		-- upvalues: GetSideSheetVisibilityModule (upval), SessionActionBindings (copy), ContextActionService (upval)
		if GetSideSheetVisibilityModule(p2) then
			for i, sessionActionBinding in SessionActionBindings do
				local function FunctionToBind(_, UserInputState, _)
					-- upvalues: sessionActionBinding (copy)
					if UserInputState == Enum.UserInputState.Begin then
						sessionActionBinding.getOnActivated()()
					end
				end
				
				if sessionActionBinding.getIsEnabled(p2) then
					ContextActionService:BindCoreAction(i, FunctionToBind, false, unpack(sessionActionBinding.keyCodes))
				else
					ContextActionService:UnbindCoreAction(i)
				end
			end
			return
		else
			for sessionActionBinding1 in SessionActionBindings do
				ContextActionService:UnbindCoreAction(sessionActionBinding1)
			end
		end
	end)
	
	return {
		sessionActionBindings = SessionActionBindings,
		cleanUp = function()
			-- upvalues: Effect1 (copy), Effect (copy)
			Effect1()
			Effect()
		end
	}
end