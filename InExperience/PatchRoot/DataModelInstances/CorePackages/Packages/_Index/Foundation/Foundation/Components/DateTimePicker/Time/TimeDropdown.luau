local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local dateTimeUtilitiesModule = require(foundation.Components.DateTimePicker.DateTimeUtilities)
local dropdownModule = require(foundation.Components.Dropdown)
local inputSizeModule = require(foundation.Enums.InputSize)
local localizationService = require(foundation.Utility.Wrappers).Services.LocalizationService
local translatorModule = require(foundation.Utility.Localization.Translator)
local useScaledValueModule = require(foundation.Utility.useScaledValue)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local t = {
	testId = "--foundation-time-dropdown",
	dateTime = DateTime.fromLocalTime(2000, 1, 1, 0, 0, 0)
}

return function(p1)
	-- upvalues: withDefaultsModule (ref), t (ref), dateTimeUtilitiesModule (ref), useScaledValueModule (ref), localizationService (ref), reactModule (ref), dropdownModule (ref), translatorModule (ref), inputSizeModule (ref)
	local var1 = withDefaultsModule(p1, t)
	local var2 = dateTimeUtilitiesModule.roundDownToNearestMinute(var1.dateTime)
	local var3 = var2:ToLocalTime()
	
	return reactModule.createElement(dropdownModule.Root, {
		label = "",
		items = (function()
			-- upvalues: var3 (ref), var2 (ref), localizationService (copy)
			local t = {}
			local var4 = var3.Minute % 30 ~= 0
			
			for i = 0, 47 do
				local dateTime = DateTime.fromLocalTime(var3.Year, var3.Month, var3.Day, math.floor(i / 2), i % 2 * 30, var3.Second)
				
				if var4 and var2.UnixTimestamp < dateTime.UnixTimestamp then
					table.insert(t, {
						icon = nil,
						isChecked = true,
						isDisabled = true,
						id = var2.UnixTimestamp,
						text = var2:FormatLocalTime("LT", localizationService.RobloxLocaleId)
					})
					var4 = false
				end
				table.insert(t, {
					icon = nil,
					id = dateTime.UnixTimestamp,
					isChecked = dateTime.UnixTimestamp == var2.UnixTimestamp,
					isDisabled = dateTime.UnixTimestamp == var2.UnixTimestamp,
					text = dateTime:FormatLocalTime("LT", localizationService.RobloxLocaleId)
				})
			end
			return t
		end)(),
		LayoutOrder = var1.LayoutOrder,
		maxHeight = useScaledValueModule(200),
		onItemChanged = var1.onItemChanged,
		placeholder = translatorModule:FormatByKey("CommonUI.Controls.Label.SelectTheTime"),
		size = inputSizeModule.Medium,
		testId = var1.testId,
		width = var1.width,
		value = var2.UnixTimestamp
	})
end