local _ = require("./types")
local _ = require("./collection_state")

return function(p1, p2, ScrollFrame)
	local Runtime = p1.runtime
	local TypesVector2 = p1.types.Vector2
	local TypesEnum = p1.types.Enum
	local GuiService = p1.config.guiService
	local Spec = p2.spec
	local Frames = p2.frames
	local UserInputService = p1.config.userInputService
	
	if p2.horizontal and UserInputService and not Spec.reorderable then
		local X = nil
		local X1 = 0
		local Flag = false
		local List = {}
		local YRatio = 0
		local Flag1 = false
		local OnFrameResult = nil
		local CanvasPosition = nil
		p1.Compose.cleanup(function()
			-- upvalues: OnFrameResult (ref), CanvasPosition (ref)
			if OnFrameResult then
				OnFrameResult()
				OnFrameResult = nil
			end
			if CanvasPosition then
				CanvasPosition()
				CanvasPosition = nil
			end
		end)
		
		local function _(CanvasPosition)
			-- upvalues: Flag1 (ref), ScrollFrame (copy)
			Flag1 = true
			ScrollFrame.CanvasPosition = CanvasPosition
			Flag1 = false
		end
		
		local _ = function(): number
			-- upvalues: ScrollFrame (copy)
			return (math.max(0, ScrollFrame.CanvasSize.X.Offset - ScrollFrame.AbsoluteWindowSize.X))
		end
		
		local _ = function()
			-- upvalues: ScrollFrame (copy)
			return ScrollFrame:FindFirstChild("Items")
		end
		
		local function inside(Position): boolean
			-- upvalues: TypesVector2 (copy), ScrollFrame (copy), GuiService (copy)
			local NewTypesVector = TypesVector2.new(Position.X, Position.Y)
			local LayerCollector = ScrollFrame:FindFirstAncestorWhichIsA("LayerCollector")
			
			if LayerCollector and LayerCollector:IsA("ScreenGui") and LayerCollector.IgnoreGuiInset and GuiService then
				NewTypesVector += GuiService:GetGuiInset()
			end
			local AbsolutePosition = ScrollFrame.AbsolutePosition
			local AbsoluteSize = ScrollFrame.AbsoluteSize
			
			return AbsolutePosition.X <= NewTypesVector.X and (AbsolutePosition.Y <= NewTypesVector.Y and NewTypesVector.X <= AbsolutePosition.X + AbsoluteSize.X) and NewTypesVector.Y <= AbsolutePosition.Y + AbsoluteSize.Y
		end
		
		Runtime.connect(UserInputService, "InputBegan", function(Input)
			-- upvalues: TypesEnum (copy), inside (copy), p1 (copy), ScrollFrame (copy), OnFrameResult (ref), CanvasPosition (ref), X (ref), X1 (ref), Flag (ref), List (ref), TypesVector2 (copy), Frames (copy)
			if Input.UserInputType == TypesEnum.UserInputType.MouseButton1 and inside(Input.Position) and p1.available(ScrollFrame) then
				if OnFrameResult then
					OnFrameResult()
					OnFrameResult = nil
				end
				if CanvasPosition then
					CanvasPosition()
					CanvasPosition = nil
				end
				X = Input.Position.X
				X1 = ScrollFrame.CanvasPosition.X
				Flag = false
				List = { TypesVector2.new(Frames.now(), Input.Position.X) }
			end
		end)
		Runtime.connect(UserInputService, "InputChanged", function(Input)
			-- upvalues: X (ref), TypesEnum (copy), Flag (ref), ScrollFrame (copy), Frames (copy), List (ref), TypesVector2 (copy), X1 (ref), Flag1 (ref)
			if X == nil or Input.UserInputType ~= TypesEnum.UserInputType.MouseMovement then return end
			local XDelta = Input.Position.X - X
			
			if not Flag and math.abs(XDelta) >= 6 then
				Flag = true
				local Items = ScrollFrame:FindFirstChild("Items")
				
				if Items and Items:IsA("GuiObject") then
					Items.Interactable = false
				end
			end
			local NowResult = Frames.now()
			table.insert(List, TypesVector2.new(NowResult, Input.Position.X))
			while #List > 2 and NowResult - List[1].X > 0.1 do
				table.remove(List, 1)
			end
			if Flag then
				Flag1 = true
				ScrollFrame.CanvasPosition = TypesVector2.new(math.clamp(X1 - XDelta, 0, (math.max(0, ScrollFrame.CanvasSize.X.Offset - ScrollFrame.AbsoluteWindowSize.X))), ScrollFrame.CanvasPosition.Y)
				Flag1 = false
			end
		end)
		Runtime.connect(UserInputService, "InputEnded", function(Input)
			-- upvalues: TypesEnum (copy), X (ref), Flag (ref), Frames (copy), ScrollFrame (copy), List (ref), YRatio (ref), p1 (copy), CanvasPosition (ref), Runtime (copy), Flag1 (ref), OnFrameResult (ref), TypesVector2 (copy)
			if Input.UserInputType ~= TypesEnum.UserInputType.MouseButton1 or X == nil then return end
			X = nil
			
			if Flag then
				Flag = false
				local Callback = nil
				Callback = Frames.onFrame(function()
					-- upvalues: Callback (ref), ScrollFrame (upval)
					if Callback then
						Callback()
					end
					local Items = ScrollFrame:FindFirstChild("Items")
					
					if Items and Items:IsA("GuiObject") then
						Items.Interactable = true
					end
				end)
				local Entry = List[1]
				local Entry1 = List[#List]
				local XDelta = Entry1.X - Entry.X
				YRatio = if XDelta > 0 then (Entry.Y - Entry1.Y) / XDelta else 0
				
				if Frames.now() - Entry1.X < 0.1 and math.abs(YRatio) > 200 then
					local MotionFlingFriction = p1.metric("motion.fling.friction")
					CanvasPosition = assert(Runtime.host.observation).observeProperty(ScrollFrame, "CanvasPosition", function()
						-- upvalues: Flag1 (upval), OnFrameResult (upval), CanvasPosition (upval)
						if not Flag1 then
							if OnFrameResult then
								OnFrameResult()
								OnFrameResult = nil
							end
							if CanvasPosition then
								CanvasPosition()
								CanvasPosition = nil
							end
						end
					end)
					OnFrameResult = Frames.onFrame(function(p3)
						-- upvalues: YRatio (upval), MotionFlingFriction (copy), ScrollFrame (upval), TypesVector2 (upval), Flag1 (upval), OnFrameResult (upval), CanvasPosition (upval)
						YRatio *= math.exp(-MotionFlingFriction * p3)
						local X = ScrollFrame.CanvasPosition.X
						local ClampedValue = math.clamp(X + YRatio * p3, 0, (math.max(0, ScrollFrame.CanvasSize.X.Offset - ScrollFrame.AbsoluteWindowSize.X)))
						Flag1 = true
						ScrollFrame.CanvasPosition = TypesVector2.new(ClampedValue, ScrollFrame.CanvasPosition.Y)
						Flag1 = false
						
						if math.abs(YRatio) < 20 or ClampedValue == X then
							if OnFrameResult then
								OnFrameResult()
								OnFrameResult = nil
							end
							if CanvasPosition then
								CanvasPosition()
								CanvasPosition = nil
							end
						end
					end)
				end
			end
		end)
	end
end