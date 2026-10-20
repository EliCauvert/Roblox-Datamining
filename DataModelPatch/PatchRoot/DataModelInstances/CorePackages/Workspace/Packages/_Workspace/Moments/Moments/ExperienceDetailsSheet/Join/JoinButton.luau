local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Button = FoundationModule.Button
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local _ = require(Moments.ExperienceDetailsSheet.Types)
local UseJoinExperienceModule = require(script.Parent.useJoinExperience)
local GetMomentsPreferencesStoreModule = require(Moments.Stores.GetMomentsPreferencesStore)

return ReactModule.memo(function(Frame)
	-- upvalues: UseJoinExperienceModule (copy), UseSignalStateFunction (copy), GetMomentsPreferencesStoreModule (copy), ReactModule (copy), Button (copy), FoundationModule (copy)
	local UseJoinExperienceModuleResult = UseJoinExperienceModule()
	local UseSignalStateResult = UseSignalStateFunction(GetMomentsPreferencesStoreModule(false).getIsTeleporting)
	local Context = Frame.context
	
	return ReactModule.createElement(Button, {
		LayoutOrder = Frame.LayoutOrder,
		text = Frame.text,
		size = FoundationModule.Enums.InputSize.Medium,
		variant = FoundationModule.Enums.ButtonVariant.Emphasis,
		isDisabled = Frame.isDisabled == true or UseSignalStateResult,
		testId = Frame.testId,
		onActivated = function()
			-- upvalues: UseJoinExperienceModuleResult (copy), Context (copy)
			UseJoinExperienceModuleResult(Context)
		end
	})
end)