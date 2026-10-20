local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local LocalizationModule = require(Parent.Localization)
local ReactModule = require(Parent.React)
local ResponsiveModule = require(Parent.Responsive)
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local UseClosableFocusRootModule = require(BuildExperience.utils.useClosableFocusRoot)
local _ = require(script.Parent.ModelPickerTypes)
local _ = require(script.Parent.ModelPickerView)

return function(Frame)
	-- upvalues: LocalizationModule (copy), LocalizationStringsModule (copy), ReactModule (copy), UseClosableFocusRootModule (copy), FocusNavigationUtilsModule (copy), ResponsiveModule (copy)
	local UseLocalizationResult = LocalizationModule.Hooks.useLocalization({
		title = LocalizationStringsModule.MODEL_PICKER_TITLE,
		unavailable = LocalizationStringsModule.MODEL_PICKER_UNAVAILABLE,
		defaultLabel = LocalizationStringsModule.MODEL_PICKER_DEFAULT_LABEL,
		defaultDescription = LocalizationStringsModule.MODEL_PICKER_DEFAULT_DESCRIPTION,
		advancedLabel = LocalizationStringsModule.MODEL_PICKER_ADVANCED_LABEL,
		advancedDescription = LocalizationStringsModule.MODEL_PICKER_ADVANCED_DESCRIPTION
	})
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: Frame (copy), UseStateResult2 (copy)
		if not Frame.isDisabled then
			UseStateResult2(true)
		end
	end, { Frame.isDisabled })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(false)
	end, {})
	local UseResult2 = ReactModule.useCallback(function(Id)
		-- upvalues: UseStateResult (copy), Frame (copy), UseStateResult2 (copy)
		if not UseStateResult or Frame.isDisabled then return end
		for _, option in Frame.data.options do
			if option.id == Id and option.isAvailable then
				UseStateResult2(false)
				Frame.onSelect(Id)
				break
			end
		end
	end, {
		UseStateResult,
		Frame.isDisabled,
		Frame.data,
		Frame.onSelect
	})
	local UseClosableFocusRootModuleResult = UseClosableFocusRootModule({
		surfaceIdentifier = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum.PopUp,
		isOpen = UseStateResult,
		onClose = UseResult1
	})
	local UsePreferredInputResult = ResponsiveModule.usePreferredInput()
	local Options = {}
	
	for _, option in Frame.data.options do
		local Unavailable = UseLocalizationResult.unavailable
		local AdvancedDescription = nil
		
		if option.model == "Default" then
			Unavailable = UseLocalizationResult.defaultLabel
			AdvancedDescription = UseLocalizationResult.defaultDescription
		elseif option.model == "Advanced" then
			Unavailable = UseLocalizationResult.advancedLabel
			AdvancedDescription = UseLocalizationResult.advancedDescription
		end
		table.insert(Options, {
			id = option.id,
			model = option.model,
			isAvailable = option.isAvailable,
			label = Unavailable,
			description = AdvancedDescription
		})
	end
	local Title = UseLocalizationResult.title
	
	if Frame.selectedId ~= nil then
		Title = UseLocalizationResult.unavailable
		
		for _, option1 in Options do
			if option1.id == Frame.selectedId then
				Title = option1.label
				break
			end
		end
	end
	return {
		data = { options = Options },
		selectedId = Frame.selectedId,
		isDisabled = Frame.isDisabled,
		LayoutOrder = Frame.LayoutOrder,
		label = Title,
		title = UseLocalizationResult.title,
		unavailableText = UseLocalizationResult.unavailable,
		isOpen = UseStateResult,
		onOpen = UseResult,
		onClose = UseResult1,
		onSelect = UseResult2,
		focusRootRef = UseClosableFocusRootModuleResult,
		hasCloseAffordance = UsePreferredInputResult ~= ResponsiveModule.Input.Directional
	}
end