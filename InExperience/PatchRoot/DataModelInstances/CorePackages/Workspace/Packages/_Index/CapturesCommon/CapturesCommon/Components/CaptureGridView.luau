local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local DashModule = require(Parent1.Dash)
local FoundationModule = require(Parent1.Foundation)
local ReactModule = require(Parent1.React)
local GridView = require(Parent1.UIBlox).App.Grid.GridView
local ScrollBarVisibility = FoundationModule.Enums.ScrollBarVisibility
local ScrollView = FoundationModule.ScrollView
local View = FoundationModule.View
local MenuButtonModule = require(Parent.Components.MenuButton)
local _ = require(Parent.Types)
local UseScreenSizeModule = require(Parent.Hooks.useScreenSize)

local function _(p1: number): number --[[ Line: 41 | Named "getItemsPerRow" ]]
	return (math.clamp(math.floor(p1 / 120), 1, 4))
end

local function getGalleryItemSize(ClampedValue, XDelta: number): Vector2 --[[ Line: 45 ]]
	local ClampedValue1 = math.clamp(math.floor(XDelta / 120), 1, 4)
	local XDeltaDelta = XDelta - 4 * (ClampedValue1 - 1)
	local Smallest = math.min(XDeltaDelta / ClampedValue1, XDeltaDelta)
	
	return Vector2.new(math.floor(Smallest), (math.floor(Smallest * ClampedValue)))
end

local _ = function(p1: number, p2: number, Vector): number --[[ Line: 55 | Named "getItemsPerPage" ]]
	if p1 <= 0 then
		return 0
	end
	local Floored = math.floor(p1 / Vector.Y)
	
	if p1 < Vector.Y * Floored + (Floored - 1) * 4 then
		Floored -= 1
	end
	return (math.max(Floored * math.clamp(math.floor(p2 / 120), 1, 4), 8))
end

return function(p1) --[[ Line: 70 ]]
	-- upvalues: ReactModule (copy), UseScreenSizeModule (copy), getGalleryItemSize (copy), DashModule (copy), View (copy), ScrollView (copy), ScrollBarVisibility (copy), GridView (copy), MenuButtonModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(Vector2.new(0, 0))
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(0)
	local UseScreenSizeModuleResult = UseScreenSizeModule()
	local UseResult = ReactModule.useCallback(function(Frame) --[[ Line: 75 ]]
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(Frame.AbsoluteSize)
	end, {})
	local IsYAbove: boolean = UseStateResult.X > 0 and UseStateResult.Y > 0
	local IsUseStateResultBelow: boolean = p1.shouldShowShowMoreButton and UseStateResult1 < #p1.captures
	local ClampedValue = math.clamp(UseScreenSizeModuleResult.Y / UseScreenSizeModuleResult.X, 0.42857142857142855, 1)
	local YDelta = UseStateResult.Y - 12 - 40 - 36
	local XDelta = UseStateResult.X - 12 - 8
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 89 ]]
		-- upvalues: getGalleryItemSize (upval), ClampedValue (ref), XDelta (copy)
		return getGalleryItemSize(ClampedValue, XDelta)
	end, { ClampedValue, XDelta })
	local UseMemoResult1 = ReactModule.useMemo(function(): number --[[ Line: 93 ]]
		-- upvalues: YDelta (copy), XDelta (copy), UseMemoResult (copy)
		if YDelta <= 0 then
			return 0
		end
		local Floored = math.floor(YDelta / UseMemoResult.Y)
		
		if YDelta < UseMemoResult.Y * Floored + (Floored - 1) * 4 then
			Floored -= 1
		end
		return (math.max(Floored * math.clamp(math.floor(XDelta / 120), 1, 4), 8))
	end, { YDelta, XDelta, UseMemoResult })
	ReactModule.useEffect(function() --[[ Line: 97 ]]
		-- upvalues: UseStateResult1 (copy), UseMemoResult1 (copy), UseStateResult2_1 (copy)
		if UseStateResult1 < UseMemoResult1 then
			UseStateResult2_1(UseMemoResult1)
		end
	end, { UseStateResult, UseMemoResult1, UseStateResult1 })
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 103 ]]
		-- upvalues: UseStateResult2_1 (copy), UseStateResult1 (copy), UseMemoResult1 (copy)
		UseStateResult2_1(UseStateResult1 + UseMemoResult1)
	end, { UseStateResult1, UseMemoResult1 })
	local UseMemoResult2 = ReactModule.useMemo(function() --[[ Line: 107 ]]
		-- upvalues: IsUseStateResultBelow (copy), p1 (copy), UseStateResult1 (copy), DashModule (upval)
		return if IsUseStateResultBelow then DashModule.slice(p1.captures, 1, (math.min(#p1.captures, UseStateResult1))) else p1.captures
	end, { p1.captures, IsUseStateResultBelow, UseStateResult1 })
	
	return ReactModule.createElement(View, {
		BorderSizePixel = 0,
		tag = "bg-surface-0",
		onAbsoluteSizeChanged = UseResult,
		Position = if p1.position then p1.position else UDim2.fromOffset(0, 0),
		Size = if p1.size then p1.size else UDim2.fromScale(1, 1)
	}, {
		CaptureGridViewContainer = ReactModule.createElement(View, {
			tag = "bg-action-subtle size-full gap-xsmall col align-x-center align-y-top shrink"
		}, {
			Header = p1.header,
			ScrollView = ReactModule.createElement(ScrollView, {
				BorderSizePixel = 0,
				tag = "auto-y size-full-0 gap-xsmall col align-x-center align-y-top shrink padding-x-xsmall",
				LayoutOrder = if p1.layoutOrder then p1.layoutOrder else 1,
				scroll = {
					AutomaticCanvasSize = Enum.AutomaticSize.Y,
					CanvasSize = UDim2.fromScale(1, 0),
					ScrollingDirection = Enum.ScrollingDirection.Y,
					scrollBarVisibility = ScrollBarVisibility.Auto
				}
			}, {
				GridView = if IsYAbove then ReactModule.createElement(GridView, {
					LayoutOrder = 1,
					itemPadding = Vector2.new(4, 4),
					items = UseMemoResult2,
					itemSize = UseMemoResult,
					renderItem = p1.renderItem
				}) else nil,
				ShowMore = if IsUseStateResultBelow then ReactModule.createElement(MenuButtonModule, {
					buttonHeight = 40,
					LayoutOrder = 2,
					text = "Show More",
					onActivated = UseResult1
				}) else nil
			})
		})
	})
end