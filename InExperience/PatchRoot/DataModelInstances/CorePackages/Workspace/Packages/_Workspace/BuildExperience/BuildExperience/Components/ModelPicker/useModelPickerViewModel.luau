local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local UserInputService = game:GetService("UserInputService")
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local LocalizationModule = require(Parent.Localization)
local ReactModule = require(Parent.React)
local ResponsiveModule = require(Parent.Responsive)
local FFlagBuildExperienceModelPickerModule = require(BuildExperience.Flags.FFlagBuildExperienceModelPicker)
local FFlagBuildExperienceModelPickerChipHashModule = require(BuildExperience.Flags.FFlagBuildExperienceModelPickerChipHash)
local CreatorAgentChatModule = if FFlagBuildExperienceModelPickerModule then require(Parent.DataHydration.CreatorAgentChat) else nil
local IsEnabled = FFlagBuildExperienceModelPickerModule and CreatorAgentChatModule.experimentOverride.isEnabled()
local SignalsModule = if IsEnabled then require(Parent.Signals) else nil
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local UseClosableFocusRootModule = require(BuildExperience.utils.useClosableFocusRoot)
local _ = require(script.Parent.ModelPickerTypes)
local _ = require(script.Parent.ModelPickerView)

return function(Frame)
	-- upvalues: IsEnabled (copy), LocalizationModule (copy), LocalizationStringsModule (copy), ReactModule (copy), SignalsModule (copy), CreatorAgentChatModule (copy), FFlagBuildExperienceModelPickerModule (copy), UserInputService (copy), UseClosableFocusRootModule (copy), FocusNavigationUtilsModule (copy), ResponsiveModule (copy), FFlagBuildExperienceModelPickerChipHashModule (copy)
	local InternalTesting = if IsEnabled then Frame.internalTesting else nil
	local UseLocalizationResult = LocalizationModule.Hooks.useLocalization({
		title = LocalizationStringsModule.MODEL_PICKER_TITLE,
		unavailable = LocalizationStringsModule.MODEL_PICKER_UNAVAILABLE,
		defaultLabel = LocalizationStringsModule.MODEL_PICKER_DEFAULT_LABEL,
		defaultDescription = LocalizationStringsModule.MODEL_PICKER_DEFAULT_DESCRIPTION,
		advancedLabel = LocalizationStringsModule.MODEL_PICKER_ADVANCED_LABEL,
		advancedDescription = LocalizationStringsModule.MODEL_PICKER_ADVANCED_DESCRIPTION,
		internalLabel = if InternalTesting then LocalizationStringsModule.MODEL_PICKER_INTERNAL_LABEL else nil,
		internalDescription = if InternalTesting then LocalizationStringsModule.MODEL_PICKER_INTERNAL_DESCRIPTION else nil,
		internalSpecLabel = if InternalTesting then LocalizationStringsModule.MODEL_PICKER_INTERNAL_SPEC_LABEL else nil,
		internalSpecPlaceholder = if InternalTesting then LocalizationStringsModule.MODEL_PICKER_INTERNAL_SPEC_PLACEHOLDER else nil,
		internalSpecHint = if InternalTesting then LocalizationStringsModule.MODEL_PICKER_INTERNAL_SPEC_HINT else nil
	})
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local IsSelected = InternalTesting ~= nil and InternalTesting.isSelected
	local IsPicker = UseStateResult == "picker"
	local IsSelected1 = UseStateResult == "spec" and IsSelected
	
	if IsEnabled then
		ReactModule.useEffect(function()
			-- upvalues: IsPicker (copy), SignalsModule (upval), CreatorAgentChatModule (upval)
			return if IsPicker then SignalsModule.createEffect(function(p1)
				-- upvalues: CreatorAgentChatModule (upval)
				CreatorAgentChatModule.PreviewSpecs.getPreviewSpecsStore(false).getAndFetchPreviewSpecs(p1)
			end) else nil
		end, { IsPicker })
	end
	if FFlagBuildExperienceModelPickerModule then
		ReactModule.useEffect(function()
			-- upvalues: UseStateResult (copy), Frame (copy), IsSelected (copy), UseStateResult2 (copy)
			if UseStateResult ~= nil and (Frame.isDisabled or UseStateResult == "spec" and not IsSelected) then
				UseStateResult2(nil)
			end
		end, { UseStateResult, IsSelected, Frame.isDisabled })
	end
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: IsPicker (copy), Frame (copy), InternalTesting (copy)
		if IsPicker and not Frame.isDisabled and InternalTesting then
			InternalTesting.onSelect()
		end
	end, { IsPicker, Frame.isDisabled, InternalTesting })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: IsPicker (copy), IsSelected (copy), Frame (copy), InternalTesting (copy), UseStateResult2 (copy)
		if IsPicker and IsSelected and not Frame.isDisabled and InternalTesting then
			UseStateResult2("spec")
		end
	end, { IsPicker, IsSelected, Frame.isDisabled, InternalTesting })
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: IsPicker (copy), IsSelected (copy), Frame (copy), InternalTesting (copy)
		if IsPicker and IsSelected and not Frame.isDisabled and InternalTesting and InternalTesting.previewHash ~= nil and InternalTesting.previewHash ~= "" then
			InternalTesting.onSaveSpec(nil)
		end
	end, { IsPicker, IsSelected, Frame.isDisabled, InternalTesting })
	local UseResult3 = ReactModule.useCallback(function(p1)
		-- upvalues: IsSelected1 (copy), Frame (copy), InternalTesting (copy)
		if IsSelected1 and not Frame.isDisabled and InternalTesting then
			InternalTesting.onSaveSpec(p1)
		end
	end, { IsSelected1, Frame.isDisabled, InternalTesting })
	local UseResult4 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2("picker")
	end, {})
	local UseResult5 = ReactModule.useCallback(function()
		-- upvalues: Frame (copy), FFlagBuildExperienceModelPickerModule (upval), UserInputService (upval), UseStateResult2 (copy)
		if not Frame.isDisabled then
			if FFlagBuildExperienceModelPickerModule then
				local FocusedTextBox = UserInputService:GetFocusedTextBox()
				
				if FocusedTextBox then
					FocusedTextBox:ReleaseFocus()
				end
			end
			UseStateResult2("picker")
		end
	end, { Frame.isDisabled })
	local UseResult6 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(nil)
	end, {})
	local UseResult7 = ReactModule.useCallback(function(Id)
		-- upvalues: IsPicker (copy), Frame (copy), UseStateResult2 (copy)
		if not IsPicker or Frame.isDisabled then return end
		for _, option in Frame.data.options do
			if option.id == Id and option.isAvailable then
				UseStateResult2(nil)
				Frame.onSelect(Id)
				break
			end
		end
	end, { IsPicker, Frame.isDisabled, Frame.data, Frame.onSelect })
	local UseClosableFocusRootModuleResult = UseClosableFocusRootModule({
		surfaceIdentifier = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum.PopUp,
		isOpen = IsPicker or IsSelected1,
		onClose = if IsSelected1 then UseResult4 else UseResult6
	})
	local UsePreferredInputResult = ResponsiveModule.usePreferredInput()
	local Options = {}
	
	for _, option in Frame.data.options do
		local AdvancedLabel = UseLocalizationResult.unavailable
		local AdvancedDescription = nil
		
		if option.model == "Default" then
			AdvancedLabel = UseLocalizationResult.defaultLabel
			AdvancedDescription = UseLocalizationResult.defaultDescription
		elseif option.model == "Advanced" then
			AdvancedLabel = UseLocalizationResult.advancedLabel
			AdvancedDescription = UseLocalizationResult.advancedDescription
		end
		table.insert(Options, {
			id = option.id,
			model = option.model,
			isAvailable = option.isAvailable,
			label = AdvancedLabel,
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
	if FFlagBuildExperienceModelPickerChipHashModule and IsSelected and InternalTesting then
		Title = if InternalTesting.previewHash == "" then UseLocalizationResult.internalLabel else InternalTesting.previewHash or UseLocalizationResult.internalLabel
	elseif IsSelected then
		Title = UseLocalizationResult.internalLabel
	end
	return {
		internalTesting = if InternalTesting then {
			isSelected = IsSelected,
			previewHash = InternalTesting.previewHash,
			onSelect = UseResult,
			onSaveSpec = UseResult3,
			onOpenSpec = UseResult1,
			onClearSpec = UseResult2,
			label = UseLocalizationResult.internalLabel,
			description = UseLocalizationResult.internalDescription,
			specLabel = UseLocalizationResult.internalSpecLabel,
			placeholder = UseLocalizationResult.internalSpecPlaceholder,
			hint = UseLocalizationResult.internalSpecHint
		} else nil,
		isSpecOpen = IsSelected1,
		onCloseSpec = UseResult4,
		data = { options = Options },
		selectedId = Frame.selectedId,
		isDisabled = Frame.isDisabled,
		LayoutOrder = Frame.LayoutOrder,
		label = Title,
		title = UseLocalizationResult.title,
		unavailableText = UseLocalizationResult.unavailable,
		isOpen = IsPicker,
		onOpen = UseResult5,
		onClose = UseResult6,
		onSelect = UseResult7,
		focusRootRef = UseClosableFocusRootModuleResult,
		hasCloseAffordance = UsePreferredInputResult ~= ResponsiveModule.Input.Directional
	}
end