local graphing = script:FindFirstAncestor("Graphing")
local reactModule = require(graphing.Parent.React)
local _ = require(graphing.Types)
local canvasContextModule = require(graphing.CanvasContext)
local mathUtilModule = require(graphing.Util.MathUtil)

function InputDetector(p1)
	-- upvalues: reactModule (ref), canvasContextModule (ref), mathUtilModule (ref)
	local var1 = reactModule.useContext(canvasContextModule)
	local inflate = p1.Inflate or 0
	local var2, var3 = reactModule.useState(false)
	local _, var4 = reactModule.useState(false)
	local var5, var6 = reactModule.useState(false)
	local var7, var8 = reactModule.useState(false)
	local var9, var10 = reactModule.useState(Vector2.zero)
	local var11 = reactModule.useCallback(function(p2)
		-- upvalues: p1 (ref), mathUtilModule (copy)
		local x = p2.X
		local y = p2.Y
		
		if p1.XSnap then
			x = mathUtilModule.roundToNearest(x, p1.XSnap)
		end
		if p1.YSnap then
			y = mathUtilModule.roundToNearest(y, p1.YSnap)
		end
		return Vector2.new(x, y)
	end, { p1.XSnap, p1.YSnap })
	
	return reactModule.createElement("Frame", {
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		Size = UDim2.new(1, inflate * 2, 1, inflate * 2),
		BackgroundTransparency = if p1.DebugColor3 ~= nil then 1 else 0,
		BackgroundColor3 = p1.DebugColor3,
		BorderSizePixel = 0,
		ZIndex = p1.ZIndex,
		[reactModule.Event.InputBegan] = reactModule.useCallback(function(_, p2)
			-- upvalues: var11 (ref), var1 (ref), var3 (ref), p1 (ref), var6 (ref), var8 (ref)
			local var12 = var11(var1.mouseToPlot(p2.Position))
			
			if p2.UserInputType == Enum.UserInputType.MouseMovement then
				var3(true)
				
				if p1.OnHoverStart then
					p1.OnHoverStart(var1.mouseToPlot(p2.Position), p2)
					
					return
				end
			elseif p2.UserInputType == Enum.UserInputType.MouseButton1 or p2.UserInputType == Enum.UserInputType.Touch then
				var6(false)
				
				if p1.OnPress then
					p1.OnPress(var12, p2)
					
					return
				end
			elseif p2.UserInputType == Enum.UserInputType.MouseButton2 then
				var8(false)
				
				if p1.OnRightPress then
					p1.OnRightPress(var12, p2)
				end
			end
		end, {
			var3, var6, var8, var1, p1.OnHoverStart, p1.OnPress, p1.OnRightPress, var11
		}),
		[reactModule.Event.InputChanged] = reactModule.useCallback(function(_, p2)
			-- upvalues: p1 (ref), var2 (ref), var11 (ref), var1 (ref)
			if p1.OnHoverMoved and var2 and p2.UserInputType == Enum.UserInputType.MouseMovement then
				p1.OnHoverMoved(var11(var1.mouseToPlot(p2.Position)), p2)
				
				return
			elseif p1.OnScroll and p2.UserInputType == Enum.UserInputType.MouseWheel then
				p1.OnScroll(p2.Position.Z, p2)
			end
		end, {
			var2,
			var1,
			p1.OnHoverMoved,
			p1.OnScroll,
			var11
		}),
		[reactModule.Event.InputEnded] = reactModule.useCallback(function(_, p2)
			-- upvalues: var11 (ref), var1 (ref), var3 (ref), p1 (ref), var2 (ref), var5 (ref), var7 (ref)
			local var12 = var11(var1.mouseToPlot(p2.Position))
			
			if p2.UserInputType == Enum.UserInputType.MouseMovement then
				var3(false)
				
				if p1.OnHoverEnded then
					p1.OnHoverEnded(var12, p2)
					
					return
				end
			elseif p2.UserInputType == Enum.UserInputType.MouseButton1 or p2.UserInputType == Enum.UserInputType.Touch then
				if p1.OnRelease then
					p1.OnRelease(var12, p2)
				end
				if p1.OnClick and var2 and not var5 then
					p1.OnClick(var12, p2)
					
					return
				end
			elseif p2.UserInputType == Enum.UserInputType.MouseButton2 then
				if p1.OnRightRelease then
					p1.OnRightRelease(var12, p2)
				end
				if p1.OnRightClick and var2 and not var7 then
					p1.OnRightClick(var12, p2)
				end
			end
		end, {
			var3, var2, var5, var7, var1, p1.OnHoverEnded, p1.OnClick, p1.OnRightClick,
			p1.OnRelease, p1.OnRightRelease, var11
		})
	}, {
		DragDetector = reactModule.createElement("UIDragDetector", {
			DragStyle = Enum.UIDragDetectorDragStyle.Scriptable,
			ReferenceUIInstance = var1.getViewport(),
			[reactModule.Event.DragStart] = reactModule.useCallback(function(p2, p3)
				-- upvalues: var4 (ref), p1 (ref), var1 (ref), var10 (ref), var11 (ref)
				var4(true)
				local zero = Vector2.zero
				local var12 = if p2.Parent then p2.Parent.Parent else nil
				
				if var12 and var12:IsA("GuiObject") then
					zero = var12.AbsolutePosition + var12.AbsoluteSize * (p1.AnchorPoint or var12.AnchorPoint)
				end
				local var13 = if p1.TreatMouseAsAnchor then Vector2.zero else var1.absToView(p3) - var1.absToView(zero)
				var10(var13)
				
				if p1.OnDragStart then
					local var14 = var1.absToView(p3) - var13
					p1.OnDragStart(var11(var1.viewToPlot(Vector2.new(math.clamp(var14.X, 0, 1), math.clamp(var14.Y, 0, 1)))), p3)
				end
			end, {
				var1, var10, var4, p1.OnDragStart, p1.AnchorPoint, p1.TreatMouseAsAnchor, var11
			}),
			[reactModule.Event.DragContinue] = reactModule.useCallback(function(_, p2)
				-- upvalues: var6 (ref), var8 (ref), p1 (ref), var1 (ref), var9 (ref), var11 (ref)
				var6(true)
				var8(true)
				
				if p1.OnDragMoved then
					local var12 = var1.absToView(p2) - var9
					p1.OnDragMoved(var11(var1.viewToPlot(Vector2.new(math.clamp(var12.X, 0, 1), math.clamp(var12.Y, 0, 1)))), p2)
				end
			end, {
				var1, var6, var8, var9, p1.OnDragMoved, var11
			}),
			[reactModule.Event.DragEnd] = reactModule.useCallback(function(_, p2)
				-- upvalues: var4 (ref), p1 (ref), var1 (ref), var9 (ref), var11 (ref)
				var4(false)
				
				if p1.OnDragEnded then
					local var12 = var1.absToView(p2) - var9
					p1.OnDragEnded(var11(var1.viewToPlot(Vector2.new(math.clamp(var12.X, 0, 1), math.clamp(var12.Y, 0, 1)))), p2)
				end
			end, {
				var1,
				var4,
				p1.OnDragEnded,
				var9,
				var11
			})
		})
	})
end

return InputDetector