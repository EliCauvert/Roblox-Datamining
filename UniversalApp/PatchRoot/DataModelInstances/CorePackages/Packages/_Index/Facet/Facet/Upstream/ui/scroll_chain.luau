local _ = require("./types")
local GestureServiceModule = require("./gesture_service")
local t = {}
local t1 = {}

local function listen(UserInputService, Origin, Begin, Touch)
	-- upvalues: t1 (copy)
	local Entry = t1[UserInputService]
	
	if not Entry then
		local config = { connection = nil, frames = {} }
		t1[UserInputService] = config
		Entry = config
		config.connection = UserInputService.InputBegan:Connect(function(Input)
			-- upvalues: Touch (copy), config (copy)
			if Input.UserInputType ~= Touch then return end
			local t = {}
			local ScrollingFrame = nil
			
			for frame in config.frames do
				local BasePlayerGui = frame:FindFirstAncestorWhichIsA("BasePlayerGui")
				
				if BasePlayerGui and not t[BasePlayerGui] then
					t[BasePlayerGui] = true
					
					for _, Object in BasePlayerGui:GetGuiObjectsAtPosition(Input.Position.X, Input.Position.Y) do
						ScrollingFrame = Object
						while ScrollingFrame do
							if not ScrollingFrame:IsA("ScrollingFrame") then
								ScrollingFrame = ScrollingFrame.Parent
								continue
							end
							local Frame: (any) -> () = config.frames[ScrollingFrame]
							
							if Frame then
								Frame(Input)
							end
							break
						end
						if Object.Active or Object:IsA("GuiButton") or Object:IsA("TextBox") then break end
					end
				end
			end
		end)
	end
	local v1 = assert(Entry)
	v1.frames[Origin] = Begin
	
	return function()
		-- upvalues: v1 (copy), Origin (copy), t1 (upval), UserInputService (copy)
		v1.frames[Origin] = nil
		
		if next(v1.frames) == nil then
			if v1.connection then
				v1.connection:Disconnect()
			end
			t1[UserInputService] = nil
		end
	end
end

local function finish(Input)
	-- upvalues: t (copy)
	local Entry = t[Input]
	
	if not Entry then return end
	t[Input] = nil
	
	for _, connection in Entry.connections do
		connection:Disconnect()
	end
	for _, value in Entry.held do
		value()
	end
end

return function(p1, Origin, Callback, Callback1)
	-- upvalues: GestureServiceModule (copy), t (copy), finish (copy), listen (copy)
	local UserInputService = p1.config.userInputService
	
	if UserInputService then
		local TypesEnum = p1.types.Enum
		local GestureServiceModuleResult = GestureServiceModule(p1)
		
		local function begin(Input)
			-- upvalues: TypesEnum (copy), Origin (copy), t (upval), UserInputService (copy), finish (upval), GestureServiceModuleResult (copy), p1 (copy), Callback1 (copy), Callback (copy)
			if Input.UserInputType ~= TypesEnum.UserInputType.Touch or not Origin.ScrollingEnabled then return end
			local Entry = t[Input]
			
			if not Entry then
				local config = {
					origin = Origin,
					start = Input.Position,
					previous = Input.Position,
					held = {},
					connections = {}
				}
				t[Input] = config
				table.insert(config.connections, UserInputService.InputChanged:Connect(function(Input1)
					-- upvalues: Input (copy), TypesEnum (upval), finish (upval), GestureServiceModuleResult (upval), p1 (upval), config (copy), Callback1 (upval), Callback (upval)
					if Input1 ~= Input then return end
					if Input.UserInputState == TypesEnum.UserInputState.Cancel then
						finish(Input)
						
						return
					end
					local MoveResult = GestureServiceModuleResult.move(Input, p1.types.Vector2.new(Input.Position.X, Input.Position.Y))
					
					if MoveResult == "drag" or MoveResult == "cancelled" then return end
					local PositionDelta = Input.Position - config.start
					local PreviousDelta = config.previous - Input.Position
					config.previous = Input.Position
					local IsMagnitudeAbove = math.abs(PositionDelta.X) > math.abs(PositionDelta.Y)
					
					if math.max(math.abs(PositionDelta.X), (math.abs(PositionDelta.Y))) < 6 then return end
					local X = if IsMagnitudeAbove then PreviousDelta.X else PreviousDelta.Y
					
					if X == 0 then return end
					local List = {}
					local Origin = config.origin
					while Origin do
						if Origin:IsA("ScrollingFrame") and not config.held[Origin] then
							if not Origin.ScrollingEnabled then break end
							local ScrollingDirection = Origin.ScrollingDirection
							local IsScrollingDirectionMatch: boolean = ScrollingDirection == TypesEnum.ScrollingDirection.XY or ScrollingDirection == (if IsMagnitudeAbove then TypesEnum.ScrollingDirection.X else TypesEnum.ScrollingDirection.Y)
							local X1 = if IsMagnitudeAbove then Origin.CanvasPosition.X else Origin.CanvasPosition.Y
							local AbsoluteCanvasSizeDelta = Origin.AbsoluteCanvasSize - Origin.AbsoluteWindowSize
							local Largest = math.max(0, if IsMagnitudeAbove then AbsoluteCanvasSizeDelta.X else AbsoluteCanvasSizeDelta.Y)
							
							if IsScrollingDirectionMatch and (Largest > 0 and (if X < 0 then X1 > 0.5 else X1 < Largest - 0.5)) then
								for _, value in List do
									config.held[value] = Callback1(value)
								end
								break
							end
							if not Callback(Origin) then break end
							table.insert(List, Origin)
						end
						Origin = Origin.Parent
					end
				end))
				table.insert(config.connections, UserInputService.InputEnded:Connect(function(Input1)
					-- upvalues: Input (copy), finish (upval)
					if Input1 == Input then
						finish(Input)
					end
				end))
				table.insert(config.connections, UserInputService.WindowFocusReleased:Connect(function()
					-- upvalues: finish (upval), Input (copy)
					finish(Input)
				end))
				
				return
			elseif Origin:IsDescendantOf(Entry.origin) then
				Entry.origin = Origin
			end
		end
		
		local ListenResult = listen(UserInputService, Origin, begin, TypesEnum.UserInputType.Touch)
		p1.runtime.connect(Origin, "InputBegan", begin)
		p1.Compose.cleanup(function()
			-- upvalues: ListenResult (copy), t (upval), Origin (copy), finish (upval)
			ListenResult()
			
			for i, value in t do
				if value.origin == Origin or value.held[Origin] then
					finish(i)
				end
			end
		end)
		
		return
	end
end