local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local OptionSelectorModule = require(script.Parent.OptionSelector)
local Button = FoundationModule.Button
local View = FoundationModule.View
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize

local function _(List, p1): boolean --[[ Line: 37 | Named "isOptionSelected" ]]
	if typeof(List) == "string" then
		return List == p1
	end
	if typeof(List) ~= "table" then
		return false
	end
	for _, value in List do
		if value == p1 then
			return true
		end
	end
	return false
end

local _ = function(Entry) --[[ Line: 52 | Named "getFirstSelectedOptionId" ]]
	return if typeof(Entry) == "string" then Entry elseif typeof(Entry) == "table" then Entry[1] else nil
end

return function(Frame) --[[ Line: 62 | Named "AnswerStack" ]]
	-- upvalues: UseLocalizationFunction (copy), LocalizationStringsModule (copy), ReactModule (copy), OptionSelectorModule (copy), View (copy), Button (copy), InputSize (copy), ButtonVariant (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		selectAnOption = LocalizationStringsModule.ANSWER_STACK_SELECT_AN_OPTION,
		submit = LocalizationStringsModule.ANSWER_STACK_SUBMIT
	})
	local OnOptionSelectedFunction = Frame.onOptionSelected
	local SelectedOptionId = Frame.selectedOptionId
	local OnConfirm = Frame.onConfirm
	local HasOnConfirm: boolean = (Frame.selectionMode or "single") == "multi" and OnConfirm ~= nil
	local SelectedOptionId1 = if HasOnConfirm or SelectedOptionId == nil then nil elseif typeof(SelectedOptionId) == "string" then SelectedOptionId elseif typeof(SelectedOptionId) == "table" then SelectedOptionId[1] else nil
	local t = {}
	local IsSelectedOptionIdMatch = nil
	
	for LayoutOrder, option in Frame.options do
		if SelectedOptionId1 == nil or option.id == SelectedOptionId1 then
			local Id = option.id
			local CreateElementFunction = ReactModule.createElement
			local config = {
				LayoutOrder = LayoutOrder,
				title = option.title,
				description = option.description
			}
			local Id1 = option.id
			
			if typeof(SelectedOptionId) == "string" then
				IsSelectedOptionIdMatch = SelectedOptionId == Id1
			elseif typeof(SelectedOptionId) == "table" then
				IsSelectedOptionIdMatch = false
				
				for _, value in SelectedOptionId do
					if value == Id1 then
						IsSelectedOptionIdMatch = true
						break
					end
				end
			else
				IsSelectedOptionIdMatch = false
			end
			config.isSelected = IsSelectedOptionIdMatch
			config.selectionStyle = if HasOnConfirm then "intermediate" else "committed"
			config.testId = `AnswerStack.Option.{option.id}`
			
			function config.onActivated() --[[ Line: 92 ]]
				-- upvalues: OnOptionSelectedFunction (copy), option (copy)
				OnOptionSelectedFunction(option)
			end
			
			t[Id] = CreateElementFunction(OptionSelectorModule, config)
		end
	end
	local config = {
		Options = ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = "col gap-medium size-full-0 auto-y"
		}, t)
	}
	
	if HasOnConfirm and OnConfirm ~= nil then
		local IsIsConfirmDisabled = Frame.isConfirmDisabled == true
		config.Confirm = ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = "row align-x-right size-full-0 auto-y"
		}, {
			Button = ReactModule.createElement(Button, {
				text = if IsIsConfirmDisabled then UseLocalizationResult.selectAnOption else Frame.confirmLabel or UseLocalizationResult.submit,
				size = InputSize.Medium,
				variant = ButtonVariant.Standard,
				isDisabled = IsIsConfirmDisabled,
				onActivated = OnConfirm,
				testId = `{Frame.testId or "AnswerStack"}.Confirm`
			})
		})
	end
	return ReactModule.createElement(View, {
		tag = "col gap-medium size-full-0 auto-y padding-top-small",
		LayoutOrder = Frame.LayoutOrder,
		testId = Frame.testId or "AnswerStack"
	}, config)
end