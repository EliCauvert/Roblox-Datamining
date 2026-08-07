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

local function _(p0) --[[ line: 41 | named "getItemsPerRow" ]]
	return math.clamp(math.floor(p0 / 120), 1, 4)
end

local function getGalleryItemSize(p1, p2) --[[ line: 45 ]]
	local clampedValue = math.clamp(math.floor(p2 / 120), 1, 4)
	p2 -= 4 * (clampedValue - 1)
	local minValue = math.min(p2 / clampedValue, p2)
	
	return Vector2.new(math.floor(minValue), math.floor(minValue * p1))
end

local _ = function(p3, p4, p5) --[[ line: 55 | named "getItemsPerPage" ]]
	if p3 <= 0 then
		return 0
	end
	local floored = math.floor(p3 / p5.Y)
	
	if p3 < p5.Y * floored + (floored - 1) * 4 then
		floored -= 1
	end
	return math.max(floored * math.clamp(math.floor(p4 / 120), 1, 4), 8)
end

return function(p6) --[[ line: 70 ]]
	-- upvalues: reactModule (ref), useScreenSizeModule (ref), getGalleryItemSize (ref), dashModule (ref), view (ref), scrollView (ref), scrollBarVisibility (ref), gridView (ref), menuButtonModule (ref)
	local var9, var10 = reactModule.useState(Vector2.new(0, 0))
	local var11, var12 = reactModule.useState(0)
	local var13 = useScreenSizeModule()
	local var14 = reactModule.useCallback(function(p7) --[[ line: 75 ]]
		-- upvalues: var10 (ref)
		var10(p7.AbsoluteSize)
	end, {})
	local var15 = var9.X > 0 and var9.Y > 0
	local var16 = p6.shouldShowShowMoreButton and var11 < #p6.captures
	local clampedValue = math.clamp(var13.Y / var13.X, 0.428571428571, 1)
	local var18 = var9.Y - 12 - 40 - 36
	local var19 = var9.X - 12 - 8
	local var20 = reactModule.useMemo(function() --[[ line: 89 ]]
		-- upvalues: getGalleryItemSize (copy), clampedValue (write), var19 (ref)
		return getGalleryItemSize(clampedValue, var19)
	end, { clampedValue, var19 })
	local var21 = reactModule.useMemo(function() --[[ line: 93 ]]
		-- upvalues: var18 (ref), var19 (ref), var20 (ref)
		if var18 <= 0 then
			return 0
		end
		local floored = math.floor(var18 / var20.Y)
		
		if var18 < var20.Y * floored + (floored - 1) * 4 then
			floored -= 1
		end
		return math.max(floored * math.clamp(math.floor(var19 / 120), 1, 4), 8)
	end, { var18, var19, var20 })
	reactModule.useEffect(function() --[[ line: 97 ]]
		-- upvalues: var11 (ref), var21 (ref), var12 (ref)
		if var11 < var21 then
			var12(var21)
		end
	end, { var9, var21, var11 })
	
	return reactModule.createElement(view, {
		BorderSizePixel = 0,
		tag = "bg-surface-0",
		onAbsoluteSizeChanged = var14,
		Position = if p6.position then p6.position else UDim2.fromOffset(0, 0),
		Size = if p6.size then p6.size else UDim2.fromScale(1, 1)
	}, {
		CaptureGridViewContainer = reactModule.createElement(view, {
			tag = "bg-action-subtle size-full gap-xsmall col align-x-center align-y-top shrink"
		}, {
			Header = p6.header,
			ScrollView = reactModule.createElement(scrollView, {
				BorderSizePixel = 0,
				tag = "auto-y size-full-0 gap-xsmall col align-x-center align-y-top shrink padding-x-xsmall",
				LayoutOrder = if p6.layoutOrder then p6.layoutOrder else 1,
				scroll = {
					AutomaticCanvasSize = Enum.AutomaticSize.Y,
					CanvasSize = UDim2.fromScale(1, 0),
					ScrollingDirection = Enum.ScrollingDirection.Y,
					scrollBarVisibility = scrollBarVisibility.Auto
				}
			}, {
				GridView = if var15 then reactModule.createElement(gridView, {
					LayoutOrder = 1,
					itemPadding = Vector2.new(4, 4),
					items = reactModule.useMemo(function() --[[ line: 107 ]]
						-- upvalues: var16 (ref), p6 (ref), var11 (ref), dashModule (copy)
						return if var16 then dashModule.slice(p6.captures, 1, math.min(#p6.captures, var11)) else p6.captures
					end, { p6.captures, var16, var11 }),
					itemSize = var20,
					renderItem = p6.renderItem
				}) else nil,
				ShowMore = if var16 then reactModule.createElement(menuButtonModule, {
					buttonHeight = 40,
					LayoutOrder = 2,
					text = "Show More",
					onActivated = reactModule.useCallback(function() --[[ line: 103 ]]
						-- upvalues: var12 (ref), var11 (ref), var21 (ref)
						var12(var11 + var21)
					end, { var11, var21 })
				}) else nil
			})
		})
	})
end