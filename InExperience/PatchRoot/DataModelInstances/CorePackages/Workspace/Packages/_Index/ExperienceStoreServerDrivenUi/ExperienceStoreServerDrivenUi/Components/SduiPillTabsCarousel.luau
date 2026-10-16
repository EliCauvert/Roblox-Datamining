local Parent = script:FindFirstAncestor("ExperienceStoreServerDrivenUi").Parent
local ReactModule = require(Parent.React)
local FFlagSduiLocalFeedFilter = require(Parent.SharedFlags).FFlagSduiLocalFeedFilter
local FoundationModule = require(Parent.Foundation)
local Chip = FoundationModule.Chip
local ScrollView = FoundationModule.ScrollView
local View = FoundationModule.View
local ChipSize = FoundationModule.Enums.ChipSize
local Scroll = {
	AutomaticCanvasSize = Enum.AutomaticSize.X,
	AutomaticSize = Enum.AutomaticSize.Y,
	CanvasSize = UDim2.fromScale(0, 0),
	ScrollingDirection = Enum.ScrollingDirection.X,
	scrollBarVisibility = FoundationModule.Enums.Visibility.None
}
local Selection = { Selectable = false }
local MemoResult = ReactModule.memo(function(p1) --[[ Line: 78 | Named "PillTab" ]]
	-- upvalues: ReactModule (copy), Chip (copy)
	local OptionId = p1.optionId
	local OnSelectFunction = p1.onSelect
	
	return ReactModule.createElement(Chip, {
		text = p1.displayName,
		isChecked = p1.isChecked,
		size = p1.chipSize,
		LayoutOrder = p1.layoutOrder,
		onActivated = ReactModule.useCallback(function() --[[ Line: 82 ]]
			-- upvalues: OnSelectFunction (copy), OptionId (copy)
			OnSelectFunction(OptionId)
		end, { OnSelectFunction, OptionId })
	})
end)

return ReactModule.memo(function(p1) --[[ Line: 97 | Named "SduiPillTabsCarousel" ]]
	-- upvalues: ChipSize (copy), FFlagSduiLocalFeedFilter (copy), ReactModule (copy), MemoResult (copy), ScrollView (copy), Scroll (copy), Selection (copy), View (copy)
	local Options = p1.options
	local OnOptionActivated = p1.onOptionActivated
	local ChipSize1 = p1.chipSize or ChipSize.Medium
	local SelectedOption = p1.selectedOption
	
	if FFlagSduiLocalFeedFilter then
		if SelectedOption == nil or SelectedOption == "" then
			SelectedOption = p1.defaultOption
		end
	elseif SelectedOption == nil or SelectedOption == "" then
		SelectedOption = "all"
	end
	local UseRefResult = ReactModule.useRef(OnOptionActivated)
	ReactModule.useEffect(function() --[[ Line: 112 ]]
		-- upvalues: UseRefResult (copy), OnOptionActivated (copy)
		UseRefResult.current = OnOptionActivated
	end, { OnOptionActivated })
	ReactModule.useEffect(function() --[[ Line: 116 ]]
		-- upvalues: p1 (copy), FFlagSduiLocalFeedFilter (upval), UseRefResult (copy)
		local DefaultOption = p1.defaultOption
		
		if FFlagSduiLocalFeedFilter and (p1.selectedOption == nil or p1.selectedOption == "") and DefaultOption ~= nil and DefaultOption ~= "" then
			local CurrentFunction: (any, any, any) -> () = UseRefResult.current
			
			if CurrentFunction then
				CurrentFunction(nil, nil, { selectedCategoryId = DefaultOption })
			end
		end
	end, { p1.defaultOption, p1.selectedOption })
	local UseResult = ReactModule.useCallback(function(SelectedCategoryId) --[[ Line: 131 ]]
		-- upvalues: UseRefResult (copy)
		local CurrentFunction: (any, any, any) -> () = UseRefResult.current
		
		if CurrentFunction then
			CurrentFunction(nil, nil, { selectedCategoryId = SelectedCategoryId })
		end
	end, {})
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 138 ]]
		-- upvalues: Options (copy), ReactModule (upval), MemoResult (upval), SelectedOption (ref), ChipSize1 (copy), UseResult (copy)
		local Elements = {}
		
		if not Options then
			return Elements
		end
		for LayoutOrder, option in Options do
			local OptionId = option.optionId
			Elements["Pill_" .. OptionId] = ReactModule.createElement(MemoResult, {
				optionId = OptionId,
				displayName = option.displayName,
				isChecked = OptionId == SelectedOption,
				chipSize = ChipSize1,
				layoutOrder = LayoutOrder,
				onSelect = UseResult
			})
		end
		return Elements
	end, { Options, SelectedOption, UseResult, ChipSize1 })
	local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 157 ]]
		-- upvalues: p1 (copy)
		local config = { ["size-full-0 auto-y"] = true }
		
		if p1.tag then
			config[p1.tag] = true
		end
		return config
	end, { p1.tag })
	
	return if Options and #Options ~= 0 then ReactModule.createElement(ScrollView, {
		LayoutOrder = p1.layoutOrder,
		tag = UseMemoResult1,
		scroll = Scroll,
		selection = Selection
	}, {
		Row = ReactModule.createElement(View, { tag = "row gap-small auto-xy" }, UseMemoResult)
	}) else nil
end)