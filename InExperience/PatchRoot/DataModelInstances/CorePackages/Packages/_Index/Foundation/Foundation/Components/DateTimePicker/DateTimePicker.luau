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

return reactModule.memo(function(p1)
	-- upvalues: flagsModule (ref), reactModule (ref), dateTimePickerBetaModule (ref), withDefaultsModule (ref), t (ref), useTokensModule (ref), dateTimePickerVariantModule (ref), dateTimeUtilitiesModule (ref), guiService (ref), dateTimeParsingUtilitiesModule (ref), popoverModule (ref), textInputModule (ref), withCommonPropsModule (ref), icon (ref), translatorModule (ref), inputSizeModule (ref), popoverSideModule (ref), viewModule (ref), calendarModule (ref), buttonModule (ref), buttonVariantModule (ref)
	if flagsModule.FoundationDateTimePickerBetaUpdate then
		return reactModule.createElement(dateTimePickerBetaModule, p1)
	end
	local var1 = withDefaultsModule(p1, t)
	local var2 = useTokensModule()
	local var3, var4 = reactModule.useState(false)
	local var5 = reactModule.useRef(nil)
	local var6 = reactModule.useMemo(function()
		-- upvalues: var1 (ref)
		local defaultDates = var1.defaultDates
		
		return if defaultDates then if typeof(defaultDates) == "table" then defaultDates else { defaultDates } else nil
	end, { var1.defaultDates })
	local var7, var8 = reactModule.useState(if var6 then if var1.variant == dateTimePickerVariantModule.Dual then `{dateTimeUtilitiesModule.formatLocalTime(var6[1])} - {if var6[2] then dateTimeUtilitiesModule.formatLocalTime(var6[2]) else ""}` else dateTimeUtilitiesModule.formatLocalTime(var6[1], var1.variant == dateTimePickerVariantModule.SingleWithTime) else "")
	local var9, var10 = reactModule.useState(var6)
	local var11 = reactModule.useCallback(function()
		-- upvalues: var4 (ref)
		var4(false)
	end, {})
	local var12 = reactModule.useCallback(function()
		-- upvalues: var4 (ref)
		var4(true)
	end, {})
	local var13 = reactModule.useCallback(function()
		-- upvalues: guiService (copy), var12 (ref)
		if guiService.ViewportDisplaySize ~= Enum.DisplaySize.Small then
			var12()
		end
	end, { var12, guiService.ViewportDisplaySize })
	local var14 = reactModule.useCallback(function(p2)
		-- upvalues: var8 (ref), var1 (ref), dateTimePickerVariantModule (copy), dateTimeUtilitiesModule (copy), dateTimeParsingUtilitiesModule (copy)
		var8(p2)
		
		if p2:match("^%s*$") then return end
		if var1.variant == dateTimePickerVariantModule.Dual then
			local var15 = p2:split("-")
			var1.onChanged(dateTimeUtilitiesModule.getDateTimeFromText(var15[1]), dateTimeUtilitiesModule.getDateTimeFromText(var15[2]))
			
			return
		end
		var1.onChanged(dateTimeUtilitiesModule.getDateTimeFromText(dateTimeParsingUtilitiesModule.trimInputText(p2)))
	end, { var1.onChanged, var1.variant })
	local var15 = reactModule.useCallback(function()
		-- upvalues: var1 (ref), dateTimePickerVariantModule (copy), dateTimeUtilitiesModule (copy), var9 (ref), var8 (ref), var11 (ref)
		if var1.variant == dateTimePickerVariantModule.Dual then
			var8(dateTimeUtilitiesModule.formatLocalTime(var9[1]) .. " - " .. (if var9[2] then dateTimeUtilitiesModule.formatLocalTime(var9[2]) else ""))
		else
			var8(dateTimeUtilitiesModule.formatLocalTime(var9[1], var1.variant == dateTimePickerVariantModule.SingleWithTime))
		end
		var11()
	end, { var9, var11, var1.variant })
	
	local _ = function()
		-- upvalues: var9 (ref), var1 (ref), dateTimePickerVariantModule (copy)
		return if var9 then if var1.variant == dateTimePickerVariantModule.Single or var1.variant == dateTimePickerVariantModule.SingleWithTime then var9[1] == nil else var1.variant == dateTimePickerVariantModule.Dual and (if var9[1] ~= nil then if var9[2] ~= nil then var9[2].UnixTimestamp < var9[1].UnixTimestamp else true else true) else false
	end
	
	local createElement = reactModule.createElement
	local root = popoverModule.Root
	local t_1 = { isOpen = var3, testId = var1.testId }
	local t_2 = {
		DateInput = reactModule.createElement(textInputModule, withCommonPropsModule(var1, {
			key = "date-input",
			hasError = var1.hasError,
			hint = var1.hint,
			iconTrailing = { name = icon.Calendar, onActivated = var12 },
			isDisabled = var1.isDisabled,
			isRequired = var1.isRequired,
			label = var1.label,
			onChanged = var14,
			onFocusGained = var13,
			placeholder = translatorModule:FormatByKey("CommonUI.Controls.Label.SelectDate"),
			ref = var5,
			selectableDateRange = var1.selectableDateRange,
			size = inputSizeModule.Medium,
			text = var7,
			testId = `{var1.testId}--text-input`,
			width = var1.width
		})),
		Anchor = reactModule.createElement(popoverModule.Anchor, { anchorRef = var5 })
	}
	local createElement_1 = reactModule.createElement
	local content = popoverModule.Content
	local t_3 = {
		hasArrow = false,
		onPressedOutside = var11,
		side = {
			position = popoverSideModule.Bottom,
			offset = var2.Stroke.Standard + var2.Padding.Small
		},
		selection = var1.selection,
		selectionGroup = var1.selectionGroup
	}
	local var16 = var3
	
	if var16 then
		local var17
		var16 = reactModule.createElement
		local var18 = viewModule
		local t_4 = {
			tag = "col auto-xy padding-large stroke-default radius-medium"
		}
		local t_5 = {
			Calendar = reactModule.createElement(calendarModule, {
				LayoutOrder = 1,
				testId = "--foundation-calendar",
				defaultDates = var9,
				onSelectedDateChanged = var10,
				selectableDateRange = var1.selectableDateRange,
				showStartDateTimeCalendarInput = var1.variant ~= dateTimePickerVariantModule.SingleWithTime,
				showEndDateTimeCalendarInput = var1.variant == dateTimePickerVariantModule.Dual,
				showTimeDropdown = var1.variant == dateTimePickerVariantModule.SingleWithTime
			})
		}
		local createElement_2 = reactModule.createElement
		local var19 = viewModule
		local t_6 = {
			LayoutOrder = 2,
			tag = "row flex-fill gap-small size-full-0 auto-y padding-top-large"
		}
		local t_7 = {}
		local createElement_3 = reactModule.createElement
		local t_8 = {}
		
		if not var9 then
			var17 = false
		elseif var1.variant == dateTimePickerVariantModule.Single or var1.variant == dateTimePickerVariantModule.SingleWithTime then
			local _ = var9[1] == nil
		elseif var1.variant == dateTimePickerVariantModule.Dual then
			var17 = true
			
			if var9[1] ~= nil then
				var17 = true
				
				if var9[2] ~= nil then
					local _ = var9[2].UnixTimestamp < var9[1].UnixTimestamp
				end
			end
		else
			var17 = false
		end
		t_8.isDisabled = var17
		t_8.onActivated = var15
		t_8.text = translatorModule:FormatByKey("CommonUI.Controls.Action.Apply")
		t_8.variant = buttonVariantModule.Emphasis
		t_8.testId = `{var1.testId}--apply-button`
		t_7.ApplyButton = createElement_3(buttonModule, t_8)
		t_7.CancelButton = reactModule.createElement(buttonModule, {
			onActivated = var11,
			text = translatorModule:FormatByKey("CommonUI.Controls.Action.Cancel"),
			variant = buttonVariantModule.Standard,
			testId = `{var1.testId}--cancel-button`
		})
		t_5.BottomBar = createElement_2(var19, t_6, t_7)
		var16 = var16(var18, t_4, t_5)
	end
	t_2.Calendar = createElement_1(content, t_3, var16)
	
	return createElement(root, t_1, t_2)
end)