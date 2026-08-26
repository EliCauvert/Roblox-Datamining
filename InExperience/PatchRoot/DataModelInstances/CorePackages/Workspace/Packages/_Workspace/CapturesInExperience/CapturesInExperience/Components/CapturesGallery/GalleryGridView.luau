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

local function _(p1)
	return math.clamp(math.floor(p1 / 120), 1, 4)
end

local _ = function(p1, p2)
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

local function renderGalleryItem(p1, p2)
	-- upvalues: reactModule (ref), galleryItemModule (ref)
	return reactModule.createElement(galleryItemModule, { capture = p1, captureIndex = p2 })
end

return function(p1)
	-- upvalues: reactModule (ref), useScreenSize (ref), useEffectOnce (ref), dashModule (ref), galleryActionContainerModule (ref), gridView (ref), renderGalleryItem (ref), showMoreButtonModule (ref)
	local var1
	local var2, var3 = reactModule.useState(Vector2.new(0, 0))
	local var4, var5 = reactModule.useState(0)
	local var6 = useScreenSize()
	local var7 = var4 < #p1.captures
	local var8 = var2.X > 0 and var2.Y > 0
	local var9 = reactModule.useCallback(function(p2)
		-- upvalues: var3 (ref)
		var3(p2.AbsoluteSize)
	end, {})
	local clampedValue = math.clamp(var6.Y / var6.X, 0.428571428571, 1)
	local var10 = var2.Y - 12 - 40 - 36
	local x = var2.X
	local var11 = clampedValue
	local clampedValue_1 = math.clamp(math.floor(x / 120), 1, 4)
	local var12 = x - 4 * (clampedValue_1 - 1)
	local minValue = math.min(var12 / clampedValue_1, var12)
	local vector2 = Vector2.new(math.floor(minValue), math.floor(minValue * var11))
	local var13 = vector2
	
	if var10 <= 0 then
		var1 = 0
	else
		local floored = math.floor(var10 / var13.Y)
		
		if var10 < var13.Y * floored + (floored - 1) * 4 then
			floored -= 1
		end
		var1 = math.max(floored * math.clamp(math.floor(x / 120), 1, 4), 8)
	end
	if var1 < var4 then
		x -= 9
		local clampedValue_2 = math.clamp(math.floor(x / 120), 1, 4)
		local var14 = x - 4 * (clampedValue_2 - 1)
		local minValue_1 = math.min(var14 / clampedValue_2, var14)
		vector2 = Vector2.new(math.floor(minValue_1), math.floor(minValue_1 * clampedValue))
		local var15 = x
		local var16 = vector2
		
		if var10 <= 0 then
			var1 = 0
		else
			local floored = math.floor(var10 / var16.Y)
			
			if var10 < var16.Y * floored + (floored - 1) * 4 then
				floored -= 1
			end
			var1 = math.max(floored * math.clamp(math.floor(var15 / 120), 1, 4), 8)
		end
	end
	useEffectOnce(function()
		-- upvalues: var5 (ref), var1 (write)
		var5(var1)
	end, var1 ~= 0)
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), var1 (write), var5 (ref)
		if var4 < var1 then
			var5(var1)
		end
	end, { var2 })
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = p1.LayoutOrder,
		Size = p1.Size or UDim2.fromScale(1, 1),
		[reactModule.Change.AbsoluteSize] = var9
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
			itemCount = #p1.captures
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
			GridView = var8 and reactModule.createElement(gridView, {
				LayoutOrder = 1,
				itemPadding = Vector2.new(4, 4),
				items = reactModule.useMemo(function()
					-- upvalues: p1 (ref), var4 (ref), dashModule (copy)
					return dashModule.slice(p1.captures, 1, math.min(#p1.captures, var4))
				end, { p1.captures, var4 }),
				itemSize = vector2,
				renderItem = renderGalleryItem
			}),
			ShowMoreButton = var7 and reactModule.createElement(showMoreButtonModule, {
				LayoutOrder = 2,
				buttonHeight = 40,
				onActivated = reactModule.useCallback(function()
					-- upvalues: var5 (ref), var4 (ref), var1 (write)
					var5(var4 + var1)
				end, { var4, var1 })
			})
		})
	})
end