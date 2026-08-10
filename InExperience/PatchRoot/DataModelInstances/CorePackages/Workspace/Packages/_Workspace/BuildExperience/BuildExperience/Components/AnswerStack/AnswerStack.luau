local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local optionSelectorModule = require(script.Parent.OptionSelector)
local button = foundationModule.Button
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local inputSize = foundationModule.Enums.InputSize

local function _(p0, p1) --[[ line: 36 | named "isOptionSelected" ]]
	if typeof(p0) == "string" then
		return p0 == p1
	elseif typeof(p0) ~= "table" then
		return false
	end
	for i, v in p0 do
		if v == p1 then
			return true
		end
	end
	return false
end

local _ = function(p2) --[[ line: 51 | named "getFirstSelectedOptionId" ]]
	return if typeof(p2) == "string" then p2 elseif typeof(p2) == "table" then p2[1] else nil
end

return function(p3) --[[ line: 61 | named "AnswerStack" ]]
	-- upvalues: reactModule (ref), optionSelectorModule (ref), view (ref), button (ref), localizationStringsModule (ref), inputSize (ref), buttonVariant (ref)
	local onOptionSelected = p3.onOptionSelected
	local options = p3.options
	local isMulti = (p3.selectionMode or "single") == "multi"
	local selectedOptionId = p3.selectedOptionId
	local onConfirm = p3.onConfirm
	local var6 = isMulti and onConfirm ~= nil
	local var7 = if var6 or selectedOptionId == nil then nil elseif typeof(selectedOptionId) == "string" then selectedOptionId elseif typeof(selectedOptionId) == "table" then selectedOptionId[1] else nil
	local t = {}
	
	for i, v in options do
		if var7 == nil or v.id == var7 then
			local var13
			local id = v.id
			local createElement = reactModule.createElement
			local var11 = optionSelectorModule
			local t_1 = {
				LayoutOrder = i,
				title = v.title,
				description = v.description
			}
			local id_1 = v.id
			
			if typeof(selectedOptionId) == "string" then
				local _ = selectedOptionId == id_1
			elseif typeof(selectedOptionId) == "table" then
				for i_1, v_1 in selectedOptionId do
					if v_1 == id_1 then
						var13 = true
					end
				end
				var13 = false
			else
				var13 = false
			end
			t_1.isSelected = var13
			t_1.selectionStyle = if not var6 then "committed" else "intermediate"
			t_1.testId = `AnswerStack.Option.{v.id}`
			
			function t_1.onActivated() --[[ line: 87 ]]
				-- upvalues: onOptionSelected (ref), v (ref)
				onOptionSelected(v)
			end
			
			t[id] = createElement(var11, t_1)
		end
	end
	local t_1 = {
		Options = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "col gap-medium size-full-0 auto-y"
		}, t)
	}
	
	if var6 and onConfirm ~= nil then
		local var10 = p3.isConfirmDisabled == true
		t_1.Confirm = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "row align-x-right size-full-0 auto-y"
		}, {
			Button = reactModule.createElement(button, {
				text = if var10 then localizationStringsModule.ANSWER_STACK_SELECT_AN_OPTION else p3.confirmLabel or localizationStringsModule.ANSWER_STACK_SUBMIT,
				size = inputSize.Medium,
				variant = buttonVariant.Standard,
				isDisabled = var10,
				onActivated = onConfirm,
				testId = `{p3.testId or "AnswerStack"}.Confirm`
			})
		})
	end
	return reactModule.createElement(view, {
		tag = "col gap-medium size-full-0 auto-y padding-top-small",
		LayoutOrder = p3.LayoutOrder,
		testId = p3.testId or "AnswerStack"
	}, t_1)
end