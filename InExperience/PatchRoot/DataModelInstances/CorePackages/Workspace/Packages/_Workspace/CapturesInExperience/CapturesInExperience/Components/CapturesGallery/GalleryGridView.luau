local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local DashModule = require(Parent1.Dash)
local ReactModule = require(Parent1.React)
local UseEffectOnceFunction = require(Parent1.RoactUtils).Hooks.useEffectOnce
local UseScreenSizeFunction = require(Parent1.RobloxAppHooks).useScreenSize
local GridView = require(Parent1.UIBlox).App.Grid.GridView
local GalleryActionContainerModule = require(Parent.Components.CapturesGallery.GalleryActionContainer)
local GalleryItemModule = require(Parent.Components.CapturesGallery.GalleryItem)
local ShowMoreButtonModule = require(Parent.Components.Common.ShowMoreButton)
local _ = require(Parent.Types)

local function _(p1: number): number --[[ Line: 40 | Named "getItemsPerRow" ]]
	return (math.clamp(math.floor(p1 / 120), 1, 4))
end

local _ = function(p1, p2: number): Vector2 --[[ Line: 44 | Named "getGalleryItemSize" ]]
	local ClampedValue = math.clamp(math.floor(p2 / 120), 1, 4)
	local v1 = p2 - 4 * (ClampedValue - 1)
	local Smallest = math.min(v1 / ClampedValue, v1)
	
	return Vector2.new(math.floor(Smallest), (math.floor(Smallest * p1)))
end

local _ = function(p1: number, p2: number, Vector): number --[[ Line: 54 | Named "getItemsPerPage" ]]
	if p1 <= 0 then
		return 0
	end
	local Floored = math.floor(p1 / Vector.Y)
	
	if p1 < Vector.Y * Floored + (Floored - 1) * 4 then
		Floored -= 1
	end
	return (math.max(Floored * math.clamp(math.floor(p2 / 120), 1, 4), 8))
end

local function renderGalleryItem(Capture, CaptureIndex) --[[ Line: 69 ]]
	-- upvalues: ReactModule (copy), GalleryItemModule (copy)
	return ReactModule.createElement(GalleryItemModule, { capture = Capture, captureIndex = CaptureIndex })
end

return function(Frame) --[[ Line: 76 ]]
	-- upvalues: ReactModule (copy), UseScreenSizeFunction (copy), UseEffectOnceFunction (copy), DashModule (copy), GalleryActionContainerModule (copy), GridView (copy), renderGalleryItem (copy), ShowMoreButtonModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(Vector2.new(0, 0))
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(0)
	local UseScreenSizeResult = UseScreenSizeFunction()
	local IsUseStateResultBelow = UseStateResult1 < #Frame.captures
	local IsYAbove: boolean = UseStateResult.X > 0 and UseStateResult.Y > 0
	local UseResult = ReactModule.useCallback(function(Frame) --[[ Line: 84 ]]
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(Frame.AbsoluteSize)
	end, {})
	local ClampedValue = math.clamp(UseScreenSizeResult.Y / UseScreenSizeResult.X, 0.42857142857142855, 1)
	local YDelta = UseStateResult.Y - 12 - 40 - 36
	local X: number = UseStateResult.X
	local ClampedValue1 = math.clamp(math.floor(X / 120), 1, 4)
	local XDelta = X - 4 * (ClampedValue1 - 1)
	local Smallest = math.min(XDelta / ClampedValue1, XDelta)
	local _Vector2 = Vector2.new(math.floor(Smallest), (math.floor(Smallest * ClampedValue)))
	local ItemSize: Vector2 = _Vector2
	local Largest = nil
	
	if YDelta <= 0 then
		Largest = 0
	else
		local Floored = math.floor(YDelta / ItemSize.Y)
		
		if YDelta < ItemSize.Y * Floored + (Floored - 1) * 4 then
			Floored -= 1
		end
		Largest = math.max(Floored * math.clamp(math.floor(X / 120), 1, 4), 8)
	end
	if UseStateResult1 > Largest then
		local XDelta1 = X - 9
		local ClampedValue2 = math.clamp(math.floor(XDelta1 / 120), 1, 4)
		local XDeltaDelta = XDelta1 - 4 * (ClampedValue2 - 1)
		local Smallest1 = math.min(XDeltaDelta / ClampedValue2, XDeltaDelta)
		_Vector2 = Vector2.new(math.floor(Smallest1), (math.floor(Smallest1 * ClampedValue)))
		local ItemSize1: Vector2 = _Vector2
		
		if YDelta <= 0 then
			Largest = 0
		else
			local Floored = math.floor(YDelta / ItemSize1.Y)
			
			if YDelta < ItemSize1.Y * Floored + (Floored - 1) * 4 then
				Floored -= 1
			end
			Largest = math.max(Floored * math.clamp(math.floor(XDelta1 / 120), 1, 4), 8)
		end
	end
	UseEffectOnceFunction(function() --[[ Line: 106 ]]
		-- upvalues: UseStateResult2_1 (copy), Largest (ref)
		UseStateResult2_1(Largest)
	end, Largest ~= 0)
	ReactModule.useEffect(function() --[[ Line: 110 ]]
		-- upvalues: UseStateResult1 (copy), Largest (ref), UseStateResult2_1 (copy)
		if UseStateResult1 < Largest then
			UseStateResult2_1(Largest)
		end
	end, { UseStateResult })
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 116 ]]
		-- upvalues: UseStateResult2_1 (copy), UseStateResult1 (copy), Largest (ref)
		UseStateResult2_1(UseStateResult1 + Largest)
	end, { UseStateResult1, Largest })
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 120 ]]
		-- upvalues: Frame (copy), UseStateResult1 (copy), DashModule (upval)
		return DashModule.slice(Frame.captures, 1, (math.min(#Frame.captures, UseStateResult1)))
	end, { Frame.captures, UseStateResult1 })
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = Frame.LayoutOrder,
		Size = Frame.Size or UDim2.fromScale(1, 1),
		[ReactModule.Change.AbsoluteSize] = UseResult
	}, {
		UIListLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Top
		}),
		GalleryActionContainer = ReactModule.createElement(GalleryActionContainerModule, {
			isDisabled = false,
			LayoutOrder = 1,
			itemCount = #Frame.captures
		}),
		ScrollingFrame = ReactModule.createElement("ScrollingFrame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = 2,
			ScrollBarThickness = 1,
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			CanvasSize = UDim2.fromScale(1, 0),
			ScrollingDirection = Enum.ScrollingDirection.Y,
			Size = UDim2.new(1, 0, 1, -36)
		}, {
			UIListLayout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Top,
				Padding = UDim.new(0, 12)
			}),
			GridView = IsYAbove and ReactModule.createElement(GridView, {
				LayoutOrder = 1,
				itemPadding = Vector2.new(4, 4),
				items = UseMemoResult,
				itemSize = _Vector2,
				renderItem = renderGalleryItem
			}),
			ShowMoreButton = IsUseStateResultBelow and ReactModule.createElement(ShowMoreButtonModule, {
				LayoutOrder = 2,
				buttonHeight = 40,
				onActivated = UseResult1
			})
		})
	})
end