local GuiService = game:GetService("GuiService")
local Parent = script.Parent.Parent.Parent.Parent
local SignalsModule = require(Parent.Signals)
local CryoModule = require(Parent.Cryo)
local DisplayModule = require(Parent.Display)
local CreateSignalFunction = SignalsModule.createSignal
local CreateEffectFunction = SignalsModule.createEffect

return function()
	-- upvalues: CreateSignalFunction (copy), CryoModule (copy), GuiService (copy), DisplayModule (copy), CreateEffectFunction (copy)
	local Signal, Signal2 = CreateSignalFunction({}, CryoModule.Dictionary.equals)
	
	local function v7(Vector, Vector1, List)
		local List1 = {}
		local Y = Vector.Y
		local X: number = Vector1.X
		local YDelta = Vector1.Y - Y
		local X1 = Vector.X
		local X2 = 0
		
		for _, value in ipairs(List) do
			local NewX = X1 + X2
			table.insert(List1, {
				Position = { X = NewX, Y = Y },
				Size = { X = value.position.X - NewX, Y = YDelta }
			})
			X1 = value.position.X
			X2 = value.size.X
		end
		local NewX = X1 + X2
		table.insert(List1, {
			Position = { X = NewX, Y = Y },
			Size = { X = X - NewX, Y = YDelta }
		})
		
		return List1
	end
	
	local function v8(List): Rect
		-- upvalues: GuiService (upval), DisplayModule (upval), v7 (copy)
		local List1 = {}
		
		for _, value in pairs(List) do
			table.insert(List1, {
				id = value.id,
				size = value.size,
				position = value.position
			})
		end
		table.sort(List1, function(A, B): boolean
			return A.position.X < B.position.X and A.position.X + A.size.X < B.size.X + B.position.X
		end)
		local GuiInset, _ = GuiService:GetGuiInset()
		local v1: Rect? = nil
		
		for _, value1 in ipairs((v7(Vector2.new(0, 0), Vector2.new(DisplayModule.GetDisplayStore(false).getViewportSize(false).X, GuiInset.Y), List1))) do
			if not v1 or v1.Width < value1.Size.X then
				v1 = Rect.new(value1.Position.X, value1.Position.Y, value1.Position.X + value1.Size.X, value1.Position.Y + value1.Size.Y)
			end
		end
		return v1
	end
	
	local function setKeepOutArea(Id, Position, Size)
		-- upvalues: Signal2 (copy), CryoModule (upval), Signal (copy)
		Signal2(CryoModule.Dictionary.join(Signal(false), { [Id] = { id = Id, position = Position, size = Size } }))
	end
	
	local function removeKeepOutArea(Key)
		-- upvalues: Signal (copy), Signal2 (copy)
		local SignalResult = Signal(false)
		SignalResult[Key] = nil
		Signal2(SignalResult)
	end
	
	local Effect = CreateEffectFunction(function(p1)
		-- upvalues: DisplayModule (upval), v8 (copy), Signal (copy), GuiService (upval)
		local _ = DisplayModule.GetDisplayStore(p1).getViewportSize(p1)
		local TopbarInset = v8(Signal(p1))
		
		if TopbarInset then
			GuiService:SetTopbarInset(TopbarInset)
		end
	end)
	
	return {
		getKeepOutAreas = Signal,
		setKeepOutArea = setKeepOutArea,
		removeKeepOutArea = removeKeepOutArea,
		cleanup = function()
			-- upvalues: Effect (copy)
			Effect()
		end
	}
end