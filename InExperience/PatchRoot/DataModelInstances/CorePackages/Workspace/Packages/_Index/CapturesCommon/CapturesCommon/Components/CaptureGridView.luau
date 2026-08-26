local parent = script.Parent.Parent
local parent_1 = parent.Parent
local dashModule = require(parent_1.Dash)
local foundationModule = require(parent_1.Foundation)
local reactModule = require(parent_1.React)
local gridView = require(parent_1.UIBlox).App.Grid.GridView
local scrollBarVisibility = foundationModule.Enums.ScrollBarVisibility
local scrollView = foundationModule.ScrollView
local view = foundationModule.View
local menuButtonModule = require(parent.Components.MenuButton)
local _ = require(parent.Types)
local useScreenSizeModule = require(parent.Hooks.useScreenSize)

local function _(p1)
	return math.clamp(math.floor(p1 / 120), 1, 4)
end

local function getGalleryItemSize(p1, p2)
	local clampedValue = math.clamp(math.floor(p2 / 120), 1, 4)
	p2 -= 4 * (clampedValue - 1)
	local minValue = math.min(p2 / clampedValue, p2)
	
	return Vector2.new(math.floor(minValue), math.floor(minValue * p1))
end

local _ = function(p1, p2, p3)
	if p1 <= 0 then
		return 0
	end
	local floored = math.floor(p1 / p3.Y)
	
	if p1 < p3.Y * floored + (floored - 1) * 4 then
		floored -= 1
	end
	return math.max(floored * math.clamp(math.floor(p2 / 120), 1, 4), 8)
end

return function(p1)
	-- upvalues: reactModule (ref), useScreenSizeModule (ref), getGalleryItemSize (ref), dashModule (ref), view (ref), scrollView (ref), scrollBarVisibility (ref), gridView (ref), menuButtonModule (ref)
	local var1, var2 = reactModule.useState(Vector2.new(0, 0))
	local var3, var4 = reactModule.useState(0)
	local var5 = useScreenSizeModule()
	local var6 = reactModule.useCallback(function(p2)
		-- upvalues: var2 (ref)
		var2(p2.AbsoluteSize)
	end, {})
	local var7 = var1.X > 0 and var1.Y > 0
	local var8 = p1.shouldShowShowMoreButton and var3 < #p1.captures
	local clampedValue = math.clamp(var5.Y / var5.X, 0.428571428571, 1)
	local var9 = var1.Y - 12 - 40 - 36
	local var10 = var1.X - 12 - 8
	local var11 = reactModule.useMemo(function()
		-- upvalues: getGalleryItemSize (copy), clampedValue (write), var10 (ref)
		return getGalleryItemSize(clampedValue, var10)
	end, { clampedValue, var10 })
	local var12 = reactModule.useMemo(function()
		-- upvalues: var9 (ref), var10 (ref), var11 (ref)
		if var9 <= 0 then
			return 0
		end
		local floored = math.floor(var9 / var11.Y)
		
		if var9 < var11.Y * floored + (floored - 1) * 4 then
			floored -= 1
		end
		return math.max(floored * math.clamp(math.floor(var10 / 120), 1, 4), 8)
	end, { var9, var10, var11 })
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), var12 (ref), var4 (ref)
		if var3 < var12 then
			var4(var12)
		end
	end, { var1, var12, var3 })
	
	return reactModule.createElement(view, {
		BorderSizePixel = 0,
		tag = "bg-surface-0",
		onAbsoluteSizeChanged = var6,
		Position = if p1.position then p1.position else UDim2.fromOffset(0, 0),
		Size = if p1.size then p1.size else UDim2.fromScale(1, 1)
	}, {
		CaptureGridViewContainer = reactModule.createElement(view, {
			tag = "bg-action-subtle size-full gap-xsmall col align-x-center align-y-top shrink"
		}, {
			Header = p1.header,
			ScrollView = reactModule.createElement(scrollView, {
				BorderSizePixel = 0,
				tag = "auto-y size-full-0 gap-xsmall col align-x-center align-y-top shrink padding-x-xsmall",
				LayoutOrder = if p1.layoutOrder then p1.layoutOrder else 1,
				scroll = {
					AutomaticCanvasSize = Enum.AutomaticSize.Y,
					CanvasSize = UDim2.fromScale(1, 0),
					ScrollingDirection = Enum.ScrollingDirection.Y,
					scrollBarVisibility = scrollBarVisibility.Auto
				}
			}, {
				GridView = if var7 then reactModule.createElement(gridView, {
					LayoutOrder = 1,
					itemPadding = Vector2.new(4, 4),
					items = reactModule.useMemo(function()
						-- upvalues: var8 (ref), p1 (ref), var3 (ref), dashModule (copy)
						return if var8 then dashModule.slice(p1.captures, 1, math.min(#p1.captures, var3)) else p1.captures
					end, { p1.captures, var8, var3 }),
					itemSize = var11,
					renderItem = p1.renderItem
				}) else nil,
				ShowMore = if var8 then reactModule.createElement(menuButtonModule, {
					buttonHeight = 40,
					LayoutOrder = 2,
					text = "Show More",
					onActivated = reactModule.useCallback(function()
						-- upvalues: var4 (ref), var3 (ref), var12 (ref)
						var4(var3 + var12)
					end, { var3, var12 })
				}) else nil
			})
		})
	})
end