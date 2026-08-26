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

local function _(p1)
	for i, v in p1 do
		if v.days == 0 then
			return v.price
		end
	end
	return 0
end

return function(p2)
	-- upvalues: useTokens (ref), reactModule (ref), localization (ref), localizationService (ref), fFlagAXDurablesForMIS (ref), useLocalization (ref)
	local var1
	local var2 = useTokens()
	local var3 = reactModule.useMemo(function()
		-- upvalues: localization (copy), localizationService (copy)
		return localization.new(localizationService.RobloxLocaleId)
	end, {})
	local var4, var5 = reactModule.useState(nil)
	reactModule.useEffect(function()
		-- upvalues: fFlagAXDurablesForMIS (copy), p2 (ref), var5 (ref)
		if fFlagAXDurablesForMIS and p2.selectedTimedOptionIndexInReducer ~= nil then
			var5(p2.selectedTimedOptionIndexInReducer)
			
			return
		end
		for i, v in p2.options do
			if v.selected then
				var5(i)
				
				return
			end
		end
	end, {
		p2.options,
		if fFlagAXDurablesForMIS then p2.selectedTimedOptionIndexInReducer else nil
	})
	local var6 = if var4 then p2.options[var4] else nil
	local var7 = if var6 then var6.days else 0
	local var8 = useLocalization({
		infinite = "Feature.Durables.ItemDetails.WearTimeOptions.Button.Infinite",
		xDay = { "Feature.Durables.BottomBar.RentalDuration", num = var7 },
		xDays = {
			"Feature.Durables.BottomBar.RentalDurationPlural",
			num = var7
		},
		xDayList = {
			"Feature.Durables.ItemDetails.WearTimeOptions.Button.XDay",
			num = var7
		},
		xDaysList = {
			"Feature.Durables.ItemDetails.WearTimeOptions.Button.XDays",
			num = var7
		}
	})
	local var9, var10 = reactModule.useState(false)
	local var11 = reactModule.useRef(nil)
	
	if var6 then
		var1 = var6.price
	else
		for i, v in p2.options do
			if v.days == 0 then
				var1 = v.price
			end
		end
		var1 = 0
	end
	local infinite, infinite_1
	local _ = nil
	local _ = nil
	
	if var7 == 0 then
		infinite = var8.infinite
		infinite_1 = var8.infinite
	elseif var7 == 1 then
		infinite = var8.xDay
		infinite_1 = var8.xDayList
	else
		infinite = var8.xDays
		infinite_1 = var8.xDaysList
	end
	return {
		tokens = var2,
		localization = var3,
		selectedIndex = var4,
		setSelectedIndex = var5,
		selectedOption = var6,
		days = var7,
		localizedText = var8,
		isOpen = var9,
		setIsOpen = var10,
		anchorRef = var11,
		price = var1,
		subLabelText = infinite,
		listLabelText = infinite_1,
		handleOptionActivated = reactModule.useCallback(function(p3)
			-- upvalues: var5 (ref), p2 (ref), var10 (ref)
			var5(p3)
			
			if p2.onOptionActivated then
				p2.onOptionActivated(p3)
			end
			var10(false)
		end, { p2.onOptionActivated }),
		updatedOptions = reactModule.useMemo(function()
			-- upvalues: p2 (ref), var4 (ref)
			local t = {}
			
			for i, v in p2.options do
				t[i] = {
					days = v.days,
					price = v.price,
					selected = i == var4,
					discountInformation = v.discountInformation
				}
			end
			return t
		end, { p2.options, var4 }),
		disableOptionSelection = p2.disableOptionSelection
	}
end