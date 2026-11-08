local Parent = script.Parent
local ReactModule = require(Parent.Parent.React)
local ThemeBackgroundFillModule = require(Parent.ThemeBackgroundFill)

return function(p1)
	-- upvalues: ReactModule (copy), ThemeBackgroundFillModule (copy)
	local ClipRight = p1.clipRight
	local Overscan = p1.overscan
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(0)
	local UseRefResult = ReactModule.useRef(nil)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy), UseBindingResult (copy), ClipRight (copy), UseBindingResult2 (copy)
		local Current = UseRefResult.current
		
		if Current == nil then return end
		local Value = UseBindingResult:getValue()
		local NewX = Current.AbsoluteSize.X + Value
		local ClampedValue = math.clamp(Current.AbsolutePosition.X + NewX - ClipRight, 0, NewX)
		
		if ClampedValue ~= Value then
			UseBindingResult2(ClampedValue)
		end
	end, { UseBindingResult, ClipRight })
	local UseResult1 = ReactModule.useCallback(function(Current)
		-- upvalues: UseRefResult (copy), UseResult (copy)
		UseRefResult.current = Current
		UseResult()
	end, { UseResult })
	ReactModule.useLayoutEffect(UseResult, { UseResult })
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		Position = UDim2.fromOffset(-Overscan, -Overscan),
		Size = UseBindingResult:map(function(p2): UDim2
			-- upvalues: Overscan (copy)
			return UDim2.new(1, Overscan * 2 - p2, 1, Overscan * 2)
		end),
		ZIndex = 0,
		ref = UseResult1,
		[ReactModule.Change.AbsolutePosition] = UseResult,
		[ReactModule.Change.AbsoluteSize] = UseResult
	}, {
		ThemeBackground = ReactModule.createElement(ThemeBackgroundFillModule, {
			image = p1.image,
			baseColor = p1.baseColor,
			onPageChanged = p1.onPageChanged,
			Size = UseBindingResult:map(function(XOffset): UDim2
				return UDim2.new(1, XOffset, 1, 0)
			end)
		})
	})
end