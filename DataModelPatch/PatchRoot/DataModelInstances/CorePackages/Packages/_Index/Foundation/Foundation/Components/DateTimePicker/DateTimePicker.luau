local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local ReactModule = require(Parent.React)
local Icon = require(Parent.BuilderIcons).Icon
local CalendarModule = require(script.Parent.Calendar)
local DateTimeUtilitiesModule = require(script.Parent.DateTimeUtilities)
local ButtonModule = require(Foundation.Components.Button)
local ButtonVariantModule = require(Foundation.Enums.ButtonVariant)
local GuiService = require(Foundation.Utility.Wrappers.Services).GuiService
local InputSizeModule = require(Foundation.Enums.InputSize)
local PopoverModule = require(Foundation.Components.Popover)
local PopoverSideModule = require(Foundation.Enums.PopoverSide)
local TextInputModule = require(Foundation.Components.TextInput)
local TranslatorModule = require(Foundation.Utility.Localization.Translator)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local DateTimePickerVariantModule = require(Foundation.Enums.DateTimePickerVariant)
local config = {
	testId = "--foundation-date-time-picker",
	variant = DateTimePickerVariantModule.Single
}

return ReactModule.memo(function(p1)
	-- upvalues: WithDefaultsModule (copy), config (copy), UseTokensModule (copy), ReactModule (copy), DateTimePickerVariantModule (copy), DateTimeUtilitiesModule (copy), GuiService (copy), PopoverModule (copy), TextInputModule (copy), WithCommonPropsModule (copy), Icon (copy), TranslatorModule (copy), InputSizeModule (copy), PopoverSideModule (copy), ViewModule (copy), CalendarModule (copy), ButtonModule (copy), ButtonVariantModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseTokensModuleResult = UseTokensModule()
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseRefResult = ReactModule.useRef(nil)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: WithDefaultsModuleResult (copy)
		local DefaultDates = WithDefaultsModuleResult.defaultDates
		
		return if DefaultDates then if typeof(DefaultDates) == "table" then DefaultDates else { DefaultDates } else nil
	end, { WithDefaultsModuleResult.defaultDates })
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(if UseMemoResult then if WithDefaultsModuleResult.variant == DateTimePickerVariantModule.Dual then `{DateTimeUtilitiesModule.formatLocalTime(UseMemoResult[1])} - {if UseMemoResult[2] then DateTimeUtilitiesModule.formatLocalTime(UseMemoResult[2]) else ""}` else DateTimeUtilitiesModule.formatLocalTime(UseMemoResult[1], WithDefaultsModuleResult.variant == DateTimePickerVariantModule.SingleWithTime) else "")
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(UseMemoResult)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(false)
	end, {})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(true)
	end, {})
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: WithDefaultsModuleResult (copy), DateTimePickerVariantModule (upval), DateTimeUtilitiesModule (upval), UseStateResult3 (copy), UseStateResult2_1 (copy), UseResult (copy)
		if WithDefaultsModuleResult.variant == DateTimePickerVariantModule.Dual then
			UseStateResult2_1(DateTimeUtilitiesModule.formatLocalTime(UseStateResult3[1]) .. " - " .. (if UseStateResult3[2] then DateTimeUtilitiesModule.formatLocalTime(UseStateResult3[2]) else ""))
		else
			UseStateResult2_1(DateTimeUtilitiesModule.formatLocalTime(UseStateResult3[1], WithDefaultsModuleResult.variant == DateTimePickerVariantModule.SingleWithTime))
		end
		UseResult()
	end, { UseStateResult3, UseResult })
	
	local function _(): boolean
		-- upvalues: UseStateResult3 (copy), WithDefaultsModuleResult (copy), DateTimePickerVariantModule (upval)
		return if UseStateResult3 then if WithDefaultsModuleResult.variant == DateTimePickerVariantModule.Single or WithDefaultsModuleResult.variant == DateTimePickerVariantModule.SingleWithTime then UseStateResult3[1] == nil else WithDefaultsModuleResult.variant == DateTimePickerVariantModule.Dual and (UseStateResult3[1] == nil or (UseStateResult3[2] == nil or UseStateResult3[2].UnixTimestamp < UseStateResult3[1].UnixTimestamp)) else false
	end
	
	return ReactModule.createElement(PopoverModule.Root, {
		isOpen = UseStateResult,
		testId = WithDefaultsModuleResult.testId
	}, {
		DateInput = ReactModule.createElement(TextInputModule, WithCommonPropsModule(WithDefaultsModuleResult, {
			key = "date-input",
			hasError = WithDefaultsModuleResult.hasError,
			hint = WithDefaultsModuleResult.hint,
			iconTrailing = { name = Icon.Calendar, onActivated = UseResult1 },
			isDisabled = WithDefaultsModuleResult.isDisabled,
			isRequired = WithDefaultsModuleResult.isRequired,
			label = WithDefaultsModuleResult.label,
			onChanged = ReactModule.useCallback(function(Text: string)
				-- upvalues: UseStateResult2_1 (copy), WithDefaultsModuleResult (copy), DateTimePickerVariantModule (upval), DateTimeUtilitiesModule (upval)
				UseStateResult2_1(Text)
				
				if Text:match("^%s*$") then return end
				if WithDefaultsModuleResult.variant == DateTimePickerVariantModule.Dual then
					local v1 = Text:split("-")
					WithDefaultsModuleResult.onChanged(DateTimeUtilitiesModule.getDateTimeFromText(v1[1]), (DateTimeUtilitiesModule.getDateTimeFromText(v1[2])))
					
					return
				else
					WithDefaultsModuleResult.onChanged((DateTimeUtilitiesModule.getDateTimeFromText(Text:match("^%s*(.-)%s*$") or "")))
				end
			end, { WithDefaultsModuleResult.onChanged }),
			onFocusGained = ReactModule.useCallback(function()
				-- upvalues: GuiService (upval), UseResult1 (copy)
				if GuiService.ViewportDisplaySize ~= Enum.DisplaySize.Small then
					UseResult1()
				end
			end, { UseResult1, GuiService.ViewportDisplaySize }),
			placeholder = TranslatorModule:FormatByKey("CommonUI.Controls.Label.SelectDate"),
			ref = UseRefResult,
			selectableDateRange = WithDefaultsModuleResult.selectableDateRange,
			size = InputSizeModule.Medium,
			text = UseStateResult1,
			testId = `{WithDefaultsModuleResult.testId}--text-input`,
			width = WithDefaultsModuleResult.width
		})),
		Anchor = ReactModule.createElement(PopoverModule.Anchor, { anchorRef = UseRefResult }),
		Calendar = ReactModule.createElement(PopoverModule.Content, {
			hasArrow = false,
			onPressedOutside = UseResult,
			side = {
				position = PopoverSideModule.Bottom,
				offset = UseTokensModuleResult.Stroke.Standard + UseTokensModuleResult.Padding.Small
			},
			selection = WithDefaultsModuleResult.selection,
			selectionGroup = WithDefaultsModuleResult.selectionGroup
		}, UseStateResult and ReactModule.createElement(ViewModule, {
			tag = "col auto-xy padding-large stroke-default radius-medium"
		}, {
			Calendar = ReactModule.createElement(CalendarModule, {
				LayoutOrder = 1,
				testId = "--foundation-calendar",
				defaultDates = UseStateResult3,
				onSelectedDateChanged = UseStateResult2_2,
				selectableDateRange = WithDefaultsModuleResult.selectableDateRange,
				showStartDateTimeCalendarInput = WithDefaultsModuleResult.variant ~= DateTimePickerVariantModule.SingleWithTime,
				showEndDateTimeCalendarInput = WithDefaultsModuleResult.variant == DateTimePickerVariantModule.Dual,
				showTimeDropdown = WithDefaultsModuleResult.variant == DateTimePickerVariantModule.SingleWithTime
			}),
			BottomBar = ReactModule.createElement(ViewModule, {
				LayoutOrder = 2,
				tag = "row flex-fill gap-small size-full-0 auto-y padding-top-large"
			}, {
				ApplyButton = ReactModule.createElement(ButtonModule, {
					isDisabled = if UseStateResult3 then if WithDefaultsModuleResult.variant == DateTimePickerVariantModule.Single or WithDefaultsModuleResult.variant == DateTimePickerVariantModule.SingleWithTime then UseStateResult3[1] == nil else WithDefaultsModuleResult.variant == DateTimePickerVariantModule.Dual and (UseStateResult3[1] == nil or (UseStateResult3[2] == nil or UseStateResult3[2].UnixTimestamp < UseStateResult3[1].UnixTimestamp)) else false,
					onActivated = UseResult2,
					text = TranslatorModule:FormatByKey("CommonUI.Controls.Action.Apply"),
					variant = ButtonVariantModule.Emphasis,
					testId = `{WithDefaultsModuleResult.testId}--apply-button`
				}),
				CancelButton = ReactModule.createElement(ButtonModule, {
					onActivated = UseResult,
					text = TranslatorModule:FormatByKey("CommonUI.Controls.Action.Cancel"),
					variant = ButtonVariantModule.Standard,
					testId = `{WithDefaultsModuleResult.testId}--cancel-button`
				})
			})
		}))
	})
end)