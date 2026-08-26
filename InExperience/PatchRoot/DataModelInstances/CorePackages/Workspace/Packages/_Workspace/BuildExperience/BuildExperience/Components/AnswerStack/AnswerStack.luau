local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local fFlagBuildLocalization = sharedFlagsModule.FFlagBuildLocalization
local optionSelectorModule = require(script.Parent.OptionSelector)
local button = foundationModule.Button
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local inputSize = foundationModule.Enums.InputSize

local function _(p1, p2)
	if typeof(p1) == "string" then
		return p1 == p2
	elseif typeof(p1) ~= "table" then
		return false
	end
	for i, v in p1 do
		if v == p2 then
			return true
		end
	end
	return false
end

local _ = function(p3)
	return if typeof(p3) == "string" then p3 elseif typeof(p3) == "table" then p3[1] else nil
end

return function(p3)
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), reactModule (ref), optionSelectorModule (ref), view (ref), button (ref), inputSize (ref), buttonVariant (ref)
	local var1 = if fFlagBuildLocalization then useLocalization({
		selectAnOption = localizationStringsModule.ANSWER_STACK_SELECT_AN_OPTION,
		submit = localizationStringsModule.ANSWER_STACK_SUBMIT
	}) else nil
	local onOptionSelected = p3.onOptionSelected
	local options = p3.options
	local isMulti = (p3.selectionMode or "single") == "multi"
	local selectedOptionId = p3.selectedOptionId
	local onConfirm = p3.onConfirm
	local var2 = isMulti and onConfirm ~= nil
	local var3 = if var2 or selectedOptionId == nil then nil elseif typeof(selectedOptionId) == "string" then selectedOptionId elseif typeof(selectedOptionId) == "table" then selectedOptionId[1] else nil
	local t = {}
	
	for i, v in options do
		if var3 == nil or v.id == var3 then
			local var4
			local id = v.id
			local createElement = reactModule.createElement
			local var5 = optionSelectorModule
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
						var4 = true
					end
				end
				var4 = false
			else
				var4 = false
			end
			t_1.isSelected = var4
			t_1.selectionStyle = if not var2 then "committed" else "intermediate"
			t_1.testId = `AnswerStack.Option.{v.id}`
			
			function t_1.onActivated()
				-- upvalues: onOptionSelected (ref), v (ref)
				onOptionSelected(v)
			end
			
			t[id] = createElement(var5, t_1)
		end
	end
	local t_1 = {
		Options = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "col gap-medium size-full-0 auto-y"
		}, t)
	}
	
	if var2 and onConfirm ~= nil then
		local var6 = p3.isConfirmDisabled == true
		t_1.Confirm = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "row align-x-right size-full-0 auto-y"
		}, {
			Button = reactModule.createElement(button, {
				text = if var6 then if fFlagBuildLocalization then var1.selectAnOption else localizationStringsModule.ANSWER_STACK_SELECT_AN_OPTION else p3.confirmLabel or (if fFlagBuildLocalization then var1.submit else localizationStringsModule.ANSWER_STACK_SUBMIT),
				size = inputSize.Medium,
				variant = buttonVariant.Standard,
				isDisabled = var6,
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