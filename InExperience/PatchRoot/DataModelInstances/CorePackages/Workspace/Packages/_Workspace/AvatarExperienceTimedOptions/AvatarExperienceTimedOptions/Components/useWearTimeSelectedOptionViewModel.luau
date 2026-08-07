local localizationService = game:GetService("LocalizationService")
local parent = script:FindFirstAncestor("AvatarExperienceTimedOptions").Parent
local avatarExperienceFlagsModule = require(parent.AvatarExperienceFlags)
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local localization = require(parent.RobloxAppLocales).Localization
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useTokens = foundationModule.Hooks.useTokens
local _ = require(parent.AvatarExperienceCommon)
local fFlagAXDurablesForMIS = avatarExperienceFlagsModule.FFlagAXDurablesForMIS

local function _(p0) --[[ line: 52 | named "getPermanentPrice" ]]
	for i, v in p0 do
		if v.days == 0 then
			return v.price
		end
	end
	return 0
end

return function(p1) --[[ line: 62 | named "useWearTimeSelectedOptionViewModel" ]]
	-- upvalues: useTokens (ref), reactModule (ref), localization (ref), localizationService (ref), fFlagAXDurablesForMIS (ref), useLocalization (ref)
	local var14
	local var4 = useTokens()
	local var5 = reactModule.useMemo(function() --[[ line: 65 ]]
		-- upvalues: localization (copy), localizationService (copy)
		return localization.new(localizationService.RobloxLocaleId)
	end, {})
	local var6, var7 = reactModule.useState(nil)
	reactModule.useEffect(function() --[[ line: 72 ]]
		-- upvalues: fFlagAXDurablesForMIS (copy), p1 (ref), var7 (ref)
		if fFlagAXDurablesForMIS and p1.selectedTimedOptionIndexInReducer ~= nil then
			var7(p1.selectedTimedOptionIndexInReducer)
			
			return
		end
		for i, v in p1.options do
			if v.selected then
				var7(i)
				
				return
			end
		end
	end, {
		p1.options,
		if fFlagAXDurablesForMIS then p1.selectedTimedOptionIndexInReducer else nil
	})
	local var8 = if var6 then p1.options[var6] else nil
	local var9 = if var8 then var8.days else 0
	local var10 = useLocalization({
		infinite = "Feature.Durables.ItemDetails.WearTimeOptions.Button.Infinite",
		xDay = { "Feature.Durables.BottomBar.RentalDuration", num = var9 },
		xDays = {
			"Feature.Durables.BottomBar.RentalDurationPlural",
			num = var9
		},
		xDayList = {
			"Feature.Durables.ItemDetails.WearTimeOptions.Button.XDay",
			num = var9
		},
		xDaysList = {
			"Feature.Durables.ItemDetails.WearTimeOptions.Button.XDays",
			num = var9
		}
	})
	local var11, var12 = reactModule.useState(false)
	local var13 = reactModule.useRef(nil)
	
	if var8 then
		var14 = var8.price
	else
		for i, v in p1.options do
			if v.days == 0 then
				var14 = v.price
			end
		end
		var14 = 0
	end
	local infinite, infinite_1
	local _ = nil
	local _ = nil
	
	if var9 == 0 then
		infinite = var10.infinite
		infinite_1 = var10.infinite
	elseif var9 == 1 then
		infinite = var10.xDay
		infinite_1 = var10.xDayList
	else
		infinite = var10.xDays
		infinite_1 = var10.xDaysList
	end
	return {
		tokens = var4,
		localization = var5,
		selectedIndex = var6,
		setSelectedIndex = var7,
		selectedOption = var8,
		days = var9,
		localizedText = var10,
		isOpen = var11,
		setIsOpen = var12,
		anchorRef = var13,
		price = var14,
		subLabelText = infinite,
		listLabelText = infinite_1,
		handleOptionActivated = reactModule.useCallback(function(p2) --[[ line: 113 ]]
			-- upvalues: var7 (ref), p1 (ref), var12 (ref)
			var7(p2)
			
			if p1.onOptionActivated then
				p1.onOptionActivated(p2)
			end
			var12(false)
		end, { p1.onOptionActivated }),
		updatedOptions = reactModule.useMemo(function() --[[ line: 121 ]]
			-- upvalues: p1 (ref), var6 (ref)
			local t = {}
			
			for i, v in p1.options do
				t[i] = {
					days = v.days,
					price = v.price,
					selected = i == var6,
					discountInformation = v.discountInformation
				}
			end
			return t
		end, { p1.options, var6 }),
		disableOptionSelection = p1.disableOptionSelection
	}
end