local inExperienceIntervention = script:FindFirstAncestor("InExperienceIntervention")
local parent = inExperienceIntervention.Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local inExperienceInterventionEventReceiverModule = require(inExperienceIntervention.InExperienceInterventionEventReceiver)
local inExperienceInterventionUIStateReducerModule = require(inExperienceIntervention.Reducers.InExperienceInterventionUIStateReducer)
local inExperienceInterventionDialogManagerModule = require(inExperienceIntervention.InExperienceInterventionDialogManager)
local constants = require(parent.InterventionShared).Utils.Constants
local useLocalization = require(parent.Localization).Hooks.useLocalization

function InExperienceInterventionContainer()
	-- upvalues: reactModule (ref), inExperienceInterventionUIStateReducerModule (ref), constants (ref), useLocalization (ref), cryoModule (ref), inExperienceInterventionEventReceiverModule (ref), inExperienceInterventionDialogManagerModule (ref)
	local var1, var2 = reactModule.useReducer(inExperienceInterventionUIStateReducerModule, constants.InitialUIState)
	local var3 = reactModule.useCallback(function(p1)
		-- upvalues: cryoModule (copy), var2 (ref)
		var2(cryoModule.Dictionary.join(p1, { dispatchTimestamp = DateTime.now().UnixTimestamp }))
	end, { var2 })
	
	return reactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
		EventReceiver = reactModule.createElement(inExperienceInterventionEventReceiverModule, {
			uiStateDispatch = var3,
			localizedText = useLocalization(constants.localizationKeys)
		}),
		DialogManager = reactModule.createElement(inExperienceInterventionDialogManagerModule, { uiState = var1, uiStateDispatch = var3 })
	})
end

return InExperienceInterventionContainer