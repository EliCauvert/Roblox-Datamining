local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local DateTimeUtilitiesModule = require(Foundation.Components.DateTimePicker.DateTimeUtilities)
local DropdownModule = require(Foundation.Components.Dropdown)
local InputSizeModule = require(Foundation.Enums.InputSize)
local LocalizationService = require(Foundation.Utility.Wrappers).Services.LocalizationService
local TranslatorModule = require(Foundation.Utility.Localization.Translator)
local UseScaledValueModule = require(Foundation.Utility.useScaledValue)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local config = {
	testId = "--foundation-time-dropdown",
	dateTime = DateTime.fromLocalTime(2000, 1, 1, 0, 0, 0)
}

return function(p1)
	-- upvalues: WithDefaultsModule (copy), config (copy), DateTimeUtilitiesModule (copy), UseScaledValueModule (copy), LocalizationService (copy), ReactModule (copy), DropdownModule (copy), TranslatorModule (copy), InputSizeModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local RoundDownToNearestMinuteResult = DateTimeUtilitiesModule.roundDownToNearestMinute(WithDefaultsModuleResult.dateTime)
	local LocalTime = RoundDownToNearestMinuteResult:ToLocalTime()
	
	return ReactModule.createElement(DropdownModule.Root, {
		label = "",
		items = (function()
			-- upvalues: LocalTime (copy), RoundDownToNearestMinuteResult (copy), DateTimeUtilitiesModule (upval), LocalizationService (upval)
			local List = {}
			local IsNotMinuteMatch = LocalTime.Minute % 30 ~= 0
			for i = 0, 47 do
				local _DateTime = DateTime.fromLocalTime(LocalTime.Year, LocalTime.Month, LocalTime.Day, math.floor(i / 2), i % 2 * 30, LocalTime.Second)
				
				if IsNotMinuteMatch and RoundDownToNearestMinuteResult.UnixTimestamp < _DateTime.UnixTimestamp then
					table.insert(List, {
						icon = nil,
						isChecked = true,
						isDisabled = true,
						id = RoundDownToNearestMinuteResult.UnixTimestamp,
						text = RoundDownToNearestMinuteResult:FormatLocalTime(DateTimeUtilitiesModule.TIME_COMPOSITE_TOKEN, LocalizationService.RobloxLocaleId)
					})
					IsNotMinuteMatch = false
				end
				table.insert(List, {
					icon = nil,
					id = _DateTime.UnixTimestamp,
					isChecked = _DateTime.UnixTimestamp == RoundDownToNearestMinuteResult.UnixTimestamp,
					isDisabled = _DateTime.UnixTimestamp == RoundDownToNearestMinuteResult.UnixTimestamp,
					text = _DateTime:FormatLocalTime(DateTimeUtilitiesModule.TIME_COMPOSITE_TOKEN, LocalizationService.RobloxLocaleId)
				})
			end
			return List
		end)(),
		LayoutOrder = WithDefaultsModuleResult.layoutOrder,
		maxHeight = UseScaledValueModule(200),
		onItemChanged = WithDefaultsModuleResult.onItemChanged,
		placeholder = TranslatorModule:FormatByKey("CommonUI.Controls.Label.SelectTheTime"),
		size = InputSizeModule.Medium,
		testId = WithDefaultsModuleResult.testId,
		width = WithDefaultsModuleResult.width,
		value = RoundDownToNearestMinuteResult.UnixTimestamp
	})
end