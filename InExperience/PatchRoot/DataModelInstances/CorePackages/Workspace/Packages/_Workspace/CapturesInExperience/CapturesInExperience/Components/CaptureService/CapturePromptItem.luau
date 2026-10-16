local Parent = script.Parent.Parent.Parent.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Checkbox = FoundationModule.Checkbox
local View = FoundationModule.View
local GetCropSizeFunction = require(Parent.CapturesCommon).Utils.getCropSize

return function(p1) --[[ Line: 20 ]]
	-- upvalues: ReactModule (copy), View (copy), FoundationModule (copy), Checkbox (copy), GetCropSizeFunction (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(Vector2.new(0, 0))
	local UseRefResult = ReactModule.useRef(nil)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(Vector2.new(0, 0))
	local UseResult = ReactModule.useCallback(function() --[[ Line: 25 ]]
		-- upvalues: p1 (copy)
		p1.updateSelected(not p1.isSelected)
	end, { p1.isSelected, p1.updateSelected })
	local UseResult1 = ReactModule.useCallback(function(Frame) --[[ Line: 29 ]]
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(Frame.AbsoluteSize)
	end, {})
	local UseResult2 = ReactModule.useCallback(function(Current) --[[ Line: 33 ]]
		-- upvalues: UseRefResult (copy), UseStateResult2_1 (copy)
		UseRefResult.current = Current
		UseStateResult2_1(Current.Resolution)
	end, {})
	ReactModule.useEffect(function() --[[ Line: 38 ]]
		-- upvalues: UseRefResult (copy)
		return function() --[[ Line: 39 ]]
			-- upvalues: UseRefResult (upval)
			if UseRefResult.current then
				UseRefResult.current.Video = ""
			end
		end
	end, {})
	local IsVideoCapture = typeof(p1.content) == "Content" and (p1.content.Object ~= nil and p1.content.Object:IsA("VideoCapture"))
	
	return ReactModule.createElement(View, {
		tag = "clip size-full",
		onAbsoluteSizeChanged = UseResult1
	}, {
		CheckboxOverlay = if p1.showCheckbox then ReactModule.createElement(View, {
			tag = "size-full padding-small",
			ZIndex = 2,
			onActivated = UseResult,
			stateLayer = {
				affordance = FoundationModule.Enums.StateLayerAffordance.None
			}
		}, {
			Checkbox = ReactModule.createElement(Checkbox, {
				label = "",
				AnchorPoint = Vector2.new(1, 0),
				isChecked = p1.isSelected,
				onActivated = UseResult,
				Position = UDim2.fromScale(1, 0)
			})
		}) else nil,
		Image = if IsVideoCapture then nil else ReactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(0.5, 0.5),
			ImageContent = p1.content,
			Position = UDim2.fromScale(0.5, 0.5),
			ScaleType = Enum.ScaleType.Crop,
			Size = UDim2.fromScale(1, 1)
		}),
		Video = if IsVideoCapture then ReactModule.createElement("VideoFrame", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundTransparency = 1,
			Looped = true,
			Playing = true,
			Position = UDim2.fromScale(0.5, 0.5),
			Size = GetCropSizeFunction(UseStateResult, UseStateResult1),
			VideoContent = p1.content,
			Volume = 0,
			[ReactModule.Event.Loaded] = UseResult2
		}) else nil
	})
end