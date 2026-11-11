local GameFilters = script:FindFirstAncestor("GameFilters")
local Parent = GameFilters.Parent
local _ = require(Parent.DiscoveryTypes)
local FoundationModule = require(Parent.Foundation)
local IconPosition = FoundationModule.Enums.IconPosition
local ImpressionsTagUtility = require(Parent.Impressions).ImpressionsTagUtility
local CentralOverlayType = require(Parent.RobloxAppEnums).CentralOverlayType
local Chip = FoundationModule.Chip
local ReactModule = require(Parent.React)
local SetCentralOverlayFunction = require(Parent.CentralOverlay).Actions.SetCentralOverlay
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseTokensFunction = FoundationModule.Hooks.useTokens
local FilterClickButtonNameModule = require(GameFilters.Analytics.FilterClickButtonName)
local _ = require(GameFilters.Components.Menu.FilterMenuDropdown)
local OpenFilterMenuPeekViewModule = require(GameFilters.OpenFilterMenuPeekView)
local ShouldUsePeekViewModule = require(GameFilters.Components.Menu.shouldUsePeekView)
local GetOptionContextTagModule = require(GameFilters.Analytics.getOptionContextTag)
local FFlagLuaAppChartsFilterOptionTextTag = require(Parent.SharedFlags).FFlagLuaAppChartsFilterOptionTextTag
local FFlagLuaAppChartsActiveFilterChips = require(Parent.SharedFlags).FFlagLuaAppChartsActiveFilterChips
local _ = require(GameFilters.FilterCallbackTypes)

return ReactModule.memo(function(p1)
	-- upvalues: FFlagLuaAppChartsActiveFilterChips (copy), ReactModule (copy), UseDispatchFunction (copy), UseTokensFunction (copy), ImpressionsTagUtility (copy), ShouldUsePeekViewModule (copy), FFlagLuaAppChartsFilterOptionTextTag (copy), GetOptionContextTagModule (copy), OpenFilterMenuPeekViewModule (copy), FilterClickButtonNameModule (copy), SetCentralOverlayFunction (copy), CentralOverlayType (copy), Chip (copy), IconPosition (copy)
	local v1 = nil
	local Callback1 = nil
	
	if not FFlagLuaAppChartsActiveFilterChips then
		v1, Callback1 = ReactModule.useState(false)
	end
	local v2 = nil
	local Callback = nil
	
	if FFlagLuaAppChartsActiveFilterChips then
		v2, Callback = ReactModule.useState(false)
	end
	local UseRefResult = ReactModule.useRef(nil)
	local UseDispatchResult = UseDispatchFunction()
	local UseTokensResult = UseTokensFunction()
	local UseMemoResult = if FFlagLuaAppChartsActiveFilterChips then ReactModule.useMemo(function(): boolean
		-- upvalues: p1 (copy)
		return p1.filter.inactiveOptionIds ~= nil and p1.filter.selectedOptionId ~= nil and not p1.filter.inactiveOptionIds[p1.filter.selectedOptionId]
	end, { p1.filter.selectedOptionId, p1.filter.inactiveOptionIds }) else nil
	local UseMemoResult1 = if FFlagLuaAppChartsActiveFilterChips then UseMemoResult or v2 else nil
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), p1 (copy)
		local Connection = if UseRefResult.current then UseRefResult.current:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
			-- upvalues: p1 (upval), UseRefResult (upval)
			p1.onAbsoluteSizeChanged(UseRefResult.current)
		end) else nil
		
		return function()
			-- upvalues: Connection (ref)
			if Connection then
				Connection:Disconnect()
			end
		end
	end, { p1.onAbsoluteSizeChanged })
	ReactModule.useEffect(function()
		-- upvalues: ImpressionsTagUtility (upval), UseRefResult (copy), p1 (copy)
		ImpressionsTagUtility.AddTag(UseRefResult, p1.impressionsTag, p1.index)
		
		return function()
			-- upvalues: ImpressionsTagUtility (upval), UseRefResult (upval), p1 (upval)
			ImpressionsTagUtility.RemoveTag(UseRefResult, p1.impressionsTag, p1.index)
		end
	end, { p1.impressionsTag, p1.index })
	local UseResult = ReactModule.useCallback(function(p2, p3, p4, p5, p6, p7)
		-- upvalues: p1 (copy)
		p1.sendFilterClick(p2, p1.filter.filterId, p3, p4, p5, p6, p7)
	end, { p1.sendFilterClick, p1.filter.filterId })
	local ShouldUsePeekViewModule1 = ShouldUsePeekViewModule()
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: FFlagLuaAppChartsActiveFilterChips (upval), Callback (ref), Callback1 (ref)
		if FFlagLuaAppChartsActiveFilterChips then
			Callback(false)
			
			return
		else
			Callback1(false)
		end
	end, {})
	
	return ReactModule.createElement(Chip, {
		icon = {
			name = "icons/actions/truncationExpand_small",
			position = IconPosition.Right
		},
		text = p1.filter.selectedOptionDisplayName,
		isChecked = if FFlagLuaAppChartsActiveFilterChips then UseMemoResult1 else v1,
		onActivated = ReactModule.useCallback(function()
			-- upvalues: FFlagLuaAppChartsFilterOptionTextTag (upval), GetOptionContextTagModule (upval), p1 (copy), ShouldUsePeekViewModule1 (copy), UseDispatchResult (copy), OpenFilterMenuPeekViewModule (upval), UseResult1 (copy), UseResult (copy), FilterClickButtonNameModule (upval), FFlagLuaAppChartsActiveFilterChips (upval), UseMemoResult1 (copy), UseRefResult (copy), UseTokensResult (copy), SetCentralOverlayFunction (upval), CentralOverlayType (upval), Callback (ref), Callback1 (ref)
			local OptionContextTagModule = if FFlagLuaAppChartsFilterOptionTextTag then GetOptionContextTagModule(p1.filter, p1.filter.selectedOptionId) else nil
			
			if ShouldUsePeekViewModule1 then
				UseDispatchResult(OpenFilterMenuPeekViewModule(p1.filter, p1.onFilterApplied, UseResult1, UseResult))
				UseResult(FilterClickButtonNameModule.OpenPeekView, p1.filter.selectedOptionId, nil, if FFlagLuaAppChartsFilterOptionTextTag then OptionContextTagModule else nil, nil, if FFlagLuaAppChartsActiveFilterChips then UseMemoResult1 else nil)
			else
				UseDispatchResult(SetCentralOverlayFunction(CentralOverlayType.GameFilterMenuDropdown, {
					openPosition = if UseRefResult.current then Vector2.new(UseRefResult.current.AbsolutePosition.X, UseRefResult.current.AbsolutePosition.Y + UseRefResult.current.AbsoluteSize.Y + UseTokensResult.Gap.Small) else nil,
					filter = p1.filter,
					onFilterApplied = p1.onFilterApplied,
					onFilterMenuClosed = UseResult1,
					sendFilterClick = UseResult
				}))
				UseResult(FilterClickButtonNameModule.OpenDropdown, p1.filter.selectedOptionId, nil, if FFlagLuaAppChartsFilterOptionTextTag then OptionContextTagModule else nil, nil, if FFlagLuaAppChartsActiveFilterChips then UseMemoResult1 else nil)
			end
			if FFlagLuaAppChartsActiveFilterChips then
				Callback(true)
				
				return
			else
				Callback1(true)
			end
		end, {
			p1.filter, p1.onFilterApplied, UseResult1, UseResult, ShouldUsePeekViewModule1,
			if FFlagLuaAppChartsActiveFilterChips then UseMemoResult1 else nil
		}),
		ref = UseRefResult
	})
end)