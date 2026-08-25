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

return reactModule.memo(function(p0)
	-- upvalues: fFlagLuaAppChartsActiveFilterChips (ref), reactModule (ref), useDispatch (ref), useTokens (ref), impressionsTagUtility (ref), shouldUsePeekViewModule (ref), fFlagLuaAppChartsFilterOptionTextTag (ref), getOptionContextTagModule (ref), openFilterMenuPeekViewModule (ref), filterClickButtonNameModule (ref), setCentralOverlay (ref), centralOverlayType (ref), chip (ref), iconPosition (ref)
	local var7 = nil
	local var8 = nil
	
	if not fFlagLuaAppChartsActiveFilterChips then
		local var9, var10 = reactModule.useState(false)
		var7 = var9
		var8 = var10
	end
	local var11 = nil
	local var12 = nil
	
	if fFlagLuaAppChartsActiveFilterChips then
		local var13, var14 = reactModule.useState(false)
		var11 = var13
		var12 = var14
	end
	local var15 = reactModule.useRef(nil)
	local var16 = useDispatch()
	local var17 = useTokens()
	local var18 = if fFlagLuaAppChartsActiveFilterChips then (if fFlagLuaAppChartsActiveFilterChips then reactModule.useMemo(function()
		-- upvalues: p0 (ref)
		return if p0.filter.inactiveOptionIds == nil or p0.filter.selectedOptionId == nil then false else not p0.filter.inactiveOptionIds[p0.filter.selectedOptionId]
	end, { p0.filter.selectedOptionId, p0.filter.inactiveOptionIds }) else nil) or var11 else nil
	reactModule.useEffect(function()
		-- upvalues: var15 (ref), p0 (ref)
		local var22 = if var15.current then var15.current:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
			-- upvalues: p0 (copy), var15 (copy)
			p0.onAbsoluteSizeChanged(var15.current)
		end) else nil
		
		return function()
			-- upvalues: var22 (write)
			if var22 then
				var22:Disconnect()
			end
		end
	end, { p0.onAbsoluteSizeChanged })
	reactModule.useEffect(function()
		-- upvalues: impressionsTagUtility (copy), var15 (ref), p0 (ref)
		impressionsTagUtility.AddTag(var15, p0.impressionsTag, p0.index)
		
		return function()
			-- upvalues: impressionsTagUtility (copy), var15 (copy), p0 (copy)
			impressionsTagUtility.RemoveTag(var15, p0.impressionsTag, p0.index)
		end
	end, { p0.impressionsTag, p0.index })
	local var19 = reactModule.useCallback(function(p1, p2, p3, p4, p5, p6)
		-- upvalues: p0 (ref)
		p0.sendFilterClick(p1, p0.filter.filterId, p2, p3, p4, p5, p6)
	end, { p0.sendFilterClick, p0.filter.filterId })
	local var20 = shouldUsePeekViewModule()
	local var21 = reactModule.useCallback(function()
		-- upvalues: fFlagLuaAppChartsActiveFilterChips (copy), var12 (write), var8 (write)
		if fFlagLuaAppChartsActiveFilterChips then
			var12(false)
			
			return
		end
		var8(false)
	end, {})
	
	return reactModule.createElement(chip, {
		icon = {
			name = "icons/actions/truncationExpand_small",
			position = iconPosition.Right
		},
		text = p0.filter.selectedOptionDisplayName,
		isChecked = if fFlagLuaAppChartsActiveFilterChips then var18 else var7,
		onActivated = reactModule.useCallback(function()
			-- upvalues: fFlagLuaAppChartsFilterOptionTextTag (copy), getOptionContextTagModule (copy), p0 (ref), var20 (ref), var16 (ref), openFilterMenuPeekViewModule (copy), var21 (ref), var19 (ref), filterClickButtonNameModule (copy), fFlagLuaAppChartsActiveFilterChips (copy), var18 (ref), var15 (ref), var17 (ref), setCentralOverlay (copy), centralOverlayType (copy), var12 (write), var8 (write)
			local var23 = if fFlagLuaAppChartsFilterOptionTextTag then getOptionContextTagModule(p0.filter, p0.filter.selectedOptionId) else nil
			
			if var20 then
				var16(openFilterMenuPeekViewModule(p0.filter, p0.onFilterApplied, var21, var19))
				var19(filterClickButtonNameModule.OpenPeekView, p0.filter.selectedOptionId, nil, if fFlagLuaAppChartsFilterOptionTextTag then var23 else nil, nil, if fFlagLuaAppChartsActiveFilterChips then var18 else nil)
			else
				var16(setCentralOverlay(centralOverlayType.GameFilterMenuDropdown, {
					openPosition = if var15.current then Vector2.new(var15.current.AbsolutePosition.X, var15.current.AbsolutePosition.Y + var15.current.AbsoluteSize.Y + var17.Gap.Small) else nil,
					filter = p0.filter,
					onFilterApplied = p0.onFilterApplied,
					onFilterMenuClosed = var21,
					sendFilterClick = var19
				}))
				var19(filterClickButtonNameModule.OpenDropdown, p0.filter.selectedOptionId, nil, if fFlagLuaAppChartsFilterOptionTextTag then var23 else nil, nil, if fFlagLuaAppChartsActiveFilterChips then var18 else nil)
			end
			if fFlagLuaAppChartsActiveFilterChips then
				var12(true)
				
				return
			end
			var8(true)
		end, {
			p0.filter, p0.onFilterApplied, var21, var19, var20,
			if fFlagLuaAppChartsActiveFilterChips then var18 else nil
		}),
		ref = var15
	})
end)