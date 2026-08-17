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

return function(p0) --[[ line: 35 | named "TimeSelector" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), dateTimeUtilitiesModule (ref), useScaledValueModule (ref), localizationService (ref), reactModule (ref), dropdownModule (ref), translatorModule (ref), inputSizeModule (ref)
	local var9 = withDefaultsModule(p0, t)
	local var10 = dateTimeUtilitiesModule.roundDownToNearestMinute(var9.dateTime)
	local var11 = var10:ToLocalTime()
	
	return reactModule.createElement(dropdownModule.Root, {
		label = "",
		items = (function() --[[ line: 43 ]]
			-- upvalues: var11 (ref), var10 (ref), dateTimeUtilitiesModule (copy), localizationService (copy)
			local t = {}
			local var13 = var11.Minute % 30 ~= 0
			
			for i = 0, 47 do
				local dateTime = DateTime.fromLocalTime(var11.Year, var11.Month, var11.Day, math.floor(i / 2), i % 2 * 30, var11.Second)
				
				if var13 and var10.UnixTimestamp < dateTime.UnixTimestamp then
					table.insert(t, {
						icon = nil,
						isChecked = true,
						isDisabled = true,
						id = var10.UnixTimestamp,
						text = var10:FormatLocalTime(dateTimeUtilitiesModule.TIME_COMPOSITE_TOKEN, localizationService.RobloxLocaleId)
					})
					var13 = false
				end
				table.insert(t, {
					icon = nil,
					id = dateTime.UnixTimestamp,
					isChecked = dateTime.UnixTimestamp == var10.UnixTimestamp,
					isDisabled = dateTime.UnixTimestamp == var10.UnixTimestamp,
					text = dateTime:FormatLocalTime(dateTimeUtilitiesModule.TIME_COMPOSITE_TOKEN, localizationService.RobloxLocaleId)
				})
			end
			return t
		end)(),
		LayoutOrder = var9.layoutOrder,
		maxHeight = useScaledValueModule(200),
		onItemChanged = var9.onItemChanged,
		placeholder = translatorModule:FormatByKey("CommonUI.Controls.Label.SelectTheTime"),
		size = inputSizeModule.Medium,
		testId = var9.testId,
		width = var9.width,
		value = var10.UnixTimestamp
	})
end