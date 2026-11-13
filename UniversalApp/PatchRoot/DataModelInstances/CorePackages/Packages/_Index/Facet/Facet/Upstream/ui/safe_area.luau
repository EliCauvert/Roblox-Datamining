local _ = require("../vendor/compose/core")
local _ = require("./types")
local _ = require("./environment_types")
local FreezeModule = require("./freeze")

local function _(Value: number): number
	return if type(Value) == "number" and Value == Value and math.abs(Value) < 1e999 then math.max(Value, 0) else 0
end

local function bar(p1, p2, p3)
	local Observation = p1.runtime.host.observation
	
	if p2 == nil or Observation == nil then
		return nil
	end
	local Success, Result = pcall(Observation.readProperty, p2, p3)
	
	if Success and typeof(Result) == "Vector2" then
		local Success1, Result1 = pcall(p1.runtime.observe, p2, p3, nil)
		
		return if Success1 then Result1 else nil
	else
		return nil
	end
end

return table.freeze({
	bars = function(p1, p2)
		-- upvalues: bar (copy)
		return {
			status = bar(p1, p2, "StatusBarSize"),
			bottom = bar(p1, p2, "BottomBarSize"),
			navigation = bar(p1, p2, "NavBarSize"),
			right = bar(p1, p2, "RightBarSize")
		}
	end,
	zoneRevision = function(p1, p2)
		local CellResult = p1.Compose.cell(0)
		
		if p2 then
			pcall(function()
				-- upvalues: p1 (copy), p2 (copy), CellResult (copy)
				p1.runtime.connect(p2, "SafeZoneOffsetsChanged", function()
					-- upvalues: CellResult (upval)
					CellResult:set(CellResult:peek() + 1)
				end)
			end)
		end
		return CellResult
	end,
	insets = function(p1, GuiService, p2, Callback)
		-- upvalues: FreezeModule (copy)
		local Largest = 0
		local Largest1 = 0
		local Largest2 = 0
		local Largest3 = 0
		
		if GuiService then
			local TypesEnum = p1.types.Enum
			local Success, Result, Result3 = pcall(function()
				-- upvalues: GuiService (copy), TypesEnum (copy)
				return GuiService:GetInsetArea(TypesEnum.ScreenInsets.None), GuiService:GetInsetArea(TypesEnum.ScreenInsets.CoreUISafeInsets)
			end)
			
			if Success and typeof(Result) == "Rect" and typeof(Result3) == "Rect" then
				local YDelta = Result3.Min.Y - Result.Min.Y
				Largest = if type(YDelta) == "number" and YDelta == YDelta and math.abs(YDelta) < 1e999 then math.max(YDelta, 0) else 0
				local XDelta = Result3.Min.X - Result.Min.X
				Largest1 = if type(XDelta) == "number" and XDelta == XDelta and math.abs(XDelta) < 1e999 then math.max(XDelta, 0) else 0
				local YDelta1 = Result.Max.Y - Result3.Max.Y
				Largest2 = if type(YDelta1) == "number" and YDelta1 == YDelta1 and math.abs(YDelta1) < 1e999 then math.max(YDelta1, 0) else 0
				local XDelta1 = Result.Max.X - Result3.Max.X
				Largest3 = if type(XDelta1) == "number" and XDelta1 == XDelta1 and math.abs(XDelta1) < 1e999 then math.max(XDelta1, 0) else 0
			else
				local Success1, Result1, Result3_1 = pcall(function()
					-- upvalues: GuiService (copy)
					return GuiService:GetGuiInset()
				end)
				
				if Success1 and typeof(Result1) == "Vector2" and typeof(Result3_1) == "Vector2" then
					local Y: number = Result1.Y
					Largest = if type(Y) == "number" and Y == Y and math.abs(Y) < 1e999 then math.max(Y, 0) else 0
					local X: number = Result1.X
					Largest1 = if type(X) == "number" and X == X and math.abs(X) < 1e999 then math.max(X, 0) else 0
					local Y1: number = Result3_1.Y
					Largest2 = if type(Y1) == "number" and Y1 == Y1 and math.abs(Y1) < 1e999 then math.max(Y1, 0) else 0
					local X1: number = Result3_1.X
					Largest3 = if type(X1) == "number" and X1 == X1 and math.abs(X1) < 1e999 then math.max(X1, 0) else 0
				end
			end
			local Success2, Result2 = pcall(function()
				-- upvalues: GuiService (copy)
				return GuiService:GetSafeZoneOffsets()
			end)
			
			if Success2 and type(Result2) == "table" then
				local Top: number = Result2.top
				Largest = math.max(Largest, if type(Top) == "number" and Top == Top and math.abs(Top) < 1e999 then math.max(Top, 0) else 0)
				local Left: number = Result2.left
				Largest1 = math.max(Largest1, if type(Left) == "number" and Left == Left and math.abs(Left) < 1e999 then math.max(Left, 0) else 0)
				local Bottom: number = Result2.bottom
				Largest2 = math.max(Largest2, if type(Bottom) == "number" and Bottom == Bottom and math.abs(Bottom) < 1e999 then math.max(Bottom, 0) else 0)
				local Right: number = Result2.right
				Largest3 = math.max(Largest3, if type(Right) == "number" and Right == Right and math.abs(Right) < 1e999 then math.max(Right, 0) else 0)
			end
		end
		local function _(p3)
			-- upvalues: Callback (copy), p1 (copy)
			local CallbackResult = if p3 then Callback(p3) else nil
			
			return if typeof(CallbackResult) == "Vector2" then CallbackResult else p1.types.Vector2.zero
		end
		
		local Status = p2.status
		local CallbackResult = if Status then Callback(Status) else nil
		local Y: number = (if typeof(CallbackResult) == "Vector2" then CallbackResult else p1.types.Vector2.zero).Y
		local Largest4 = math.max(Largest, if type(Y) == "number" and Y == Y and math.abs(Y) < 1e999 then math.max(Y, 0) else 0)
		local Bottom = p2.bottom
		local CallbackResult1 = if Bottom then Callback(Bottom) else nil
		local Y2: number = (if typeof(CallbackResult1) == "Vector2" then CallbackResult1 else p1.types.Vector2.zero).Y
		local Navigation = p2.navigation
		local CallbackResult2 = if Navigation then Callback(Navigation) else nil
		local Y1: number = (if typeof(CallbackResult2) == "Vector2" then CallbackResult2 else p1.types.Vector2.zero).Y
		local Largest5 = math.max(Largest2, if type(Y2) == "number" and (Y2 == Y2 and math.abs(Y2) < 1e999) then math.max(Y2, 0) else 0, if type(Y1) == "number" and Y1 == Y1 and math.abs(Y1) < 1e999 then math.max(Y1, 0) else 0)
		local Right = p2.right
		local CallbackResult3 = if Right then Callback(Right) else nil
		local X: number = (if typeof(CallbackResult3) == "Vector2" then CallbackResult3 else p1.types.Vector2.zero).X
		
		return FreezeModule({
			top = Largest4,
			left = Largest1,
			bottom = Largest5,
			right = math.max(Largest3, if type(X) == "number" and X == X and math.abs(X) < 1e999 then math.max(X, 0) else 0)
		})
	end
})