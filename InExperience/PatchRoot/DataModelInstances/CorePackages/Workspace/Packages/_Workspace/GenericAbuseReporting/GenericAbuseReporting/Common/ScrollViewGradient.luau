local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local reactModule = require(genericAbuseReporting.Parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local scrollView = foundationModule.ScrollView
local scrollBarVisibility = foundationModule.Enums.ScrollBarVisibility
local useLayerCollector = require(parent.UIBlox).Core.Layout.LayerCollector.useLayerCollector

return reactModule.forwardRef(function(p1, p2)
	-- upvalues: reactModule (ref), useLayerCollector (ref), view (ref), scrollView (ref), scrollBarVisibility (ref)
	local var1 = reactModule.useRef(nil)
	local var2, var3 = reactModule.useState(Vector2.zero)
	local var4, var5 = reactModule.useState(Vector2.zero)
	local var6, var7 = reactModule.useState(true)
	local var8, var9 = reactModule.useState(false)
	local absoluteSize = useLayerCollector().absoluteSize
	reactModule.useLayoutEffect(function()
		-- upvalues: var1 (ref), var3 (ref), var5 (ref)
		if var1.current then
			var3(var1.current.AbsoluteCanvasSize)
			var5(var1.current.AbsoluteWindowSize)
			local var10 = var1.current:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(function()
				-- upvalues: var3 (copy), var1 (copy)
				var3(var1.current.AbsoluteCanvasSize)
			end)
			local var11 = var1.current:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(function()
				-- upvalues: var5 (copy), var1 (copy)
				var5(var1.current.AbsoluteWindowSize)
			end)
			
			return function()
				-- upvalues: var10 (ref), var11 (ref)
				var10:Disconnect()
				var11:Disconnect()
			end
		end
		return function() end
	end, { var1.current, absoluteSize })
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), var2 (ref), var4 (ref), var7 (ref), var9 (ref)
		if var1.current then
			local var10 = var1.current:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
				-- upvalues: var1 (copy), var2 (copy), var4 (copy), var7 (copy), var9 (copy)
				local canvasPosition = var1.current.CanvasPosition
				
				if var2.Y == var4.Y then
					var7(true)
					var9(true)
					
					return
				elseif canvasPosition.Y <= 0 then
					var7(true)
					
					return
				elseif var2.Y - var4.Y <= canvasPosition.Y then
					var9(true)
					
					return
				end
				var7(false)
				var9(false)
			end)
			
			return function()
				-- upvalues: var10 (ref)
				var10:Disconnect()
			end
		end
		return function() end
	end, { var1.current, absoluteSize, var2, var4 })
	
	return reactModule.createElement(view, { tag = "size-full" }, {
		TopGradient = reactModule.createElement(view, {
			ZIndex = 2,
			Size = UDim2.new(1, -15, 0, p1.gradientHeight),
			tag = if not var6 then "bg-surface-300" else nil
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
			Position = UDim2.new(0, 0, 1, -p1.gradientHeight),
			Size = UDim2.new(1, -15, 0, p1.gradientHeight),
			tag = if not var8 then "bg-surface-300" else nil
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
			Size = p1.Size or UDim2.new(1, 0, 1, 0),
			ZIndex = p1.ZIndex,
			scroll = {
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				CanvasSize = UDim2.fromOffset(0, 0),
				scrollBarVisibility = scrollBarVisibility.Always,
				ScrollingDirection = Enum.ScrollingDirection.Y
			},
			scrollingFrameRef = var1,
			ref = p2
		}, p1.children)
	})
end)