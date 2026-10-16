local Graphing = script:FindFirstAncestor("Graphing")
local ReactModule = require(Graphing.Parent.React)
local _ = require(Graphing.Types)
local CanvasContextModule = require(Graphing.CanvasContext)
local MathUtilModule = require(Graphing.Util.MathUtil)

function InputDetector(Frame: Frame) --[[ Line: 53 ]]
	-- upvalues: ReactModule (copy), CanvasContextModule (copy), MathUtilModule (copy)
	local UseContextResult = ReactModule.useContext(CanvasContextModule)
	local Inflate = Frame.Inflate or 0
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local _, UseStateResult2_1 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_2 = ReactModule.useState(false)
	local UseStateResult3, UseStateResult2_3 = ReactModule.useState(false)
	local UseStateResult4, UseStateResult2_4 = ReactModule.useState(Vector2.zero)
	local UseResult = ReactModule.useCallback(function(Vector): Vector2 --[[ Line: 64 ]]
		-- upvalues: Frame (copy), MathUtilModule (upval)
		local X = Vector.X
		local Y = Vector.Y
		
		if Frame.XSnap then
			X = MathUtilModule.roundToNearest(X, Frame.XSnap)
		end
		if Frame.YSnap then
			Y = MathUtilModule.roundToNearest(Y, Frame.YSnap)
		end
		return Vector2.new(X, Y)
	end, { Frame.XSnap, Frame.YSnap })
	
	return ReactModule.createElement("Frame", {
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		Size = UDim2.new(1, Inflate * 2, 1, Inflate * 2),
		BackgroundTransparency = if Frame.DebugColor3 == nil then 1 else 0,
		BackgroundColor3 = Frame.DebugColor3,
		BorderSizePixel = 0,
		ZIndex = Frame.ZIndex,
		[ReactModule.Event.InputBegan] = ReactModule.useCallback(function(_, Input) --[[ Line: 77 ]]
			-- upvalues: UseResult (copy), UseContextResult (copy), UseStateResult2 (copy), Frame (copy), UseStateResult2_2 (copy), UseStateResult2_3 (copy)
			local UseResultResult = UseResult(UseContextResult.mouseToPlot(Input.Position))
			
			if Input.UserInputType == Enum.UserInputType.MouseMovement then
				UseStateResult2(true)
				
				if Frame.OnHoverStart then
					Frame.OnHoverStart(UseContextResult.mouseToPlot(Input.Position), Input)
					
					return
				end
			elseif Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
				UseStateResult2_2(false)
				
				if Frame.OnPress then
					Frame.OnPress(UseResultResult, Input)
					
					return
				end
			elseif Input.UserInputType == Enum.UserInputType.MouseButton2 then
				UseStateResult2_3(false)
				
				if Frame.OnRightPress then
					Frame.OnRightPress(UseResultResult, Input)
				end
			end
		end, {
			UseStateResult2, UseStateResult2_2, UseStateResult2_3, UseContextResult,
			Frame.OnHoverStart, Frame.OnPress, Frame.OnRightPress, UseResult
		}),
		[ReactModule.Event.InputChanged] = ReactModule.useCallback(function(_, Input) --[[ Line: 115 ]]
			-- upvalues: Frame (copy), UseStateResult (copy), UseResult (copy), UseContextResult (copy)
			if Frame.OnHoverMoved and UseStateResult and Input.UserInputType == Enum.UserInputType.MouseMovement then
				Frame.OnHoverMoved(UseResult(UseContextResult.mouseToPlot(Input.Position)), Input)
				
				return
			end
			if Frame.OnScroll and Input.UserInputType == Enum.UserInputType.MouseWheel then
				Frame.OnScroll(Input.Position.Z, Input)
			end
		end, {
			UseStateResult,
			UseContextResult,
			Frame.OnHoverMoved,
			Frame.OnScroll,
			UseResult
		}),
		[ReactModule.Event.InputEnded] = ReactModule.useCallback(function(_, Input) --[[ Line: 124 ]]
			-- upvalues: UseResult (copy), UseContextResult (copy), UseStateResult2 (copy), Frame (copy), UseStateResult (copy), UseStateResult1 (copy), UseStateResult3 (copy)
			local UseResultResult = UseResult(UseContextResult.mouseToPlot(Input.Position))
			
			if Input.UserInputType == Enum.UserInputType.MouseMovement then
				UseStateResult2(false)
				
				if Frame.OnHoverEnded then
					Frame.OnHoverEnded(UseResultResult, Input)
					
					return
				end
			elseif Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
				if Frame.OnRelease then
					Frame.OnRelease(UseResultResult, Input)
				end
				if Frame.OnClick and UseStateResult and not UseStateResult1 then
					Frame.OnClick(UseResultResult, Input)
					
					return
				end
			elseif Input.UserInputType == Enum.UserInputType.MouseButton2 then
				if Frame.OnRightRelease then
					Frame.OnRightRelease(UseResultResult, Input)
				end
				if Frame.OnRightClick and UseStateResult and not UseStateResult3 then
					Frame.OnRightClick(UseResultResult, Input)
				end
			end
		end, {
			UseStateResult2, UseStateResult, UseStateResult1, UseStateResult3,
			UseContextResult, Frame.OnHoverEnded, Frame.OnClick, Frame.OnRightClick,
			Frame.OnRelease, Frame.OnRightRelease, UseResult
		})
	}, {
		DragDetector = ReactModule.createElement("UIDragDetector", {
			DragStyle = Enum.UIDragDetectorDragStyle.Scriptable,
			ReferenceUIInstance = UseContextResult.getViewport(),
			[ReactModule.Event.DragStart] = ReactModule.useCallback(function(p1, p2) --[[ Line: 168 ]]
				-- upvalues: UseStateResult2_1 (copy), Frame (copy), UseContextResult (copy), UseStateResult2_4 (copy), UseResult (copy)
				UseStateResult2_1(true)
				local ZeroVector = Vector2.zero
				local Parent = if p1.Parent then p1.Parent.Parent else nil
				
				if Parent and Parent:IsA("GuiObject") then
					ZeroVector = Parent.AbsolutePosition + Parent.AbsoluteSize * (Frame.AnchorPoint or Parent.AnchorPoint)
				end
				local ZeroVector1 = if Frame.TreatMouseAsAnchor then Vector2.zero else UseContextResult.absToView(p2) - UseContextResult.absToView(ZeroVector)
				UseStateResult2_4(ZeroVector1)
				
				if Frame.OnDragStart then
					local AbsToViewResultDelta = UseContextResult.absToView(p2) - ZeroVector1
					Frame.OnDragStart(UseResult(UseContextResult.viewToPlot((Vector2.new(math.clamp(AbsToViewResultDelta.X, 0, 1), (math.clamp(AbsToViewResultDelta.Y, 0, 1)))))), p2)
				end
			end, {
				UseContextResult, UseStateResult2_4, UseStateResult2_1, Frame.OnDragStart,
				Frame.AnchorPoint, Frame.TreatMouseAsAnchor, UseResult
			}),
			[ReactModule.Event.DragContinue] = ReactModule.useCallback(function(_, p1) --[[ Line: 201 ]]
				-- upvalues: UseStateResult2_2 (copy), UseStateResult2_3 (copy), Frame (copy), UseContextResult (copy), UseStateResult4 (copy), UseResult (copy)
				UseStateResult2_2(true)
				UseStateResult2_3(true)
				
				if Frame.OnDragMoved then
					local AbsToViewResultDelta = UseContextResult.absToView(p1) - UseStateResult4
					Frame.OnDragMoved(UseResult(UseContextResult.viewToPlot((Vector2.new(math.clamp(AbsToViewResultDelta.X, 0, 1), (math.clamp(AbsToViewResultDelta.Y, 0, 1)))))), p1)
				end
			end, {
				UseContextResult, UseStateResult2_2, UseStateResult2_3, UseStateResult4,
				Frame.OnDragMoved, UseResult
			}),
			[ReactModule.Event.DragEnd] = ReactModule.useCallback(function(_, p1) --[[ Line: 212 ]]
				-- upvalues: UseStateResult2_1 (copy), Frame (copy), UseContextResult (copy), UseStateResult4 (copy), UseResult (copy)
				UseStateResult2_1(false)
				
				if Frame.OnDragEnded then
					local AbsToViewResultDelta = UseContextResult.absToView(p1) - UseStateResult4
					Frame.OnDragEnded(UseResult(UseContextResult.viewToPlot((Vector2.new(math.clamp(AbsToViewResultDelta.X, 0, 1), (math.clamp(AbsToViewResultDelta.Y, 0, 1)))))), p1)
				end
			end, {
				UseContextResult,
				UseStateResult2_1,
				Frame.OnDragEnded,
				UseStateResult4,
				UseResult
			})
		})
	})
end

return InputDetector