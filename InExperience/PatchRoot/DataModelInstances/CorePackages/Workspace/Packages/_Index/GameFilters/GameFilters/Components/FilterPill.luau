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
local _ = require(gameFilters.FilterCallbackTypes)

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), useDispatch (ref), useTokens (ref), impressionsTagUtility (ref), shouldUsePeekViewModule (ref), fFlagLuaAppChartsFilterOptionTextTag (ref), getOptionContextTagModule (ref), openFilterMenuPeekViewModule (ref), filterClickButtonNameModule (ref), setCentralOverlay (ref), centralOverlayType (ref), chip (ref), iconPosition (ref)
	local _ = nil
	local _ = nil
	local var1, var2 = reactModule.useState(false)
	local var3 = var2
	local var4 = reactModule.useRef(nil)
	local var5 = useDispatch()
	local var6 = useTokens()
	local var7 = reactModule.useMemo(function()
		-- upvalues: p1 (ref)
		return if p1.filter.inactiveOptionIds == nil or p1.filter.selectedOptionId == nil then false else not p1.filter.inactiveOptionIds[p1.filter.selectedOptionId]
	end, { p1.filter.selectedOptionId, p1.filter.inactiveOptionIds }) or var1
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), p1 (ref)
		local var8 = if var4.current then var4.current:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
			-- upvalues: p1 (copy), var4 (copy)
			p1.onAbsoluteSizeChanged(var4.current)
		end) else nil
		
		return function()
			-- upvalues: var8 (write)
			if var8 then
				var8:Disconnect()
			end
		end
	end, { p1.onAbsoluteSizeChanged })
	reactModule.useEffect(function()
		-- upvalues: impressionsTagUtility (copy), var4 (ref), p1 (ref)
		impressionsTagUtility.AddTag(var4, p1.impressionsTag, p1.index)
		
		return function()
			-- upvalues: impressionsTagUtility (copy), var4 (copy), p1 (copy)
			impressionsTagUtility.RemoveTag(var4, p1.impressionsTag, p1.index)
		end
	end, { p1.impressionsTag, p1.index })
	local var8 = reactModule.useCallback(function(p2, p3, p4, p5, p6, p7)
		-- upvalues: p1 (ref)
		p1.sendFilterClick(p2, p1.filter.filterId, p3, p4, p5, p6, p7)
	end, { p1.sendFilterClick, p1.filter.filterId })
	local var9 = shouldUsePeekViewModule()
	local var10 = reactModule.useCallback(function()
		-- upvalues: var3 (write)
		var3(false)
	end, {})
	
	return reactModule.createElement(chip, {
		icon = {
			name = "icons/actions/truncationExpand_small",
			position = iconPosition.Right
		},
		text = p1.filter.selectedOptionDisplayName,
		isChecked = var7,
		onActivated = reactModule.useCallback(function()
			-- upvalues: fFlagLuaAppChartsFilterOptionTextTag (copy), getOptionContextTagModule (copy), p1 (ref), var9 (ref), var5 (ref), openFilterMenuPeekViewModule (copy), var10 (ref), var8 (ref), filterClickButtonNameModule (copy), var7 (ref), var4 (ref), var6 (ref), setCentralOverlay (copy), centralOverlayType (copy), var3 (write)
			local var11 = if fFlagLuaAppChartsFilterOptionTextTag then getOptionContextTagModule(p1.filter, p1.filter.selectedOptionId) else nil
			
			if var9 then
				var5(openFilterMenuPeekViewModule(p1.filter, p1.onFilterApplied, var10, var8))
				var8(filterClickButtonNameModule.OpenPeekView, p1.filter.selectedOptionId, nil, if fFlagLuaAppChartsFilterOptionTextTag then var11 else nil, nil, var7)
			else
				var5(setCentralOverlay(centralOverlayType.GameFilterMenuDropdown, {
					openPosition = if var4.current then Vector2.new(var4.current.AbsolutePosition.X, var4.current.AbsolutePosition.Y + var4.current.AbsoluteSize.Y + var6.Gap.Small) else nil,
					filter = p1.filter,
					onFilterApplied = p1.onFilterApplied,
					onFilterMenuClosed = var10,
					sendFilterClick = var8
				}))
				var8(filterClickButtonNameModule.OpenDropdown, p1.filter.selectedOptionId, nil, if fFlagLuaAppChartsFilterOptionTextTag then var11 else nil, nil, var7)
			end
			var3(true)
		end, {
			p1.filter, p1.onFilterApplied, var10, var8, var9, var7
		}),
		ref = var4
	})
end)