local Object = require(script.Parent.Parent.Parent.LuauPolyfill).Object
local NaturalCompareFunction = require(script.Parent.naturalCompare).naturalCompare
local Module = {}

local function suggestionList(Text, p1)
	-- upvalues: Module (copy), Object (copy), NaturalCompareFunction (copy)
	local MeasureResults = {}
	local NewModule = Module.new(Text)
	local NewFloored = math.floor(Text:len() * 0.4) + 1
	
	for i = 1, #p1 do
		local v1 = p1[i]
		local MeasureResult = NewModule:measure(v1, NewFloored)
		
		if MeasureResult ~= nil then
			MeasureResults[v1] = MeasureResult
		end
	end
	local KeysResult = Object.keys(MeasureResults)
	table.sort(KeysResult, function(A, B): boolean
		-- upvalues: MeasureResults (copy), NaturalCompareFunction (upval)
		local MeasureResultDelta = MeasureResults[A] - MeasureResults[B]
		
		return if MeasureResultDelta == 0 then NaturalCompareFunction(A, B) < 0 else MeasureResultDelta < 0
	end)
	
	return KeysResult
end

local Callback = nil
Module.__index = Module

function Module.new(Text: string)
	-- upvalues: Module (copy), Callback (ref)
	local self = setmetatable({}, Module)
	self._input = Text
	self._inputLowerCase = Text:lower()
	self._inputArray = Callback(self._inputLowerCase)
	local Length: number = Text:len()
	self._rows = {
		table.create(Length + 1, 0),
		table.create(Length + 1, 0),
		table.create(Length + 1, 0)
	}
	
	return self
end

function Module:measure(Text: string, NewFloored)
	-- upvalues: Callback (ref)
	if self._input == Text then
		return 0
	end
	local Lowered = Text:lower()
	
	if self._inputLowerCase == Lowered then
		return 1
	end
	local CallbackResult = Callback(Lowered)
	local InputArray = self._inputArray
	
	if #CallbackResult < #InputArray then
		local CallbackResult1 = CallbackResult
		CallbackResult = InputArray
		InputArray = CallbackResult1
	end
	local CountCallbackResult = #CallbackResult
	local CountInputArray = #InputArray
	
	if NewFloored < CountCallbackResult - CountInputArray then
		return nil
	end
	local Rows = self._rows
	
	for i = 0, CountInputArray do
		Rows[1][i + 1] = i
	end
	for i1 = 1, CountCallbackResult do
		local Row = Rows[(i1 - 1) % 3 + 1]
		local Row1 = Rows[i1 % 3 + 1]
		Row1[1] = i1
		local i3: number = i1
		
		for i2 = 1, CountInputArray do
			local Smallest = math.min(Row[i2 + 1] + 1, Row1[i2] + 1, Row[i2] + (if CallbackResult[i1] == InputArray[i2] then 0 else 1))
			
			if i1 > 1 and i2 > 1 and CallbackResult[i1] == InputArray[i2 - 1] and CallbackResult[i1 - 1] == InputArray[i2] then
				Smallest = math.min(Smallest, Rows[(i1 - 2) % 3 + 1][i2 - 1] + 1)
			end
			if Smallest < i3 then
				i3 = Smallest
			end
			Row1[i2 + 1] = Smallest
		end
		if NewFloored < i3 then
			return nil
		end
	end
	local RowEntry = Rows[CountCallbackResult % 3 + 1][CountInputArray + 1]
	
	return if RowEntry <= NewFloored then RowEntry else nil
end

Callback = function(Text: string)
	local ByteValues = {}
	
	for i = 1, Text:len() do
		ByteValues[i] = Text:byte(i)
	end
	return ByteValues
end

return { suggestionList = suggestionList }