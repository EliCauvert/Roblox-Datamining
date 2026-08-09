local gameFilters = script:FindFirstAncestor("GameFilters")
local parent = gameFilters.Parent
local appEventIngestService = require(parent.RoactServiceTags).AppEventIngestService
local _ = require(parent.DiscoveryTypes)
local foundationModule = require(parent.Foundation)
local iconPosition = foundationModule.Enums.IconPosition
local impressionsTagUtility = require(parent.Impressions).ImpressionsTagUtility
local centralOverlayType = require(parent.RobloxAppEnums).CentralOverlayType
local chip = foundationModule.Chip
local reactModule = require(parent.React)
local setCentralOverlay = require(parent.CentralOverlay).Actions.SetCentralOverlay
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local useTokens = foundationModule.Hooks.useTokens
local filterClickButtonNameModule = require(gameFilters.Analytics.FilterClickButtonName)
local _ = require(gameFilters.Components.Menu.FilterMenuDropdown)
local openFilterMenuPeekViewModule = require(gameFilters.OpenFilterMenuPeekView)
local gamesFilterClickEventModule = require(gameFilters.Analytics.gamesFilterClickEvent)
local shouldUsePeekViewModule = require(gameFilters.Components.Menu.shouldUsePeekView)
local getOptionContextTagModule = require(gameFilters.Analytics.getOptionContextTag)
local fFlagLuaAppChartsFilterOptionTextTag = require(parent.SharedFlags).FFlagLuaAppChartsFilterOptionTextTag
local fFlagLuaAppChartsActiveFilterChips = require(parent.SharedFlags).FFlagLuaAppChartsActiveFilterChips
local fFlagLuaAppFilterCarouselCallbacks = require(parent.SharedFlags).FFlagLuaAppFilterCarouselCallbacks
local _ = require(gameFilters.FilterCallbackTypes)

return reactModule.memo(function(p0) --[[ line: 45 ]]
	-- upvalues: fFlagLuaAppChartsActiveFilterChips (ref), reactModule (ref), useDispatch (ref), useTokens (ref), impressionsTagUtility (ref), fFlagLuaAppFilterCarouselCallbacks (ref), useRoactService (ref), appEventIngestService (ref), gamesFilterClickEventModule (ref), fFlagLuaAppChartsFilterOptionTextTag (ref), shouldUsePeekViewModule (ref), getOptionContextTagModule (ref), openFilterMenuPeekViewModule (ref), filterClickButtonNameModule (ref), setCentralOverlay (ref), centralOverlayType (ref), chip (ref), iconPosition (ref)
	local var8 = nil
	local var9 = nil
	
	if not fFlagLuaAppChartsActiveFilterChips then
		local var10, var11 = reactModule.useState(false)
		var8 = var10
		var9 = var11
	end
	local var12 = nil
	local var13 = nil
	
	if fFlagLuaAppChartsActiveFilterChips then
		local var14, var15 = reactModule.useState(false)
		var12 = var14
		var13 = var15
	end
	local var21
	local var16 = reactModule.useRef(nil)
	local var17 = useDispatch()
	local var18 = useTokens()
	local var19 = if fFlagLuaAppChartsActiveFilterChips then (if fFlagLuaAppChartsActiveFilterChips then reactModule.useMemo(function() --[[ line: 61 ]]
		-- upvalues: p0 (ref)
		return if p0.filter.inactiveOptionIds == nil or p0.filter.selectedOptionId == nil then false else not p0.filter.inactiveOptionIds[p0.filter.selectedOptionId]
	end, { p0.filter.selectedOptionId, p0.filter.inactiveOptionIds }) else nil) or var12 else nil
	reactModule.useEffect(function() --[[ line: 72 ]]
		-- upvalues: var16 (ref), p0 (ref)
		local var24 = if var16.current then var16.current:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ line: 76 ]]
			-- upvalues: p0 (copy), var16 (copy)
			p0.onAbsoluteSizeChanged(var16.current)
		end) else nil
		
		return function() --[[ line: 81 ]]
			-- upvalues: var24 (write)
			if var24 then
				var24:Disconnect()
			end
		end
	end, { p0.onAbsoluteSizeChanged })
	reactModule.useEffect(function() --[[ line: 88 ]]
		-- upvalues: impressionsTagUtility (copy), var16 (ref), p0 (ref)
		impressionsTagUtility.AddTag(var16, p0.impressionsTag, p0.index)
		
		return function() --[[ line: 91 ]]
			-- upvalues: impressionsTagUtility (copy), var16 (copy), p0 (copy)
			impressionsTagUtility.RemoveTag(var16, p0.impressionsTag, p0.index)
		end
	end, { p0.impressionsTag, p0.index })
	local _ = nil
	
	if fFlagLuaAppFilterCarouselCallbacks then
		var21 = reactModule.useCallback(function(p1, p2, p3, p4, p5, p6) --[[ line: 106 ]]
			-- upvalues: p0 (ref)
			p0.sendFilterClick(p1, p0.filter.filterId, p2, p3, p4, p5, p6)
		end, { p0.sendFilterClick, p0.filter.filterId })
	else
		local var20 = useRoactService(appEventIngestService)
		var21 = reactModule.useCallback(function(p7, p8, p9, p10, p11, p12) --[[ line: 129 ]]
			-- upvalues: gamesFilterClickEventModule (copy), var20 (ref), p0 (ref), fFlagLuaAppChartsFilterOptionTextTag (copy), fFlagLuaAppChartsActiveFilterChips (copy)
			gamesFilterClickEventModule(var20, p0.pageContext, {
				buttonName = p7,
				filterId = p0.filter.filterId,
				selectedOptionId = p8,
				previousOptionId = p9,
				gameSetTypeId = p0.analyticsInfo.gameSetTypeId,
				gameSetTargetId = p0.analyticsInfo.gameSetTargetId,
				sortPos = p0.analyticsInfo.sortPos,
				selectedOptionContextTag = if fFlagLuaAppChartsFilterOptionTextTag then p10 else nil,
				previousOptionContextTag = if fFlagLuaAppChartsFilterOptionTextTag then p11 else nil,
				isActive = if fFlagLuaAppChartsActiveFilterChips then p12 else nil
			})
		end, { var20, p0.filter, p0.pageContext, p0.analyticsInfo })
	end
	local var22 = shouldUsePeekViewModule()
	local var23 = reactModule.useCallback(function() --[[ line: 159 ]]
		-- upvalues: fFlagLuaAppChartsActiveFilterChips (copy), var13 (write), var9 (write)
		if fFlagLuaAppChartsActiveFilterChips then
			var13(false)
			
			return
		end
		var9(false)
	end, {})
	
	return reactModule.createElement(chip, {
		icon = {
			name = "icons/actions/truncationExpand_small",
			position = iconPosition.Right
		},
		text = p0.filter.selectedOptionDisplayName,
		isChecked = if fFlagLuaAppChartsActiveFilterChips then var19 else var8,
		onActivated = reactModule.useCallback(function() --[[ line: 167 ]]
			-- upvalues: fFlagLuaAppChartsFilterOptionTextTag (copy), getOptionContextTagModule (copy), p0 (ref), var22 (ref), var17 (ref), openFilterMenuPeekViewModule (copy), var23 (ref), var21 (write), filterClickButtonNameModule (copy), fFlagLuaAppChartsActiveFilterChips (copy), var19 (ref), var16 (ref), var18 (ref), setCentralOverlay (copy), centralOverlayType (copy), var13 (write), var9 (write)
			local var25 = if fFlagLuaAppChartsFilterOptionTextTag then getOptionContextTagModule(p0.filter, p0.filter.selectedOptionId) else nil
			
			if var22 then
				var17(openFilterMenuPeekViewModule(p0.filter, p0.onFilterApplied, var23, var21))
				var21(filterClickButtonNameModule.OpenPeekView, p0.filter.selectedOptionId, nil, if fFlagLuaAppChartsFilterOptionTextTag then var25 else nil, nil, if fFlagLuaAppChartsActiveFilterChips then var19 else nil)
			else
				var17(setCentralOverlay(centralOverlayType.GameFilterMenuDropdown, {
					openPosition = if var16.current then Vector2.new(var16.current.AbsolutePosition.X, var16.current.AbsolutePosition.Y + var16.current.AbsoluteSize.Y + var18.Gap.Small) else nil,
					filter = p0.filter,
					onFilterApplied = p0.onFilterApplied,
					onFilterMenuClosed = var23,
					sendFilterClick = var21
				}))
				var21(filterClickButtonNameModule.OpenDropdown, p0.filter.selectedOptionId, nil, if fFlagLuaAppChartsFilterOptionTextTag then var25 else nil, nil, if fFlagLuaAppChartsActiveFilterChips then var19 else nil)
			end
			if fFlagLuaAppChartsActiveFilterChips then
				var13(true)
				
				return
			end
			var9(true)
		end, {
			p0.filter, p0.onFilterApplied, var23, var21, var22,
			if fFlagLuaAppChartsActiveFilterChips then var19 else nil
		}),
		ref = var16
	})
end)