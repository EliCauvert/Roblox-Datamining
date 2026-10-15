local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local reactModule = require(parent.React)
local localizationModule = require(parent.Localization)
local _ = require(buildExperience.Chat.chatTypes)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local _ = require(script.Parent.AnswersCardView)
local useLocalization = localizationModule.Hooks.useLocalization

return function(p1)
	-- upvalues: useLocalization (ref), localizationStringsModule (ref), reactModule (ref)
	local var1 = useLocalization({ answers = localizationStringsModule.ANSWER_FORM_ANSWERS })
	local var2, var3 = reactModule.useBinding(0)
	local var4 = reactModule.useCallback(function(p2)
		-- upvalues: var3 (ref)
		var3(p2.AbsoluteSize.Y)
	end, {})
	local t = {}
	
	for i, v in p1.prompts do
		local t_1 = {}
		
		if v.customResponseText == nil then
			local selectedOptionId = v.selectedOptionId
			
			for i_1, v_1 in v.question.options do
				local var5
				if typeof(selectedOptionId) == "table" then
					var5 = table.find(selectedOptionId, v_1.id) ~= nil
					var5 = nil
				else
					var5 = selectedOptionId == v_1.id
				end
				if var5 then
					table.insert(t_1, {
						title = v_1.title,
						description = if v_1.description ~= "" then nil else v_1.description
					})
				end
			end
		else
			table.insert(t_1, { title = v.customResponseText })
		end
		table.insert(t, { question = v.question.question, answers = t_1 })
	end
	return {
		LayoutOrder = p1.LayoutOrder,
		Size = var2:map(function(p2)
			return UDim2.new(1, 0, 0, p2)
		end),
		headerText = var1.answers,
		rows = t,
		onContentSizeChanged = var4
	}
end