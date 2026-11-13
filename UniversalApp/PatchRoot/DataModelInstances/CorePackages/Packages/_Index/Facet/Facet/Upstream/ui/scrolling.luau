local _ = require("./types")
local _ = require("./environment_types")
local MotionModule = require("./motion")

return function(p1, p2)
	-- upvalues: MotionModule (copy)
	local Config = p1.config
	local Types = p1.types
	local TypesVector2 = Types.Vector2
	local TypesEnum = Types.Enum
	local self = setmetatable({}, { __mode = "k" })
	
	local function _(): boolean
		-- upvalues: Config (copy), MotionModule (upval), p1 (copy)
		local GuiService = Config.guiService
		local Success, Result = pcall(function()
			-- upvalues: GuiService (copy)
			return GuiService ~= nil and GuiService.ReducedMotionEnabled
		end)
		
		return MotionModule.resolve(p1.read(Config.motionLevel), Success and Result == true) ~= "normal"
	end
	
	local _ = function(ScrollFrame)
		-- upvalues: TypesVector2 (copy)
		local AbsoluteCanvasSize = ScrollFrame.AbsoluteCanvasSize
		local AbsoluteWindowSize = ScrollFrame.AbsoluteWindowSize
		
		return TypesVector2.new(math.max(0, AbsoluteCanvasSize.X - AbsoluteWindowSize.X), (math.max(0, AbsoluteCanvasSize.Y - AbsoluteWindowSize.Y)))
	end
	
	local function move(ScrollFrame, NewResult, p3): boolean
		-- upvalues: TypesVector2 (copy), self (copy), Config (copy), MotionModule (upval), p1 (copy), Types (copy), TypesEnum (copy)
		local AbsoluteCanvasSize = ScrollFrame.AbsoluteCanvasSize
		local AbsoluteWindowSize = ScrollFrame.AbsoluteWindowSize
		local NewTypesVector = TypesVector2.new(math.max(0, AbsoluteCanvasSize.X - AbsoluteWindowSize.X), (math.max(0, AbsoluteCanvasSize.Y - AbsoluteWindowSize.Y)))
		local NewTypesVector1 = TypesVector2.new(math.clamp(NewResult.X, 0, NewTypesVector.X), (math.clamp(NewResult.Y, 0, NewTypesVector.Y)))
		local SelfEntry = self[ScrollFrame]
		
		if SelfEntry then
			self[ScrollFrame] = nil
			SelfEntry:Cancel()
		end
		if NewTypesVector1 == ScrollFrame.CanvasPosition then
			return false
		end
		local TweenService = Config.services.TweenService
		repeat
			if TweenService and (not p3 or p3.animated ~= false) then
				local GuiService = Config.guiService
				local Success, Result = pcall(function()
					-- upvalues: GuiService (copy)
					return GuiService ~= nil and GuiService.ReducedMotionEnabled
				end)
				
				if MotionModule.resolve(p1.read(Config.motionLevel), Success and Result == true) == "normal" then
					local Tween = TweenService:Create(ScrollFrame, Types.TweenInfo.new(p1.metric("motion.durations.scrollReveal"), p1.motionStyle("scroll"), TypesEnum.EasingDirection.Out), { CanvasPosition = NewTypesVector1 })
					self[ScrollFrame] = Tween
					Tween:Play()
					break
				end
			end
			ScrollFrame.CanvasPosition = NewTypesVector1
		until true
		return true
	end
	
	function p2.scrollTo(ScrollFrame, Vector, p3)
		-- upvalues: TypesVector2 (copy), move (copy)
		assert(type(ScrollFrame) ~= "string" and (ScrollFrame ~= nil and ScrollFrame:IsA("ScrollingFrame")), "Facet UI.scrollTo expects a ScrollingFrame")
		local CanvasPosition = ScrollFrame.CanvasPosition
		local NewTypesVector = nil
		
		if Vector == "top" then
			NewTypesVector = TypesVector2.new(CanvasPosition.X, 0)
		elseif Vector == "bottom" then
			local AbsoluteCanvasSize = ScrollFrame.AbsoluteCanvasSize
			local AbsoluteWindowSize = ScrollFrame.AbsoluteWindowSize
			NewTypesVector = TypesVector2.new(CanvasPosition.X, TypesVector2.new(math.max(0, AbsoluteCanvasSize.X - AbsoluteWindowSize.X), (math.max(0, AbsoluteCanvasSize.Y - AbsoluteWindowSize.Y))).Y)
		elseif typeof(Vector) == "Vector2" then
			NewTypesVector = Vector
		else
			assert(type(Vector) == "table", "Facet UI.scrollTo expects top, bottom, a Vector2 or { x, y }")
			NewTypesVector = TypesVector2.new(Vector.x or CanvasPosition.X, Vector.y or CanvasPosition.Y)
		end
		return (move(ScrollFrame, NewTypesVector, p3))
	end
	
	local _ = function(p3: number, p4: number, p5): number
		return if p3 < 0 or p5 < p4 then p3 elseif p5 < p3 + p4 then p3 + p4 - p5 else 0
	end
	
	function p2.scrollToVisible(Frame: Frame, Vector, p3): boolean
		-- upvalues: TypesEnum (copy), TypesVector2 (copy), move (copy)
		assert(typeof(Frame) == "Instance" and Frame:IsA("GuiObject"), "Facet UI.scrollToVisible expects a GuiObject")
		local AbsolutePosition = Frame.AbsolutePosition
		local AbsoluteSize = Frame.AbsoluteSize
		local X = AbsolutePosition.X
		local Y = AbsolutePosition.Y
		local X1 = AbsoluteSize.X
		local Y1 = AbsoluteSize.Y
		
		if Vector then
			X += Vector.x
			Y += Vector.y
			X1 = Vector.w
			Y1 = Vector.h
		end
		local NewX = 0
		local NewY = 0
		local Flag = false
		local Parent = Frame.Parent
		while Parent do
			if Parent:IsA("ScrollingFrame") then
				local ScrollFrame = Parent
				local AbsolutePosition1 = ScrollFrame.AbsolutePosition
				local AbsoluteWindowSize = ScrollFrame.AbsoluteWindowSize
				local CanvasPosition = ScrollFrame.CanvasPosition
				local ScrollingDirection = ScrollFrame.ScrollingDirection
				local v1 = nil
				
				if ScrollingDirection == TypesEnum.ScrollingDirection.Y then
					v1 = 0
				else
					local XDelta = X - NewX - AbsolutePosition1.X
					local X2 = AbsoluteWindowSize.X
					v1 = if XDelta < 0 or X2 < X1 then XDelta elseif X2 < XDelta + X1 then XDelta + X1 - X2 else 0
				end
				local v2 = nil
				if ScrollingDirection == TypesEnum.ScrollingDirection.X then
					v2 = 0
				else
					local YDelta = Y - NewY - AbsolutePosition1.Y
					local Y2 = AbsoluteWindowSize.Y
					v2 = if YDelta < 0 or Y2 < Y1 then YDelta elseif Y2 < YDelta + Y1 then YDelta + Y1 - Y2 else 0
				end
				if v1 ~= 0 or v2 ~= 0 then
					local AbsoluteCanvasSize = ScrollFrame.AbsoluteCanvasSize
					local AbsoluteWindowSize1 = ScrollFrame.AbsoluteWindowSize
					local NewTypesVector = TypesVector2.new(math.max(0, AbsoluteCanvasSize.X - AbsoluteWindowSize1.X), (math.max(0, AbsoluteCanvasSize.Y - AbsoluteWindowSize1.Y)))
					local NewTypesVector1 = TypesVector2.new(math.clamp(CanvasPosition.X + v1, 0, NewTypesVector.X), (math.clamp(CanvasPosition.Y + v2, 0, NewTypesVector.Y)))
					
					if move(ScrollFrame, NewTypesVector1, p3) then
						Flag = true
						NewX += NewTypesVector1.X - CanvasPosition.X
						NewY += NewTypesVector1.Y - CanvasPosition.Y
					end
				end
			end
			Parent = Parent.Parent
		end
		return Flag
	end
	
	local function keyed(): boolean
		-- upvalues: Config (copy), TypesEnum (copy)
		local UserInputService = Config.userInputService
		
		if UserInputService == nil then
			return false
		else
			local Success, Result = pcall(function()
				-- upvalues: UserInputService (copy)
				return UserInputService:GetLastInputType()
			end)
			
			return if Success and Result ~= nil then Result == TypesEnum.UserInputType.Keyboard or string.find(Result.Name, "^Gamepad") ~= nil else false
		end
	end
	
	table.insert(p1.selectionHooks, function(Frame: Frame)
		-- upvalues: keyed (copy), TypesEnum (copy), p2 (copy)
		if typeof(Frame) ~= "Instance" and type(Frame) ~= "table" then return end
		if not Frame:IsA("GuiObject") or not keyed() then return end
		local ScrollingFrame = Frame:FindFirstAncestorWhichIsA("ScrollingFrame")
		
		if ScrollingFrame ~= nil then
			local Y: number = Frame.AbsoluteSize.Y
			local ClampedValue = math.clamp((ScrollingFrame.AbsoluteWindowSize.Y - Y) / 2, 0, Y)
			local X: number = Frame.AbsoluteSize.X
			local ClampedValue1: number = if ScrollingFrame.ScrollingDirection == TypesEnum.ScrollingDirection.X then math.clamp((ScrollingFrame.AbsoluteWindowSize.X - X) / 2, 0, X) else 0
			p2.scrollToVisible(Frame, {
				x = -ClampedValue1,
				y = -ClampedValue,
				w = X + ClampedValue1 * 2,
				h = Y + ClampedValue * 2
			}, { animated = false })
			
			return
		end
	end)
end