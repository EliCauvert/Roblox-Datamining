local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local ReactModule = require(Parent.React)
local _ = require(BuildExperience.Chat.chatTypes)
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local _ = require(script.Parent.AnswersCardView)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization

return function(Frame) --[[ Line: 17 | Named "useAnswersCardViewModel" ]]
	-- upvalues: UseLocalizationFunction (copy), LocalizationStringsModule (copy), ReactModule (copy)
	local UseLocalizationResult = UseLocalizationFunction({ answers = LocalizationStringsModule.ANSWER_FORM_ANSWERS })
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(0)
	local UseResult = ReactModule.useCallback(function(Frame) --[[ Line: 20 ]]
		-- upvalues: UseBindingResult2 (copy)
		UseBindingResult2(Frame.AbsoluteSize.Y)
	end, {})
	local Rows = {}
	
	for _, prompt in Frame.prompts do
		local List = {}
		
		if prompt.customResponseText == nil then
			local SelectedOptionId = prompt.selectedOptionId
			
			for _, option in prompt.question.options do
				if if typeof(SelectedOptionId) == "table" then table.find(SelectedOptionId, option.id) ~= nil else SelectedOptionId == option.id then
					table.insert(List, {
						title = option.title,
						description = if option.description == "" then nil else option.description
					})
				end
			end
		else
			table.insert(List, { title = prompt.customResponseText })
		end
		table.insert(Rows, { question = prompt.question.question, answers = List })
	end
	return {
		LayoutOrder = Frame.LayoutOrder,
		Size = UseBindingResult:map(function(YOffset): UDim2 --[[ Line: 51 ]]
			return UDim2.new(1, 0, 0, YOffset)
		end),
		headerText = UseLocalizationResult.answers,
		rows = Rows,
		onContentSizeChanged = UseResult
	}
end