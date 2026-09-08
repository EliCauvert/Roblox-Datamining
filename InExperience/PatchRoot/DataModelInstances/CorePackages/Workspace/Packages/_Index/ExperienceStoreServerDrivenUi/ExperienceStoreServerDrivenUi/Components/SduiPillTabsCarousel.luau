local parent = script:FindFirstAncestor("ExperienceStoreServerDrivenUi").Parent
local reactModule = require(parent.React)
local fFlagSduiLocalFeedFilter = require(parent.SharedFlags).FFlagSduiLocalFeedFilter
local foundationModule = require(parent.Foundation)
local chip = foundationModule.Chip
local scrollView = foundationModule.ScrollView
local view = foundationModule.View
local chipSize = foundationModule.Enums.ChipSize
local t = {
	AutomaticCanvasSize = Enum.AutomaticSize.X,
	AutomaticSize = Enum.AutomaticSize.Y,
	CanvasSize = UDim2.fromScale(0, 0),
	ScrollingDirection = Enum.ScrollingDirection.X,
	scrollBarVisibility = foundationModule.Enums.Visibility.None
}
local t_1 = { Selectable = false }
local var1 = reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), chip (ref)
	local optionId = p1.optionId
	local onSelect = p1.onSelect
	
	return reactModule.createElement(chip, {
		text = p1.displayName,
		isChecked = p1.isChecked,
		size = p1.chipSize,
		LayoutOrder = p1.layoutOrder,
		onActivated = reactModule.useCallback(function()
			-- upvalues: onSelect (ref), optionId (ref)
			onSelect(optionId)
		end, { onSelect, optionId })
	})
end)

return reactModule.memo(function(value)
	-- upvalues: chipSize (ref), fFlagSduiLocalFeedFilter (ref), reactModule (ref), var1 (ref), scrollView (ref), t (ref), t_1 (ref), view (ref)
	local options = value.options
	local onOptionActivated = value.onOptionActivated
	local chipSize_1 = value.chipSize or chipSize.Medium
	local selectedOption = value.selectedOption
	
	if fFlagSduiLocalFeedFilter then
		if selectedOption == nil or selectedOption == "" then
			selectedOption = value.defaultOption
		end
	elseif selectedOption == nil or selectedOption == "" then
		selectedOption = "all"
	end
	local var2 = reactModule.useRef(onOptionActivated)
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), onOptionActivated (ref)
		var2.current = onOptionActivated
	end, { onOptionActivated })
	reactModule.useEffect(function()
		-- upvalues: value (ref), fFlagSduiLocalFeedFilter (copy), var2 (ref)
		local defaultOption = value.defaultOption
		
		if fFlagSduiLocalFeedFilter and (value.selectedOption == nil or value.selectedOption == "") and (defaultOption ~= nil and defaultOption ~= "") then
			local current = var2.current
			
			if current then
				current(nil, nil, { selectedCategoryId = defaultOption })
			end
		end
	end, { value.defaultOption, value.selectedOption })
	local var3 = reactModule.useCallback(function(p1)
		-- upvalues: var2 (ref)
		local current = var2.current
		
		if current then
			current(nil, nil, { selectedCategoryId = p1 })
		end
	end, {})
	
	return if options and #options ~= 0 then reactModule.createElement(scrollView, {
		LayoutOrder = value.layoutOrder,
		tag = reactModule.useMemo(function()
			-- upvalues: value (ref)
			local t = { ["size-full-0 auto-y"] = true }
			
			if value.tag then
				t[value.tag] = true
			end
			return t
		end, { value.tag }),
		scroll = t,
		selection = t_1
	}, {
		Row = reactModule.createElement(view, { tag = "row gap-small auto-xy" }, reactModule.useMemo(function()
			-- upvalues: options (ref), reactModule (copy), var1 (copy), selectedOption (write), chipSize_1 (ref), var3 (ref)
			local t = {}
			
			if not options then
				return t
			end
			for i, v in options do
				local optionId = v.optionId
				t["Pill_" .. optionId] = reactModule.createElement(var1, {
					optionId = optionId,
					displayName = v.displayName,
					isChecked = optionId == selectedOption,
					chipSize = chipSize_1,
					layoutOrder = i,
					onSelect = var3
				})
			end
			return t
		end, { options, selectedOption, var3, chipSize_1 }))
	}) else nil
end)