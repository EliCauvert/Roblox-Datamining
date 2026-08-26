local gameFilters = script:FindFirstAncestor("GameFilters")
local parent = gameFilters.Parent
local _ = require(parent.DiscoveryTypes)
local foundationModule = require(parent.Foundation)
local iconPosition = foundationModule.Enums.IconPosition
local impressionsTagUtility = require(parent.Impressions).ImpressionsTagUtility
local centralOverlayType = require(parent.RobloxAppEnums).CentralOverlayType
local chip = foundationModule.Chip
local reactModule = require(parent.React)
local setCentralOverlay = require(parent.CentralOverlay).Actions.SetCentralOverlay
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useTokens = foundationModule.Hooks.useTokens
local filterClickButtonNameModule = require(gameFilters.Analytics.FilterClickButtonName)
local _ = require(gameFilters.Components.Menu.FilterMenuDropdown)
local openFilterMenuPeekViewModule = require(gameFilters.OpenFilterMenuPeekView)
local shouldUsePeekViewModule = require(gameFilters.Components.Menu.shouldUsePeekView)
local getOptionContextTagModule = require(gameFilters.Analytics.getOptionContextTag)
local fFlagLuaAppChartsFilterOptionTextTag = require(parent.SharedFlags).FFlagLuaAppChartsFilterOptionTextTag
local fFlagLuaAppChartsActiveFilterChips = require(parent.SharedFlags).FFlagLuaAppChartsActiveFilterChips
local _ = require(gameFilters.FilterCallbackTypes)

return reactModule.memo(function(p1)
	-- upvalues: fFlagLuaAppChartsActiveFilterChips (ref), reactModule (ref), useDispatch (ref), useTokens (ref), impressionsTagUtility (ref), shouldUsePeekViewModule (ref), fFlagLuaAppChartsFilterOptionTextTag (ref), getOptionContextTagModule (ref), openFilterMenuPeekViewModule (ref), filterClickButtonNameModule (ref), setCentralOverlay (ref), centralOverlayType (ref), chip (ref), iconPosition (ref)
	local var1 = nil
	local var2 = nil
	
	if not fFlagLuaAppChartsActiveFilterChips then
		local var3, var4 = reactModule.useState(false)
		var1 = var3
		var2 = var4
	end
	local var5 = nil
	local var6 = nil
	
	if fFlagLuaAppChartsActiveFilterChips then
		local var7, var8 = reactModule.useState(false)
		var5 = var7
		var6 = var8
	end
	local var9 = reactModule.useRef(nil)
	local var10 = useDispatch()
	local var11 = useTokens()
	local var12 = if fFlagLuaAppChartsActiveFilterChips then (if fFlagLuaAppChartsActiveFilterChips then reactModule.useMemo(function()
		-- upvalues: p1 (ref)
		return if p1.filter.inactiveOptionIds == nil or p1.filter.selectedOptionId == nil then false else not p1.filter.inactiveOptionIds[p1.filter.selectedOptionId]
	end, { p1.filter.selectedOptionId, p1.filter.inactiveOptionIds }) else nil) or var5 else nil
	reactModule.useEffect(function()
		-- upvalues: var9 (ref), p1 (ref)
		local var13 = if var9.current then var9.current:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
			-- upvalues: p1 (copy), var9 (copy)
			p1.onAbsoluteSizeChanged(var9.current)
		end) else nil
		
		return function()
			-- upvalues: var13 (write)
			if var13 then
				var13:Disconnect()
			end
		end
	end, { p1.onAbsoluteSizeChanged })
	reactModule.useEffect(function()
		-- upvalues: impressionsTagUtility (copy), var9 (ref), p1 (ref)
		impressionsTagUtility.AddTag(var9, p1.impressionsTag, p1.index)
		
		return function()
			-- upvalues: impressionsTagUtility (copy), var9 (copy), p1 (copy)
			impressionsTagUtility.RemoveTag(var9, p1.impressionsTag, p1.index)
		end
	end, { p1.impressionsTag, p1.index })
	local var13 = reactModule.useCallback(function(p2, p3, p4, p5, p6, p7)
		-- upvalues: p1 (ref)
		p1.sendFilterClick(p2, p1.filter.filterId, p3, p4, p5, p6, p7)
	end, { p1.sendFilterClick, p1.filter.filterId })
	local var14 = shouldUsePeekViewModule()
	local var15 = reactModule.useCallback(function()
		-- upvalues: fFlagLuaAppChartsActiveFilterChips (copy), var6 (write), var2 (write)
		if fFlagLuaAppChartsActiveFilterChips then
			var6(false)
			
			return
		end
		var2(false)
	end, {})
	
	return reactModule.createElement(chip, {
		icon = {
			name = "icons/actions/truncationExpand_small",
			position = iconPosition.Right
		},
		text = p1.filter.selectedOptionDisplayName,
		isChecked = if fFlagLuaAppChartsActiveFilterChips then var12 else var1,
		onActivated = reactModule.useCallback(function()
			-- upvalues: fFlagLuaAppChartsFilterOptionTextTag (copy), getOptionContextTagModule (copy), p1 (ref), var14 (ref), var10 (ref), openFilterMenuPeekViewModule (copy), var15 (ref), var13 (ref), filterClickButtonNameModule (copy), fFlagLuaAppChartsActiveFilterChips (copy), var12 (ref), var9 (ref), var11 (ref), setCentralOverlay (copy), centralOverlayType (copy), var6 (write), var2 (write)
			local var16 = if fFlagLuaAppChartsFilterOptionTextTag then getOptionContextTagModule(p1.filter, p1.filter.selectedOptionId) else nil
			
			if var14 then
				var10(openFilterMenuPeekViewModule(p1.filter, p1.onFilterApplied, var15, var13))
				var13(filterClickButtonNameModule.OpenPeekView, p1.filter.selectedOptionId, nil, if fFlagLuaAppChartsFilterOptionTextTag then var16 else nil, nil, if fFlagLuaAppChartsActiveFilterChips then var12 else nil)
			else
				var10(setCentralOverlay(centralOverlayType.GameFilterMenuDropdown, {
					openPosition = if var9.current then Vector2.new(var9.current.AbsolutePosition.X, var9.current.AbsolutePosition.Y + var9.current.AbsoluteSize.Y + var11.Gap.Small) else nil,
					filter = p1.filter,
					onFilterApplied = p1.onFilterApplied,
					onFilterMenuClosed = var15,
					sendFilterClick = var13
				}))
				var13(filterClickButtonNameModule.OpenDropdown, p1.filter.selectedOptionId, nil, if fFlagLuaAppChartsFilterOptionTextTag then var16 else nil, nil, if fFlagLuaAppChartsActiveFilterChips then var12 else nil)
			end
			if fFlagLuaAppChartsActiveFilterChips then
				var6(true)
				
				return
			end
			var2(true)
		end, {
			p1.filter, p1.onFilterApplied, var15, var13, var14,
			if fFlagLuaAppChartsActiveFilterChips then var12 else nil
		}),
		ref = var9
	})
end)