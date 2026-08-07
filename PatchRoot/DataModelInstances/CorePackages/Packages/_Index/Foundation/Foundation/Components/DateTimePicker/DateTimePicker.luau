-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:48:02 2026 Pacific Standard Time.

local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local reactModule = require(parent.React)
local icon = require(parent.BuilderIcons).Icon
local calendarModule = require(script.Parent.Calendar)
local dateTimeUtilitiesModule = require(script.Parent.DateTimeUtilities)
local buttonModule = require(foundation.Components.Button)
local buttonVariantModule = require(foundation.Enums.ButtonVariant)
local guiService = require(foundation.Utility.Wrappers.Services).GuiService
local inputSizeModule = require(foundation.Enums.InputSize)
local popoverModule = require(foundation.Components.Popover)
local popoverSideModule = require(foundation.Enums.PopoverSide)
local textInputModule = require(foundation.Components.TextInput)
local translatorModule = require(foundation.Utility.Localization.Translator)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local dateTimePickerVariantModule = require(foundation.Enums.DateTimePickerVariant)
local t = {
	testId = "--foundation-date-time-picker",
	variant = dateTimePickerVariantModule.Single
}

return reactModule.memo(function(p0) --[[ line: 69 | named "DateTimePicker" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), reactModule (ref), dateTimePickerVariantModule (ref), dateTimeUtilitiesModule (ref), guiService (ref), popoverModule (ref), textInputModule (ref), withCommonPropsModule (ref), icon (ref), translatorModule (ref), inputSizeModule (ref), popoverSideModule (ref), viewModule (ref), calendarModule (ref), buttonModule (ref), buttonVariantModule (ref)
	local var17 = withDefaultsModule(p0, t)
	local var18 = useTokensModule()
	local var19, var20 = reactModule.useState(false)
	local var21 = reactModule.useRef(nil)
	local var22 = reactModule.useMemo(function() --[[ line: 76 ]]
		-- upvalues: var17 (ref)
		local defaultDates = var17.defaultDates
		
		return if defaultDates then if typeof(defaultDates) == "table" then defaultDates else { defaultDates } else nil
	end, { var17.defaultDates })
	local var23, var24 = reactModule.useState(if var22 then if var17.variant == dateTimePickerVariantModule.Dual then `{dateTimeUtilitiesModule.formatLocalTime(var22[1])} - {if var22[2] then dateTimeUtilitiesModule.formatLocalTime(var22[2]) else ""}` else dateTimeUtilitiesModule.formatLocalTime(var22[1], var17.variant == dateTimePickerVariantModule.SingleWithTime) else "")
	local var25, var26 = reactModule.useState(var22)
	local var27 = reactModule.useCallback(function() --[[ line: 105 ]]
		-- upvalues: var20 (ref)
		var20(false)
	end, {})
	local var28 = reactModule.useCallback(function() --[[ line: 109 ]]
		-- upvalues: var20 (ref)
		var20(true)
	end, {})
	local var29 = reactModule.useCallback(function() --[[ line: 113 ]]
		-- upvalues: guiService (copy), var28 (ref)
		if guiService.ViewportDisplaySize ~= Enum.DisplaySize.Small then
			var28()
		end
	end, { var28, guiService.ViewportDisplaySize })
	local var30 = reactModule.useCallback(function(p1) --[[ line: 120 ]]
		-- upvalues: var24 (ref), var17 (ref), dateTimePickerVariantModule (copy), dateTimeUtilitiesModule (copy)
		var24(p1)
		
		if p1:match("^%s*$") then return end
		if var17.variant == dateTimePickerVariantModule.Dual then
			local var44 = p1:split("-")
			var17.onChanged(dateTimeUtilitiesModule.getDateTimeFromText(var44[1]), dateTimeUtilitiesModule.getDateTimeFromText(var44[2]))
			
			return
		end
		var17.onChanged(dateTimeUtilitiesModule.getDateTimeFromText(p1:match("^%s*(.-)%s*$") or ""))
	end, { var17.onChanged })
	local var31 = reactModule.useCallback(function() --[[ line: 144 ]]
		-- upvalues: var17 (ref), dateTimePickerVariantModule (copy), dateTimeUtilitiesModule (copy), var25 (ref), var24 (ref), var27 (ref)
		if var17.variant == dateTimePickerVariantModule.Dual then
			var24(dateTimeUtilitiesModule.formatLocalTime(var25[1]) .. " - " .. (if var25[2] then dateTimeUtilitiesModule.formatLocalTime(var25[2]) else ""))
		else
			var24(dateTimeUtilitiesModule.formatLocalTime(var25[1], var17.variant == dateTimePickerVariantModule.SingleWithTime))
		end
		var27()
	end, { var25, var27 })
	
	local _ = function() --[[ line: 168 ]]
		-- upvalues: var25 (ref), var17 (ref), dateTimePickerVariantModule (copy)
		return if var25 then if var17.variant == dateTimePickerVariantModule.Single or var17.variant == dateTimePickerVariantModule.SingleWithTime then var25[1] == nil else var17.variant == dateTimePickerVariantModule.Dual and (if var25[1] ~= nil then if var25[2] ~= nil then var25[2].UnixTimestamp < var25[1].UnixTimestamp else true else true) else false
	end
	
	local createElement = reactModule.createElement
	local root = popoverModule.Root
	local t_1 = { isOpen = var19, testId = var17.testId }
	local t_2 = {
		DateInput = reactModule.createElement(textInputModule, withCommonPropsModule(var17, {
			key = "date-input",
			hasError = var17.hasError,
			hint = var17.hint,
			iconTrailing = { name = icon.Calendar, onActivated = var28 },
			isDisabled = var17.isDisabled,
			isRequired = var17.isRequired,
			label = var17.label,
			onChanged = var30,
			onFocusGained = var29,
			placeholder = translatorModule:FormatByKey("CommonUI.Controls.Label.SelectDate"),
			ref = var21,
			selectableDateRange = var17.selectableDateRange,
			size = inputSizeModule.Medium,
			text = var23,
			testId = `{var17.testId}--text-input`,
			width = var17.width
		})),
		Anchor = reactModule.createElement(popoverModule.Anchor, { anchorRef = var21 })
	}
	local createElement_1 = reactModule.createElement
	local content = popoverModule.Content
	local t_3 = {
		hasArrow = false,
		onPressedOutside = var27,
		side = {
			position = popoverSideModule.Bottom,
			offset = var18.Stroke.Standard + var18.Padding.Small
		},
		selection = var17.selection,
		selectionGroup = var17.selectionGroup
	}
	local var35 = var19
	
	if var35 then
		local var43
		var35 = reactModule.createElement
		local var36 = viewModule
		local t_4 = {
			tag = "col auto-xy padding-large stroke-default radius-medium"
		}
		local t_5 = {
			Calendar = reactModule.createElement(calendarModule, {
				LayoutOrder = 1,
				testId = "--foundation-calendar",
				defaultDates = var25,
				onSelectedDateChanged = var26,
				selectableDateRange = var17.selectableDateRange,
				showStartDateTimeCalendarInput = var17.variant ~= dateTimePickerVariantModule.SingleWithTime,
				showEndDateTimeCalendarInput = var17.variant == dateTimePickerVariantModule.Dual,
				showTimeDropdown = var17.variant == dateTimePickerVariantModule.SingleWithTime
			})
		}
		local createElement_2 = reactModule.createElement
		local var39 = viewModule
		local t_6 = {
			LayoutOrder = 2,
			tag = "row flex-fill gap-small size-full-0 auto-y padding-top-large"
		}
		local t_7 = {}
		local createElement_3 = reactModule.createElement
		local t_8 = {}
		
		if not var25 then
			var43 = false
		elseif var17.variant == dateTimePickerVariantModule.Single or var17.variant == dateTimePickerVariantModule.SingleWithTime then
			local _ = var25[1] == nil
		elseif var17.variant == dateTimePickerVariantModule.Dual then
			var43 = true
			
			if var25[1] ~= nil then
				var43 = true
				
				if var25[2] ~= nil then
					local _ = var25[2].UnixTimestamp < var25[1].UnixTimestamp
				end
			end
		else
			var43 = false
		end
		t_8.isDisabled = var43
		t_8.onActivated = var31
		t_8.text = translatorModule:FormatByKey("CommonUI.Controls.Action.Apply")
		t_8.variant = buttonVariantModule.Emphasis
		t_8.testId = `{var17.testId}--apply-button`
		t_7.ApplyButton = createElement_3(buttonModule, t_8)
		t_7.CancelButton = reactModule.createElement(buttonModule, {
			onActivated = var27,
			text = translatorModule:FormatByKey("CommonUI.Controls.Action.Cancel"),
			variant = buttonVariantModule.Standard,
			testId = `{var17.testId}--cancel-button`
		})
		t_5.BottomBar = createElement_2(var39, t_6, t_7)
		var35 = var35(var36, t_4, t_5)
	end
	t_2.Calendar = createElement_1(content, t_3, var35)
	
	return createElement(root, t_1, t_2)
end)