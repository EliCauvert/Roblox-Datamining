local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local reactModule = require(genericAbuseReporting.Parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local scrollView = foundationModule.ScrollView
local scrollBarVisibility = foundationModule.Enums.ScrollBarVisibility
local useLayerCollector = require(parent.UIBlox).Core.Layout.LayerCollector.useLayerCollector

return reactModule.forwardRef(function(p0, p1) --[[ line: 21 ]]
	-- upvalues: reactModule (ref), useLayerCollector (ref), view (ref), scrollView (ref), scrollBarVisibility (ref)
	local var3 = reactModule.useRef(nil)
	local var4, var5 = reactModule.useState(Vector2.zero)
	local var6, var7 = reactModule.useState(Vector2.zero)
	local var8, var9 = reactModule.useState(true)
	local var10, var11 = reactModule.useState(false)
	local absoluteSize = useLayerCollector().absoluteSize
	reactModule.useLayoutEffect(function() --[[ line: 30 ]]
		-- upvalues: var3 (ref), var5 (ref), var7 (ref)
		if var3.current then
			var5(var3.current.AbsoluteCanvasSize)
			var7(var3.current.AbsoluteWindowSize)
			local var12 = var3.current:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(function() --[[ line: 37 ]]
				-- upvalues: var5 (copy), var3 (copy)
				var5(var3.current.AbsoluteCanvasSize)
			end)
			local var13 = var3.current:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(function() --[[ line: 42 ]]
				-- upvalues: var7 (copy), var3 (copy)
				var7(var3.current.AbsoluteWindowSize)
			end)
			
			return function() --[[ line: 46 ]]
				-- upvalues: var12 (ref), var13 (ref)
				var12:Disconnect()
				var13:Disconnect()
			end
		end
		return function() --[[ line: 51 ]] end
	end, { var3.current, absoluteSize })
	reactModule.useEffect(function() --[[ line: 54 ]]
		-- upvalues: var3 (ref), var4 (ref), var6 (ref), var9 (ref), var11 (ref)
		if var3.current then
			local var14 = var3.current:GetPropertyChangedSignal("CanvasPosition"):Connect(function() --[[ line: 56 ]]
				-- upvalues: var3 (copy), var4 (copy), var6 (copy), var9 (copy), var11 (copy)
				local canvasPosition = var3.current.CanvasPosition
				
				if var4.Y == var6.Y then
					var9(true)
					var11(true)
					
					return
				elseif canvasPosition.Y <= 0 then
					var9(true)
					
					return
				elseif var4.Y - var6.Y <= canvasPosition.Y then
					var11(true)
					
					return
				end
				var9(false)
				var11(false)
			end)
			
			return function() --[[ line: 71 ]]
				-- upvalues: var14 (ref)
				var14:Disconnect()
			end
		end
		return function() --[[ line: 75 ]] end
	end, { var3.current, absoluteSize, var4, var6 })
	
	return reactModule.createElement(view, { tag = "size-full" }, {
		TopGradient = reactModule.createElement(view, {
			ZIndex = 2,
			Size = UDim2.new(1, -15, 0, p0.gradientHeight),
			tag = if not var8 then "bg-surface-300" else nil
		}, {
			UIGradient = reactModule.createElement("UIGradient", {
				Rotation = 90,
				Transparency = NumberSequence.new({
					NumberSequenceKeypoint.new(0, 0),
					NumberSequenceKeypoint.new(1, 1)
				})
			})
		}),
		BottomGradient = reactModule.createElement(view, {
			ZIndex = 2,
			Position = UDim2.new(0, 0, 1, -p0.gradientHeight),
			Size = UDim2.new(1, -15, 0, p0.gradientHeight),
			tag = if not var10 then "bg-surface-300" else nil
		}, {
			UIGradient = reactModule.createElement("UIGradient", {
				Rotation = 270,
				Transparency = NumberSequence.new({
					NumberSequenceKeypoint.new(0, 0),
					NumberSequenceKeypoint.new(1, 1)
				})
			})
		}),
		ScrollView = reactModule.createElement(scrollView, {
			Size = p0.Size or UDim2.new(1, 0, 1, 0),
			ZIndex = p0.ZIndex,
			scroll = {
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				CanvasSize = UDim2.fromOffset(0, 0),
				scrollBarVisibility = scrollBarVisibility.Always,
				ScrollingDirection = Enum.ScrollingDirection.Y
			},
			scrollingFrameRef = var3,
			ref = p1
		}, p0.children)
	})
end)