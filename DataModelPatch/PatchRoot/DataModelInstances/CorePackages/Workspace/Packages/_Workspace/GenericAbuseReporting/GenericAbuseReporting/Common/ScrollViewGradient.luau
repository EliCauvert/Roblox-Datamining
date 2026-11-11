local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local Parent = GenericAbuseReporting.Parent
local ReactModule = require(GenericAbuseReporting.Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local ScrollView = FoundationModule.ScrollView
local ScrollBarVisibility = FoundationModule.Enums.ScrollBarVisibility
local UseLayerCollectorFunction = require(Parent.UIBlox).Core.Layout.LayerCollector.useLayerCollector

return (ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: ReactModule (copy), UseLayerCollectorFunction (copy), View (copy), ScrollView (copy), ScrollBarVisibility (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseStateResult, UseStateResult2 = ReactModule.useState(Vector2.zero)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(Vector2.zero)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(true)
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(false)
	local AbsoluteSize = UseLayerCollectorFunction().absoluteSize
	ReactModule.useLayoutEffect(function()
		-- upvalues: UseRefResult (copy), UseStateResult2 (copy), UseStateResult2_1 (copy)
		if UseRefResult.current then
			UseStateResult2(UseRefResult.current.AbsoluteCanvasSize)
			UseStateResult2_1(UseRefResult.current.AbsoluteWindowSize)
			local Connection = UseRefResult.current:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(function()
				-- upvalues: UseStateResult2 (upval), UseRefResult (upval)
				UseStateResult2(UseRefResult.current.AbsoluteCanvasSize)
			end)
			local Connection1 = UseRefResult.current:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(function()
				-- upvalues: UseStateResult2_1 (upval), UseRefResult (upval)
				UseStateResult2_1(UseRefResult.current.AbsoluteWindowSize)
			end)
			
			return function()
				-- upvalues: Connection (copy), Connection1 (copy)
				Connection:Disconnect()
				Connection1:Disconnect()
			end
		else
			return function() end
		end
	end, { UseRefResult.current, AbsoluteSize })
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), UseStateResult (copy), UseStateResult1 (copy), UseStateResult2_2 (copy), UseStateResult2_3 (copy)
		if UseRefResult.current then
			local Connection = UseRefResult.current:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
				-- upvalues: UseRefResult (upval), UseStateResult (upval), UseStateResult1 (upval), UseStateResult2_2 (upval), UseStateResult2_3 (upval)
				local CanvasPosition = UseRefResult.current.CanvasPosition
				
				if UseStateResult.Y == UseStateResult1.Y then
					UseStateResult2_2(true)
					UseStateResult2_3(true)
					
					return
				end
				if CanvasPosition.Y <= 0 then
					UseStateResult2_2(true)
					
					return
				end
				if UseStateResult.Y - UseStateResult1.Y <= CanvasPosition.Y then
					UseStateResult2_3(true)
					
					return
				else
					UseStateResult2_2(false)
					UseStateResult2_3(false)
				end
			end)
			
			return function()
				-- upvalues: Connection (copy)
				Connection:Disconnect()
			end
		else
			return function() end
		end
	end, {
		UseRefResult.current,
		AbsoluteSize,
		UseStateResult,
		UseStateResult1
	})
	
	return ReactModule.createElement(View, { tag = "size-full" }, {
		TopGradient = ReactModule.createElement(View, {
			ZIndex = 2,
			Size = UDim2.new(1, -15, 0, p1.gradientHeight),
			tag = if UseStateResult3 then nil else "bg-surface-300"
		}, {
			UIGradient = ReactModule.createElement("UIGradient", {
				Rotation = 90,
				Transparency = NumberSequence.new({
					NumberSequenceKeypoint.new(0, 0),
					NumberSequenceKeypoint.new(1, 1)
				})
			})
		}),
		BottomGradient = ReactModule.createElement(View, {
			ZIndex = 2,
			Position = UDim2.new(0, 0, 1, -p1.gradientHeight),
			Size = UDim2.new(1, -15, 0, p1.gradientHeight),
			tag = if UseStateResult4 then nil else "bg-surface-300"
		}, {
			UIGradient = ReactModule.createElement("UIGradient", {
				Rotation = 270,
				Transparency = NumberSequence.new({
					NumberSequenceKeypoint.new(0, 0),
					NumberSequenceKeypoint.new(1, 1)
				})
			})
		}),
		ScrollView = ReactModule.createElement(ScrollView, {
			Size = p1.Size or UDim2.new(1, 0, 1, 0),
			ZIndex = p1.ZIndex,
			scroll = {
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				CanvasSize = UDim2.fromOffset(0, 0),
				scrollBarVisibility = ScrollBarVisibility.Always,
				ScrollingDirection = Enum.ScrollingDirection.Y
			},
			scrollingFrameRef = UseRefResult,
			ref = Ref
		}, p1.children)
	})
end))