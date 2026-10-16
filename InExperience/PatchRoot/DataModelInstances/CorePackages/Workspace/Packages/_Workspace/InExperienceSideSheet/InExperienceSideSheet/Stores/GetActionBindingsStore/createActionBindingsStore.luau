local ContextActionService = game:GetService("ContextActionService")
local InExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local Parent = InExperienceSideSheet.Parent
local SignalsModule = require(Parent.Signals)
local AnalyticsConstantsModule = require(InExperienceSideSheet.Analytics.AnalyticsConstants)
local SidesheetAnalyticsModule = require(InExperienceSideSheet.Analytics.SidesheetAnalytics)
local EnumsModule = require(InExperienceSideSheet.Common.Enums)
local GetIntegrationsStoreModule = require(InExperienceSideSheet.Stores.GetIntegrationsStore)
local ClosePeoplePageOpenedWithSideSheetModule = require(InExperienceSideSheet.Utils.closePeoplePageOpenedWithSideSheet)
local GetSideSheetVisibilityModule = require(InExperienceSideSheet.Utils.getSideSheetVisibility)
local ToggleSideSheetModule = require(InExperienceSideSheet.Utils.toggleSideSheet)
local FFlagSideSheetOpenPeoplePage = require(InExperienceSideSheet.Flags).FFlagSideSheetOpenPeoplePage
local FFlagShowSwitchServerButton = require(Parent.SharedFlags).FFlagShowSwitchServerButton
local IsPioneerLaunchFunction = require(Parent.PioneerUtils).isPioneerLaunch

local function createActionBinding(KeyCodes) --[[ Line: 38 ]]
	-- upvalues: SignalsModule (copy)
	local Signal, Signal2 = SignalsModule.createSignal(true)
	local Signal1, Signal2_1 = SignalsModule.createSignal(function() --[[ Line: 40 ]]
		return function() --[[ Line: 41 ]] end
	end)
	
	return {
		keyCodes = KeyCodes,
		getOnActivated = Signal1,
		setOnActivated = Signal2_1,
		getIsEnabled = Signal,
		setIsEnabled = Signal2
	}
end

return function() --[[ Line: 53 | Named "createActionBindingsStore" ]]
	-- upvalues: EnumsModule (copy), createActionBinding (copy), FFlagShowSwitchServerButton (copy), IsPioneerLaunchFunction (copy), SignalsModule (copy), GetIntegrationsStoreModule (copy), FFlagSideSheetOpenPeoplePage (copy), ClosePeoplePageOpenedWithSideSheetModule (copy), ToggleSideSheetModule (copy), SidesheetAnalyticsModule (copy), AnalyticsConstantsModule (copy), GetSideSheetVisibilityModule (copy), ContextActionService (copy)
	local SessionActionBindings = {
		[EnumsModule.ActionBinding.Leave] = createActionBinding({ Enum.KeyCode.L, Enum.KeyCode.ButtonX }),
		[EnumsModule.ActionBinding.Respawn] = createActionBinding({ Enum.KeyCode.R, Enum.KeyCode.ButtonY })
	}
	
	if FFlagShowSwitchServerButton or IsPioneerLaunchFunction() then
		SessionActionBindings[EnumsModule.ActionBinding.SwitchServer] = createActionBinding(nil)
	end
	local Effect = SignalsModule.createEffect(function(p1) --[[ Line: 63 ]]
		-- upvalues: GetIntegrationsStoreModule (upval), SessionActionBindings (copy), FFlagSideSheetOpenPeoplePage (upval), ClosePeoplePageOpenedWithSideSheetModule (upval), ToggleSideSheetModule (upval), SidesheetAnalyticsModule (upval), AnalyticsConstantsModule (upval)
		for _, value in GetIntegrationsStoreModule(p1).getSessionActionIntegrations(p1) do
			local SessionActionBinding = SessionActionBindings[value.id]
			
			if SessionActionBinding then
				SessionActionBinding.setOnActivated(function() --[[ Line: 71 ]]
					-- upvalues: value (copy), FFlagSideSheetOpenPeoplePage (upval), ClosePeoplePageOpenedWithSideSheetModule (upval), ToggleSideSheetModule (upval), SidesheetAnalyticsModule (upval), AnalyticsConstantsModule (upval)
					return function() --[[ Line: 72 ]]
						-- upvalues: value (upval), FFlagSideSheetOpenPeoplePage (upval), ClosePeoplePageOpenedWithSideSheetModule (upval), ToggleSideSheetModule (upval), SidesheetAnalyticsModule (upval), AnalyticsConstantsModule (upval)
						value.activated()
						
						if FFlagSideSheetOpenPeoplePage then
							ClosePeoplePageOpenedWithSideSheetModule()
						end
						ToggleSideSheetModule(false)
						SidesheetAnalyticsModule.logSidesheetClosed(AnalyticsConstantsModule.Source.ItemSelected)
					end
				end)
			end
		end
	end)
	local Effect1 = SignalsModule.createEffect(function(p2) --[[ Line: 86 ]]
		-- upvalues: GetSideSheetVisibilityModule (upval), SessionActionBindings (copy), IsPioneerLaunchFunction (upval), FFlagShowSwitchServerButton (upval), ContextActionService (upval)
		if GetSideSheetVisibilityModule(p2) then
			for i, sessionActionBinding in SessionActionBindings do
				if not IsPioneerLaunchFunction() and not FFlagShowSwitchServerButton or sessionActionBinding.keyCodes ~= nil then
					local function FunctionToBind(_, UserInputState, _) --[[ Line: 93 ]]
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
		cleanUp = function() --[[ Line: 113 ]]
			-- upvalues: Effect1 (copy), Effect (copy)
			Effect1()
			Effect()
		end
	}
end