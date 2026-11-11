local Foundation = script:FindFirstAncestor("Foundation")
local ConnectionModule = require(Foundation.Utility.Wrappers.Connection)
local DragIntentModule = require(Foundation.Enums.DragIntent)
local SignalModule = require(Foundation.Utility.Wrappers.Signal)
local SwipeMathModule = require(script.Parent.swipeMath)
local UserInputService = require(Foundation.Utility.Wrappers.Services).UserInputService

local function _(Input): boolean
	return Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch
end

local _ = function(Ancestor, Ancestor1, Ancestor2)
	return if Ancestor1 == Ancestor or Ancestor1:IsDescendantOf(Ancestor) then true else Ancestor2 ~= nil and (Ancestor1 == Ancestor2 or Ancestor1:IsDescendantOf(Ancestor2))
end

return {
	beginGesture = function(Input, LastTime)
		-- upvalues: DragIntentModule (copy)
		return {
			velocityX = 0,
			lastProgress = nil,
			input = Input,
			startX = Input.Position.X,
			startY = Input.Position.Y,
			lastX = Input.Position.X,
			lastTime = LastTime,
			intent = DragIntentModule.Pending
		}
	end,
	canBegin = function(p1, Input): boolean
		-- upvalues: UserInputService (copy)
		return p1 == nil and (if Input.UserInputType == Enum.UserInputType.MouseButton1 then UserInputService:GetFocusedTextBox() == nil else Input.UserInputType == Enum.UserInputType.Touch and UserInputService:GetFocusedTextBox() == nil)
	end,
	connectPointer = function(p1)
		-- upvalues: ConnectionModule (copy), SignalModule (copy), UserInputService (copy)
		local ConnectResult = nil
		
		local function _()
			-- upvalues: ConnectResult (ref), ConnectionModule (upval)
			if ConnectResult ~= nil then
				ConnectionModule.Disconnect(ConnectResult)
				ConnectResult = nil
			end
		end
		
		local ConnectResult1 = SignalModule.Connect(UserInputService.InputBegan, function(p2)
			-- upvalues: p1 (copy), ConnectResult (ref), SignalModule (upval), UserInputService (upval)
			if p1.onBegan(p2) and ConnectResult == nil then
				ConnectResult = SignalModule.Connect(UserInputService.InputChanged, p1.onChanged)
			end
		end)
		local ConnectResult2 = SignalModule.Connect(UserInputService.InputEnded, function(p2)
			-- upvalues: p1 (copy), ConnectResult (ref), ConnectionModule (upval)
			if p1.onEnded(p2) and ConnectResult ~= nil then
				ConnectionModule.Disconnect(ConnectResult)
				ConnectResult = nil
			end
		end)
		
		return function()
			-- upvalues: ConnectionModule (upval), ConnectResult1 (copy), ConnectResult2 (copy), ConnectResult (ref)
			ConnectionModule.Disconnect(ConnectResult1)
			ConnectionModule.Disconnect(ConnectResult2)
			
			if ConnectResult ~= nil then
				ConnectionModule.Disconnect(ConnectResult)
				ConnectResult = nil
			end
		end
	end,
	isForeignHit = function(Ancestor, Ancestor1, Ancestor2): boolean
		return Ancestor1 ~= nil and not (if Ancestor1 == Ancestor or Ancestor1:IsDescendantOf(Ancestor) then true else Ancestor2 ~= nil and (Ancestor1 == Ancestor2 or Ancestor1:IsDescendantOf(Ancestor2)))
	end,
	isInside = function(Frame: Frame, Vector): boolean
		local AbsolutePosition = Frame.AbsolutePosition
		local AbsoluteSize = Frame.AbsoluteSize
		
		return AbsolutePosition.X <= Vector.X and (AbsolutePosition.Y <= Vector.Y and Vector.X <= AbsolutePosition.X + AbsoluteSize.X) and Vector.Y <= AbsolutePosition.Y + AbsoluteSize.Y
	end,
	matchesMove = function(Input, Input1): boolean
		return if Input1.UserInputType == Enum.UserInputType.Touch then Input == Input1 else Input.UserInputType == Enum.UserInputType.MouseMovement
	end,
	matchesRelease = function(Input, Input1): boolean
		return if Input1.UserInputType == Enum.UserInputType.Touch then Input == Input1 else Input.UserInputType == Enum.UserInputType.MouseButton1
	end,
	move = function(p1, p2, p3)
		-- upvalues: DragIntentModule (copy), SwipeMathModule (copy)
		local Position = p2.Position
		local X = Position.X
		local XDelta = X - p1.startX
		local YDelta = Position.Y - p1.startY
		local Flag = nil
		
		if p1.intent == DragIntentModule.Pending then
			local ClassifyDragResult = SwipeMathModule.classifyDrag(XDelta, YDelta, 8, p3)
			
			if ClassifyDragResult == DragIntentModule.Claim then
				p1.intent = DragIntentModule.Claim
				Flag = true
			else
				if ClassifyDragResult == DragIntentModule.Ignore then
					p1.intent = DragIntentModule.Ignore
				end
				Flag = false
			end
		else
			Flag = false
		end
		local IsIntentMatch = p1.intent == DragIntentModule.Claim
		
		if IsIntentMatch then
			local ClockTime = os.clock()
			local ClockTimeDelta = ClockTime - p1.lastTime
			
			if ClockTimeDelta > 0 then
				p1.velocityX = (X - p1.lastX) / ClockTimeDelta
			end
			p1.lastX = X
			p1.lastTime = ClockTime
		end
		return Flag, IsIntentMatch, X
	end,
	sampleVelocity = function(p1, LastX, LastTime)
		local LastTimeDelta = LastTime - p1.lastTime
		
		if LastTimeDelta > 0 then
			p1.velocityX = (LastX - p1.lastX) / LastTimeDelta
		end
		p1.lastX = LastX
		p1.lastTime = LastTime
	end,
	setProgressIfChanged = function(p1, Callback: (any) -> (), LastProgress)
		if p1.lastProgress ~= LastProgress then
			p1.lastProgress = LastProgress
			Callback(LastProgress)
			
			return
		end
	end,
	topGuiAt = function(Ancestor, Vector, Ancestor1)
		local PlayerGui = Ancestor:FindFirstAncestorWhichIsA("PlayerGui")
		
		if PlayerGui == nil then
			PlayerGui = Ancestor:FindFirstAncestorWhichIsA("CoreGui")
		end
		if PlayerGui == nil then
			return nil
		end
		for _, Gui in PlayerGui:GetGuiObjectsAtPosition(Vector.X, Vector.Y) do
			if typeof(Gui) == "Instance" and Gui:IsA("GuiObject") and (Gui.Active or (if Gui == Ancestor or Gui:IsDescendantOf(Ancestor) then true else Ancestor1 ~= nil and (Gui == Ancestor1 or Gui:IsDescendantOf(Ancestor1)))) then
				return Gui
			end
		end
		return nil
	end,
	updateClaim = function(p1, p2, p3, p4): boolean
		-- upvalues: DragIntentModule (copy), SwipeMathModule (copy)
		if p1.intent ~= DragIntentModule.Pending then
			return false
		end
		local ClassifyDragResult = SwipeMathModule.classifyDrag(p2, p3, 8, p4)
		
		if ClassifyDragResult == DragIntentModule.Claim then
			p1.intent = DragIntentModule.Claim
			
			return true
		end
		if ClassifyDragResult == DragIntentModule.Ignore then
			p1.intent = DragIntentModule.Ignore
		end
		return false
	end
}