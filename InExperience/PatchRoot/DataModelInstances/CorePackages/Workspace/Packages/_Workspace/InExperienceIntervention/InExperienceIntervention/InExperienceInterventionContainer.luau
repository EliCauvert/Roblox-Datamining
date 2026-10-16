local InExperienceIntervention = script:FindFirstAncestor("InExperienceIntervention")
local Parent = InExperienceIntervention.Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local InExperienceInterventionEventReceiverModule = require(InExperienceIntervention.InExperienceInterventionEventReceiver)
local InExperienceInterventionUIStateReducerModule = require(InExperienceIntervention.Reducers.InExperienceInterventionUIStateReducer)
local InExperienceInterventionDialogManagerModule = require(InExperienceIntervention.InExperienceInterventionDialogManager)
local Constants = require(Parent.InterventionShared).Utils.Constants
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization

function InExperienceInterventionContainer() --[[ Line: 12 ]]
	-- upvalues: ReactModule (copy), InExperienceInterventionUIStateReducerModule (copy), Constants (copy), UseLocalizationFunction (copy), CryoModule (copy), InExperienceInterventionEventReceiverModule (copy), InExperienceInterventionDialogManagerModule (copy)
	local UseReducerResult, UseReducerResult2 = ReactModule.useReducer(InExperienceInterventionUIStateReducerModule, Constants.InitialUIState)
	local UseResult = ReactModule.useCallback(function(p1) --[[ Line: 18 ]]
		-- upvalues: CryoModule (upval), UseReducerResult2 (copy)
		UseReducerResult2((CryoModule.Dictionary.join(p1, { dispatchTimestamp = DateTime.now().UnixTimestamp })))
	end, { UseReducerResult2 })
	
	return ReactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
		EventReceiver = ReactModule.createElement(InExperienceInterventionEventReceiverModule, {
			uiStateDispatch = UseResult,
			localizedText = UseLocalizationFunction(Constants.localizationKeys)
		}),
		DialogManager = ReactModule.createElement(InExperienceInterventionDialogManagerModule, { uiState = UseReducerResult, uiStateDispatch = UseResult })
	})
end

return InExperienceInterventionContainer