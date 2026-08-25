local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local dashModule = require(parent_1.Dash)
local reactModule = require(parent_1.React)
local roactUtilsModule = require(parent_1.RoactUtils)
local robloxAppHooksModule = require(parent_1.RobloxAppHooks)
local UIBloxModule = require(parent_1.UIBlox)
local useEffectOnce = roactUtilsModule.Hooks.useEffectOnce
local useScreenSize = robloxAppHooksModule.useScreenSize
local gridView = UIBloxModule.App.Grid.GridView
local galleryActionContainerModule = require(parent.Components.CapturesGallery.GalleryActionContainer)
local galleryItemModule = require(parent.Components.CapturesGallery.GalleryItem)
local showMoreButtonModule = require(parent.Components.Common.ShowMoreButton)
local _ = require(parent.Types)

local function _(p0)
	return math.clamp(math.floor(p0 / 120), 1, 4)
end

local _ = function(p1, p2)
	local clampedValue = math.clamp(math.floor(p2 / 120), 1, 4)
	p2 -= 4 * (clampedValue - 1)
	local minValue = math.min(p2 / clampedValue, p2)
	
	return Vector2.new(math.floor(minValue), math.floor(minValue * p1))
end

local _ = function(p3, p4, p5)
	if p3 <= 0 then
		return 0
	end
	local floored = math.floor(p3 / p5.Y)
	
	if p3 < p5.Y * floored + (floored - 1) * 4 then
		floored -= 1
	end
	return math.max(floored * math.clamp(math.floor(p4 / 120), 1, 4), 8)
end

local function renderGalleryItem(p6, p7)
	-- upvalues: reactModule (ref), galleryItemModule (ref)
	return reactModule.createElement(galleryItemModule, { capture = p6, captureIndex = p7 })
end

return function(p8)
	-- upvalues: reactModule (ref), useScreenSize (ref), useEffectOnce (ref), dashModule (ref), galleryActionContainerModule (ref), gridView (ref), renderGalleryItem (ref), showMoreButtonModule (ref)
	local var28
	local var12, var13 = reactModule.useState(Vector2.new(0, 0))
	local var14, var15 = reactModule.useState(0)
	local var16 = useScreenSize()
	local var17 = var14 < #p8.captures
	local var18 = var12.X > 0 and var12.Y > 0
	local var19 = reactModule.useCallback(function(p9)
		-- upvalues: var13 (ref)
		var13(p9.AbsoluteSize)
	end, {})
	local clampedValue = math.clamp(var16.Y / var16.X, 0.428571428571, 1)
	local var21 = var12.Y - 12 - 40 - 36
	local x = var12.X
	local var22 = clampedValue
	local clampedValue_1 = math.clamp(math.floor(x / 120), 1, 4)
	local var24 = x - 4 * (clampedValue_1 - 1)
	local minValue = math.min(var24 / clampedValue_1, var24)
	local vector2 = Vector2.new(math.floor(minValue), math.floor(minValue * var22))
	local var27 = vector2
	
	if var21 <= 0 then
		var28 = 0
	else
		local floored = math.floor(var21 / var27.Y)
		
		if var21 < var27.Y * floored + (floored - 1) * 4 then
			floored -= 1
		end
		var28 = math.max(floored * math.clamp(math.floor(x / 120), 1, 4), 8)
	end
	if var28 < var14 then
		x -= 9
		local clampedValue_2 = math.clamp(math.floor(x / 120), 1, 4)
		local var31 = x - 4 * (clampedValue_2 - 1)
		local minValue_1 = math.min(var31 / clampedValue_2, var31)
		vector2 = Vector2.new(math.floor(minValue_1), math.floor(minValue_1 * clampedValue))
		local var33 = x
		local var34 = vector2
		
		if var21 <= 0 then
			var28 = 0
		else
			local floored = math.floor(var21 / var34.Y)
			
			if var21 < var34.Y * floored + (floored - 1) * 4 then
				floored -= 1
			end
			var28 = math.max(floored * math.clamp(math.floor(var33 / 120), 1, 4), 8)
		end
	end
	useEffectOnce(function()
		-- upvalues: var15 (ref), var28 (write)
		var15(var28)
	end, var28 ~= 0)
	reactModule.useEffect(function()
		-- upvalues: var14 (ref), var28 (write), var15 (ref)
		if var14 < var28 then
			var15(var28)
		end
	end, { var12 })
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = p8.LayoutOrder,
		Size = p8.Size or UDim2.fromScale(1, 1),
		[reactModule.Change.AbsoluteSize] = var19
	}, {
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Top
		}),
		GalleryActionContainer = reactModule.createElement(galleryActionContainerModule, {
			isDisabled = false,
			LayoutOrder = 1,
			itemCount = #p8.captures
		}),
		ScrollingFrame = reactModule.createElement("ScrollingFrame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = 2,
			ScrollBarThickness = 1,
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			CanvasSize = UDim2.fromScale(1, 0),
			ScrollingDirection = Enum.ScrollingDirection.Y,
			Size = UDim2.new(1, 0, 1, -36)
		}, {
			UIListLayout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Top,
				Padding = UDim.new(0, 12)
			}),
			GridView = var18 and reactModule.createElement(gridView, {
				LayoutOrder = 1,
				itemPadding = Vector2.new(4, 4),
				items = reactModule.useMemo(function()
					-- upvalues: p8 (ref), var14 (ref), dashModule (copy)
					return dashModule.slice(p8.captures, 1, math.min(#p8.captures, var14))
				end, { p8.captures, var14 }),
				itemSize = vector2,
				renderItem = renderGalleryItem
			}),
			ShowMoreButton = var17 and reactModule.createElement(showMoreButtonModule, {
				LayoutOrder = 2,
				buttonHeight = 40,
				onActivated = reactModule.useCallback(function()
					-- upvalues: var15 (ref), var14 (ref), var28 (write)
					var15(var14 + var28)
				end, { var14, var28 })
			})
		})
	})
end