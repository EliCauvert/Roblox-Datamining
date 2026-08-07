local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local button = foundationModule.Button
local useSignalState = require(parent.SignalsReact).useSignalState
local _ = require(moments.ExperienceDetailsSheet.Types)
local useJoinExperienceModule = require(script.Parent.useJoinExperience)
local getMomentsPreferencesStoreModule = require(moments.Stores.GetMomentsPreferencesStore)

return reactModule.memo(function(p0) --[[ line: 30 | named "JoinButton" ]]
	-- upvalues: useJoinExperienceModule (ref), useSignalState (ref), getMomentsPreferencesStoreModule (ref), reactModule (ref), button (ref), foundationModule (ref)
	local var5 = useJoinExperienceModule()
	local context = p0.context
	
	return reactModule.createElement(button, {
		LayoutOrder = p0.LayoutOrder,
		text = p0.text,
		size = foundationModule.Enums.InputSize.Medium,
		variant = foundationModule.Enums.ButtonVariant.Emphasis,
		isDisabled = if p0.isDisabled ~= true then useSignalState(getMomentsPreferencesStoreModule(false).getIsTeleporting) else true,
		testId = p0.testId,
		onActivated = function() --[[ line: 43 ]]
			-- upvalues: var5 (ref), context (ref)
			var5(context)
		end
	})
end)