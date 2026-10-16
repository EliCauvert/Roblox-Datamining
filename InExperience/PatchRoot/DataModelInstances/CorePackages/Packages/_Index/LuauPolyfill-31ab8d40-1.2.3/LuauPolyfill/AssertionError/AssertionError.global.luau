local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local CollectionsModule = require(Parent1.Collections)
local Array = CollectionsModule.Array
local Object = CollectionsModule.Object
local BooleanModule = require(Parent1.Boolean)
local StringModule = require(Parent1.String)
local _ = require(Parent1.ES7Types)
local InspectFunction = CollectionsModule.inspect
local ErrorModule = require(Parent.Error)
local InstanceOfModule = require(Parent1.InstanceOf)
local config = {
	stderr = {
		isTTY = false,
		columns = 0,
		hasColors = function(...): boolean --[[ Line: 48 ]]
			return true
		end
	}
}

function ErrorCaptureStackTrace(p1, ...) --[[ Line: 55 ]]
	-- upvalues: ErrorModule (copy)
	ErrorModule.captureStackTrace(p1, ...)
end

local function _(p1) --[[ Line: 60 | Named "removeColors" ]]
	return p1
end

local v1 = ""
local v2 = ""
local v3 = ""
local v4 = ""
local config1 = {
	deepStrictEqual = "Expected values to be strictly deep-equal:",
	strictEqual = "Expected values to be strictly equal:",
	strictEqualObject = "Expected \"actual\" to be reference-equal to \"expected\":",
	deepEqual = "Expected values to be loosely deep-equal:",
	notDeepStrictEqual = "Expected \"actual\" not to be strictly deep-equal to:",
	notStrictEqual = "Expected \"actual\" to be strictly unequal to:",
	notStrictEqualObject = "Expected \"actual\" not to be reference-equal to \"expected\":",
	notDeepEqual = "Expected \"actual\" not to be loosely deep-equal to:",
	notIdentical = "Values have same structure but are not reference-equal:",
	notDeepEqualUnequal = "Expected values not to be loosely deep-equal:"
}

local _ = function(p1) --[[ Line: 88 | Named "copyError" ]]
	-- upvalues: Object (copy)
	local t = {}
	
	for _, value in Object.keys(p1) do
		t[value] = p1[value]
	end
	t.message = p1.message
	
	return t
end

local _ = function(p2) --[[ Line: 99 | Named "inspectValue" ]]
	-- upvalues: InspectFunction (copy)
	return InspectFunction(p2, {
		compact = false,
		customInspect = false,
		depth = 1000,
		maxArrayLength = 1e999,
		showHidden = false,
		showProxy = false,
		sorted = true,
		getters = true
	})
end

local function createErrDiff(Actual, Expected, Operator: string): string --[[ Line: 114 ]]
	-- upvalues: InspectFunction (copy), StringModule (copy), BooleanModule (copy), config1 (copy), config (copy), v1 (ref), v4 (ref), Array (copy), v2 (ref), v3 (ref)
	local Text = ""
	local Text1 = ""
	local Text2 = ""
	local Flag = false
	local InspectResult = InspectFunction(Actual, {
		compact = false,
		customInspect = false,
		depth = 1000,
		maxArrayLength = 1e999,
		showHidden = false,
		showProxy = false,
		sorted = true,
		getters = true
	})
	local List1 = StringModule.split(InspectResult, "\n")
	local List = StringModule.split(InspectFunction(Expected, {
		compact = false,
		customInspect = false,
		depth = 1000,
		maxArrayLength = 1e999,
		showHidden = false,
		showProxy = false,
		sorted = true,
		getters = true
	}), "\n")
	local Count = 0
	local v5 = ""
	
	if Operator == "strictEqual" and (typeof(Actual) == "table" and Actual ~= nil and typeof(Expected) == "table" and Expected ~= nil or typeof(Actual) == "function" and typeof(Expected) == "function") then
		Operator = "strictEqualObject"
	end
	if #List1 == 1 and #List == 1 and List1[1] ~= List[1] then
		local Entry2: string = List1[1]
		local Entry3 = if BooleanModule.toJSBoolean(false) then List[1] else List[1]
		local NewLength = string.len(Entry2) + string.len(Entry3)
		
		if NewLength <= 12 then
			if (typeof(Actual) ~= "table" or Actual == nil) and (typeof(Expected) ~= "table" or Expected == nil) and (Actual ~= 0 or Expected ~= 0) then
				return ("%s\n\n"):format(config1[Operator]) .. ("%s !== %s\n"):format(List1[1], List[1])
			end
		elseif Operator ~= "strictEqualObject" and NewLength < (if config.stderr.isTTY then config.stderr.columns else 80) then
			while string.sub(Entry2, Count + 1, Count + 1) == string.sub(Entry3, Count + 1, Count + 1) do
				Count += 1
			end
			if Count > 2 then
				v5 = ("\n  %s^"):format(string.rep(" ", Count))
				Count = 0
			end
		end
	end
	local Entry = List1[#List1]
	local Entry1 = List[#List]
	while Entry == Entry1 do
		local Count1: number = Count
		Count += 1
		
		if Count1 < 3 then
			Text2 = ("\n  %s%s"):format(Entry, Text2)
		else
			Text = Entry
		end
		table.remove(List1)
		table.remove(List)
		
		if #List1 == 0 or #List == 0 then break end
		Entry = List1[#List1]
		Entry1 = List[#List]
	end
	local Largest = math.max(#List1, #List)
	
	if Largest == 0 then
		local List2 = StringModule.split(InspectResult, "\n")
		
		if #List2 > 50 then
			List2[47] = ("%s...%s"):format(v1, v4)
			while #List2 > 47 do
				table.remove(List2)
			end
		end
		return ("%s\n\n"):format("Values have same structure but are not reference-equal:") .. ("%s\n"):format(Array.join(List2, "\n"))
	else
		if Count >= 5 then
			Text2 = ("\n%s...%s%s"):format(v1, v4, Text2)
			Flag = true
		end
		if Text ~= "" then
			Text2 = ("\n  %s%s"):format(Text, Text2)
			Text = ""
		end
		local Count2 = 0
		local Count3 = 0
		local Text3 = config1[Operator] .. ("\n%s+ actual%s %s- expected%s"):format(v2, v4, v3, v4)
		local Message: string = (" %s...%s Lines skipped"):format(v1, v4)
		local List3 = List1
		local Text4: string = ("%s+%s"):format(v2, v4)
		local CountList = #List
		
		if #List1 < Largest then
			List3 = List
			Text4 = ("%s-%s"):format(v3, v4)
			CountList = #List1
		end
		for i = 1, Largest do
			if CountList < i then
				if Count3 > 2 then
					if Count3 > 3 then
						if Count3 > 4 then
							if Count3 == 5 then
								Text1 ..= ("\n  %s"):format(List3[i - 3])
								Count2 += 1
							else
								Text1 ..= ("\n%s...%s"):format(v1, v4)
								Flag = true
							end
						end
						Text1 ..= ("\n  %s"):format(List3[i - 2])
						Count2 += 1
					end
					Text1 ..= ("\n  %s"):format(List3[i - 1])
					Count2 += 1
				end
				Count3 = 0
				
				if List3 == List1 then
					Text1 ..= ("\n%s %s"):format(Text4, List3[i])
				else
					Text ..= ("\n%s %s"):format(Text4, List3[i])
				end
				Count2 += 1
			else
				local Entry4 = List[i]
				local Entry41 = List1[i]
				local Inverted: boolean = Entry41 ~= Entry4 and (not BooleanModule.toJSBoolean(StringModule.endsWith(Entry41, ",")) or StringModule.slice(Entry41, 0, -1) ~= Entry4)
				
				if Inverted and StringModule.endsWith(Entry4, ",") and StringModule.slice(Entry4, 0, -1) == Entry41 then
					Inverted = false
					Entry41 ..= ","
				end
				if Inverted then
					if Count3 > 2 then
						if Count3 > 3 then
							if Count3 > 4 then
								if Count3 == 5 then
									Text1 ..= ("\n  %s"):format(List1[i - 3])
									Count2 += 1
								else
									Text1 ..= ("\n%s...%s"):format(v1, v4)
									Flag = true
								end
							end
							Text1 ..= ("\n  %s"):format(List1[i - 2])
							Count2 += 1
						end
						Text1 ..= ("\n  %s"):format(List1[i - 1])
						Count2 += 1
					end
					Count3 = 0
					Text1 ..= ("\n%s+%s %s"):format(v2, v4, Entry41)
					Text ..= ("\n%s-%s %s"):format(v3, v4, Entry4)
					Count2 += 2
				else
					Text1 ..= Text
					Text = ""
					Count3 += 1
					
					if Count3 <= 2 then
						Text1 ..= ("\n  %s"):format(Entry41)
						Count2 += 1
					end
				end
			end
			if Count2 > 50 and i < Largest - 2 then
				return ("%s%s\n%s\n%s...%s%s\n"):format(Text3, Message, Text1, v1, v4, Text) .. ("%s...%s"):format(v1, v4)
			end
		end
		return ("%s%s\n%s%s%s%s"):format(Text3, if Flag then Message else "", Text1, Text, Text2, v5)
	end
end

local self = setmetatable({}, { __index = ErrorModule })
self.__index = self

function self:__tostring() --[[ Line: 394 ]]
	return self:toString()
end

function self.new(p2) --[[ Line: 407 ]]
	-- upvalues: ErrorModule (copy), self (copy), config (copy), v1 (ref), v2 (ref), v4 (ref), v3 (ref), Array (copy), Object (copy), InstanceOfModule (copy), createErrDiff (copy), config1 (copy), StringModule (copy), InspectFunction (copy), BooleanModule (copy)
	local Message = p2.message
	local Operator = p2.operator
	local StackStartFn = p2.stackStartFn
	local Actual = p2.actual
	local Expected = p2.expected
	local self1 = nil
	
	if Message == nil then
		if config.stderr.isTTY then
			if config.stderr:hasColors() then
				v1 = "\27[34m"
				v2 = "\27[32m"
				v4 = "\27[39m"
				v3 = "\27[31m"
			else
				v1 = ""
				v2 = ""
				v4 = ""
				v3 = ""
			end
		end
		if typeof(Actual) == "table" and Actual ~= nil and typeof(Expected) == "table" and Expected ~= nil and Array.indexOf(Object.keys(Actual), "stack") ~= -1 and InstanceOfModule(Actual, ErrorModule) and Array.indexOf(Object.keys(Expected), "stack") ~= -1 and InstanceOfModule(Expected, ErrorModule) then
			local Actual1 = Actual
			local t = {}
			
			for _, value in Object.keys(Actual1) do
				t[value] = Actual1[value]
			end
			t.message = Actual1.message
			Actual = t
			local Expected1 = Expected
			local t1 = {}
			
			for _, value1 in Object.keys(Expected1) do
				t1[value1] = Expected1[value1]
			end
			t1.message = Expected1.message
			Expected = t1
		end
		if Operator == "deepStrictEqual" or Operator == "strictEqual" then
			self1 = setmetatable(ErrorModule.new(createErrDiff(Actual, Expected, Operator)), self)
		elseif Operator == "notDeepStrictEqual" or Operator == "notStrictEqual" then
			local Entry = config1[Operator]
			local List = StringModule.split(InspectFunction(Actual, {
				compact = false,
				customInspect = false,
				depth = 1000,
				maxArrayLength = 1e999,
				showHidden = false,
				showProxy = false,
				sorted = true,
				getters = true
			}), "\n")
			
			if Operator == "notStrictEqual" and (typeof(Actual) == "table" and Actual ~= nil or typeof(Actual) == "function") then
				Entry = "Expected \"actual\" not to be reference-equal to \"expected\":"
			end
			if #List > 50 then
				List[47] = ("%s...%s"):format(v1, v4)
				while #List > 47 do
					table.remove(List)
				end
			end
			self1 = if #List == 1 then setmetatable(ErrorModule.new(("%s%s%s"):format(Entry, if string.len(List[1]) > 5 then "\n\n" else " ", List[1])), self) else setmetatable(ErrorModule.new(("%s\n\n%s\n"):format(Entry, Array.join(List, "\n"))), self)
		else
			local Message1 = InspectFunction(Actual, {
				compact = false,
				customInspect = false,
				depth = 1000,
				maxArrayLength = 1e999,
				showHidden = false,
				showProxy = false,
				sorted = true,
				getters = true
			})
			local Text = InspectFunction(Expected, {
				compact = false,
				customInspect = false,
				depth = 1000,
				maxArrayLength = 1e999,
				showHidden = false,
				showProxy = false,
				sorted = true,
				getters = true
			})
			local Entry1 = config1[tostring(Operator)]
			
			if Operator == "notDeepEqual" and Message1 == Text then
				local Text1: string = ("%s\n\n%s"):format(Entry1, Message1)
				
				if string.len(Text1) > 1024 then
					Text1 = ("%s..."):format(StringModule.slice(Text1, 0, 1021))
				end
				self1 = setmetatable(ErrorModule.new(Text1), self)
			else
				if string.len(Message1) > 512 then
					Message1 = ("%s..."):format(StringModule.slice(Message1, 0, 509))
				end
				if string.len(Text) > 512 then
					Text = ("%s..."):format(StringModule.slice(Text, 0, 509))
				end
				if Operator == "deepEqual" then
					Message1 = ("%s\n\n%s\n\nshould loosely deep-equal\n\n"):format(Entry1, Message1)
				else
					local Entry = config1[("%sUnequal"):format((tostring(Operator)))]
					
					if BooleanModule.toJSBoolean(Entry) then
						Message1 = ("%s\n\n%s\n\nshould not loosely deep-equal\n\n"):format(Entry, Message1)
					else
						Text = (" %s %s"):format(tostring(Operator), Text)
					end
				end
				self1 = setmetatable(ErrorModule.new(("%s%s"):format(Message1, Text)), self)
			end
		end
	else
		self1 = setmetatable(ErrorModule.new((tostring(Message))), self)
	end
	self1.generatedMessage = not BooleanModule.toJSBoolean(Message)
	self1.name = "AssertionError [ERR_ASSERTION]"
	self1.code = "ERR_ASSERTION"
	self1.actual = Actual
	self1.expected = Expected
	self1.operator = Operator
	ErrorCaptureStackTrace(self1, StackStartFn or self.new)
	self1.name = "AssertionError"
	
	return self1
end

function self:toString(): string --[[ Line: 576 ]]
	return ("%s [%s]: %s"):format(self.name, self.code, self.message)
end

self.name = "AssertionError"

return { AssertionError = self }