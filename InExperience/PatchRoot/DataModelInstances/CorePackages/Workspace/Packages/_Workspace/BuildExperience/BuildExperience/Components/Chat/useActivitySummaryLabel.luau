local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local LocalizationRoactContext = require(Parent.Localization).LocalizationRoactContext
local _ = require(BuildExperience.Chat.chatTypes)
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local FFlagBuildExperiencePromptStallMessageModule = require(BuildExperience.Flags.FFlagBuildExperiencePromptStallMessage)
local UseStepRowsModule = require(script.Parent.useStepRows)
local UseReactiveValueFunction = require(script.Parent.activityLabelHelpers).useReactiveValue
local LocalizeStepLabelFunction = UseStepRowsModule.localizeStepLabel
local UseStepRowsFunction = UseStepRowsModule.useStepRows
local t = {}

return {
	useActivitySummaryLabel = function(p1)
		-- upvalues: UseLocalizationFunction (copy), LocalizationStringsModule (copy), FFlagBuildExperiencePromptStallMessageModule (copy), ReactModule (copy), LocalizationRoactContext (copy), UseReactiveValueFunction (copy), t (copy), UseStepRowsFunction (copy), LocalizeStepLabelFunction (copy)
		local UseLocalizationResult = UseLocalizationFunction({
			assigningTasks = LocalizationStringsModule.CHAT_ASSIGNING_TASKS,
			assistantLoading = LocalizationStringsModule.CHAT_ASSISTANT_LOADING,
			assistantTakingLonger = if FFlagBuildExperiencePromptStallMessageModule then LocalizationStringsModule.CHAT_ASSISTANT_TAKING_LONGER else nil,
			questionComposerAnswer = LocalizationStringsModule.CHAT_QUESTION_COMPOSER_ANSWER,
			questionMultiple = LocalizationStringsModule.CHAT_QUESTION_MULTIPLE,
			questionSingle = LocalizationStringsModule.CHAT_QUESTION_SINGLE,
			tool = LocalizationStringsModule.CHAT_TOOL
		})
		local UseContextResult = ReactModule.useContext(LocalizationRoactContext)
		local UseReactiveValueResult = UseReactiveValueFunction(p1.label or "")
		local UseReactiveValueResult1 = UseReactiveValueFunction(p1.activityItems or t)
		local UseReactiveValueResult2 = UseReactiveValueFunction(p1.isLoading or false)
		local UseStepRowsResult = UseStepRowsFunction(p1)
		local config = {
			[LocalizationStringsModule.CHAT_ASSIGNING_TASKS] = UseLocalizationResult.assigningTasks,
			[LocalizationStringsModule.CHAT_ASSISTANT_LOADING] = UseLocalizationResult.assistantLoading,
			[LocalizationStringsModule.CHAT_QUESTION_COMPOSER_ANSWER] = UseLocalizationResult.questionComposerAnswer,
			[LocalizationStringsModule.CHAT_QUESTION_MULTIPLE] = UseLocalizationResult.questionMultiple,
			[LocalizationStringsModule.CHAT_QUESTION_SINGLE] = UseLocalizationResult.questionSingle
		}
		local IsIsWaitingForLocalTool: boolean = p1.isWaitingForLocalTool == true or config[UseReactiveValueResult] ~= nil
		local v1 = nil
		
		if UseReactiveValueResult2 and not IsIsWaitingForLocalTool then
			for _, value in UseStepRowsResult do
				if value.isRunning == true then
					v1 = value
					break
				end
			end
		end
		return {
			label = if v1 == nil then LocalizeStepLabelFunction(UseReactiveValueResult, p1.summaryToolActivity, config, UseLocalizationResult.tool, UseContextResult) else v1.title,
			runningKey = if v1 == nil then nil else v1.key,
			labelSource = UseReactiveValueResult,
			activityItems = UseReactiveValueResult1,
			takingLongerText = UseLocalizationResult.assistantTakingLonger,
			localizationContext = UseContextResult
		}
	end
}