local LocalizationService = game:GetService("LocalizationService")
local Parent = script:FindFirstAncestor("AvatarExperienceTimedOptions").Parent
local ReactModule = require(Parent.React)
local Localization = require(Parent.RobloxAppLocales).Localization
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local _ = require(Parent.AvatarExperienceCommon)
local FFlagAXDurablesForMIS = require(Parent.AvatarExperienceFlags).FFlagAXDurablesForMIS

local function _(List)
	for _, value in List do
		if value.days == 0 then
			return value.price
		end
	end
	return 0
end

return function(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), Localization (copy), LocalizationService (copy), FFlagAXDurablesForMIS (copy), UseLocalizationFunction (copy)
	local UseTokensResult = UseTokensFunction()
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: Localization (upval), LocalizationService (upval)
		return Localization.new(LocalizationService.RobloxLocaleId)
	end, {})
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	ReactModule.useEffect(function()
		-- upvalues: FFlagAXDurablesForMIS (upval), p1 (copy), UseStateResult2 (copy)
		if FFlagAXDurablesForMIS and p1.selectedTimedOptionIndexInReducer ~= nil then
			UseStateResult2(p1.selectedTimedOptionIndexInReducer)
			
			return
		end
		for i, option in p1.options do
			if option.selected then
				UseStateResult2(i)
				break
			end
		end
	end, {
		p1.options,
		if FFlagAXDurablesForMIS then p1.selectedTimedOptionIndexInReducer else nil
	})
	local Option = if UseStateResult then p1.options[UseStateResult] else nil
	local Days = if Option then Option.days else 0
	local UseLocalizationResult = UseLocalizationFunction({
		infinite = "Feature.Durables.ItemDetails.WearTimeOptions.Button.Infinite",
		xDay = { "Feature.Durables.BottomBar.RentalDuration", num = Days },
		xDays = {
			"Feature.Durables.BottomBar.RentalDurationPlural",
			num = Days
		},
		xDayList = {
			"Feature.Durables.ItemDetails.WearTimeOptions.Button.XDay",
			num = Days
		},
		xDaysList = {
			"Feature.Durables.ItemDetails.WearTimeOptions.Button.XDays",
			num = Days
		}
	})
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseRefResult = ReactModule.useRef(nil)
	local Price = nil
	
	if Option then
		Price = Option.price
	else
		Price = 0
		
		for _, option in p1.options do
			if option.days == 0 then
				Price = option.price
				break
			end
		end
	end
	local Infinite = nil
	local Infinite1 = nil
	if Days == 0 then
		Infinite = UseLocalizationResult.infinite
		Infinite1 = UseLocalizationResult.infinite
	elseif Days == 1 then
		Infinite = UseLocalizationResult.xDay
		Infinite1 = UseLocalizationResult.xDayList
	else
		Infinite = UseLocalizationResult.xDays
		Infinite1 = UseLocalizationResult.xDaysList
	end
	return {
		tokens = UseTokensResult,
		localization = UseMemoResult,
		selectedIndex = UseStateResult,
		setSelectedIndex = UseStateResult2,
		selectedOption = Option,
		days = Days,
		localizedText = UseLocalizationResult,
		isOpen = UseStateResult1,
		setIsOpen = UseStateResult2_1,
		anchorRef = UseRefResult,
		price = Price,
		subLabelText = Infinite,
		listLabelText = Infinite1,
		handleOptionActivated = ReactModule.useCallback(function(p2)
			-- upvalues: UseStateResult2 (copy), p1 (copy), UseStateResult2_1 (copy)
			UseStateResult2(p2)
			
			if p1.onOptionActivated then
				p1.onOptionActivated(p2)
			end
			UseStateResult2_1(false)
		end, { p1.onOptionActivated }),
		updatedOptions = ReactModule.useMemo(function()
			-- upvalues: p1 (copy), UseStateResult (copy)
			local t = {}
			
			for i, option in p1.options do
				t[i] = {
					days = option.days,
					price = option.price,
					selected = i == UseStateResult,
					discountInformation = option.discountInformation
				}
			end
			return t
		end, { p1.options, UseStateResult }),
		disableOptionSelection = p1.disableOptionSelection
	}
end