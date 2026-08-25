local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local reactModule = require(parent.React)
local icon = require(parent.BuilderIcons).Icon
local calendarModule = require(script.Parent.Calendar.Calendar)
local dateTimeParsingUtilitiesModule = require(script.Parent.Utilities.DateTimeParsingUtilities)
local dateTimePickerBetaModule = require(script.Parent.DateTimePickerBeta)
local _ = require(script.Parent.DateTimePickerProps)
local dateTimeUtilitiesModule = require(script.Parent.DateTimeUtilities)
local buttonModule = require(foundation.Components.Button)
local buttonVariantModule = require(foundation.Enums.ButtonVariant)
local dateTimePickerVariantModule = require(foundation.Enums.DateTimePickerVariant)
local flagsModule = require(foundation.Utility.Flags)
local guiService = require(foundation.Utility.Wrappers.Services).GuiService
local inputSizeModule = require(foundation.Enums.InputSize)
local popoverModule = require(foundation.Components.Popover)
local popoverSideModule = require(foundation.Enums.PopoverSide)
local textInputModule = require(foundation.Components.TextInput)
local translatorModule = require(foundation.Utility.Localization.Translator)
local viewModule = require(foundation.Components.View)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local t = {
	testId = "--foundation-date-time-picker",
	variant = dateTimePickerVariantModule.Single
}

return reactModule.memo(function(p0)
	-- upvalues: flagsModule (ref), reactModule (ref), dateTimePickerBetaModule (ref), withDefaultsModule (ref), t (ref), useTokensModule (ref), dateTimePickerVariantModule (ref), dateTimeUtilitiesModule (ref), guiService (ref), dateTimeParsingUtilitiesModule (ref), popoverModule (ref), textInputModule (ref), withCommonPropsModule (ref), icon (ref), translatorModule (ref), inputSizeModule (ref), popoverSideModule (ref), viewModule (ref), calendarModule (ref), buttonModule (ref), buttonVariantModule (ref)
	if flagsModule.FoundationDateTimePickerBetaUpdate then
		return reactModule.createElement(dateTimePickerBetaModule, p0)
	end
	local var20 = withDefaultsModule(p0, t)
	local var21 = useTokensModule()
	local var22, var23 = reactModule.useState(false)
	local var24 = reactModule.useRef(nil)
	local var25 = reactModule.useMemo(function()
		-- upvalues: var20 (ref)
		local defaultDates = var20.defaultDates
		
		return if defaultDates then if typeof(defaultDates) == "table" then defaultDates else { defaultDates } else nil
	end, { var20.defaultDates })
	local var26, var27 = reactModule.useState(if var25 then if var20.variant == dateTimePickerVariantModule.Dual then `{dateTimeUtilitiesModule.formatLocalTime(var25[1])} - {if var25[2] then dateTimeUtilitiesModule.formatLocalTime(var25[2]) else ""}` else dateTimeUtilitiesModule.formatLocalTime(var25[1], var20.variant == dateTimePickerVariantModule.SingleWithTime) else "")
	local var28, var29 = reactModule.useState(var25)
	local var30 = reactModule.useCallback(function()
		-- upvalues: var23 (ref)
		var23(false)
	end, {})
	local var31 = reactModule.useCallback(function()
		-- upvalues: var23 (ref)
		var23(true)
	end, {})
	local var32 = reactModule.useCallback(function()
		-- upvalues: guiService (copy), var31 (ref)
		if guiService.ViewportDisplaySize ~= Enum.DisplaySize.Small then
			var31()
		end
	end, { var31, guiService.ViewportDisplaySize })
	local var33 = reactModule.useCallback(function(p1)
		-- upvalues: var27 (ref), var20 (ref), dateTimePickerVariantModule (copy), dateTimeUtilitiesModule (copy), dateTimeParsingUtilitiesModule (copy)
		var27(p1)
		
		if p1:match("^%s*$") then return end
		if var20.variant == dateTimePickerVariantModule.Dual then
			local var47 = p1:split("-")
			var20.onChanged(dateTimeUtilitiesModule.getDateTimeFromText(var47[1]), dateTimeUtilitiesModule.getDateTimeFromText(var47[2]))
			
			return
		end
		var20.onChanged(dateTimeUtilitiesModule.getDateTimeFromText(dateTimeParsingUtilitiesModule.trimInputText(p1)))
	end, { var20.onChanged, var20.variant })
	local var34 = reactModule.useCallback(function()
		-- upvalues: var20 (ref), dateTimePickerVariantModule (copy), dateTimeUtilitiesModule (copy), var28 (ref), var27 (ref), var30 (ref)
		if var20.variant == dateTimePickerVariantModule.Dual then
			var27(dateTimeUtilitiesModule.formatLocalTime(var28[1]) .. " - " .. (if var28[2] then dateTimeUtilitiesModule.formatLocalTime(var28[2]) else ""))
		else
			var27(dateTimeUtilitiesModule.formatLocalTime(var28[1], var20.variant == dateTimePickerVariantModule.SingleWithTime))
		end
		var30()
	end, { var28, var30, var20.variant })
	
	local _ = function()
		-- upvalues: var28 (ref), var20 (ref), dateTimePickerVariantModule (copy)
		return if var28 then if var20.variant == dateTimePickerVariantModule.Single or var20.variant == dateTimePickerVariantModule.SingleWithTime then var28[1] == nil else var20.variant == dateTimePickerVariantModule.Dual and (if var28[1] ~= nil then if var28[2] ~= nil then var28[2].UnixTimestamp < var28[1].UnixTimestamp else true else true) else false
	end
	
	local createElement = reactModule.createElement
	local root = popoverModule.Root
	local t_1 = { isOpen = var22, testId = var20.testId }
	local t_2 = {
		DateInput = reactModule.createElement(textInputModule, withCommonPropsModule(var20, {
			key = "date-input",
			hasError = var20.hasError,
			hint = var20.hint,
			iconTrailing = { name = icon.Calendar, onActivated = var31 },
			isDisabled = var20.isDisabled,
			isRequired = var20.isRequired,
			label = var20.label,
			onChanged = var33,
			onFocusGained = var32,
			placeholder = translatorModule:FormatByKey("CommonUI.Controls.Label.SelectDate"),
			ref = var24,
			selectableDateRange = var20.selectableDateRange,
			size = inputSizeModule.Medium,
			text = var26,
			testId = `{var20.testId}--text-input`,
			width = var20.width
		})),
		Anchor = reactModule.createElement(popoverModule.Anchor, { anchorRef = var24 })
	}
	local createElement_1 = reactModule.createElement
	local content = popoverModule.Content
	local t_3 = {
		hasArrow = false,
		onPressedOutside = var30,
		side = {
			position = popoverSideModule.Bottom,
			offset = var21.Stroke.Standard + var21.Padding.Small
		},
		selection = var20.selection,
		selectionGroup = var20.selectionGroup
	}
	local var38 = var22
	
	if var38 then
		local var46
		var38 = reactModule.createElement
		local var39 = viewModule
		local t_4 = {
			tag = "col auto-xy padding-large stroke-default radius-medium"
		}
		local t_5 = {
			Calendar = reactModule.createElement(calendarModule, {
				LayoutOrder = 1,
				testId = "--foundation-calendar",
				defaultDates = var28,
				onSelectedDateChanged = var29,
				selectableDateRange = var20.selectableDateRange,
				showStartDateTimeCalendarInput = var20.variant ~= dateTimePickerVariantModule.SingleWithTime,
				showEndDateTimeCalendarInput = var20.variant == dateTimePickerVariantModule.Dual,
				showTimeDropdown = var20.variant == dateTimePickerVariantModule.SingleWithTime
			})
		}
		local createElement_2 = reactModule.createElement
		local var42 = viewModule
		local t_6 = {
			LayoutOrder = 2,
			tag = "row flex-fill gap-small size-full-0 auto-y padding-top-large"
		}
		local t_7 = {}
		local createElement_3 = reactModule.createElement
		local t_8 = {}
		
		if not var28 then
			var46 = false
		elseif var20.variant == dateTimePickerVariantModule.Single or var20.variant == dateTimePickerVariantModule.SingleWithTime then
			local _ = var28[1] == nil
		elseif var20.variant == dateTimePickerVariantModule.Dual then
			var46 = true
			
			if var28[1] ~= nil then
				var46 = true
				
				if var28[2] ~= nil then
					local _ = var28[2].UnixTimestamp < var28[1].UnixTimestamp
				end
			end
		else
			var46 = false
		end
		t_8.isDisabled = var46
		t_8.onActivated = var34
		t_8.text = translatorModule:FormatByKey("CommonUI.Controls.Action.Apply")
		t_8.variant = buttonVariantModule.Emphasis
		t_8.testId = `{var20.testId}--apply-button`
		t_7.ApplyButton = createElement_3(buttonModule, t_8)
		t_7.CancelButton = reactModule.createElement(buttonModule, {
			onActivated = var30,
			text = translatorModule:FormatByKey("CommonUI.Controls.Action.Cancel"),
			variant = buttonVariantModule.Standard,
			testId = `{var20.testId}--cancel-button`
		})
		t_5.BottomBar = createElement_2(var42, t_6, t_7)
		var38 = var38(var39, t_4, t_5)
	end
	t_2.Calendar = createElement_1(content, t_3, var38)
	
	return createElement(root, t_1, t_2)
end)