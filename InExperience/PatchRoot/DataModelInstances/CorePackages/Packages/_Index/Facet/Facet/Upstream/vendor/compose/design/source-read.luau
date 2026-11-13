local _ = require("./types")
local DatatypeModule = require("./datatype")
local DocumentModule = require("./document")

local function tokenize(Text: string)
	local t = {}
	local StartIndex = 1
	while StartIndex <= #Text do
		local Segment = string.sub(Text, StartIndex, StartIndex)
		local _, EndIndex1 = string.find(Text, "^%s+", StartIndex)
		
		if EndIndex1 then
			StartIndex = EndIndex1 + 1
		elseif string.sub(Text, StartIndex, StartIndex + 1) == "--" then
			local FoundAt: number? = string.find(Text, "\n", StartIndex, true)
			StartIndex = if FoundAt then FoundAt + 1 else #Text + 1
		elseif Segment == "\"" then
			local EndIndex = StartIndex + 1
			while EndIndex <= #Text and string.sub(Text, EndIndex, EndIndex) ~= "\"" do
				EndIndex += if string.sub(Text, EndIndex, EndIndex) == "\\" then 2 else 1
			end
			t[#t + 1] = {
				kind = "string",
				text = string.sub(Text, StartIndex, EndIndex),
				start = StartIndex,
				finish = EndIndex
			}
			StartIndex = EndIndex + 1
		elseif string.match(Segment, "[%a_]") then
			local Text1 = assert(string.match(Text, "^[%w_]+", StartIndex))
			t[#t + 1] = {
				kind = "name",
				text = Text1,
				start = StartIndex,
				finish = StartIndex + #Text1 - 1
			}
			StartIndex += #Text1
		elseif string.match(Text, "^%-?%d", StartIndex) then
			local Match: string = string.match(Text, "^%-?%d+%.?%d*[eE][%+%-]?%d+", StartIndex) or assert(string.match(Text, "^%-?%d+%.?%d*", StartIndex))
			t[#t + 1] = {
				kind = "number",
				text = Match,
				start = StartIndex,
				finish = StartIndex + #Match - 1
			}
			StartIndex += #Match
		elseif string.sub(Text, StartIndex, StartIndex + 2) == "..." then
			t[#t + 1] = {
				kind = "symbol",
				text = "...",
				start = StartIndex,
				finish = StartIndex + 2
			}
			StartIndex += 3
		else
			t[#t + 1] = {
				kind = "symbol",
				text = Segment,
				start = StartIndex,
				finish = StartIndex
			}
			StartIndex += 1
		end
	end
	return t
end

local function _(Text: string): string
	return (string.gsub(string.sub(Text, 2, -2), "\\(.)", function(Match)
		return if Match == "n" then "\n" elseif Match == "t" then "\t" else Match
	end))
end

local function readLiteral(p1, Count, Callback)
	local Count1 = Count
	
	local function _(p2)
		-- upvalues: p1 (copy), Count1 (ref)
		local v1 = p1[Count1 + (p2 or 0)]
		
		return if v1 then v1.text else ""
	end
	
	local _ = function(p2)
		-- upvalues: p1 (copy), Count1 (ref)
		local TheValueEndedEarly = assert(p1[Count1], "The value ended early")
		assert(p2 == nil or TheValueEndedEarly.text == p2, `Expected {p2 or ""} but found {TheValueEndedEarly.text}`)
		Count1 += 1
		
		return TheValueEndedEarly
	end
	
	local function read()
		-- upvalues: p1 (copy), Count1 (ref), Callback (copy), read (copy)
		local v1 = p1[Count1]
		local IsNotFalse: boolean = v1 ~= nil and (v1.kind == "name" and (v1.text ~= "true" and v1.text ~= "false"))
		
		if Callback ~= nil then
			local v2 = p1[Count1 + 0]
			
			if (if v2 then v2.text else "") == "function" or IsNotFalse then
				local CallbackResult, CallbackResult2 = Callback(Count1)
				Count1 = CallbackResult2
				
				return CallbackResult
			end
		end
		local TheValueEndedEarly = assert(p1[Count1], "The value ended early")
		assert(true, `Expected  but found {TheValueEndedEarly.text}`)
		Count1 += 1
		
		if TheValueEndedEarly.kind == "string" then
			return (string.gsub(string.sub(TheValueEndedEarly.text, 2, -2), "\\(.)", function(Match)
				return if Match == "n" then "\n" elseif Match == "t" then "\t" else Match
			end))
		end
		if TheValueEndedEarly.kind == "number" then
			return assert(tonumber(TheValueEndedEarly.text), "Invalid number")
		end
		if TheValueEndedEarly.text == "true" or TheValueEndedEarly.text == "false" then
			return TheValueEndedEarly.text == "true"
		end
		assert(TheValueEndedEarly.text == "{", `Unexpected {TheValueEndedEarly.text}`)
		local t = {}
		local Count = 0
		local v3 = nil
		while true do
			local v4 = p1[Count1 + 0]
			if (if v4 then v4.text else "") == "}" then break end
			v3 = nil
			local v5 = p1[Count1 + 0]
			repeat
				if (if v5 then v5.text else "") == "[" then
					local TheValueEndedEarly1 = assert(p1[Count1], "The value ended early")
					assert(TheValueEndedEarly1.text == "[", `Expected [ but found {TheValueEndedEarly1.text}`)
					Count1 += 1
					local ReadResult = read()
					
					if type(ReadResult) == "string" or type(ReadResult) == "number" then
						v3 = ReadResult
					else
						error("Table keys are text or numbers")
					end
					local TheValueEndedEarly2 = assert(p1[Count1], "The value ended early")
					assert(TheValueEndedEarly2.text == "]", `Expected ] but found {TheValueEndedEarly2.text}`)
					Count1 += 1
					local TheValueEndedEarly3 = assert(p1[Count1], "The value ended early")
					assert(TheValueEndedEarly3.text == "=", `Expected = but found {TheValueEndedEarly3.text}`)
					Count1 += 1
					break
				else
					if p1[Count1] and p1[Count1].kind == "name" then
						local v6 = p1[Count1 + 1]
						
						if (if v6 then v6.text else "") == "=" then
							local TheValueEndedEarly4 = assert(p1[Count1], "The value ended early")
							assert(true, `Expected  but found {TheValueEndedEarly4.text}`)
							Count1 += 1
							v3 = TheValueEndedEarly4.text
							local TheValueEndedEarly5 = assert(p1[Count1], "The value ended early")
							assert(TheValueEndedEarly5.text == "=", `Expected = but found {TheValueEndedEarly5.text}`)
							Count1 += 1
							break
						end
					end
					Count += 1
					v3 = Count
				end
			until true
			t[v3] = read()
			local v7 = p1[Count1 + 0]
			
			if (if v7 then v7.text else "") ~= "," then continue end
			local TheValueEndedEarly6 = assert(p1[Count1], "The value ended early")
			assert(TheValueEndedEarly6.text == ",", `Expected , but found {TheValueEndedEarly6.text}`)
			Count1 += 1
			continue
		end
		local TheValueEndedEarly7 = assert(p1[Count1], "The value ended early")
		assert(TheValueEndedEarly7.text == "}", `Expected } but found {TheValueEndedEarly7.text}`)
		Count1 += 1
		
		return t
	end
	
	return read(), Count1
end

local Module = {
	typeImports = function(p2, Joined)
		-- upvalues: tokenize (copy)
		local t = {}
		local Kenize = tokenize(Joined)
		
		for i, value in Kenize do
			local KenizeEntry = Kenize[i + 1]
			local KenizeEntry1 = Kenize[i + 2]
			local KenizeEntry2 = Kenize[i + 3]
			
			if value.text == "local" and KenizeEntry and KenizeEntry1 and KenizeEntry2 and KenizeEntry1.text == "=" and KenizeEntry2.text == "require" then
				t[KenizeEntry.text] = true
			end
		end
		local v1 = (function(Text: string)
			-- upvalues: tokenize (upval), t (copy)
			local Kenize = tokenize(Text)
			local List = {}
			local Count = 1
			
			local function _(p3)
				-- upvalues: Kenize (copy), Count (ref)
				local KenizeEntry = Kenize[Count + (p3 or 0)]
				
				return if KenizeEntry then KenizeEntry.text else ""
			end
			
			local _ = function(p3)
				-- upvalues: Kenize (copy), Count (ref)
				local KenizeEntry = Kenize[Count + 0]
				assert((if KenizeEntry then KenizeEntry.text else "") == p3, "Type imports require a static module path")
				Count += 1
			end
			while Kenize[Count] do
				local KenizeEntry = Kenize[Count + 0]
				
				if (if KenizeEntry then KenizeEntry.text else "") == "local" then
					local KenizeEntry1 = Kenize[Count + 1]
					
					if (if KenizeEntry1 then KenizeEntry1.text else "") == "design" then break end
					local KenizeEntry2 = Kenize[Count + 1]
					
					if (if KenizeEntry2 then KenizeEntry2.text else "") == "_design" then break end
				end
				local KenizeEntry3 = Kenize[Count + 0]
				
				if (if KenizeEntry3 then KenizeEntry3.text else "") == "local" then
					local KenizeEntry4 = Kenize[Count + 2]
					
					if (if KenizeEntry4 then KenizeEntry4.text else "") == "=" then
						local KenizeEntry5 = Kenize[Count + 3]
						
						if (if KenizeEntry5 then KenizeEntry5.text else "") == "require" then
							local Count1: number = Count
							local KenizeEntry6 = Kenize[Count + 1]
							assert(KenizeEntry6.kind == "name", "Type imports declare a local name")
							Count += 4
							
							if t[KenizeEntry6.text] then continue end
							local KenizeEntry7 = Kenize[Count + 0]
							local v2 = (if KenizeEntry7 then KenizeEntry7.text else "") == "("
							
							if v2 then
								Count += 1
							end
							local TypeImportsRequireAModulePath = assert(Kenize[Count], "Type imports require a module path")
							Count += 1
							
							if TypeImportsRequireAModulePath.kind ~= "string" then
								assert(v2 and TypeImportsRequireAModulePath.kind == "name", "Type imports require a static module path")
								
								if TypeImportsRequireAModulePath.text == "game" then
									local KenizeEntry8 = Kenize[Count + 0]
									
									if (if KenizeEntry8 then KenizeEntry8.text else "") == ":" then
										local KenizeEntry9 = Kenize[Count + 0]
										assert((if KenizeEntry9 then KenizeEntry9.text else "") == ":", "Type imports require a static module path")
										Count += 1
										local KenizeEntry10 = Kenize[Count + 0]
										assert((if KenizeEntry10 then KenizeEntry10.text else "") == "GetService", "Type imports require a static module path")
										Count += 1
										local KenizeEntry11 = Kenize[Count + 0]
										assert((if KenizeEntry11 then KenizeEntry11.text else "") == "(", "Type imports require a static module path")
										Count += 1
										assert(Kenize[Count] and Kenize[Count].kind == "string", "Type imports name a service")
										Count += 1
										local KenizeEntry12 = Kenize[Count + 0]
										assert((if KenizeEntry12 then KenizeEntry12.text else "") == ")", "Type imports require a static module path")
										Count += 1
									end
								end
								while true do
									local KenizeEntry13 = Kenize[Count + 0]
									local v3 = (if KenizeEntry13 then KenizeEntry13.text else "") == "."
									if not v3 then
										local KenizeEntry14 = Kenize[Count + 0]
										v3 = (if KenizeEntry14 then KenizeEntry14.text else "") == "["
									end
									if not v3 then break end
									local KenizeEntry15 = Kenize[Count + 0]
									local v4 = (if KenizeEntry15 then KenizeEntry15.text else "") == "["
									Count += 1
									assert(assert(Kenize[Count], "Type imports require a path segment").kind == (if v4 then "string" else "name"), "Type imports require static path segments")
									Count += 1
									
									if not v4 then continue end
									local KenizeEntry16 = Kenize[Count + 0]
									assert((if KenizeEntry16 then KenizeEntry16.text else "") == "]", "Type imports require a static module path")
									Count += 1
									continue
								end
							end
							if v2 then
								local KenizeEntry17 = Kenize[Count + 0]
								assert((if KenizeEntry17 then KenizeEntry17.text else "") == ")", "Type imports require a static module path")
								Count += 1
							end
							local Flag = true
							local KenizeEntry18 = Kenize[Count + 0]
							local IsLocal = (if KenizeEntry18 then KenizeEntry18.text else "") == ""
							
							if not IsLocal then
								Flag = true
								local KenizeEntry19 = Kenize[Count + 0]
								IsLocal = (if KenizeEntry19 then KenizeEntry19.text else "") == "local"
							end
							if not IsLocal then
								Flag = true
								local KenizeEntry20 = Kenize[Count + 0]
								local IsExport = (if KenizeEntry20 then KenizeEntry20.text else "") == "export"
								
								if not IsExport then
									Flag = true
									local KenizeEntry21 = Kenize[Count + 0]
									IsExport = (if KenizeEntry21 then KenizeEntry21.text else "") == "type"
								end
								if not IsExport then
									local KenizeEntry22 = Kenize[Count + 0]
									Flag = (if KenizeEntry22 then KenizeEntry22.text else "") == "return"
								end
							end
							assert(Flag, "Type imports require a static module path")
							table.insert(List, (string.sub(Text, Kenize[Count1].start, Kenize[Count - 1].finish)))
						end
					end
				end
				Count += 1
			end
			return List
		end)(p2)
		
		return if #v1 > 0 then v1 else nil
	end,
	parseLiteral = function(p3)
		-- upvalues: tokenize (copy), readLiteral (copy)
		local Kenize = tokenize(p3)
		local Literal, Literal2 = readLiteral(Kenize, 1)
		assert(#Kenize < Literal2, "Unexpected text after the value")
		
		return Literal
	end
}

local _ = function(p3, p4)
	local v5 = p3[p4]
	assert(type(v5) == "string", `The design header needs text at {p4}`)
	
	return v5
end

local function list(Contract, p3)
	local ContractEntry = Contract[p3]
	local List = {}
	
	if ContractEntry == nil then
		return List
	end
	assert(type(ContractEntry) == "table", `The design header needs a list at {p3}`)
	
	for _, value in ContractEntry do
		assert(type(value) == "table", `The design header list {p3} holds records`)
		table.insert(List, value)
	end
	return List
end

local _ = function(p4)
	if p4 == "value" or p4 == "readable" or p4 == "cell" then
		return p4
	else
		error(`Unknown input kind {p4}`, 0)
	end
end

local function inputType(p4)
	if p4 == "string" or p4 == "number" or p4 == "boolean" or p4 == "color" or p4 == "image" or p4 == "vector3" or p4 == "list" or p4 == "record" or p4 == "slot" then
		return p4
	else
		error(`Unknown input type {p4}`, 0)
	end
end

local function stateFrom(p4)
	-- upvalues: list (copy)
	if p4.state == nil then
		return nil
	end
	local List = {}
	
	for _, value in list(p4, "state") do
		local Initial = value.initial
		assert(Initial ~= nil, "State needs an initial value")
		local t = {}
		local Id = value.id
		assert(type(Id) == "string", "The design header needs text at id")
		t.id = Id
		local Type1 = value.type
		assert(type(Type1) == "string", "The design header needs text at type")
		local Type2 = nil
		
		if Type1 == "string" or Type1 == "number" or Type1 == "boolean" or Type1 == "color" or Type1 == "image" or Type1 == "vector3" or Type1 == "list" or Type1 == "record" or Type1 == "slot" then
			Type2 = Type1
		else
			error(`Unknown input type {Type1}`, 0)
			Type2 = nil
		end
		t.type = Type2
		t.initial = Initial
		table.insert(List, t)
	end
	return List
end

local function sequencesFrom(p5)
	-- upvalues: list (copy)
	if p5.sequences == nil then
		return nil
	end
	local List = {}
	
	for _, value in list(p5, "sequences") do
		local Steps = {}
		
		for _, value1 in list(value, "steps") do
			local function _(p6)
				-- upvalues: value1 (copy)
				local Entry = value1[p6]
				
				return if type(Entry) == "string" then Entry else nil
			end
			
			local Delay = value1.delay
			local Delay1 = if type(Delay) == "string" then Delay else nil
			local Duration = value1.duration
			local Duration1 = if type(Duration) == "string" then Duration else nil
			local Easing = value1.easing
			local Easing1 = if type(Easing) == "string" then Easing else nil
			local State = value1.state
			local State1 = if type(State) == "string" then State else nil
			local Output = value1.output
			table.insert(Steps, {
				delay = Delay1,
				duration = Duration1,
				easing = Easing1,
				state = State1,
				to = value1.to,
				output = if type(Output) == "string" then Output else nil
			})
		end
		local t = {}
		local Id = value.id
		assert(type(Id) == "string", "The design header needs text at id")
		t.id = Id
		t.autoplay = value.autoplay == true or nil
		t.steps = Steps
		table.insert(List, t)
	end
	return List
end

local function fieldsFrom(p6)
	-- upvalues: list (copy), fieldsFrom (copy)
	local List1 = {}
	
	for _, value in list(p6, "fields") do
		local List = nil
		
		if type(value.options) == "table" then
			List = {}
			
			for _, option in value.options do
				assert(type(option) == "string", "Item options are text")
				table.insert(List, option)
			end
		end
		local t = {}
		local Id = value.id
		assert(type(Id) == "string", "The design header needs text at id")
		t.id = Id
		local Type1 = value.type
		assert(type(Type1) == "string", "The design header needs text at type")
		local Type2 = nil
		
		if Type1 == "string" or Type1 == "number" or Type1 == "boolean" or Type1 == "color" or Type1 == "image" or Type1 == "vector3" or Type1 == "list" or Type1 == "record" or Type1 == "slot" then
			Type2 = Type1
		else
			error(`Unknown input type {Type1}`, 0)
			Type2 = nil
		end
		t.type = Type2
		local LuauType = nil
		
		if value.luauType == nil then
			LuauType = nil
		else
			LuauType = value.luauType
			assert(type(LuauType) == "string", "The design header needs text at luauType")
		end
		t.luauType = LuauType
		t.fields = if value.fields == nil then nil else fieldsFrom(value)
		t.options = List
		table.insert(List1, t)
	end
	return List1
end

local function contractOf(p7)
	-- upvalues: list (copy), fieldsFrom (copy), inputType (copy)
	local Contract = p7.contract
	assert(type(Contract) == "table", "The design header needs a contract")
	local Inputs = {}
	
	for _, value in list(Contract, "inputs") do
		local FieldsFromResult = if value.fields == nil then nil else fieldsFrom(value)
		local Options = nil
		
		if value.options ~= nil then
			assert(type(value.options) == "table", "Input options are a list")
			local List = {}
			
			for _, option in value.options do
				assert(type(option) == "string", "Input options are text")
				table.insert(List, option)
			end
			Options = List
		end
		local t = {}
		local Id = value.id
		assert(type(Id) == "string", "The design header needs text at id")
		t.id = Id
		local Kind = value.kind
		assert(type(Kind) == "string", "The design header needs text at kind")
		local Kind1 = nil
		
		if Kind == "value" or Kind == "readable" or Kind == "cell" then
			Kind1 = Kind
		else
			error(`Unknown input kind {Kind}`, 0)
			Kind1 = nil
		end
		t.kind = Kind1
		local LuauType = nil
		
		if value.luauType == nil then
			LuauType = nil
		else
			LuauType = value.luauType
			assert(type(LuauType) == "string", "The design header needs text at luauType")
		end
		t.luauType = LuauType
		local Type1 = value.type
		assert(type(Type1) == "string", "The design header needs text at type")
		local Type2 = nil
		
		if Type1 == "string" or Type1 == "number" or Type1 == "boolean" or Type1 == "color" or Type1 == "image" or Type1 == "vector3" or Type1 == "list" or Type1 == "record" or Type1 == "slot" then
			Type2 = Type1
		else
			error(`Unknown input type {Type1}`, 0)
			Type2 = nil
		end
		t.type = Type2
		t.preview = value.preview
		t.fields = FieldsFromResult
		t.required = value.required == true or nil
		t.options = Options
		table.insert(Inputs, t)
	end
	local Outputs = {}
	
	for _, value1 in list(Contract, "outputs") do
		local Args = nil
		local Args1 = value1.args
		
		if Args1 ~= nil then
			assert(type(Args1) == "table", "Output arguments are a list")
			local List = {}
			
			for _, value2 in Args1 do
				assert(type(value2) == "string", "Output arguments name input types")
				table.insert(List, inputType(value2))
			end
			Args = List
		end
		local Row = value1.row
		local t = {}
		local Id = value1.id
		assert(type(Id) == "string", "The design header needs text at id")
		t.id = Id
		t.args = Args
		t.row = if type(Row) == "string" then Row else nil
		table.insert(Outputs, t)
	end
	return { inputs = Inputs, outputs = Outputs }
end

local function editorNodes(Tbl, ContentName, Callback: (any, any) -> ())
	-- upvalues: editorNodes (copy)
	Callback(Tbl, ContentName)
	local t = {}
	
	local function templates(Literal, p8)
		-- upvalues: t (copy), templates (copy)
		if type(Literal) ~= "table" then return end
		local Template = Literal["$template"]
		
		if type(Template) == "string" and (t[Template] == nil or p8 < t[Template]) then
			t[Template] = p8
		end
		for i, value in Literal do
			templates(value, `{p8}/{tostring(i)}`)
		end
	end
	
	for i, prop in Tbl.props do
		if prop.literal ~= nil then
			templates(prop.literal, (tostring(i)))
		end
	end
	local Count = 0
	
	for _, child in Tbl.children do
		local Entry = t[child.id]
		
		if Entry then
			editorNodes(child, `{ContentName}/content/{Entry}`, Callback)
		else
			Count += 1
			editorNodes(child, `{ContentName}/{Count}`, Callback)
		end
	end
	if Tbl.rowVariant then
		for _, cas in Tbl.rowVariant.cases do
			local Copy = table.clone(Tbl)
			Copy.rowVariant = nil
			local Children = cas.children
			Copy.props = cas.props
			Copy.children = Children
			editorNodes(Copy, `{ContentName}/variant/{cas.value}`, Callback)
		end
	end
end

function Module.parse(p9, p10)
	-- upvalues: tokenize (copy), readLiteral (copy), DatatypeModule (copy), contractOf (copy), editorNodes (copy), DocumentModule (copy), Module (copy), stateFrom (copy), sequencesFrom (copy)
	local Kenize = tokenize(p9)
	local Count = 1
	
	local function _(p11)
		-- upvalues: Kenize (copy), Count (ref)
		local KenizeEntry = Kenize[Count + (p11 or 0)]
		
		return if KenizeEntry then KenizeEntry.text else ""
	end
	
	local _ = function(p11)
		-- upvalues: Kenize (copy), Count (ref)
		local TheDesignSourceEndedEarly = assert(Kenize[Count], "The design source ended early")
		assert(p11 == nil or TheDesignSourceEndedEarly.text == p11, `Expected {p11 or ""} but found {TheDesignSourceEndedEarly.text}`)
		Count += 1
		
		return TheDesignSourceEndedEarly
	end
	
	local _ = function()
		-- upvalues: Kenize (copy), Count (ref)
		local TheDesignSourceEndedEarly = assert(Kenize[Count], "The design source ended early")
		assert(true, `Expected  but found {TheDesignSourceEndedEarly.text}`)
		Count += 1
		assert(TheDesignSourceEndedEarly.kind == "name", `Expected a name but found {TheDesignSourceEndedEarly.text}`)
		
		return TheDesignSourceEndedEarly.text
	end
	
	local function annotation(p11)
		-- upvalues: Kenize (copy), Count (ref)
		local KenizeEntry = Kenize[Count + 0]
		
		if (if KenizeEntry then KenizeEntry.text else "") == ":" then
			local TheDesignSourceEndedEarly = assert(Kenize[Count], "The design source ended early")
			assert(TheDesignSourceEndedEarly.text == ":", `Expected : but found {TheDesignSourceEndedEarly.text}`)
			Count += 1
			local Count1 = 0
			local v5 = ""
			while true do
				if Count1 <= 0 then
					local KenizeEntry1 = Kenize[Count + 0]
					
					if (if KenizeEntry1 then KenizeEntry1.text else "") == p11 then break end
				end
				local TheDesignSourceEndedEarly1 = assert(Kenize[Count], "The design source ended early")
				assert(true, `Expected  but found {TheDesignSourceEndedEarly1.text}`)
				Count += 1
				local Text = TheDesignSourceEndedEarly1.text
				
				if Text == "(" or Text == "{" or Text == "[" or Text == "<" then
					Count1 += 1
				elseif Text == ")" or Text == "}" or Text == "]" or Text == ">" and v5 ~= "-" then
					Count1 -= 1
				end
				if p11 == "return" and Count1 == 0 and Text ~= "." and Text ~= "|" and Text ~= "&" and Text ~= "-" and (Text ~= ">" or v5 ~= "-") then
					local KenizeEntry2 = Kenize[Count + 0]
					local v6 = (if KenizeEntry2 then KenizeEntry2.text else "") == "."
					
					if not v6 then
						local KenizeEntry3 = Kenize[Count + 0]
						v6 = (if KenizeEntry3 then KenizeEntry3.text else "") == "<"
					end
					if not v6 then
						local KenizeEntry4 = Kenize[Count + 0]
						local v7 = (if KenizeEntry4 then KenizeEntry4.text else "") == "?"
						
						if not v7 then
							local KenizeEntry5 = Kenize[Count + 0]
							v7 = (if KenizeEntry5 then KenizeEntry5.text else "") == "|"
						end
						if not v7 then
							local KenizeEntry6 = Kenize[Count + 0]
							local v8 = (if KenizeEntry6 then KenizeEntry6.text else "") == "&"
							
							if not v8 then
								local KenizeEntry7 = Kenize[Count + 0]
								v8 = (if KenizeEntry7 then KenizeEntry7.text else "") == "-"
							end
							if not v8 then break end
						end
					end
				end
				v5 = Text
			end
		end
	end
	
	local _ = function()
		-- upvalues: Kenize (copy), Count (ref), p10 (copy)
		local TheDesignSourceEndedEarly = assert(Kenize[Count], "The design source ended early")
		assert(true, `Expected  but found {TheDesignSourceEndedEarly.text}`)
		Count += 1
		assert(TheDesignSourceEndedEarly.kind == "name", `Expected a name but found {TheDesignSourceEndedEarly.text}`)
		local Text = TheDesignSourceEndedEarly.text
		assert(Text ~= "use", "Layout functions use a typed readable input: compute the value in the caller and bind props.<input>")
		assert(Text ~= "props" and (Text ~= "state" and (Text ~= "refs" and Text ~= p10.parameter)), "Row parameters must not shadow Design inputs, state, references or controls")
		
		return Text
	end
	
	local v9 = "current"
	
	local function rowAlias()
		-- upvalues: Kenize (copy), Count (ref), v9 (ref)
		local KenizeEntry = Kenize[Count + 0]
		
		if (if KenizeEntry then KenizeEntry.text else "") == "local" then
			local KenizeEntry1 = Kenize[Count + 1]
			
			if string.match(if KenizeEntry1 then KenizeEntry1.text else "", "^row_[%w]+$") then
				local TheDesignSourceEndedEarly = assert(Kenize[Count], "The design source ended early")
				assert(TheDesignSourceEndedEarly.text == "local", `Expected local but found {TheDesignSourceEndedEarly.text}`)
				Count += 1
				assert(true, `Expected  but found {assert(Kenize[Count], "The design source ended early").text}`)
				Count += 1
				local TheDesignSourceEndedEarly1 = assert(Kenize[Count], "The design source ended early")
				assert(TheDesignSourceEndedEarly1.text == "=", `Expected = but found {TheDesignSourceEndedEarly1.text}`)
				Count += 1
				local v10 = v9
				local TheDesignSourceEndedEarly2 = assert(Kenize[Count], "The design source ended early")
				assert(v10 == nil or TheDesignSourceEndedEarly2.text == v10, `Expected {v10 or ""} but found {TheDesignSourceEndedEarly2.text}`)
				Count += 1
			end
		end
	end
	
	local _ = function()
		-- upvalues: Kenize (copy), Count (ref)
		local TheDesignSourceEndedEarly = assert(Kenize[Count], "The design source ended early")
		assert(TheDesignSourceEndedEarly.text == ",", `Expected , but found {TheDesignSourceEndedEarly.text}`)
		Count += 1
		local TheDesignSourceEndedEarly1 = assert(Kenize[Count], "The design source ended early")
		assert(true, `Expected  but found {TheDesignSourceEndedEarly1.text}`)
		Count += 1
		assert(TheDesignSourceEndedEarly1.kind == "string" and string.gsub(string.sub(TheDesignSourceEndedEarly1.text, 2, -2), "\\(.)", function(Match)
			return if Match == "n" then "\n" elseif Match == "t" then "\t" else Match
		end) == "Node reference is not captured", "Node references assert their capture")
		local TheDesignSourceEndedEarly2 = assert(Kenize[Count], "The design source ended early")
		assert(TheDesignSourceEndedEarly2.text == ")", `Expected ) but found {TheDesignSourceEndedEarly2.text}`)
		Count += 1
	end
	
	local t = {}
	
	for i, kind in p10.kinds do
		t[kind.call] = i
	end
	local t1 = {}
	local Contract = { inputs = {}, outputs = {} }
	local t2 = {}
	local t3 = {}
	local t4 = {}
	local Callback = nil
	
	local function rowBody(TheDesignSourceEndedEarly)
		-- upvalues: v9 (ref), rowAlias (copy), Kenize (copy), Count (ref), Callback (ref)
		local v10 = v9
		v9 = TheDesignSourceEndedEarly or v9
		rowAlias()
		local Cases = {}
		local List = {}
		local Item = nil
		while true do
			local KenizeEntry = Kenize[Count + 0]
			if (if KenizeEntry then KenizeEntry.text else "") ~= "if" then break end
			local TheDesignSourceEndedEarly1 = assert(Kenize[Count], "The design source ended early")
			assert(TheDesignSourceEndedEarly1.text == "if", `Expected if but found {TheDesignSourceEndedEarly1.text}`)
			Count += 1
			local v11 = v9
			local TheDesignSourceEndedEarly2 = assert(Kenize[Count], "The design source ended early")
			assert(v11 == nil or TheDesignSourceEndedEarly2.text == v11, `Expected {v11 or ""} but found {TheDesignSourceEndedEarly2.text}`)
			Count += 1
			local TheDesignSourceEndedEarly3 = assert(Kenize[Count], "The design source ended early")
			assert(TheDesignSourceEndedEarly3.text == ":", `Expected : but found {TheDesignSourceEndedEarly3.text}`)
			Count += 1
			local TheDesignSourceEndedEarly4 = assert(Kenize[Count], "The design source ended early")
			assert(TheDesignSourceEndedEarly4.text == "peek", `Expected peek but found {TheDesignSourceEndedEarly4.text}`)
			Count += 1
			local TheDesignSourceEndedEarly5 = assert(Kenize[Count], "The design source ended early")
			assert(TheDesignSourceEndedEarly5.text == "(", `Expected ( but found {TheDesignSourceEndedEarly5.text}`)
			Count += 1
			local TheDesignSourceEndedEarly6 = assert(Kenize[Count], "The design source ended early")
			assert(TheDesignSourceEndedEarly6.text == ")", `Expected ) but found {TheDesignSourceEndedEarly6.text}`)
			Count += 1
			local TheDesignSourceEndedEarly7 = assert(Kenize[Count], "The design source ended early")
			assert(TheDesignSourceEndedEarly7.text == ".", `Expected . but found {TheDesignSourceEndedEarly7.text}`)
			Count += 1
			local TheDesignSourceEndedEarly8 = assert(Kenize[Count], "The design source ended early")
			assert(true, `Expected  but found {TheDesignSourceEndedEarly8.text}`)
			Count += 1
			assert(TheDesignSourceEndedEarly8.kind == "name", `Expected a name but found {TheDesignSourceEndedEarly8.text}`)
			local Text = TheDesignSourceEndedEarly8.text
			assert(Item == nil or Item == Text, "Row variants read one enum field")
			Item = Text
			local TheDesignSourceEndedEarly9 = assert(Kenize[Count], "The design source ended early")
			assert(TheDesignSourceEndedEarly9.text == "=", `Expected = but found {TheDesignSourceEndedEarly9.text}`)
			Count += 1
			local TheDesignSourceEndedEarly10 = assert(Kenize[Count], "The design source ended early")
			assert(TheDesignSourceEndedEarly10.text == "=", `Expected = but found {TheDesignSourceEndedEarly10.text}`)
			Count += 1
			local TheDesignSourceEndedEarly11 = assert(Kenize[Count], "The design source ended early")
			assert(true, `Expected  but found {TheDesignSourceEndedEarly11.text}`)
			Count += 1
			assert(TheDesignSourceEndedEarly11.kind == "string", "Row variants select text enum options")
			local TheDesignSourceEndedEarly12 = assert(Kenize[Count], "The design source ended early")
			assert(TheDesignSourceEndedEarly12.text == "then", `Expected then but found {TheDesignSourceEndedEarly12.text}`)
			Count += 1
			local TheDesignSourceEndedEarly13 = assert(Kenize[Count], "The design source ended early")
			assert(TheDesignSourceEndedEarly13.text == "return", `Expected return but found {TheDesignSourceEndedEarly13.text}`)
			Count += 1
			local CallbackResult = Callback()
			table.insert(List, CallbackResult)
			table.insert(Cases, {
				value = string.gsub(string.sub(TheDesignSourceEndedEarly11.text, 2, -2), "\\(.)", function(Match)
					return if Match == "n" then "\n" elseif Match == "t" then "\t" else Match
				end),
				kind = CallbackResult.kind,
				props = CallbackResult.props,
				children = CallbackResult.children
			})
			local TheDesignSourceEndedEarly14 = assert(Kenize[Count], "The design source ended early")
			assert(TheDesignSourceEndedEarly14.text == "end", `Expected end but found {TheDesignSourceEndedEarly14.text}`)
			Count += 1
		end
		local TheDesignSourceEndedEarly15 = assert(Kenize[Count], "The design source ended early")
		assert(TheDesignSourceEndedEarly15.text == "return", `Expected return but found {TheDesignSourceEndedEarly15.text}`)
		Count += 1
		local CallbackResult = Callback()
		
		if Item then
			for _, value in List do
				assert(if CallbackResult.nameInput == nil and CallbackResult.nameField == nil then value.name == CallbackResult.name and (value.nameInput == CallbackResult.nameInput and value.nameField == CallbackResult.nameField) else value.nameInput == CallbackResult.nameInput and value.nameField == CallbackResult.nameField, "Row variants keep one direct root name")
			end
			CallbackResult.rowVariant = { item = Item, cases = Cases }
		end
		v9 = v10
		
		return CallbackResult
	end
	
	local List = {}
	
	local _ = function()
		-- upvalues: readLiteral (upval), Kenize (copy), Count (ref), t1 (copy), List (ref), v9 (ref), p10 (copy), annotation (copy), Callback (ref)
		local Literal, Literal2 = readLiteral(Kenize, Count, function(p12)
			-- upvalues: Count (upval), Kenize (upval), t1 (upval), List (upval), v9 (upval), p10 (upval), annotation (upval), Callback (upval)
			Count = p12
			local v12 = Kenize[Count + 0]
			
			if (if v12 then v12.text else "") == "props" then
				local TheDesignSourceEndedEarly = assert(Kenize[Count], "The design source ended early")
				assert(TheDesignSourceEndedEarly.text == "props", `Expected props but found {TheDesignSourceEndedEarly.text}`)
				Count += 1
				local TheDesignSourceEndedEarly1 = assert(Kenize[Count], "The design source ended early")
				assert(TheDesignSourceEndedEarly1.text == ".", `Expected . but found {TheDesignSourceEndedEarly1.text}`)
				Count += 1
				local t = {}
				local TheDesignSourceEndedEarly2 = assert(Kenize[Count], "The design source ended early")
				assert(true, `Expected  but found {TheDesignSourceEndedEarly2.text}`)
				Count += 1
				assert(TheDesignSourceEndedEarly2.kind == "name", `Expected a name but found {TheDesignSourceEndedEarly2.text}`)
				t["$input"] = TheDesignSourceEndedEarly2.text
				
				return t, Count
			end
			local v13 = Kenize[Count + 0]
			
			if (if v13 then v13.text else "") == "function" then
				local TheDesignSourceEndedEarly = assert(Kenize[Count], "The design source ended early")
				assert(TheDesignSourceEndedEarly.text == "function", `Expected function but found {TheDesignSourceEndedEarly.text}`)
				Count += 1
				local TheDesignSourceEndedEarly3 = assert(Kenize[Count], "The design source ended early")
				assert(TheDesignSourceEndedEarly3.text == "(", `Expected ( but found {TheDesignSourceEndedEarly3.text}`)
				Count += 1
				local v14 = Kenize[Count + 0]
				assert((if v14 then v14.text else "") ~= "use", "Layout functions use a typed readable input: compute the value in the caller and bind props.<input>")
				
				if not Kenize[Count] or Kenize[Count].kind ~= "name" then
					local v15 = Kenize[Count + 0]
					
					if (if v15 then v15.text else "") ~= ")" then
						local TheDesignSourceEndedEarly4 = assert(Kenize[Count], "The design source ended early")
						assert(TheDesignSourceEndedEarly4.text == "...", `Expected ... but found {TheDesignSourceEndedEarly4.text}`)
						Count += 1
						local TheDesignSourceEndedEarly5 = assert(Kenize[Count], "The design source ended early")
						assert(TheDesignSourceEndedEarly5.text == ")", `Expected ) but found {TheDesignSourceEndedEarly5.text}`)
						Count += 1
						local TheDesignSourceEndedEarly6 = assert(Kenize[Count], "The design source ended early")
						assert(TheDesignSourceEndedEarly6.text == "if", `Expected if but found {TheDesignSourceEndedEarly6.text}`)
						Count += 1
						local TheDesignSourceEndedEarly7 = assert(Kenize[Count], "The design source ended early")
						assert(TheDesignSourceEndedEarly7.text == "props", `Expected props but found {TheDesignSourceEndedEarly7.text}`)
						Count += 1
						local TheDesignSourceEndedEarly8 = assert(Kenize[Count], "The design source ended early")
						assert(TheDesignSourceEndedEarly8.text == ".", `Expected . but found {TheDesignSourceEndedEarly8.text}`)
						Count += 1
						local TheDesignSourceEndedEarly9 = assert(Kenize[Count], "The design source ended early")
						assert(true, `Expected  but found {TheDesignSourceEndedEarly9.text}`)
						Count += 1
						assert(TheDesignSourceEndedEarly9.kind == "name", `Expected a name but found {TheDesignSourceEndedEarly9.text}`)
						local Text = TheDesignSourceEndedEarly9.text
						local TheDesignSourceEndedEarly10 = assert(Kenize[Count], "The design source ended early")
						assert(TheDesignSourceEndedEarly10.text == "then", `Expected then but found {TheDesignSourceEndedEarly10.text}`)
						Count += 1
						local TheDesignSourceEndedEarly11 = assert(Kenize[Count], "The design source ended early")
						assert(TheDesignSourceEndedEarly11.text == "props", `Expected props but found {TheDesignSourceEndedEarly11.text}`)
						Count += 1
						local TheDesignSourceEndedEarly12 = assert(Kenize[Count], "The design source ended early")
						assert(TheDesignSourceEndedEarly12.text == ".", `Expected . but found {TheDesignSourceEndedEarly12.text}`)
						Count += 1
						local TheDesignSourceEndedEarly13 = assert(Kenize[Count], "The design source ended early")
						assert(Text == nil or TheDesignSourceEndedEarly13.text == Text, `Expected {Text or ""} but found {TheDesignSourceEndedEarly13.text}`)
						Count += 1
						local TheDesignSourceEndedEarly14 = assert(Kenize[Count], "The design source ended early")
						assert(TheDesignSourceEndedEarly14.text == "(", `Expected ( but found {TheDesignSourceEndedEarly14.text}`)
						Count += 1
						local config = { ["$output"] = Text }
						local v16 = Kenize[Count + 0]
						
						if (if v16 then v16.text else "") == v9 then
							local v17 = v9
							local TheDesignSourceEndedEarly15 = assert(Kenize[Count], "The design source ended early")
							assert(v17 == nil or TheDesignSourceEndedEarly15.text == v17, `Expected {v17 or ""} but found {TheDesignSourceEndedEarly15.text}`)
							Count += 1
							local TheDesignSourceEndedEarly16 = assert(Kenize[Count], "The design source ended early")
							assert(TheDesignSourceEndedEarly16.text == ":", `Expected : but found {TheDesignSourceEndedEarly16.text}`)
							Count += 1
							local TheDesignSourceEndedEarly17 = assert(Kenize[Count], "The design source ended early")
							assert(TheDesignSourceEndedEarly17.text == "peek", `Expected peek but found {TheDesignSourceEndedEarly17.text}`)
							Count += 1
							local TheDesignSourceEndedEarly18 = assert(Kenize[Count], "The design source ended early")
							assert(TheDesignSourceEndedEarly18.text == "(", `Expected ( but found {TheDesignSourceEndedEarly18.text}`)
							Count += 1
							local TheDesignSourceEndedEarly19 = assert(Kenize[Count], "The design source ended early")
							assert(TheDesignSourceEndedEarly19.text == ")", `Expected ) but found {TheDesignSourceEndedEarly19.text}`)
							Count += 1
							config["$row"] = true
						else
							local TheDesignSourceEndedEarly20 = assert(Kenize[Count], "The design source ended early")
							assert(TheDesignSourceEndedEarly20.text == "...", `Expected ... but found {TheDesignSourceEndedEarly20.text}`)
							Count += 1
						end
						local TheDesignSourceEndedEarly21 = assert(Kenize[Count], "The design source ended early")
						assert(TheDesignSourceEndedEarly21.text == ")", `Expected ) but found {TheDesignSourceEndedEarly21.text}`)
						Count += 1
						local TheDesignSourceEndedEarly22 = assert(Kenize[Count], "The design source ended early")
						assert(TheDesignSourceEndedEarly22.text == "end", `Expected end but found {TheDesignSourceEndedEarly22.text}`)
						Count += 1
						local TheDesignSourceEndedEarly23 = assert(Kenize[Count], "The design source ended early")
						assert(TheDesignSourceEndedEarly23.text == "end", `Expected end but found {TheDesignSourceEndedEarly23.text}`)
						Count += 1
						
						return config, Count
					end
				end
				local v14 = v9
				local v15 = Kenize[Count + 0]
				
				if (if v15 then v15.text else "") ~= ")" then
					local TheDesignSourceEndedEarly24 = assert(Kenize[Count], "The design source ended early")
					assert(true, `Expected  but found {TheDesignSourceEndedEarly24.text}`)
					Count += 1
					assert(TheDesignSourceEndedEarly24.kind == "name", `Expected a name but found {TheDesignSourceEndedEarly24.text}`)
					local Text = TheDesignSourceEndedEarly24.text
					assert(Text ~= "use", "Layout functions use a typed readable input: compute the value in the caller and bind props.<input>")
					assert(Text ~= "props" and (Text ~= "state" and (Text ~= "refs" and Text ~= p10.parameter)), "Row parameters must not shadow Design inputs, state, references or controls")
					v9 = Text
					annotation(")")
				end
				local TheDesignSourceEndedEarly25 = assert(Kenize[Count], "The design source ended early")
				assert(TheDesignSourceEndedEarly25.text == ")", `Expected ) but found {TheDesignSourceEndedEarly25.text}`)
				Count += 1
				annotation("return")
				local TheDesignSourceEndedEarly26 = assert(Kenize[Count], "The design source ended early")
				assert(TheDesignSourceEndedEarly26.text == "return", `Expected return but found {TheDesignSourceEndedEarly26.text}`)
				Count += 1
				local v16 = Callback()
				local TheDesignSourceEndedEarly27 = assert(Kenize[Count], "The design source ended early")
				assert(TheDesignSourceEndedEarly27.text == "end", `Expected end but found {TheDesignSourceEndedEarly27.text}`)
				Count += 1
				v9 = v14
				table.insert(List, v16)
				
				return { ["$template"] = v16.id }, Count
			else
				local TheDesignSourceEndedEarly = assert(Kenize[Count], "The design source ended early")
				assert(true, `Expected  but found {TheDesignSourceEndedEarly.text}`)
				Count += 1
				assert(TheDesignSourceEndedEarly.kind == "name", `Expected a name but found {TheDesignSourceEndedEarly.text}`)
				local Text = TheDesignSourceEndedEarly.text
				while true do
					local v17 = Kenize[Count + 0]
					if (if v17 then v17.text else "") ~= "." then break end
					local TheDesignSourceEndedEarly28 = assert(Kenize[Count], "The design source ended early")
					assert(TheDesignSourceEndedEarly28.text == ".", `Expected . but found {TheDesignSourceEndedEarly28.text}`)
					Count += 1
					local v18 = "."
					local TheDesignSourceEndedEarly29 = assert(Kenize[Count], "The design source ended early")
					assert(true, `Expected  but found {TheDesignSourceEndedEarly29.text}`)
					Count += 1
					assert(TheDesignSourceEndedEarly29.kind == "name", `Expected a name but found {TheDesignSourceEndedEarly29.text}`)
					Text ..= v18 .. TheDesignSourceEndedEarly29.text
				end
				local v19 = Kenize[Count + 0]
				assert((if v19 then v19.text else "") ~= "(", `{Text} is custom code; compute it in the caller and bind props.<input> or a library token`)
				local v20 = assert(t1[Text], `{Text} is not a row function`)
				table.insert(List, v20)
				
				return { ["$template"] = v20.id }, Count
			end
		end)
		Count = Literal2
		
		return Literal
	end
	
	local Count1 = 1
	
	local function dotted()
		-- upvalues: Kenize (copy), Count (ref)
		local TheDesignSourceEndedEarly = assert(Kenize[Count], "The design source ended early")
		assert(true, `Expected  but found {TheDesignSourceEndedEarly.text}`)
		Count += 1
		assert(TheDesignSourceEndedEarly.kind == "name", `Expected a name but found {TheDesignSourceEndedEarly.text}`)
		local Text = TheDesignSourceEndedEarly.text
		while true do
			local KenizeEntry = Kenize[Count + 0]
			if (if KenizeEntry then KenizeEntry.text else "") ~= "." then break end
			local TheDesignSourceEndedEarly1 = assert(Kenize[Count], "The design source ended early")
			assert(TheDesignSourceEndedEarly1.text == ".", `Expected . but found {TheDesignSourceEndedEarly1.text}`)
			Count += 1
			local v12 = "."
			local TheDesignSourceEndedEarly2 = assert(Kenize[Count], "The design source ended early")
			assert(true, `Expected  but found {TheDesignSourceEndedEarly2.text}`)
			Count += 1
			assert(TheDesignSourceEndedEarly2.kind == "name", `Expected a name but found {TheDesignSourceEndedEarly2.text}`)
			Text ..= v12 .. TheDesignSourceEndedEarly2.text
		end
		return Text
	end
	
	local function token()
		-- upvalues: p10 (copy), Kenize (copy), Count (ref), dotted (copy), readLiteral (upval), t1 (copy), List (ref), v9 (ref), annotation (copy), Callback (ref)
		local Token: string = p10.token
		
		if Token == nil or Kenize[Count] == nil or Kenize[Count].kind ~= "name" then
			return nil
		end
		local Count1: number = Count
		local DottedResult: string = dotted()
		
		if string.sub(Token, -1) == "." and string.sub(DottedResult, 1, #Token) == Token then
			return (string.sub(DottedResult, #Token + 1))
		end
		if DottedResult ~= Token then
			Count = Count1
			
			return nil
		end
		local KenizeEntry = Kenize[Count + 0]
		local v13 = (if KenizeEntry then KenizeEntry.text else "") == "("
		
		if v13 then
			local TheDesignSourceEndedEarly = assert(Kenize[Count], "The design source ended early")
			assert(TheDesignSourceEndedEarly.text == "(", `Expected ( but found {TheDesignSourceEndedEarly.text}`)
			Count += 1
		end
		local Literal, Literal2 = readLiteral(Kenize, Count, function(p12)
			-- upvalues: Count (upval), Kenize (upval), t1 (upval), List (upval), v9 (upval), p10 (upval), annotation (upval), Callback (upval)
			Count = p12
			local v14 = Kenize[Count + 0]
			
			if (if v14 then v14.text else "") == "props" then
				local TheDesignSourceEndedEarly = assert(Kenize[Count], "The design source ended early")
				assert(TheDesignSourceEndedEarly.text == "props", `Expected props but found {TheDesignSourceEndedEarly.text}`)
				Count += 1
				local TheDesignSourceEndedEarly1 = assert(Kenize[Count], "The design source ended early")
				assert(TheDesignSourceEndedEarly1.text == ".", `Expected . but found {TheDesignSourceEndedEarly1.text}`)
				Count += 1
				local t = {}
				local TheDesignSourceEndedEarly2 = assert(Kenize[Count], "The design source ended early")
				assert(true, `Expected  but found {TheDesignSourceEndedEarly2.text}`)
				Count += 1
				assert(TheDesignSourceEndedEarly2.kind == "name", `Expected a name but found {TheDesignSourceEndedEarly2.text}`)
				t["$input"] = TheDesignSourceEndedEarly2.text
				
				return t, Count
			end
			local v15 = Kenize[Count + 0]
			
			if (if v15 then v15.text else "") == "function" then
				local TheDesignSourceEndedEarly = assert(Kenize[Count], "The design source ended early")
				assert(TheDesignSourceEndedEarly.text == "function", `Expected function but found {TheDesignSourceEndedEarly.text}`)
				Count += 1
				local TheDesignSourceEndedEarly3 = assert(Kenize[Count], "The design source ended early")
				assert(TheDesignSourceEndedEarly3.text == "(", `Expected ( but found {TheDesignSourceEndedEarly3.text}`)
				Count += 1
				local v16 = Kenize[Count + 0]
				assert((if v16 then v16.text else "") ~= "use", "Layout functions use a typed readable input: compute the value in the caller and bind props.<input>")
				
				if not Kenize[Count] or Kenize[Count].kind ~= "name" then
					local v17 = Kenize[Count + 0]
					
					if (if v17 then v17.text else "") ~= ")" then
						local TheDesignSourceEndedEarly4 = assert(Kenize[Count], "The design source ended early")
						assert(TheDesignSourceEndedEarly4.text == "...", `Expected ... but found {TheDesignSourceEndedEarly4.text}`)
						Count += 1
						local TheDesignSourceEndedEarly5 = assert(Kenize[Count], "The design source ended early")
						assert(TheDesignSourceEndedEarly5.text == ")", `Expected ) but found {TheDesignSourceEndedEarly5.text}`)
						Count += 1
						local TheDesignSourceEndedEarly6 = assert(Kenize[Count], "The design source ended early")
						assert(TheDesignSourceEndedEarly6.text == "if", `Expected if but found {TheDesignSourceEndedEarly6.text}`)
						Count += 1
						local TheDesignSourceEndedEarly7 = assert(Kenize[Count], "The design source ended early")
						assert(TheDesignSourceEndedEarly7.text == "props", `Expected props but found {TheDesignSourceEndedEarly7.text}`)
						Count += 1
						local TheDesignSourceEndedEarly8 = assert(Kenize[Count], "The design source ended early")
						assert(TheDesignSourceEndedEarly8.text == ".", `Expected . but found {TheDesignSourceEndedEarly8.text}`)
						Count += 1
						local TheDesignSourceEndedEarly9 = assert(Kenize[Count], "The design source ended early")
						assert(true, `Expected  but found {TheDesignSourceEndedEarly9.text}`)
						Count += 1
						assert(TheDesignSourceEndedEarly9.kind == "name", `Expected a name but found {TheDesignSourceEndedEarly9.text}`)
						local Text = TheDesignSourceEndedEarly9.text
						local TheDesignSourceEndedEarly10 = assert(Kenize[Count], "The design source ended early")
						assert(TheDesignSourceEndedEarly10.text == "then", `Expected then but found {TheDesignSourceEndedEarly10.text}`)
						Count += 1
						local TheDesignSourceEndedEarly11 = assert(Kenize[Count], "The design source ended early")
						assert(TheDesignSourceEndedEarly11.text == "props", `Expected props but found {TheDesignSourceEndedEarly11.text}`)
						Count += 1
						local TheDesignSourceEndedEarly12 = assert(Kenize[Count], "The design source ended early")
						assert(TheDesignSourceEndedEarly12.text == ".", `Expected . but found {TheDesignSourceEndedEarly12.text}`)
						Count += 1
						local TheDesignSourceEndedEarly13 = assert(Kenize[Count], "The design source ended early")
						assert(Text == nil or TheDesignSourceEndedEarly13.text == Text, `Expected {Text or ""} but found {TheDesignSourceEndedEarly13.text}`)
						Count += 1
						local TheDesignSourceEndedEarly14 = assert(Kenize[Count], "The design source ended early")
						assert(TheDesignSourceEndedEarly14.text == "(", `Expected ( but found {TheDesignSourceEndedEarly14.text}`)
						Count += 1
						local config = { ["$output"] = Text }
						local v18 = Kenize[Count + 0]
						
						if (if v18 then v18.text else "") == v9 then
							local v19 = v9
							local TheDesignSourceEndedEarly15 = assert(Kenize[Count], "The design source ended early")
							assert(v19 == nil or TheDesignSourceEndedEarly15.text == v19, `Expected {v19 or ""} but found {TheDesignSourceEndedEarly15.text}`)
							Count += 1
							local TheDesignSourceEndedEarly16 = assert(Kenize[Count], "The design source ended early")
							assert(TheDesignSourceEndedEarly16.text == ":", `Expected : but found {TheDesignSourceEndedEarly16.text}`)
							Count += 1
							local TheDesignSourceEndedEarly17 = assert(Kenize[Count], "The design source ended early")
							assert(TheDesignSourceEndedEarly17.text == "peek", `Expected peek but found {TheDesignSourceEndedEarly17.text}`)
							Count += 1
							local TheDesignSourceEndedEarly18 = assert(Kenize[Count], "The design source ended early")
							assert(TheDesignSourceEndedEarly18.text == "(", `Expected ( but found {TheDesignSourceEndedEarly18.text}`)
							Count += 1
							local TheDesignSourceEndedEarly19 = assert(Kenize[Count], "The design source ended early")
							assert(TheDesignSourceEndedEarly19.text == ")", `Expected ) but found {TheDesignSourceEndedEarly19.text}`)
							Count += 1
							config["$row"] = true
						else
							local TheDesignSourceEndedEarly20 = assert(Kenize[Count], "The design source ended early")
							assert(TheDesignSourceEndedEarly20.text == "...", `Expected ... but found {TheDesignSourceEndedEarly20.text}`)
							Count += 1
						end
						local TheDesignSourceEndedEarly21 = assert(Kenize[Count], "The design source ended early")
						assert(TheDesignSourceEndedEarly21.text == ")", `Expected ) but found {TheDesignSourceEndedEarly21.text}`)
						Count += 1
						local TheDesignSourceEndedEarly22 = assert(Kenize[Count], "The design source ended early")
						assert(TheDesignSourceEndedEarly22.text == "end", `Expected end but found {TheDesignSourceEndedEarly22.text}`)
						Count += 1
						local TheDesignSourceEndedEarly23 = assert(Kenize[Count], "The design source ended early")
						assert(TheDesignSourceEndedEarly23.text == "end", `Expected end but found {TheDesignSourceEndedEarly23.text}`)
						Count += 1
						
						return config, Count
					end
				end
				local v16 = v9
				local v17 = Kenize[Count + 0]
				
				if (if v17 then v17.text else "") ~= ")" then
					local TheDesignSourceEndedEarly24 = assert(Kenize[Count], "The design source ended early")
					assert(true, `Expected  but found {TheDesignSourceEndedEarly24.text}`)
					Count += 1
					assert(TheDesignSourceEndedEarly24.kind == "name", `Expected a name but found {TheDesignSourceEndedEarly24.text}`)
					local Text = TheDesignSourceEndedEarly24.text
					assert(Text ~= "use", "Layout functions use a typed readable input: compute the value in the caller and bind props.<input>")
					assert(Text ~= "props" and (Text ~= "state" and (Text ~= "refs" and Text ~= p10.parameter)), "Row parameters must not shadow Design inputs, state, references or controls")
					v9 = Text
					annotation(")")
				end
				local TheDesignSourceEndedEarly25 = assert(Kenize[Count], "The design source ended early")
				assert(TheDesignSourceEndedEarly25.text == ")", `Expected ) but found {TheDesignSourceEndedEarly25.text}`)
				Count += 1
				annotation("return")
				local TheDesignSourceEndedEarly26 = assert(Kenize[Count], "The design source ended early")
				assert(TheDesignSourceEndedEarly26.text == "return", `Expected return but found {TheDesignSourceEndedEarly26.text}`)
				Count += 1
				local v18 = Callback()
				local TheDesignSourceEndedEarly27 = assert(Kenize[Count], "The design source ended early")
				assert(TheDesignSourceEndedEarly27.text == "end", `Expected end but found {TheDesignSourceEndedEarly27.text}`)
				Count += 1
				v9 = v16
				table.insert(List, v18)
				
				return { ["$template"] = v18.id }, Count
			else
				local TheDesignSourceEndedEarly = assert(Kenize[Count], "The design source ended early")
				assert(true, `Expected  but found {TheDesignSourceEndedEarly.text}`)
				Count += 1
				assert(TheDesignSourceEndedEarly.kind == "name", `Expected a name but found {TheDesignSourceEndedEarly.text}`)
				local Text = TheDesignSourceEndedEarly.text
				local v19 = Kenize[Count + 0]
				
				if (if v19 then v19.text else "") ~= "." then
				end
				local TheDesignSourceEndedEarly28 = assert(Kenize[Count], "The design source ended early")
				assert(TheDesignSourceEndedEarly28.text == ".", `Expected . but found {TheDesignSourceEndedEarly28.text}`)
				Count += 1
				local v20 = "."
				local TheDesignSourceEndedEarly29 = assert(Kenize[Count], "The design source ended early")
				assert(true, `Expected  but found {TheDesignSourceEndedEarly29.text}`)
				Count += 1
				assert(TheDesignSourceEndedEarly29.kind == "name", `Expected a name but found {TheDesignSourceEndedEarly29.text}`)
				Text ..= v20 .. TheDesignSourceEndedEarly29.text
			end
		end)
		Count = Literal2
		
		if v336 then
			local TheDesignSourceEndedEarly = assert(Kenize[Count], "The design source ended early")
			assert(TheDesignSourceEndedEarly.text == ")", `Expected ) but found {TheDesignSourceEndedEarly.text}`)
			Count += 1
		end
		assert(type(Literal) == "string", "Token names are text")
		
		return Literal
	end
	
	local Motion = p10.motion
	local Kenize1 = if Motion then tokenize(Motion.call .. "(") else {}
	
	local _ = function(): boolean
		-- upvalues: Kenize1 (copy), Kenize (copy), Count (ref)
		for i, value in Kenize1 do
			local KenizeEntry = Kenize[Count + (i - 1 or 0)]
			
			if (if KenizeEntry then KenizeEntry.text else "") ~= value.text then
				return false
			end
		end
		return true
	end
	
	local function value()
		-- upvalues: Motion (copy), Kenize1 (copy), Kenize (copy), Count (ref), dotted (copy), value (copy), t1 (copy), t2 (copy), t3 (copy), List (ref), annotation (copy), t4 (copy), v9 (ref), Contract (ref), p10 (copy), rowAlias (copy), rowBody (copy), readLiteral (upval), Callback (ref), DatatypeModule (upval), token (copy)
		if Motion ~= nil then
			local Flag = true
			
			for i, value1 in Kenize1 do
				local KenizeEntry1 = Kenize[Count + (i - 1 or 0)]
				
				if (if KenizeEntry1 then KenizeEntry1.text else "") ~= value1.text then
					Flag = false
					break
				end
			end
			if Flag then
				dotted()
				local TheDesignSourceEndedEarly = assert(Kenize[Count], "The design source ended early")
				assert(TheDesignSourceEndedEarly.text == "(", `Expected ( but found {TheDesignSourceEndedEarly.text}`)
				Count += 1
				local v12 = assert(value(), `{Motion.call} moves an input, state or item`)
				local TheDesignSourceEndedEarly1 = assert(Kenize[Count], "The design source ended early")
				assert(TheDesignSourceEndedEarly1.text == ",", `Expected , but found {TheDesignSourceEndedEarly1.text}`)
				Count += 1
				local TheDesignSourceEndedEarly2 = assert(Kenize[Count], "The design source ended early")
				assert(true, `Expected  but found {TheDesignSourceEndedEarly2.text}`)
				Count += 1
				v12.motion = string.gsub(string.sub(TheDesignSourceEndedEarly2.text, 2, -2), "\\(.)", function(Match)
					return if Match == "n" then "\n" elseif Match == "t" then "\t" else Match
				end)
				local TheDesignSourceEndedEarly3 = assert(Kenize[Count], "The design source ended early")
				assert(TheDesignSourceEndedEarly3.text == ")", `Expected ) but found {TheDesignSourceEndedEarly3.text}`)
				Count += 1
				
				return v12, nil
			end
		end
		local KenizeEntry = Kenize[Count]
		repeat
			if not KenizeEntry or KenizeEntry.kind ~= "name" or t1[KenizeEntry.text] == nil then break end
			local KenizeEntry3 = Kenize[Count + 1]
			
			if (if KenizeEntry3 then KenizeEntry3.text else "") ~= "," then
				local KenizeEntry4 = Kenize[Count + 1]
				
				if (if KenizeEntry4 then KenizeEntry4.text else "") ~= "}" then continue end
			end
			assert(true, `Expected  but found {assert(Kenize[Count], "The design source ended early").text}`)
			Count += 1
			
			return nil, t1[KenizeEntry.text]
		until true
		repeat
			if not KenizeEntry or KenizeEntry.kind ~= "name" or t2[KenizeEntry.text] == nil then break end
			local KenizeEntry8 = Kenize[Count + 1]
			
			if (if KenizeEntry8 then KenizeEntry8.text else "") ~= "," then
				local KenizeEntry9 = Kenize[Count + 1]
				
				if (if KenizeEntry9 then KenizeEntry9.text else "") ~= "}" then continue end
			end
			assert(true, `Expected  but found {assert(Kenize[Count], "The design source ended early").text}`)
			Count += 1
			local Entry = t3[KenizeEntry.text] or {}
			for _, value2 in Entry do
				table.insert(List, value2)
			end
			return { literal = t2[KenizeEntry.text] }, nil
		until true
		local KenizeEntry7 = Kenize[Count + 0]
		
		if (if KenizeEntry7 then KenizeEntry7.text else "") == "sequences" then
			local KenizeEntry10 = Kenize[Count + 1]
			
			if (if KenizeEntry10 then KenizeEntry10.text else "") == "." then
				local TheDesignSourceEndedEarly = assert(Kenize[Count], "The design source ended early")
				assert(TheDesignSourceEndedEarly.text == "sequences", `Expected sequences but found {TheDesignSourceEndedEarly.text}`)
				Count += 1
				local TheDesignSourceEndedEarly4 = assert(Kenize[Count], "The design source ended early")
				assert(TheDesignSourceEndedEarly4.text == ".", `Expected . but found {TheDesignSourceEndedEarly4.text}`)
				Count += 1
				local TheDesignSourceEndedEarly5 = assert(Kenize[Count], "The design source ended early")
				assert(true, `Expected  but found {TheDesignSourceEndedEarly5.text}`)
				Count += 1
				assert(TheDesignSourceEndedEarly5.kind == "name", `Expected a name but found {TheDesignSourceEndedEarly5.text}`)
				local Text = TheDesignSourceEndedEarly5.text
				local TheDesignSourceEndedEarly6 = assert(Kenize[Count], "The design source ended early")
				assert(TheDesignSourceEndedEarly6.text == ".", `Expected . but found {TheDesignSourceEndedEarly6.text}`)
				Count += 1
				local TheDesignSourceEndedEarly7 = assert(Kenize[Count], "The design source ended early")
				assert(TheDesignSourceEndedEarly7.text == "play", `Expected play but found {TheDesignSourceEndedEarly7.text}`)
				Count += 1
				
				return { play = Text }, nil
			end
		end
		local KenizeEntry11 = Kenize[Count + 0]
		
		if (if KenizeEntry11 then KenizeEntry11.text else "") == "state" then
			local KenizeEntry12 = Kenize[Count + 1]
			
			if (if KenizeEntry12 then KenizeEntry12.text else "") == "." then
				local TheDesignSourceEndedEarly = assert(Kenize[Count], "The design source ended early")
				assert(TheDesignSourceEndedEarly.text == "state", `Expected state but found {TheDesignSourceEndedEarly.text}`)
				Count += 1
				local TheDesignSourceEndedEarly8 = assert(Kenize[Count], "The design source ended early")
				assert(TheDesignSourceEndedEarly8.text == ".", `Expected . but found {TheDesignSourceEndedEarly8.text}`)
				Count += 1
				local t = {}
				local TheDesignSourceEndedEarly9 = assert(Kenize[Count], "The design source ended early")
				assert(true, `Expected  but found {TheDesignSourceEndedEarly9.text}`)
				Count += 1
				assert(TheDesignSourceEndedEarly9.kind == "name", `Expected a name but found {TheDesignSourceEndedEarly9.text}`)
				t.state = TheDesignSourceEndedEarly9.text
				
				return t, nil
			end
		end
		local KenizeEntry13 = Kenize[Count + 0]
		
		if (if KenizeEntry13 then KenizeEntry13.text else "") == "assert" then
			local TheDesignSourceEndedEarly = assert(Kenize[Count], "The design source ended early")
			assert(TheDesignSourceEndedEarly.text == "assert", `Expected assert but found {TheDesignSourceEndedEarly.text}`)
			Count += 1
			local TheDesignSourceEndedEarly10 = assert(Kenize[Count], "The design source ended early")
			assert(TheDesignSourceEndedEarly10.text == "(", `Expected ( but found {TheDesignSourceEndedEarly10.text}`)
			Count += 1
			local TheDesignSourceEndedEarly11 = assert(Kenize[Count], "The design source ended early")
			assert(TheDesignSourceEndedEarly11.text == "refs", `Expected refs but found {TheDesignSourceEndedEarly11.text}`)
			Count += 1
			local TheDesignSourceEndedEarly12 = assert(Kenize[Count], "The design source ended early")
			assert(TheDesignSourceEndedEarly12.text == ".", `Expected . but found {TheDesignSourceEndedEarly12.text}`)
			Count += 1
			local TheDesignSourceEndedEarly13 = assert(Kenize[Count], "The design source ended early")
			assert(true, `Expected  but found {TheDesignSourceEndedEarly13.text}`)
			Count += 1
			assert(TheDesignSourceEndedEarly13.kind == "name", `Expected a name but found {TheDesignSourceEndedEarly13.text}`)
			local Text = TheDesignSourceEndedEarly13.text
			local TheDesignSourceEndedEarly14 = assert(Kenize[Count], "The design source ended early")
			assert(TheDesignSourceEndedEarly14.text == ":", `Expected : but found {TheDesignSourceEndedEarly14.text}`)
			Count += 1
			local TheDesignSourceEndedEarly15 = assert(Kenize[Count], "The design source ended early")
			assert(TheDesignSourceEndedEarly15.text == "peek", `Expected peek but found {TheDesignSourceEndedEarly15.text}`)
			Count += 1
			local TheDesignSourceEndedEarly16 = assert(Kenize[Count], "The design source ended early")
			assert(TheDesignSourceEndedEarly16.text == "(", `Expected ( but found {TheDesignSourceEndedEarly16.text}`)
			Count += 1
			local TheDesignSourceEndedEarly17 = assert(Kenize[Count], "The design source ended early")
			assert(TheDesignSourceEndedEarly17.text == ")", `Expected ) but found {TheDesignSourceEndedEarly17.text}`)
			Count += 1
			local TheDesignSourceEndedEarly18 = assert(Kenize[Count], "The design source ended early")
			assert(TheDesignSourceEndedEarly18.text == ",", `Expected , but found {TheDesignSourceEndedEarly18.text}`)
			Count += 1
			local TheDesignSourceEndedEarly19 = assert(Kenize[Count], "The design source ended early")
			assert(true, `Expected  but found {TheDesignSourceEndedEarly19.text}`)
			Count += 1
			assert(TheDesignSourceEndedEarly19.kind == "string" and string.gsub(string.sub(TheDesignSourceEndedEarly19.text, 2, -2), "\\(.)", function(Match)
				return if Match == "n" then "\n" elseif Match == "t" then "\t" else Match
			end) == "Node reference is not captured", "Node references assert their capture")
			local TheDesignSourceEndedEarly20 = assert(Kenize[Count], "The design source ended early")
			assert(TheDesignSourceEndedEarly20.text == ")", `Expected ) but found {TheDesignSourceEndedEarly20.text}`)
			Count += 1
			
			return { node = Text }, nil
		end
		local KenizeEntry14 = Kenize[Count + 0]
		
		if (if KenizeEntry14 then KenizeEntry14.text else "") == "refs" then
			local TheDesignSourceEndedEarly = assert(Kenize[Count], "The design source ended early")
			assert(TheDesignSourceEndedEarly.text == "refs", `Expected refs but found {TheDesignSourceEndedEarly.text}`)
			Count += 1
			local TheDesignSourceEndedEarly21 = assert(Kenize[Count], "The design source ended early")
			assert(TheDesignSourceEndedEarly21.text == ".", `Expected . but found {TheDesignSourceEndedEarly21.text}`)
			Count += 1
			local t = {}
			local TheDesignSourceEndedEarly22 = assert(Kenize[Count], "The design source ended early")
			assert(true, `Expected  but found {TheDesignSourceEndedEarly22.text}`)
			Count += 1
			assert(TheDesignSourceEndedEarly22.kind == "name", `Expected a name but found {TheDesignSourceEndedEarly22.text}`)
			t.node = TheDesignSourceEndedEarly22.text
			
			return t, nil
		end
		local KenizeEntry15 = Kenize[Count + 0]
		
		if (if KenizeEntry15 then KenizeEntry15.text else "") == "props" then
			local TheDesignSourceEndedEarly = assert(Kenize[Count], "The design source ended early")
			assert(TheDesignSourceEndedEarly.text == "props", `Expected props but found {TheDesignSourceEndedEarly.text}`)
			Count += 1
			local TheDesignSourceEndedEarly23 = assert(Kenize[Count], "The design source ended early")
			assert(TheDesignSourceEndedEarly23.text == ".", `Expected . but found {TheDesignSourceEndedEarly23.text}`)
			Count += 1
			local TheDesignSourceEndedEarly24 = assert(Kenize[Count], "The design source ended early")
			assert(true, `Expected  but found {TheDesignSourceEndedEarly24.text}`)
			Count += 1
			assert(TheDesignSourceEndedEarly24.kind == "name", `Expected a name but found {TheDesignSourceEndedEarly24.text}`)
			local Text = TheDesignSourceEndedEarly24.text
			local List1 = {}
			while true do
				local KenizeEntry5 = Kenize[Count + 0]
				if (if KenizeEntry5 then KenizeEntry5.text else "") ~= "." then break end
				local TheDesignSourceEndedEarly25 = assert(Kenize[Count], "The design source ended early")
				assert(TheDesignSourceEndedEarly25.text == ".", `Expected . but found {TheDesignSourceEndedEarly25.text}`)
				Count += 1
				local TheDesignSourceEndedEarly26 = assert(Kenize[Count], "The design source ended early")
				assert(true, `Expected  but found {TheDesignSourceEndedEarly26.text}`)
				Count += 1
				assert(TheDesignSourceEndedEarly26.kind == "name", `Expected a name but found {TheDesignSourceEndedEarly26.text}`)
				table.insert(List1, TheDesignSourceEndedEarly26.text)
			end
			return { input = Text, path = if #List1 > 0 then List1 else nil }, nil
		else
			local KenizeEntry16 = Kenize[Count + 0]
			
			if (if KenizeEntry16 then KenizeEntry16.text else "") == "function" then
				local TheDesignSourceEndedEarly = assert(Kenize[Count], "The design source ended early")
				assert(TheDesignSourceEndedEarly.text == "function", `Expected function but found {TheDesignSourceEndedEarly.text}`)
				Count += 1
				local TheDesignSourceEndedEarly27 = assert(Kenize[Count], "The design source ended early")
				assert(TheDesignSourceEndedEarly27.text == "(", `Expected ( but found {TheDesignSourceEndedEarly27.text}`)
				Count += 1
				local KenizeEntry6 = Kenize[Count + 0]
				local IsUse = (if KenizeEntry6 then KenizeEntry6.text else "") == "use"
				
				if IsUse then
					local TheDesignSourceEndedEarly28 = assert(Kenize[Count], "The design source ended early")
					assert(TheDesignSourceEndedEarly28.text == "use", `Expected use but found {TheDesignSourceEndedEarly28.text}`)
					Count += 1
					annotation(")")
					local TheDesignSourceEndedEarly29 = assert(Kenize[Count], "The design source ended early")
					assert(TheDesignSourceEndedEarly29.text == ")", `Expected ) but found {TheDesignSourceEndedEarly29.text}`)
					Count += 1
					annotation("return")
				end
				if IsUse then
					local KenizeEntry21 = Kenize[Count + 0]
					
					if (if KenizeEntry21 then KenizeEntry21.text else "") == "local" then
						local KenizeEntry22 = Kenize[Count + 1]
						
						if (if KenizeEntry22 then KenizeEntry22.text else "") == "chosen" then
							local TheDesignSourceEndedEarly30 = assert(Kenize[Count], "The design source ended early")
							assert(TheDesignSourceEndedEarly30.text == "local", `Expected local but found {TheDesignSourceEndedEarly30.text}`)
							Count += 1
							local TheDesignSourceEndedEarly31 = assert(Kenize[Count], "The design source ended early")
							assert(TheDesignSourceEndedEarly31.text == "chosen", `Expected chosen but found {TheDesignSourceEndedEarly31.text}`)
							Count += 1
							local TheDesignSourceEndedEarly32 = assert(Kenize[Count], "The design source ended early")
							assert(TheDesignSourceEndedEarly32.text == "=", `Expected = but found {TheDesignSourceEndedEarly32.text}`)
							Count += 1
							local TheDesignSourceEndedEarly33 = assert(Kenize[Count], "The design source ended early")
							assert(TheDesignSourceEndedEarly33.text == "named", `Expected named but found {TheDesignSourceEndedEarly33.text}`)
							Count += 1
							local TheDesignSourceEndedEarly34 = assert(Kenize[Count], "The design source ended early")
							assert(TheDesignSourceEndedEarly34.text == "[", `Expected [ but found {TheDesignSourceEndedEarly34.text}`)
							Count += 1
							local KenizeEntry20 = Kenize[Count + 0]
							local IsUse1 = (if KenizeEntry20 then KenizeEntry20.text else "") == "use"
							
							if IsUse1 then
								local TheDesignSourceEndedEarly35 = assert(Kenize[Count], "The design source ended early")
								assert(TheDesignSourceEndedEarly35.text == "use", `Expected use but found {TheDesignSourceEndedEarly35.text}`)
								Count += 1
								local TheDesignSourceEndedEarly36 = assert(Kenize[Count], "The design source ended early")
								assert(TheDesignSourceEndedEarly36.text == "(", `Expected ( but found {TheDesignSourceEndedEarly36.text}`)
								Count += 1
							end
							local TheDesignSourceEndedEarly37 = assert(Kenize[Count], "The design source ended early")
							assert(true, `Expected  but found {TheDesignSourceEndedEarly37.text}`)
							Count += 1
							assert(TheDesignSourceEndedEarly37.kind == "name", `Expected a name but found {TheDesignSourceEndedEarly37.text}`)
							local Text3 = TheDesignSourceEndedEarly37.text
							local TheDesignSourceEndedEarly38 = assert(Kenize[Count], "The design source ended early")
							assert(TheDesignSourceEndedEarly38.text == ".", `Expected . but found {TheDesignSourceEndedEarly38.text}`)
							Count += 1
							local TheDesignSourceEndedEarly39 = assert(Kenize[Count], "The design source ended early")
							assert(true, `Expected  but found {TheDesignSourceEndedEarly39.text}`)
							Count += 1
							assert(TheDesignSourceEndedEarly39.kind == "name", `Expected a name but found {TheDesignSourceEndedEarly39.text}`)
							local Text4 = TheDesignSourceEndedEarly39.text
							
							if IsUse1 then
								local TheDesignSourceEndedEarly40 = assert(Kenize[Count], "The design source ended early")
								assert(TheDesignSourceEndedEarly40.text == ")", `Expected ) but found {TheDesignSourceEndedEarly40.text}`)
								Count += 1
							end
							assert(Text3 == "props" or Text3 == "state", "A chosen node follows an input or state")
							local TheDesignSourceEndedEarly41 = assert(Kenize[Count], "The design source ended early")
							assert(TheDesignSourceEndedEarly41.text == "]", `Expected ] but found {TheDesignSourceEndedEarly41.text}`)
							Count += 1
							local TheDesignSourceEndedEarly42 = assert(Kenize[Count], "The design source ended early")
							assert(TheDesignSourceEndedEarly42.text == "return", `Expected return but found {TheDesignSourceEndedEarly42.text}`)
							Count += 1
							local KenizeEntry2 = Kenize[Count + 0]
							local IsAssert = (if KenizeEntry2 then KenizeEntry2.text else "") == "assert"
							
							if IsAssert then
								local TheDesignSourceEndedEarly43 = assert(Kenize[Count], "The design source ended early")
								assert(TheDesignSourceEndedEarly43.text == "assert", `Expected assert but found {TheDesignSourceEndedEarly43.text}`)
								Count += 1
								local TheDesignSourceEndedEarly44 = assert(Kenize[Count], "The design source ended early")
								assert(TheDesignSourceEndedEarly44.text == "(", `Expected ( but found {TheDesignSourceEndedEarly44.text}`)
								Count += 1
							end
							local TheDesignSourceEndedEarly45 = assert(Kenize[Count], "The design source ended early")
							assert(TheDesignSourceEndedEarly45.text == "if", `Expected if but found {TheDesignSourceEndedEarly45.text}`)
							Count += 1
							local TheDesignSourceEndedEarly46 = assert(Kenize[Count], "The design source ended early")
							assert(TheDesignSourceEndedEarly46.text == "chosen", `Expected chosen but found {TheDesignSourceEndedEarly46.text}`)
							Count += 1
							local TheDesignSourceEndedEarly47 = assert(Kenize[Count], "The design source ended early")
							assert(TheDesignSourceEndedEarly47.text == "then", `Expected then but found {TheDesignSourceEndedEarly47.text}`)
							Count += 1
							local TheDesignSourceEndedEarly48 = assert(Kenize[Count], "The design source ended early")
							assert(TheDesignSourceEndedEarly48.text == "use", `Expected use but found {TheDesignSourceEndedEarly48.text}`)
							Count += 1
							local TheDesignSourceEndedEarly49 = assert(Kenize[Count], "The design source ended early")
							assert(TheDesignSourceEndedEarly49.text == "(", `Expected ( but found {TheDesignSourceEndedEarly49.text}`)
							Count += 1
							local TheDesignSourceEndedEarly50 = assert(Kenize[Count], "The design source ended early")
							assert(TheDesignSourceEndedEarly50.text == "chosen", `Expected chosen but found {TheDesignSourceEndedEarly50.text}`)
							Count += 1
							local TheDesignSourceEndedEarly51 = assert(Kenize[Count], "The design source ended early")
							assert(TheDesignSourceEndedEarly51.text == ")", `Expected ) but found {TheDesignSourceEndedEarly51.text}`)
							Count += 1
							local TheDesignSourceEndedEarly52 = assert(Kenize[Count], "The design source ended early")
							assert(TheDesignSourceEndedEarly52.text == "else", `Expected else but found {TheDesignSourceEndedEarly52.text}`)
							Count += 1
							local TheDesignSourceEndedEarly53 = assert(Kenize[Count], "The design source ended early")
							assert(TheDesignSourceEndedEarly53.text == "nil", `Expected nil but found {TheDesignSourceEndedEarly53.text}`)
							Count += 1
							
							if IsAssert then
								local TheDesignSourceEndedEarly54 = assert(Kenize[Count], "The design source ended early")
								assert(TheDesignSourceEndedEarly54.text == ",", `Expected , but found {TheDesignSourceEndedEarly54.text}`)
								Count += 1
								local TheDesignSourceEndedEarly55 = assert(Kenize[Count], "The design source ended early")
								assert(true, `Expected  but found {TheDesignSourceEndedEarly55.text}`)
								Count += 1
								assert(TheDesignSourceEndedEarly55.kind == "string" and string.gsub(string.sub(TheDesignSourceEndedEarly55.text, 2, -2), "\\(.)", function(Match)
									return if Match == "n" then "\n" elseif Match == "t" then "\t" else Match
								end) == "Node reference is not captured", "Node references assert their capture")
								local TheDesignSourceEndedEarly56 = assert(Kenize[Count], "The design source ended early")
								assert(TheDesignSourceEndedEarly56.text == ")", `Expected ) but found {TheDesignSourceEndedEarly56.text}`)
								Count += 1
							end
							local TheDesignSourceEndedEarly57 = assert(Kenize[Count], "The design source ended early")
							assert(TheDesignSourceEndedEarly57.text == "end", `Expected end but found {TheDesignSourceEndedEarly57.text}`)
							Count += 1
							local List3 = {}
							
							for _, value3 in t4 do
								table.insert(List3, value3)
							end
							table.sort(List3)
							
							return { nodeFrom = Text4, nodes = List3 }, nil
						end
					end
				end
				if IsUse then
					local KenizeEntry24 = Kenize[Count + 0]
					assert((if KenizeEntry24 then KenizeEntry24.text else "") == "return", "Layout functions use a typed readable input: compute the value in the caller and bind props.<input>")
					local TheDesignSourceEndedEarly58 = assert(Kenize[Count], "The design source ended early")
					assert(TheDesignSourceEndedEarly58.text == "return", `Expected return but found {TheDesignSourceEndedEarly58.text}`)
					Count += 1
					local KenizeEntry25 = Kenize[Count + 0]
					
					if (if KenizeEntry25 then KenizeEntry25.text else "") == "assert" then
						local TheDesignSourceEndedEarly59 = assert(Kenize[Count], "The design source ended early")
						assert(TheDesignSourceEndedEarly59.text == "assert", `Expected assert but found {TheDesignSourceEndedEarly59.text}`)
						Count += 1
						local TheDesignSourceEndedEarly60 = assert(Kenize[Count], "The design source ended early")
						assert(TheDesignSourceEndedEarly60.text == "(", `Expected ( but found {TheDesignSourceEndedEarly60.text}`)
						Count += 1
						local TheDesignSourceEndedEarly61 = assert(Kenize[Count], "The design source ended early")
						assert(TheDesignSourceEndedEarly61.text == "use", `Expected use but found {TheDesignSourceEndedEarly61.text}`)
						Count += 1
						local TheDesignSourceEndedEarly62 = assert(Kenize[Count], "The design source ended early")
						assert(TheDesignSourceEndedEarly62.text == "(", `Expected ( but found {TheDesignSourceEndedEarly62.text}`)
						Count += 1
						local TheDesignSourceEndedEarly63 = assert(Kenize[Count], "The design source ended early")
						assert(TheDesignSourceEndedEarly63.text == "refs", `Expected refs but found {TheDesignSourceEndedEarly63.text}`)
						Count += 1
						local TheDesignSourceEndedEarly64 = assert(Kenize[Count], "The design source ended early")
						assert(TheDesignSourceEndedEarly64.text == ".", `Expected . but found {TheDesignSourceEndedEarly64.text}`)
						Count += 1
						local TheDesignSourceEndedEarly65 = assert(Kenize[Count], "The design source ended early")
						assert(true, `Expected  but found {TheDesignSourceEndedEarly65.text}`)
						Count += 1
						assert(TheDesignSourceEndedEarly65.kind == "name", `Expected a name but found {TheDesignSourceEndedEarly65.text}`)
						local Text1 = TheDesignSourceEndedEarly65.text
						local TheDesignSourceEndedEarly66 = assert(Kenize[Count], "The design source ended early")
						assert(TheDesignSourceEndedEarly66.text == ")", `Expected ) but found {TheDesignSourceEndedEarly66.text}`)
						Count += 1
						local TheDesignSourceEndedEarly67 = assert(Kenize[Count], "The design source ended early")
						assert(TheDesignSourceEndedEarly67.text == ",", `Expected , but found {TheDesignSourceEndedEarly67.text}`)
						Count += 1
						local TheDesignSourceEndedEarly68 = assert(Kenize[Count], "The design source ended early")
						assert(true, `Expected  but found {TheDesignSourceEndedEarly68.text}`)
						Count += 1
						assert(TheDesignSourceEndedEarly68.kind == "string" and string.gsub(string.sub(TheDesignSourceEndedEarly68.text, 2, -2), "\\(.)", function(Match)
							return if Match == "n" then "\n" elseif Match == "t" then "\t" else Match
						end) == "Node reference is not captured", "Node references assert their capture")
						local TheDesignSourceEndedEarly69 = assert(Kenize[Count], "The design source ended early")
						assert(TheDesignSourceEndedEarly69.text == ")", `Expected ) but found {TheDesignSourceEndedEarly69.text}`)
						Count += 1
						local TheDesignSourceEndedEarly70 = assert(Kenize[Count], "The design source ended early")
						assert(TheDesignSourceEndedEarly70.text == "end", `Expected end but found {TheDesignSourceEndedEarly70.text}`)
						Count += 1
						
						return { node = Text1 }, nil
					end
					local KenizeEntry19 = Kenize[Count + 0]
					
					if (if KenizeEntry19 then KenizeEntry19.text else "") ~= "use" then
						local KenizeEntry28 = Kenize[Count + 0]
						
						if (if KenizeEntry28 then KenizeEntry28.text else "") ~= "tostring" then
							local ADatatypeFormulaReturnsAConstructor = assert(value(), "A datatype formula returns a constructor")
							assert(type(ADatatypeFormulaReturnsAConstructor.literal) == "table", "A datatype formula returns components")
							local TheDesignSourceEndedEarly71 = assert(Kenize[Count], "The design source ended early")
							assert(TheDesignSourceEndedEarly71.text == "end", `Expected end but found {TheDesignSourceEndedEarly71.text}`)
							Count += 1
							
							return ADatatypeFormulaReturnsAConstructor, nil
						end
					end
					local KenizeEntry29 = Kenize[Count + 0]
					local IsTostring = (if KenizeEntry29 then KenizeEntry29.text else "") == "tostring"
					
					if IsTostring then
						local TheDesignSourceEndedEarly72 = assert(Kenize[Count], "The design source ended early")
						assert(TheDesignSourceEndedEarly72.text == "tostring", `Expected tostring but found {TheDesignSourceEndedEarly72.text}`)
						Count += 1
						local TheDesignSourceEndedEarly73 = assert(Kenize[Count], "The design source ended early")
						assert(TheDesignSourceEndedEarly73.text == "(", `Expected ( but found {TheDesignSourceEndedEarly73.text}`)
						Count += 1
					end
					local TheDesignSourceEndedEarly74 = assert(Kenize[Count], "The design source ended early")
					assert(TheDesignSourceEndedEarly74.text == "use", `Expected use but found {TheDesignSourceEndedEarly74.text}`)
					Count += 1
					local TheDesignSourceEndedEarly75 = assert(Kenize[Count], "The design source ended early")
					assert(TheDesignSourceEndedEarly75.text == "(", `Expected ( but found {TheDesignSourceEndedEarly75.text}`)
					Count += 1
					local TheDesignSourceEndedEarly76 = assert(Kenize[Count], "The design source ended early")
					assert(true, `Expected  but found {TheDesignSourceEndedEarly76.text}`)
					Count += 1
					assert(TheDesignSourceEndedEarly76.kind == "name", `Expected a name but found {TheDesignSourceEndedEarly76.text}`)
					local Text2: string = TheDesignSourceEndedEarly76.text
					assert(Text2 ~= "environment" or Text2 == v9, "Layout functions use a typed readable input: compute the value in the caller and bind props.<input>")
					
					if Text2 == "props" then
						assert(not IsTostring, "Item bindings read the declared row parameter; use function(use) return use(current).field end and prepare computed fields in the caller")
						local TheDesignSourceEndedEarly77 = assert(Kenize[Count], "The design source ended early")
						assert(TheDesignSourceEndedEarly77.text == ".", `Expected . but found {TheDesignSourceEndedEarly77.text}`)
						Count += 1
						local TheDesignSourceEndedEarly78 = assert(Kenize[Count], "The design source ended early")
						assert(true, `Expected  but found {TheDesignSourceEndedEarly78.text}`)
						Count += 1
						assert(TheDesignSourceEndedEarly78.kind == "name", `Expected a name but found {TheDesignSourceEndedEarly78.text}`)
						local Text7 = TheDesignSourceEndedEarly78.text
						local IsNotValue = false
						
						for _, input in Contract.inputs do
							if input.id == Text7 then
								IsNotValue = input.kind ~= "value"
							end
						end
						assert(IsNotValue, "Input formulas read a declared readable or cell input; bind props.<input> directly")
						local TheDesignSourceEndedEarly79 = assert(Kenize[Count], "The design source ended early")
						assert(TheDesignSourceEndedEarly79.text == ")", `Expected ) but found {TheDesignSourceEndedEarly79.text}`)
						Count += 1
						local TheDesignSourceEndedEarly80 = assert(Kenize[Count], "The design source ended early")
						assert(TheDesignSourceEndedEarly80.text == "end", `Expected end but found {TheDesignSourceEndedEarly80.text}`)
						Count += 1
						
						return { input = Text7 }, nil
					else
						assert(Text2 == v9 or string.match(Text2, "^row_[%w]+$") ~= nil, "Item bindings read the declared row parameter; use function(use) return use(current).field end and prepare computed fields in the caller")
						local TheDesignSourceEndedEarly81 = assert(Kenize[Count], "The design source ended early")
						assert(TheDesignSourceEndedEarly81.text == ")", `Expected ) but found {TheDesignSourceEndedEarly81.text}`)
						Count += 1
						local TheDesignSourceEndedEarly82 = assert(Kenize[Count], "The design source ended early")
						assert(TheDesignSourceEndedEarly82.text == ".", `Expected . but found {TheDesignSourceEndedEarly82.text}`)
						Count += 1
						local TheDesignSourceEndedEarly83 = assert(Kenize[Count], "The design source ended early")
						assert(true, `Expected  but found {TheDesignSourceEndedEarly83.text}`)
						Count += 1
						assert(TheDesignSourceEndedEarly83.kind == "name", `Expected a name but found {TheDesignSourceEndedEarly83.text}`)
						local Text8 = TheDesignSourceEndedEarly83.text
						
						if IsTostring then
							local TheDesignSourceEndedEarly84 = assert(Kenize[Count], "The design source ended early")
							assert(TheDesignSourceEndedEarly84.text == ")", `Expected ) but found {TheDesignSourceEndedEarly84.text}`)
							Count += 1
						end
						local TheDesignSourceEndedEarly85 = assert(Kenize[Count], "The design source ended early")
						assert(TheDesignSourceEndedEarly85.text == "end", `Expected end but found {TheDesignSourceEndedEarly85.text}`)
						Count += 1
						local Match: string? = string.match(Text2, "^row_([%w]+)$")
						
						return { item = if Match then Match .. "." .. Text8 else Text8 }, nil
					end
				else
					local KenizeEntry26 = Kenize[Count + 0]
					repeat
						if not string.match(if KenizeEntry26 then KenizeEntry26.text else "", "^event%d+$") then
							local KenizeEntry23 = Kenize[Count + 0]
							
							if (if KenizeEntry23 then KenizeEntry23.text else "") == ")" then
								local KenizeEntry30 = Kenize[Count + 1]
								
								if (if KenizeEntry30 then KenizeEntry30.text else "") == "if" then
									local t = {}
									local Count1 = 0
									while true do
										local KenizeEntry18 = Kenize[Count + 0]
										if (if KenizeEntry18 then KenizeEntry18.text else "") == ")" then break end
										Count1 += 1
										KenizeEntry18 = assert(Kenize[Count], "The design source ended early")
										assert(true, `Expected  but found {KenizeEntry18.text}`)
										Count += 1
										assert(KenizeEntry18.kind == "name", `Expected a name but found {KenizeEntry18.text}`)
										local Text5 = KenizeEntry18.text
										assert(Text5 == `event{Count1}`, "Action parameters use ordered event positions")
										t[Text5] = Count1
										Text5 = assert(Kenize[Count], "The design source ended early")
										assert(Text5.text == ":", `Expected : but found {Text5.text}`)
										Count += 1
										KenizeEntry18 = 0
										while true do
											local TheDesignSourceEndedEarly86 = assert(Kenize[Count], "The design source ended early")
											assert(true, `Expected  but found {TheDesignSourceEndedEarly86.text}`)
											Count += 1
											TheDesignSourceEndedEarly86 = TheDesignSourceEndedEarly86.text
											if TheDesignSourceEndedEarly86 == "(" or TheDesignSourceEndedEarly86 == "{" or (TheDesignSourceEndedEarly86 == "[" or TheDesignSourceEndedEarly86 == "<") then
												KenizeEntry18 += 1
											elseif TheDesignSourceEndedEarly86 == ")" or TheDesignSourceEndedEarly86 == "}" or TheDesignSourceEndedEarly86 == "]" or TheDesignSourceEndedEarly86 == ">" then
												KenizeEntry18 -= 1
											end
											if KenizeEntry18 ~= 0 then continue end
											local KenizeEntry17 = Kenize[Count + 0]
											local v13 = (if KenizeEntry17 then KenizeEntry17.text else "") == ","
											
											if not v13 then
												KenizeEntry17 = Kenize[Count + 0]
												v13 = (if KenizeEntry17 then KenizeEntry17.text else "") == ")"
											end
											if v13 then break end
										end
										KenizeEntry18 = Kenize[Count + 0]
										
										if (if KenizeEntry18 then KenizeEntry18.text else "") ~= "," then continue end
										local TheDesignSourceEndedEarly87 = assert(Kenize[Count], "The design source ended early")
										assert(TheDesignSourceEndedEarly87.text == ",", `Expected , but found {TheDesignSourceEndedEarly87.text}`)
										Count += 1
										continue
									end
									local TheDesignSourceEndedEarly1 = assert(Kenize[Count], "The design source ended early")
									assert(TheDesignSourceEndedEarly1.text == ")", `Expected ) but found {TheDesignSourceEndedEarly1.text}`)
									Count += 1
									local TheDesignSourceEndedEarly2 = assert(Kenize[Count], "The design source ended early")
									assert(TheDesignSourceEndedEarly2.text == "if", `Expected if but found {TheDesignSourceEndedEarly2.text}`)
									Count += 1
									local TheDesignSourceEndedEarly3 = assert(Kenize[Count], "The design source ended early")
									assert(TheDesignSourceEndedEarly3.text == "props", `Expected props but found {TheDesignSourceEndedEarly3.text}`)
									Count += 1
									local TheDesignSourceEndedEarly4 = assert(Kenize[Count], "The design source ended early")
									assert(TheDesignSourceEndedEarly4.text == ".", `Expected . but found {TheDesignSourceEndedEarly4.text}`)
									Count += 1
									local TheDesignSourceEndedEarly5 = assert(Kenize[Count], "The design source ended early")
									assert(true, `Expected  but found {TheDesignSourceEndedEarly5.text}`)
									Count += 1
									assert(TheDesignSourceEndedEarly5.kind == "name", `Expected a name but found {TheDesignSourceEndedEarly5.text}`)
									local Text6 = TheDesignSourceEndedEarly5.text
									local TheDesignSourceEndedEarly6 = assert(Kenize[Count], "The design source ended early")
									assert(TheDesignSourceEndedEarly6.text == "then", `Expected then but found {TheDesignSourceEndedEarly6.text}`)
									Count += 1
									local TheDesignSourceEndedEarly7 = assert(Kenize[Count], "The design source ended early")
									assert(TheDesignSourceEndedEarly7.text == "props", `Expected props but found {TheDesignSourceEndedEarly7.text}`)
									Count += 1
									local TheDesignSourceEndedEarly8 = assert(Kenize[Count], "The design source ended early")
									assert(TheDesignSourceEndedEarly8.text == ".", `Expected . but found {TheDesignSourceEndedEarly8.text}`)
									Count += 1
									local TheDesignSourceEndedEarly9 = assert(Kenize[Count], "The design source ended early")
									assert(Text6 == nil or TheDesignSourceEndedEarly9.text == Text6, `Expected {Text6 or ""} but found {TheDesignSourceEndedEarly9.text}`)
									Count += 1
									local TheDesignSourceEndedEarly10 = assert(Kenize[Count], "The design source ended early")
									assert(TheDesignSourceEndedEarly10.text == "(", `Expected ( but found {TheDesignSourceEndedEarly10.text}`)
									Count += 1
									local List2 = {}
									while true do
										local KenizeEntry31 = Kenize[Count + 0]
										if (if KenizeEntry31 then KenizeEntry31.text else "") == ")" then break end
										KenizeEntry31 = Kenize[Count + 0]
										
										if (if KenizeEntry31 then KenizeEntry31.text else "") == v9 then
											local TheDesignSourceEndedEarly88 = v9
											KenizeEntry31 = assert(Kenize[Count], "The design source ended early")
											assert(TheDesignSourceEndedEarly88 == nil or KenizeEntry31.text == TheDesignSourceEndedEarly88, `Expected {TheDesignSourceEndedEarly88 or ""} but found {KenizeEntry31.text}`)
											Count += 1
											TheDesignSourceEndedEarly88 = assert(Kenize[Count], "The design source ended early")
											assert(TheDesignSourceEndedEarly88.text == ":", `Expected : but found {TheDesignSourceEndedEarly88.text}`)
											Count += 1
											TheDesignSourceEndedEarly88 = assert(Kenize[Count], "The design source ended early")
											assert(TheDesignSourceEndedEarly88.text == "peek", `Expected peek but found {TheDesignSourceEndedEarly88.text}`)
											Count += 1
											TheDesignSourceEndedEarly88 = assert(Kenize[Count], "The design source ended early")
											assert(TheDesignSourceEndedEarly88.text == "(", `Expected ( but found {TheDesignSourceEndedEarly88.text}`)
											Count += 1
											TheDesignSourceEndedEarly88 = assert(Kenize[Count], "The design source ended early")
											assert(TheDesignSourceEndedEarly88.text == ")", `Expected ) but found {TheDesignSourceEndedEarly88.text}`)
											Count += 1
											TheDesignSourceEndedEarly88 = assert(Kenize[Count], "The design source ended early")
											assert(TheDesignSourceEndedEarly88.text == ".", `Expected . but found {TheDesignSourceEndedEarly88.text}`)
											Count += 1
											local t5 = {}
											local TheDesignSourceEndedEarly89 = assert(Kenize[Count], "The design source ended early")
											assert(true, `Expected  but found {TheDesignSourceEndedEarly89.text}`)
											Count += 1
											assert(TheDesignSourceEndedEarly89.kind == "name", `Expected a name but found {TheDesignSourceEndedEarly89.text}`)
											t5.item = TheDesignSourceEndedEarly89.text
											table.insert(List2, t5)
										else
											local t6 = {}
											local TheDesignSourceEndedEarly90 = assert(Kenize[Count], "The design source ended early")
											assert(true, `Expected  but found {TheDesignSourceEndedEarly90.text}`)
											Count += 1
											assert(TheDesignSourceEndedEarly90.kind == "name", `Expected a name but found {TheDesignSourceEndedEarly90.text}`)
											t6.event = assert(t[TheDesignSourceEndedEarly90.text], "Unknown action event argument")
											table.insert(List2, t6)
										end
										KenizeEntry31 = Kenize[Count + 0]
										
										if (if KenizeEntry31 then KenizeEntry31.text else "") ~= "," then continue end
										local TheDesignSourceEndedEarly91 = assert(Kenize[Count], "The design source ended early")
										assert(TheDesignSourceEndedEarly91.text == ",", `Expected , but found {TheDesignSourceEndedEarly91.text}`)
										Count += 1
									end
									local TheDesignSourceEndedEarly92 = assert(Kenize[Count], "The design source ended early")
									assert(TheDesignSourceEndedEarly92.text == ")", `Expected ) but found {TheDesignSourceEndedEarly92.text}`)
									Count += 1
									local TheDesignSourceEndedEarly93 = assert(Kenize[Count], "The design source ended early")
									assert(TheDesignSourceEndedEarly93.text == "end", `Expected end but found {TheDesignSourceEndedEarly93.text}`)
									Count += 1
									local TheDesignSourceEndedEarly94 = assert(Kenize[Count], "The design source ended early")
									assert(TheDesignSourceEndedEarly94.text == "end", `Expected end but found {TheDesignSourceEndedEarly94.text}`)
									Count += 1
									
									return { output = Text6, arguments = List2 }, nil
								end
							end
							if Kenize[Count] and Kenize[Count].kind == "name" then break end
							local KenizeEntry36 = Kenize[Count + 0]
							
							if (if KenizeEntry36 then KenizeEntry36.text else "") == ")" then break end
							local TheDesignSourceEndedEarly95 = assert(Kenize[Count], "The design source ended early")
							assert(TheDesignSourceEndedEarly95.text == "...", `Expected ... but found {TheDesignSourceEndedEarly95.text}`)
							Count += 1
							local TheDesignSourceEndedEarly96 = assert(Kenize[Count], "The design source ended early")
							assert(TheDesignSourceEndedEarly96.text == ")", `Expected ) but found {TheDesignSourceEndedEarly96.text}`)
							Count += 1
							local TheDesignSourceEndedEarly97 = assert(Kenize[Count], "The design source ended early")
							assert(TheDesignSourceEndedEarly97.text == "if", `Expected if but found {TheDesignSourceEndedEarly97.text}`)
							Count += 1
							local TheDesignSourceEndedEarly98 = assert(Kenize[Count], "The design source ended early")
							assert(TheDesignSourceEndedEarly98.text == "props", `Expected props but found {TheDesignSourceEndedEarly98.text}`)
							Count += 1
							local TheDesignSourceEndedEarly99 = assert(Kenize[Count], "The design source ended early")
							assert(TheDesignSourceEndedEarly99.text == ".", `Expected . but found {TheDesignSourceEndedEarly99.text}`)
							Count += 1
							local TheDesignSourceEndedEarly100 = assert(Kenize[Count], "The design source ended early")
							assert(true, `Expected  but found {TheDesignSourceEndedEarly100.text}`)
							Count += 1
							assert(TheDesignSourceEndedEarly100.kind == "name", `Expected a name but found {TheDesignSourceEndedEarly100.text}`)
							local Text10 = TheDesignSourceEndedEarly100.text
							local TheDesignSourceEndedEarly101 = assert(Kenize[Count], "The design source ended early")
							assert(TheDesignSourceEndedEarly101.text == "then", `Expected then but found {TheDesignSourceEndedEarly101.text}`)
							Count += 1
							local TheDesignSourceEndedEarly102 = assert(Kenize[Count], "The design source ended early")
							assert(TheDesignSourceEndedEarly102.text == "props", `Expected props but found {TheDesignSourceEndedEarly102.text}`)
							Count += 1
							local TheDesignSourceEndedEarly103 = assert(Kenize[Count], "The design source ended early")
							assert(TheDesignSourceEndedEarly103.text == ".", `Expected . but found {TheDesignSourceEndedEarly103.text}`)
							Count += 1
							local TheDesignSourceEndedEarly104 = assert(Kenize[Count], "The design source ended early")
							assert(Text10 == nil or TheDesignSourceEndedEarly104.text == Text10, `Expected {Text10 or ""} but found {TheDesignSourceEndedEarly104.text}`)
							Count += 1
							local TheDesignSourceEndedEarly105 = assert(Kenize[Count], "The design source ended early")
							assert(TheDesignSourceEndedEarly105.text == "(", `Expected ( but found {TheDesignSourceEndedEarly105.text}`)
							Count += 1
							local Args = nil
							local Fields = nil
							local KenizeEntry38 = Kenize[Count + 0]
							
							if (if KenizeEntry38 then KenizeEntry38.text else "") == "..." then
								local TheDesignSourceEndedEarly106 = assert(Kenize[Count], "The design source ended early")
								assert(TheDesignSourceEndedEarly106.text == "...", `Expected ... but found {TheDesignSourceEndedEarly106.text}`)
								Count += 1
							else
								local List5 = {}
								local List6 = {}
								while true do
									local TheDesignSourceEndedEarly11 = Kenize[Count + 0]
									if (if TheDesignSourceEndedEarly11 then TheDesignSourceEndedEarly11.text else "") == ")" then break end
									TheDesignSourceEndedEarly11 = Kenize[Count + 0]
									
									if (if TheDesignSourceEndedEarly11 then TheDesignSourceEndedEarly11.text else "") == v9 then
										local TheDesignSourceEndedEarly107 = v9
										TheDesignSourceEndedEarly11 = assert(Kenize[Count], "The design source ended early")
										local NoTheDesignSourceEndedEarly = TheDesignSourceEndedEarly107 == nil or TheDesignSourceEndedEarly11.text == TheDesignSourceEndedEarly107
										assert(NoTheDesignSourceEndedEarly, `Expected {TheDesignSourceEndedEarly107 or ""} but found {TheDesignSourceEndedEarly11.text}`)
										Count += 1
										TheDesignSourceEndedEarly107 = assert(Kenize[Count], "The design source ended early")
										assert(TheDesignSourceEndedEarly107.text == ":", `Expected : but found {TheDesignSourceEndedEarly107.text}`)
										Count += 1
										TheDesignSourceEndedEarly107 = assert(Kenize[Count], "The design source ended early")
										assert(TheDesignSourceEndedEarly107.text == "peek", `Expected peek but found {TheDesignSourceEndedEarly107.text}`)
										Count += 1
										TheDesignSourceEndedEarly107 = assert(Kenize[Count], "The design source ended early")
										assert(TheDesignSourceEndedEarly107.text == "(", `Expected ( but found {TheDesignSourceEndedEarly107.text}`)
										Count += 1
										TheDesignSourceEndedEarly107 = assert(Kenize[Count], "The design source ended early")
										assert(TheDesignSourceEndedEarly107.text == ")", `Expected ) but found {TheDesignSourceEndedEarly107.text}`)
										Count += 1
										TheDesignSourceEndedEarly107 = assert(Kenize[Count], "The design source ended early")
										assert(TheDesignSourceEndedEarly107.text == ".", `Expected . but found {TheDesignSourceEndedEarly107.text}`)
										Count += 1
										NoTheDesignSourceEndedEarly = assert(Kenize[Count], "The design source ended early")
										assert(true, `Expected  but found {NoTheDesignSourceEndedEarly.text}`)
										Count += 1
										assert(NoTheDesignSourceEndedEarly.kind == "name", `Expected a name but found {NoTheDesignSourceEndedEarly.text}`)
										table.insert(List6, NoTheDesignSourceEndedEarly.text)
									else
										local Literal1, Literal2_1 = readLiteral(Kenize, Count, function(p12)
											-- upvalues: Count (upval), Kenize (upval), t1 (upval), List (upval), v9 (upval), p10 (upval), annotation (upval), Callback (upval)
											Count = p12
											local v14 = Kenize[Count + 0]
											
											if (if v14 then v14.text else "") == "props" then
												local TheDesignSourceEndedEarly = assert(Kenize[Count], "The design source ended early")
												assert(TheDesignSourceEndedEarly.text == "props", `Expected props but found {TheDesignSourceEndedEarly.text}`)
												Count += 1
												local TheDesignSourceEndedEarly1 = assert(Kenize[Count], "The design source ended early")
												assert(TheDesignSourceEndedEarly1.text == ".", `Expected . but found {TheDesignSourceEndedEarly1.text}`)
												Count += 1
												local t = {}
												local TheDesignSourceEndedEarly2 = assert(Kenize[Count], "The design source ended early")
												assert(true, `Expected  but found {TheDesignSourceEndedEarly2.text}`)
												Count += 1
												assert(TheDesignSourceEndedEarly2.kind == "name", `Expected a name but found {TheDesignSourceEndedEarly2.text}`)
												t["$input"] = TheDesignSourceEndedEarly2.text
												
												return t, Count
											end
											local v15 = Kenize[Count + 0]
											
											if (if v15 then v15.text else "") == "function" then
												local TheDesignSourceEndedEarly = assert(Kenize[Count], "The design source ended early")
												assert(TheDesignSourceEndedEarly.text == "function", `Expected function but found {TheDesignSourceEndedEarly.text}`)
												Count += 1
												local TheDesignSourceEndedEarly3 = assert(Kenize[Count], "The design source ended early")
												assert(TheDesignSourceEndedEarly3.text == "(", `Expected ( but found {TheDesignSourceEndedEarly3.text}`)
												Count += 1
												local v16 = Kenize[Count + 0]
												assert((if v16 then v16.text else "") ~= "use", "Layout functions use a typed readable input: compute the value in the caller and bind props.<input>")
												
												if not Kenize[Count] or Kenize[Count].kind ~= "name" then
													local v17 = Kenize[Count + 0]
													
													if (if v17 then v17.text else "") ~= ")" then
														local TheDesignSourceEndedEarly4 = assert(Kenize[Count], "The design source ended early")
														assert(TheDesignSourceEndedEarly4.text == "...", `Expected ... but found {TheDesignSourceEndedEarly4.text}`)
														Count += 1
														local TheDesignSourceEndedEarly5 = assert(Kenize[Count], "The design source ended early")
														assert(TheDesignSourceEndedEarly5.text == ")", `Expected ) but found {TheDesignSourceEndedEarly5.text}`)
														Count += 1
														local TheDesignSourceEndedEarly6 = assert(Kenize[Count], "The design source ended early")
														assert(TheDesignSourceEndedEarly6.text == "if", `Expected if but found {TheDesignSourceEndedEarly6.text}`)
														Count += 1
														local TheDesignSourceEndedEarly7 = assert(Kenize[Count], "The design source ended early")
														assert(TheDesignSourceEndedEarly7.text == "props", `Expected props but found {TheDesignSourceEndedEarly7.text}`)
														Count += 1
														local TheDesignSourceEndedEarly8 = assert(Kenize[Count], "The design source ended early")
														assert(TheDesignSourceEndedEarly8.text == ".", `Expected . but found {TheDesignSourceEndedEarly8.text}`)
														Count += 1
														local TheDesignSourceEndedEarly9 = assert(Kenize[Count], "The design source ended early")
														assert(true, `Expected  but found {TheDesignSourceEndedEarly9.text}`)
														Count += 1
														assert(TheDesignSourceEndedEarly9.kind == "name", `Expected a name but found {TheDesignSourceEndedEarly9.text}`)
														local Text = TheDesignSourceEndedEarly9.text
														local TheDesignSourceEndedEarly10 = assert(Kenize[Count], "The design source ended early")
														assert(TheDesignSourceEndedEarly10.text == "then", `Expected then but found {TheDesignSourceEndedEarly10.text}`)
														Count += 1
														local TheDesignSourceEndedEarly11 = assert(Kenize[Count], "The design source ended early")
														assert(TheDesignSourceEndedEarly11.text == "props", `Expected props but found {TheDesignSourceEndedEarly11.text}`)
														Count += 1
														local TheDesignSourceEndedEarly12 = assert(Kenize[Count], "The design source ended early")
														assert(TheDesignSourceEndedEarly12.text == ".", `Expected . but found {TheDesignSourceEndedEarly12.text}`)
														Count += 1
														local TheDesignSourceEndedEarly13 = assert(Kenize[Count], "The design source ended early")
														assert(Text == nil or TheDesignSourceEndedEarly13.text == Text, `Expected {Text or ""} but found {TheDesignSourceEndedEarly13.text}`)
														Count += 1
														local TheDesignSourceEndedEarly14 = assert(Kenize[Count], "The design source ended early")
														assert(TheDesignSourceEndedEarly14.text == "(", `Expected ( but found {TheDesignSourceEndedEarly14.text}`)
														Count += 1
														local config = { ["$output"] = Text }
														local v18 = Kenize[Count + 0]
														
														if (if v18 then v18.text else "") == v9 then
															local v19 = v9
															local TheDesignSourceEndedEarly15 = assert(Kenize[Count], "The design source ended early")
															assert(v19 == nil or TheDesignSourceEndedEarly15.text == v19, `Expected {v19 or ""} but found {TheDesignSourceEndedEarly15.text}`)
															Count += 1
															local TheDesignSourceEndedEarly16 = assert(Kenize[Count], "The design source ended early")
															assert(TheDesignSourceEndedEarly16.text == ":", `Expected : but found {TheDesignSourceEndedEarly16.text}`)
															Count += 1
															local TheDesignSourceEndedEarly17 = assert(Kenize[Count], "The design source ended early")
															assert(TheDesignSourceEndedEarly17.text == "peek", `Expected peek but found {TheDesignSourceEndedEarly17.text}`)
															Count += 1
															local TheDesignSourceEndedEarly18 = assert(Kenize[Count], "The design source ended early")
															assert(TheDesignSourceEndedEarly18.text == "(", `Expected ( but found {TheDesignSourceEndedEarly18.text}`)
															Count += 1
															local TheDesignSourceEndedEarly19 = assert(Kenize[Count], "The design source ended early")
															assert(TheDesignSourceEndedEarly19.text == ")", `Expected ) but found {TheDesignSourceEndedEarly19.text}`)
															Count += 1
															config["$row"] = true
														else
															local TheDesignSourceEndedEarly20 = assert(Kenize[Count], "The design source ended early")
															assert(TheDesignSourceEndedEarly20.text == "...", `Expected ... but found {TheDesignSourceEndedEarly20.text}`)
															Count += 1
														end
														local TheDesignSourceEndedEarly21 = assert(Kenize[Count], "The design source ended early")
														assert(TheDesignSourceEndedEarly21.text == ")", `Expected ) but found {TheDesignSourceEndedEarly21.text}`)
														Count += 1
														local TheDesignSourceEndedEarly22 = assert(Kenize[Count], "The design source ended early")
														assert(TheDesignSourceEndedEarly22.text == "end", `Expected end but found {TheDesignSourceEndedEarly22.text}`)
														Count += 1
														local TheDesignSourceEndedEarly23 = assert(Kenize[Count], "The design source ended early")
														assert(TheDesignSourceEndedEarly23.text == "end", `Expected end but found {TheDesignSourceEndedEarly23.text}`)
														Count += 1
														
														return config, Count
													end
												end
												local v16 = v9
												local v17 = Kenize[Count + 0]
												
												if (if v17 then v17.text else "") ~= ")" then
													local TheDesignSourceEndedEarly24 = assert(Kenize[Count], "The design source ended early")
													assert(true, `Expected  but found {TheDesignSourceEndedEarly24.text}`)
													Count += 1
													assert(TheDesignSourceEndedEarly24.kind == "name", `Expected a name but found {TheDesignSourceEndedEarly24.text}`)
													local Text = TheDesignSourceEndedEarly24.text
													assert(Text ~= "use", "Layout functions use a typed readable input: compute the value in the caller and bind props.<input>")
													assert(Text ~= "props" and (Text ~= "state" and (Text ~= "refs" and Text ~= p10.parameter)), "Row parameters must not shadow Design inputs, state, references or controls")
													v9 = Text
													annotation(")")
												end
												local TheDesignSourceEndedEarly25 = assert(Kenize[Count], "The design source ended early")
												assert(TheDesignSourceEndedEarly25.text == ")", `Expected ) but found {TheDesignSourceEndedEarly25.text}`)
												Count += 1
												annotation("return")
												local TheDesignSourceEndedEarly26 = assert(Kenize[Count], "The design source ended early")
												assert(TheDesignSourceEndedEarly26.text == "return", `Expected return but found {TheDesignSourceEndedEarly26.text}`)
												Count += 1
												local v18 = Callback()
												local TheDesignSourceEndedEarly27 = assert(Kenize[Count], "The design source ended early")
												assert(TheDesignSourceEndedEarly27.text == "end", `Expected end but found {TheDesignSourceEndedEarly27.text}`)
												Count += 1
												v9 = v16
												table.insert(List, v18)
												
												return { ["$template"] = v18.id }, Count
											else
												local TheDesignSourceEndedEarly = assert(Kenize[Count], "The design source ended early")
												assert(true, `Expected  but found {TheDesignSourceEndedEarly.text}`)
												Count += 1
												assert(TheDesignSourceEndedEarly.kind == "name", `Expected a name but found {TheDesignSourceEndedEarly.text}`)
												local Text = TheDesignSourceEndedEarly.text
												local v19 = Kenize[Count + 0]
												
												if (if v19 then v19.text else "") ~= "." then
												end
												local TheDesignSourceEndedEarly28 = assert(Kenize[Count], "The design source ended early")
												assert(TheDesignSourceEndedEarly28.text == ".", `Expected . but found {TheDesignSourceEndedEarly28.text}`)
												Count += 1
												local v20 = "."
												local TheDesignSourceEndedEarly29 = assert(Kenize[Count], "The design source ended early")
												assert(true, `Expected  but found {TheDesignSourceEndedEarly29.text}`)
												Count += 1
												assert(TheDesignSourceEndedEarly29.kind == "name", `Expected a name but found {TheDesignSourceEndedEarly29.text}`)
												Text ..= v20 .. TheDesignSourceEndedEarly29.text
											end
										end)
										Count = Literal2_1
										table.insert(List5, Literal1)
									end
									TheDesignSourceEndedEarly11 = Kenize[Count + 0]
									
									if (if TheDesignSourceEndedEarly11 then TheDesignSourceEndedEarly11.text else "") ~= "," then continue end
									local TheDesignSourceEndedEarly108 = assert(Kenize[Count], "The design source ended early")
									assert(TheDesignSourceEndedEarly108.text == ",", `Expected , but found {TheDesignSourceEndedEarly108.text}`)
									Count += 1
									continue
								end
								if #List5 > 0 or #List6 == 0 then
									Args = List5
								end
								if #List6 > 0 then
									Fields = List6
								end
							end
							local TheDesignSourceEndedEarly109 = assert(Kenize[Count], "The design source ended early")
							assert(TheDesignSourceEndedEarly109.text == ")", `Expected ) but found {TheDesignSourceEndedEarly109.text}`)
							Count += 1
							local TheDesignSourceEndedEarly110 = assert(Kenize[Count], "The design source ended early")
							assert(TheDesignSourceEndedEarly110.text == "end", `Expected end but found {TheDesignSourceEndedEarly110.text}`)
							Count += 1
							local TheDesignSourceEndedEarly111 = assert(Kenize[Count], "The design source ended early")
							assert(TheDesignSourceEndedEarly111.text == "end", `Expected end but found {TheDesignSourceEndedEarly111.text}`)
							Count += 1
							
							return { output = Text10, args = Args, fields = Fields }, nil
						end
					until true
					local v14 = v9
					local KenizeEntry37 = Kenize[Count + 0]
					
					if (if KenizeEntry37 then KenizeEntry37.text else "") ~= ")" then
						local TheDesignSourceEndedEarly112 = assert(Kenize[Count], "The design source ended early")
						assert(true, `Expected  but found {TheDesignSourceEndedEarly112.text}`)
						Count += 1
						assert(TheDesignSourceEndedEarly112.kind == "name", `Expected a name but found {TheDesignSourceEndedEarly112.text}`)
						local Text11 = TheDesignSourceEndedEarly112.text
						assert(Text11 ~= "use", "Layout functions use a typed readable input: compute the value in the caller and bind props.<input>")
						assert(Text11 ~= "props" and (Text11 ~= "state" and (Text11 ~= "refs" and Text11 ~= p10.parameter)), "Row parameters must not shadow Design inputs, state, references or controls")
						v9 = Text11
						annotation(")")
					end
					local TheDesignSourceEndedEarly113 = assert(Kenize[Count], "The design source ended early")
					assert(TheDesignSourceEndedEarly113.text == ")", `Expected ) but found {TheDesignSourceEndedEarly113.text}`)
					Count += 1
					annotation("return")
					rowAlias()
					local KenizeEntry39 = Kenize[Count + 0]
					
					if (if KenizeEntry39 then KenizeEntry39.text else "") == "if" then
						local RowBodyResult = rowBody()
						local TheDesignSourceEndedEarly114 = assert(Kenize[Count], "The design source ended early")
						assert(TheDesignSourceEndedEarly114.text == "end", `Expected end but found {TheDesignSourceEndedEarly114.text}`)
						Count += 1
						v9 = v14
						
						return nil, RowBodyResult
					end
					local TheDesignSourceEndedEarly115 = assert(Kenize[Count], "The design source ended early")
					assert(TheDesignSourceEndedEarly115.text == "return", `Expected return but found {TheDesignSourceEndedEarly115.text}`)
					Count += 1
					local KenizeEntry35 = Kenize[Count]
					
					if KenizeEntry35 == nil or KenizeEntry35.text ~= "{" and KenizeEntry35.kind ~= "string" and KenizeEntry35.kind ~= "number" then
						local CallbackResult = Callback()
						local TheDesignSourceEndedEarly116 = assert(Kenize[Count], "The design source ended early")
						assert(TheDesignSourceEndedEarly116.text == "end", `Expected end but found {TheDesignSourceEndedEarly116.text}`)
						Count += 1
						v9 = v14
						
						return nil, CallbackResult
					else
						local Literal4, Literal2_2 = readLiteral(Kenize, Count, function(p12)
							-- upvalues: Count (upval), Kenize (upval), t1 (upval), List (upval), v9 (upval), p10 (upval), annotation (upval), Callback (upval)
							Count = p12
							local v15 = Kenize[Count + 0]
							
							if (if v15 then v15.text else "") == "props" then
								local TheDesignSourceEndedEarly = assert(Kenize[Count], "The design source ended early")
								assert(TheDesignSourceEndedEarly.text == "props", `Expected props but found {TheDesignSourceEndedEarly.text}`)
								Count += 1
								local TheDesignSourceEndedEarly1 = assert(Kenize[Count], "The design source ended early")
								assert(TheDesignSourceEndedEarly1.text == ".", `Expected . but found {TheDesignSourceEndedEarly1.text}`)
								Count += 1
								local t = {}
								local TheDesignSourceEndedEarly2 = assert(Kenize[Count], "The design source ended early")
								assert(true, `Expected  but found {TheDesignSourceEndedEarly2.text}`)
								Count += 1
								assert(TheDesignSourceEndedEarly2.kind == "name", `Expected a name but found {TheDesignSourceEndedEarly2.text}`)
								t["$input"] = TheDesignSourceEndedEarly2.text
								
								return t, Count
							end
							local v16 = Kenize[Count + 0]
							
							if (if v16 then v16.text else "") == "function" then
								local TheDesignSourceEndedEarly = assert(Kenize[Count], "The design source ended early")
								assert(TheDesignSourceEndedEarly.text == "function", `Expected function but found {TheDesignSourceEndedEarly.text}`)
								Count += 1
								local TheDesignSourceEndedEarly3 = assert(Kenize[Count], "The design source ended early")
								assert(TheDesignSourceEndedEarly3.text == "(", `Expected ( but found {TheDesignSourceEndedEarly3.text}`)
								Count += 1
								local v17 = Kenize[Count + 0]
								assert((if v17 then v17.text else "") ~= "use", "Layout functions use a typed readable input: compute the value in the caller and bind props.<input>")
								
								if not Kenize[Count] or Kenize[Count].kind ~= "name" then
									local v18 = Kenize[Count + 0]
									
									if (if v18 then v18.text else "") ~= ")" then
										local TheDesignSourceEndedEarly4 = assert(Kenize[Count], "The design source ended early")
										assert(TheDesignSourceEndedEarly4.text == "...", `Expected ... but found {TheDesignSourceEndedEarly4.text}`)
										Count += 1
										local TheDesignSourceEndedEarly5 = assert(Kenize[Count], "The design source ended early")
										assert(TheDesignSourceEndedEarly5.text == ")", `Expected ) but found {TheDesignSourceEndedEarly5.text}`)
										Count += 1
										local TheDesignSourceEndedEarly6 = assert(Kenize[Count], "The design source ended early")
										assert(TheDesignSourceEndedEarly6.text == "if", `Expected if but found {TheDesignSourceEndedEarly6.text}`)
										Count += 1
										local TheDesignSourceEndedEarly7 = assert(Kenize[Count], "The design source ended early")
										assert(TheDesignSourceEndedEarly7.text == "props", `Expected props but found {TheDesignSourceEndedEarly7.text}`)
										Count += 1
										local TheDesignSourceEndedEarly8 = assert(Kenize[Count], "The design source ended early")
										assert(TheDesignSourceEndedEarly8.text == ".", `Expected . but found {TheDesignSourceEndedEarly8.text}`)
										Count += 1
										local TheDesignSourceEndedEarly9 = assert(Kenize[Count], "The design source ended early")
										assert(true, `Expected  but found {TheDesignSourceEndedEarly9.text}`)
										Count += 1
										assert(TheDesignSourceEndedEarly9.kind == "name", `Expected a name but found {TheDesignSourceEndedEarly9.text}`)
										local Text = TheDesignSourceEndedEarly9.text
										local TheDesignSourceEndedEarly10 = assert(Kenize[Count], "The design source ended early")
										assert(TheDesignSourceEndedEarly10.text == "then", `Expected then but found {TheDesignSourceEndedEarly10.text}`)
										Count += 1
										local TheDesignSourceEndedEarly11 = assert(Kenize[Count], "The design source ended early")
										assert(TheDesignSourceEndedEarly11.text == "props", `Expected props but found {TheDesignSourceEndedEarly11.text}`)
										Count += 1
										local TheDesignSourceEndedEarly12 = assert(Kenize[Count], "The design source ended early")
										assert(TheDesignSourceEndedEarly12.text == ".", `Expected . but found {TheDesignSourceEndedEarly12.text}`)
										Count += 1
										local TheDesignSourceEndedEarly13 = assert(Kenize[Count], "The design source ended early")
										assert(Text == nil or TheDesignSourceEndedEarly13.text == Text, `Expected {Text or ""} but found {TheDesignSourceEndedEarly13.text}`)
										Count += 1
										local TheDesignSourceEndedEarly14 = assert(Kenize[Count], "The design source ended early")
										assert(TheDesignSourceEndedEarly14.text == "(", `Expected ( but found {TheDesignSourceEndedEarly14.text}`)
										Count += 1
										local config = { ["$output"] = Text }
										local v19 = Kenize[Count + 0]
										
										if (if v19 then v19.text else "") == v9 then
											local v20 = v9
											local TheDesignSourceEndedEarly15 = assert(Kenize[Count], "The design source ended early")
											assert(v20 == nil or TheDesignSourceEndedEarly15.text == v20, `Expected {v20 or ""} but found {TheDesignSourceEndedEarly15.text}`)
											Count += 1
											local TheDesignSourceEndedEarly16 = assert(Kenize[Count], "The design source ended early")
											assert(TheDesignSourceEndedEarly16.text == ":", `Expected : but found {TheDesignSourceEndedEarly16.text}`)
											Count += 1
											local TheDesignSourceEndedEarly17 = assert(Kenize[Count], "The design source ended early")
											assert(TheDesignSourceEndedEarly17.text == "peek", `Expected peek but found {TheDesignSourceEndedEarly17.text}`)
											Count += 1
											local TheDesignSourceEndedEarly18 = assert(Kenize[Count], "The design source ended early")
											assert(TheDesignSourceEndedEarly18.text == "(", `Expected ( but found {TheDesignSourceEndedEarly18.text}`)
											Count += 1
											local TheDesignSourceEndedEarly19 = assert(Kenize[Count], "The design source ended early")
											assert(TheDesignSourceEndedEarly19.text == ")", `Expected ) but found {TheDesignSourceEndedEarly19.text}`)
											Count += 1
											config["$row"] = true
										else
											local TheDesignSourceEndedEarly20 = assert(Kenize[Count], "The design source ended early")
											assert(TheDesignSourceEndedEarly20.text == "...", `Expected ... but found {TheDesignSourceEndedEarly20.text}`)
											Count += 1
										end
										local TheDesignSourceEndedEarly21 = assert(Kenize[Count], "The design source ended early")
										assert(TheDesignSourceEndedEarly21.text == ")", `Expected ) but found {TheDesignSourceEndedEarly21.text}`)
										Count += 1
										local TheDesignSourceEndedEarly22 = assert(Kenize[Count], "The design source ended early")
										assert(TheDesignSourceEndedEarly22.text == "end", `Expected end but found {TheDesignSourceEndedEarly22.text}`)
										Count += 1
										local TheDesignSourceEndedEarly23 = assert(Kenize[Count], "The design source ended early")
										assert(TheDesignSourceEndedEarly23.text == "end", `Expected end but found {TheDesignSourceEndedEarly23.text}`)
										Count += 1
										
										return config, Count
									end
								end
								local v17 = v9
								local v18 = Kenize[Count + 0]
								
								if (if v18 then v18.text else "") ~= ")" then
									local TheDesignSourceEndedEarly24 = assert(Kenize[Count], "The design source ended early")
									assert(true, `Expected  but found {TheDesignSourceEndedEarly24.text}`)
									Count += 1
									assert(TheDesignSourceEndedEarly24.kind == "name", `Expected a name but found {TheDesignSourceEndedEarly24.text}`)
									local Text = TheDesignSourceEndedEarly24.text
									assert(Text ~= "use", "Layout functions use a typed readable input: compute the value in the caller and bind props.<input>")
									assert(Text ~= "props" and (Text ~= "state" and (Text ~= "refs" and Text ~= p10.parameter)), "Row parameters must not shadow Design inputs, state, references or controls")
									v9 = Text
									annotation(")")
								end
								local TheDesignSourceEndedEarly25 = assert(Kenize[Count], "The design source ended early")
								assert(TheDesignSourceEndedEarly25.text == ")", `Expected ) but found {TheDesignSourceEndedEarly25.text}`)
								Count += 1
								annotation("return")
								local TheDesignSourceEndedEarly26 = assert(Kenize[Count], "The design source ended early")
								assert(TheDesignSourceEndedEarly26.text == "return", `Expected return but found {TheDesignSourceEndedEarly26.text}`)
								Count += 1
								local v19 = Callback()
								local TheDesignSourceEndedEarly27 = assert(Kenize[Count], "The design source ended early")
								assert(TheDesignSourceEndedEarly27.text == "end", `Expected end but found {TheDesignSourceEndedEarly27.text}`)
								Count += 1
								v9 = v17
								table.insert(List, v19)
								
								return { ["$template"] = v19.id }, Count
							else
								local TheDesignSourceEndedEarly = assert(Kenize[Count], "The design source ended early")
								assert(true, `Expected  but found {TheDesignSourceEndedEarly.text}`)
								Count += 1
								assert(TheDesignSourceEndedEarly.kind == "name", `Expected a name but found {TheDesignSourceEndedEarly.text}`)
								local Text = TheDesignSourceEndedEarly.text
								local v20 = Kenize[Count + 0]
								
								if (if v20 then v20.text else "") ~= "." then
								end
								local TheDesignSourceEndedEarly28 = assert(Kenize[Count], "The design source ended early")
								assert(TheDesignSourceEndedEarly28.text == ".", `Expected . but found {TheDesignSourceEndedEarly28.text}`)
								Count += 1
								local v21 = "."
								local TheDesignSourceEndedEarly29 = assert(Kenize[Count], "The design source ended early")
								assert(true, `Expected  but found {TheDesignSourceEndedEarly29.text}`)
								Count += 1
								assert(TheDesignSourceEndedEarly29.kind == "name", `Expected a name but found {TheDesignSourceEndedEarly29.text}`)
								Text ..= v21 .. TheDesignSourceEndedEarly29.text
							end
						end)
						Count = Literal2_2
						local TheDesignSourceEndedEarly117 = assert(Kenize[Count], "The design source ended early")
						assert(TheDesignSourceEndedEarly117.text == "end", `Expected end but found {TheDesignSourceEndedEarly117.text}`)
						Count += 1
						v9 = v14
						
						return { literal = Literal4 }, nil
					end
				end
			else
				if Kenize[Count] and Kenize[Count].kind == "name" then
					local KenizeEntry41 = Kenize[Count + 1]
					
					if (if KenizeEntry41 then KenizeEntry41.text else "") == "." then
						local Count2: number = Count
						local DottedResult: string = dotted()
						local Match: string? = string.match(DottedResult, "^Enum%.[%w_]+%.([%w_]+)$")
						
						if Match ~= nil then
							return { literal = Match }, nil
						end
						if DottedResult == "Color3.fromHex" then
							local KenizeEntry34 = Kenize[Count + 0]
							local v12 = (if KenizeEntry34 then KenizeEntry34.text else "") == "("
							
							if v12 then
								local TheDesignSourceEndedEarly = assert(Kenize[Count], "The design source ended early")
								assert(TheDesignSourceEndedEarly.text == "(", `Expected ( but found {TheDesignSourceEndedEarly.text}`)
								Count += 1
							end
							local Literal5, Literal2_3 = readLiteral(Kenize, Count, function(p12)
								-- upvalues: Count (upval), Kenize (upval), t1 (upval), List (upval), v9 (upval), p10 (upval), annotation (upval), Callback (upval)
								Count = p12
								local v13 = Kenize[Count + 0]
								
								if (if v13 then v13.text else "") == "props" then
									local TheDesignSourceEndedEarly = assert(Kenize[Count], "The design source ended early")
									assert(TheDesignSourceEndedEarly.text == "props", `Expected props but found {TheDesignSourceEndedEarly.text}`)
									Count += 1
									local TheDesignSourceEndedEarly1 = assert(Kenize[Count], "The design source ended early")
									assert(TheDesignSourceEndedEarly1.text == ".", `Expected . but found {TheDesignSourceEndedEarly1.text}`)
									Count += 1
									local t = {}
									local TheDesignSourceEndedEarly2 = assert(Kenize[Count], "The design source ended early")
									assert(true, `Expected  but found {TheDesignSourceEndedEarly2.text}`)
									Count += 1
									assert(TheDesignSourceEndedEarly2.kind == "name", `Expected a name but found {TheDesignSourceEndedEarly2.text}`)
									t["$input"] = TheDesignSourceEndedEarly2.text
									
									return t, Count
								end
								local v14 = Kenize[Count + 0]
								
								if (if v14 then v14.text else "") == "function" then
									local TheDesignSourceEndedEarly = assert(Kenize[Count], "The design source ended early")
									assert(TheDesignSourceEndedEarly.text == "function", `Expected function but found {TheDesignSourceEndedEarly.text}`)
									Count += 1
									local TheDesignSourceEndedEarly3 = assert(Kenize[Count], "The design source ended early")
									assert(TheDesignSourceEndedEarly3.text == "(", `Expected ( but found {TheDesignSourceEndedEarly3.text}`)
									Count += 1
									local v15 = Kenize[Count + 0]
									assert((if v15 then v15.text else "") ~= "use", "Layout functions use a typed readable input: compute the value in the caller and bind props.<input>")
									
									if not Kenize[Count] or Kenize[Count].kind ~= "name" then
										local v16 = Kenize[Count + 0]
										
										if (if v16 then v16.text else "") ~= ")" then
											local TheDesignSourceEndedEarly4 = assert(Kenize[Count], "The design source ended early")
											assert(TheDesignSourceEndedEarly4.text == "...", `Expected ... but found {TheDesignSourceEndedEarly4.text}`)
											Count += 1
											local TheDesignSourceEndedEarly5 = assert(Kenize[Count], "The design source ended early")
											assert(TheDesignSourceEndedEarly5.text == ")", `Expected ) but found {TheDesignSourceEndedEarly5.text}`)
											Count += 1
											local TheDesignSourceEndedEarly6 = assert(Kenize[Count], "The design source ended early")
											assert(TheDesignSourceEndedEarly6.text == "if", `Expected if but found {TheDesignSourceEndedEarly6.text}`)
											Count += 1
											local TheDesignSourceEndedEarly7 = assert(Kenize[Count], "The design source ended early")
											assert(TheDesignSourceEndedEarly7.text == "props", `Expected props but found {TheDesignSourceEndedEarly7.text}`)
											Count += 1
											local TheDesignSourceEndedEarly8 = assert(Kenize[Count], "The design source ended early")
											assert(TheDesignSourceEndedEarly8.text == ".", `Expected . but found {TheDesignSourceEndedEarly8.text}`)
											Count += 1
											local TheDesignSourceEndedEarly9 = assert(Kenize[Count], "The design source ended early")
											assert(true, `Expected  but found {TheDesignSourceEndedEarly9.text}`)
											Count += 1
											assert(TheDesignSourceEndedEarly9.kind == "name", `Expected a name but found {TheDesignSourceEndedEarly9.text}`)
											local Text = TheDesignSourceEndedEarly9.text
											local TheDesignSourceEndedEarly10 = assert(Kenize[Count], "The design source ended early")
											assert(TheDesignSourceEndedEarly10.text == "then", `Expected then but found {TheDesignSourceEndedEarly10.text}`)
											Count += 1
											local TheDesignSourceEndedEarly11 = assert(Kenize[Count], "The design source ended early")
											assert(TheDesignSourceEndedEarly11.text == "props", `Expected props but found {TheDesignSourceEndedEarly11.text}`)
											Count += 1
											local TheDesignSourceEndedEarly12 = assert(Kenize[Count], "The design source ended early")
											assert(TheDesignSourceEndedEarly12.text == ".", `Expected . but found {TheDesignSourceEndedEarly12.text}`)
											Count += 1
											local TheDesignSourceEndedEarly13 = assert(Kenize[Count], "The design source ended early")
											assert(Text == nil or TheDesignSourceEndedEarly13.text == Text, `Expected {Text or ""} but found {TheDesignSourceEndedEarly13.text}`)
											Count += 1
											local TheDesignSourceEndedEarly14 = assert(Kenize[Count], "The design source ended early")
											assert(TheDesignSourceEndedEarly14.text == "(", `Expected ( but found {TheDesignSourceEndedEarly14.text}`)
											Count += 1
											local config = { ["$output"] = Text }
											local v17 = Kenize[Count + 0]
											
											if (if v17 then v17.text else "") == v9 then
												local v18 = v9
												local TheDesignSourceEndedEarly15 = assert(Kenize[Count], "The design source ended early")
												assert(v18 == nil or TheDesignSourceEndedEarly15.text == v18, `Expected {v18 or ""} but found {TheDesignSourceEndedEarly15.text}`)
												Count += 1
												local TheDesignSourceEndedEarly16 = assert(Kenize[Count], "The design source ended early")
												assert(TheDesignSourceEndedEarly16.text == ":", `Expected : but found {TheDesignSourceEndedEarly16.text}`)
												Count += 1
												local TheDesignSourceEndedEarly17 = assert(Kenize[Count], "The design source ended early")
												assert(TheDesignSourceEndedEarly17.text == "peek", `Expected peek but found {TheDesignSourceEndedEarly17.text}`)
												Count += 1
												local TheDesignSourceEndedEarly18 = assert(Kenize[Count], "The design source ended early")
												assert(TheDesignSourceEndedEarly18.text == "(", `Expected ( but found {TheDesignSourceEndedEarly18.text}`)
												Count += 1
												local TheDesignSourceEndedEarly19 = assert(Kenize[Count], "The design source ended early")
												assert(TheDesignSourceEndedEarly19.text == ")", `Expected ) but found {TheDesignSourceEndedEarly19.text}`)
												Count += 1
												config["$row"] = true
											else
												local TheDesignSourceEndedEarly20 = assert(Kenize[Count], "The design source ended early")
												assert(TheDesignSourceEndedEarly20.text == "...", `Expected ... but found {TheDesignSourceEndedEarly20.text}`)
												Count += 1
											end
											local TheDesignSourceEndedEarly21 = assert(Kenize[Count], "The design source ended early")
											assert(TheDesignSourceEndedEarly21.text == ")", `Expected ) but found {TheDesignSourceEndedEarly21.text}`)
											Count += 1
											local TheDesignSourceEndedEarly22 = assert(Kenize[Count], "The design source ended early")
											assert(TheDesignSourceEndedEarly22.text == "end", `Expected end but found {TheDesignSourceEndedEarly22.text}`)
											Count += 1
											local TheDesignSourceEndedEarly23 = assert(Kenize[Count], "The design source ended early")
											assert(TheDesignSourceEndedEarly23.text == "end", `Expected end but found {TheDesignSourceEndedEarly23.text}`)
											Count += 1
											
											return config, Count
										end
									end
									local v15 = v9
									local v16 = Kenize[Count + 0]
									
									if (if v16 then v16.text else "") ~= ")" then
										local TheDesignSourceEndedEarly24 = assert(Kenize[Count], "The design source ended early")
										assert(true, `Expected  but found {TheDesignSourceEndedEarly24.text}`)
										Count += 1
										assert(TheDesignSourceEndedEarly24.kind == "name", `Expected a name but found {TheDesignSourceEndedEarly24.text}`)
										local Text = TheDesignSourceEndedEarly24.text
										assert(Text ~= "use", "Layout functions use a typed readable input: compute the value in the caller and bind props.<input>")
										assert(Text ~= "props" and (Text ~= "state" and (Text ~= "refs" and Text ~= p10.parameter)), "Row parameters must not shadow Design inputs, state, references or controls")
										v9 = Text
										annotation(")")
									end
									local TheDesignSourceEndedEarly25 = assert(Kenize[Count], "The design source ended early")
									assert(TheDesignSourceEndedEarly25.text == ")", `Expected ) but found {TheDesignSourceEndedEarly25.text}`)
									Count += 1
									annotation("return")
									local TheDesignSourceEndedEarly26 = assert(Kenize[Count], "The design source ended early")
									assert(TheDesignSourceEndedEarly26.text == "return", `Expected return but found {TheDesignSourceEndedEarly26.text}`)
									Count += 1
									local v17 = Callback()
									local TheDesignSourceEndedEarly27 = assert(Kenize[Count], "The design source ended early")
									assert(TheDesignSourceEndedEarly27.text == "end", `Expected end but found {TheDesignSourceEndedEarly27.text}`)
									Count += 1
									v9 = v15
									table.insert(List, v17)
									
									return { ["$template"] = v17.id }, Count
								else
									local TheDesignSourceEndedEarly = assert(Kenize[Count], "The design source ended early")
									assert(true, `Expected  but found {TheDesignSourceEndedEarly.text}`)
									Count += 1
									assert(TheDesignSourceEndedEarly.kind == "name", `Expected a name but found {TheDesignSourceEndedEarly.text}`)
									local Text = TheDesignSourceEndedEarly.text
									local v18 = Kenize[Count + 0]
									
									if (if v18 then v18.text else "") ~= "." then
									end
									local TheDesignSourceEndedEarly28 = assert(Kenize[Count], "The design source ended early")
									assert(TheDesignSourceEndedEarly28.text == ".", `Expected . but found {TheDesignSourceEndedEarly28.text}`)
									Count += 1
									local v19 = "."
									local TheDesignSourceEndedEarly29 = assert(Kenize[Count], "The design source ended early")
									assert(true, `Expected  but found {TheDesignSourceEndedEarly29.text}`)
									Count += 1
									assert(TheDesignSourceEndedEarly29.kind == "name", `Expected a name but found {TheDesignSourceEndedEarly29.text}`)
									Text ..= v19 .. TheDesignSourceEndedEarly29.text
								end
							end)
							Count = Literal2_3
							
							if v12 then
								local TheDesignSourceEndedEarly = assert(Kenize[Count], "The design source ended early")
								assert(TheDesignSourceEndedEarly.text == ")", `Expected ) but found {TheDesignSourceEndedEarly.text}`)
								Count += 1
							end
							assert(type(Literal5) == "string", "Color3.fromHex takes text")
							
							return { literal = "#" .. Literal5 }, nil
						elseif DottedResult == "Vector2.one" or DottedResult == "Vector2.zero" or (DottedResult == "Vector3.one" or DottedResult == "Vector3.zero") then
							local Match1, Match2 = string.match(DottedResult, "^(%w+)%.(%w+)$")
							local Literal3 = {}
							
							for i1 = 1, assert(DatatypeModule.arity[assert(Match1)]) do
								Literal3[i1] = if Match2 == "one" then 1 else 0
							end
							return { literal = Literal3 }, nil
						else
							if string.match(DottedResult, "^[%w_]+%.new$") or (DottedResult == "UDim2.fromOffset" or DottedResult == "UDim2.fromScale") then
								local KenizeEntry27 = Kenize[Count + 0]
								
								if (if KenizeEntry27 then KenizeEntry27.text else "") == "(" then
									local TheDesignSourceEndedEarly = assert(Kenize[Count], "The design source ended early")
									assert(TheDesignSourceEndedEarly.text == "(", `Expected ( but found {TheDesignSourceEndedEarly.text}`)
									Count += 1
									local List4 = {}
									while true do
										local Text9 = Kenize[Count + 0]
										if (if Text9 then Text9.text else "") == ")" then break end
										local KenizeEntry33 = token()
										
										if KenizeEntry33 then
											List4[#List4 + 1] = { token = KenizeEntry33 }
										else
											local KenizeEntry32 = Kenize[Count + 0]
											Text9 = if KenizeEntry32 then KenizeEntry32.text else ""
											local IsProps = Text9 == "props"
											
											if not IsProps then
												KenizeEntry32 = Kenize[Count + 0]
												Text9 = if KenizeEntry32 then KenizeEntry32.text else ""
												IsProps = Text9 == "use"
											end
											if IsProps then
												local IsNotEnvironment = Kenize[Count + 0]
												KenizeEntry32 = if IsNotEnvironment then IsNotEnvironment.text else ""
												Text9 = KenizeEntry32 == "use"
												
												if Text9 then
													KenizeEntry32 = assert(Kenize[Count], "The design source ended early")
													assert(KenizeEntry32.text == "use", `Expected use but found {KenizeEntry32.text}`)
													Count += 1
													KenizeEntry32 = assert(Kenize[Count], "The design source ended early")
													assert(KenizeEntry32.text == "(", `Expected ( but found {KenizeEntry32.text}`)
													Count += 1
												end
												local KenizeEntry40 = Kenize[Count + 0]
												IsNotEnvironment = (if KenizeEntry40 then KenizeEntry40.text else "") ~= "environment"
												assert(IsNotEnvironment, "Layout functions use a typed readable input: compute the value in the caller and bind props.<input>")
												KenizeEntry32 = assert(Kenize[Count], "The design source ended early")
												assert(KenizeEntry32.text == "props", `Expected props but found {KenizeEntry32.text}`)
												Count += 1
												KenizeEntry32 = assert(Kenize[Count], "The design source ended early")
												assert(KenizeEntry32.text == ".", `Expected . but found {KenizeEntry32.text}`)
												Count += 1
												KenizeEntry32 = assert(Kenize[Count], "The design source ended early")
												assert(true, `Expected  but found {KenizeEntry32.text}`)
												Count += 1
												assert(KenizeEntry32.kind == "name", "A datatype component names an input")
												
												if Text9 then
													IsNotEnvironment = assert(Kenize[Count], "The design source ended early")
													KenizeEntry40 = IsNotEnvironment.text == ")"
													assert(KenizeEntry40, `Expected ) but found {IsNotEnvironment.text}`)
													Count += 1
												end
												List4[#List4 + 1] = { input = KenizeEntry32.text }
											else
												local Literal2_4
												KenizeEntry32, Literal2_4 = readLiteral(Kenize, Count, function(p12)
													-- upvalues: Count (upval), Kenize (upval), t1 (upval), List (upval), v9 (upval), p10 (upval), annotation (upval), Callback (upval)
													Count = p12
													local v13 = Kenize[Count + 0]
													
													if (if v13 then v13.text else "") == "props" then
														local TheDesignSourceEndedEarly = assert(Kenize[Count], "The design source ended early")
														assert(TheDesignSourceEndedEarly.text == "props", `Expected props but found {TheDesignSourceEndedEarly.text}`)
														Count += 1
														local TheDesignSourceEndedEarly1 = assert(Kenize[Count], "The design source ended early")
														assert(TheDesignSourceEndedEarly1.text == ".", `Expected . but found {TheDesignSourceEndedEarly1.text}`)
														Count += 1
														local t = {}
														local TheDesignSourceEndedEarly2 = assert(Kenize[Count], "The design source ended early")
														assert(true, `Expected  but found {TheDesignSourceEndedEarly2.text}`)
														Count += 1
														assert(TheDesignSourceEndedEarly2.kind == "name", `Expected a name but found {TheDesignSourceEndedEarly2.text}`)
														t["$input"] = TheDesignSourceEndedEarly2.text
														
														return t, Count
													end
													local v14 = Kenize[Count + 0]
													
													if (if v14 then v14.text else "") == "function" then
														local TheDesignSourceEndedEarly = assert(Kenize[Count], "The design source ended early")
														assert(TheDesignSourceEndedEarly.text == "function", `Expected function but found {TheDesignSourceEndedEarly.text}`)
														Count += 1
														local TheDesignSourceEndedEarly3 = assert(Kenize[Count], "The design source ended early")
														assert(TheDesignSourceEndedEarly3.text == "(", `Expected ( but found {TheDesignSourceEndedEarly3.text}`)
														Count += 1
														local v15 = Kenize[Count + 0]
														assert((if v15 then v15.text else "") ~= "use", "Layout functions use a typed readable input: compute the value in the caller and bind props.<input>")
														
														if not Kenize[Count] or Kenize[Count].kind ~= "name" then
															local v16 = Kenize[Count + 0]
															
															if (if v16 then v16.text else "") ~= ")" then
																local TheDesignSourceEndedEarly4 = assert(Kenize[Count], "The design source ended early")
																assert(TheDesignSourceEndedEarly4.text == "...", `Expected ... but found {TheDesignSourceEndedEarly4.text}`)
																Count += 1
																local TheDesignSourceEndedEarly5 = assert(Kenize[Count], "The design source ended early")
																assert(TheDesignSourceEndedEarly5.text == ")", `Expected ) but found {TheDesignSourceEndedEarly5.text}`)
																Count += 1
																local TheDesignSourceEndedEarly6 = assert(Kenize[Count], "The design source ended early")
																assert(TheDesignSourceEndedEarly6.text == "if", `Expected if but found {TheDesignSourceEndedEarly6.text}`)
																Count += 1
																local TheDesignSourceEndedEarly7 = assert(Kenize[Count], "The design source ended early")
																assert(TheDesignSourceEndedEarly7.text == "props", `Expected props but found {TheDesignSourceEndedEarly7.text}`)
																Count += 1
																local TheDesignSourceEndedEarly8 = assert(Kenize[Count], "The design source ended early")
																assert(TheDesignSourceEndedEarly8.text == ".", `Expected . but found {TheDesignSourceEndedEarly8.text}`)
																Count += 1
																local TheDesignSourceEndedEarly9 = assert(Kenize[Count], "The design source ended early")
																assert(true, `Expected  but found {TheDesignSourceEndedEarly9.text}`)
																Count += 1
																assert(TheDesignSourceEndedEarly9.kind == "name", `Expected a name but found {TheDesignSourceEndedEarly9.text}`)
																local Text = TheDesignSourceEndedEarly9.text
																local TheDesignSourceEndedEarly10 = assert(Kenize[Count], "The design source ended early")
																assert(TheDesignSourceEndedEarly10.text == "then", `Expected then but found {TheDesignSourceEndedEarly10.text}`)
																Count += 1
																local TheDesignSourceEndedEarly11 = assert(Kenize[Count], "The design source ended early")
																assert(TheDesignSourceEndedEarly11.text == "props", `Expected props but found {TheDesignSourceEndedEarly11.text}`)
																Count += 1
																local TheDesignSourceEndedEarly12 = assert(Kenize[Count], "The design source ended early")
																assert(TheDesignSourceEndedEarly12.text == ".", `Expected . but found {TheDesignSourceEndedEarly12.text}`)
																Count += 1
																local TheDesignSourceEndedEarly13 = assert(Kenize[Count], "The design source ended early")
																assert(Text == nil or TheDesignSourceEndedEarly13.text == Text, `Expected {Text or ""} but found {TheDesignSourceEndedEarly13.text}`)
																Count += 1
																local TheDesignSourceEndedEarly14 = assert(Kenize[Count], "The design source ended early")
																assert(TheDesignSourceEndedEarly14.text == "(", `Expected ( but found {TheDesignSourceEndedEarly14.text}`)
																Count += 1
																local config = { ["$output"] = Text }
																local v17 = Kenize[Count + 0]
																
																if (if v17 then v17.text else "") == v9 then
																	local v18 = v9
																	local TheDesignSourceEndedEarly15 = assert(Kenize[Count], "The design source ended early")
																	assert(v18 == nil or TheDesignSourceEndedEarly15.text == v18, `Expected {v18 or ""} but found {TheDesignSourceEndedEarly15.text}`)
																	Count += 1
																	local TheDesignSourceEndedEarly16 = assert(Kenize[Count], "The design source ended early")
																	assert(TheDesignSourceEndedEarly16.text == ":", `Expected : but found {TheDesignSourceEndedEarly16.text}`)
																	Count += 1
																	local TheDesignSourceEndedEarly17 = assert(Kenize[Count], "The design source ended early")
																	assert(TheDesignSourceEndedEarly17.text == "peek", `Expected peek but found {TheDesignSourceEndedEarly17.text}`)
																	Count += 1
																	local TheDesignSourceEndedEarly18 = assert(Kenize[Count], "The design source ended early")
																	assert(TheDesignSourceEndedEarly18.text == "(", `Expected ( but found {TheDesignSourceEndedEarly18.text}`)
																	Count += 1
																	local TheDesignSourceEndedEarly19 = assert(Kenize[Count], "The design source ended early")
																	assert(TheDesignSourceEndedEarly19.text == ")", `Expected ) but found {TheDesignSourceEndedEarly19.text}`)
																	Count += 1
																	config["$row"] = true
																else
																	local TheDesignSourceEndedEarly20 = assert(Kenize[Count], "The design source ended early")
																	assert(TheDesignSourceEndedEarly20.text == "...", `Expected ... but found {TheDesignSourceEndedEarly20.text}`)
																	Count += 1
																end
																local TheDesignSourceEndedEarly21 = assert(Kenize[Count], "The design source ended early")
																assert(TheDesignSourceEndedEarly21.text == ")", `Expected ) but found {TheDesignSourceEndedEarly21.text}`)
																Count += 1
																local TheDesignSourceEndedEarly22 = assert(Kenize[Count], "The design source ended early")
																assert(TheDesignSourceEndedEarly22.text == "end", `Expected end but found {TheDesignSourceEndedEarly22.text}`)
																Count += 1
																local TheDesignSourceEndedEarly23 = assert(Kenize[Count], "The design source ended early")
																assert(TheDesignSourceEndedEarly23.text == "end", `Expected end but found {TheDesignSourceEndedEarly23.text}`)
																Count += 1
																
																return config, Count
															end
														end
														local v15 = v9
														local v16 = Kenize[Count + 0]
														
														if (if v16 then v16.text else "") ~= ")" then
															local TheDesignSourceEndedEarly24 = assert(Kenize[Count], "The design source ended early")
															assert(true, `Expected  but found {TheDesignSourceEndedEarly24.text}`)
															Count += 1
															assert(TheDesignSourceEndedEarly24.kind == "name", `Expected a name but found {TheDesignSourceEndedEarly24.text}`)
															local Text = TheDesignSourceEndedEarly24.text
															assert(Text ~= "use", "Layout functions use a typed readable input: compute the value in the caller and bind props.<input>")
															assert(Text ~= "props" and (Text ~= "state" and (Text ~= "refs" and Text ~= p10.parameter)), "Row parameters must not shadow Design inputs, state, references or controls")
															v9 = Text
															annotation(")")
														end
														local TheDesignSourceEndedEarly25 = assert(Kenize[Count], "The design source ended early")
														assert(TheDesignSourceEndedEarly25.text == ")", `Expected ) but found {TheDesignSourceEndedEarly25.text}`)
														Count += 1
														annotation("return")
														local TheDesignSourceEndedEarly26 = assert(Kenize[Count], "The design source ended early")
														assert(TheDesignSourceEndedEarly26.text == "return", `Expected return but found {TheDesignSourceEndedEarly26.text}`)
														Count += 1
														local v17 = Callback()
														local TheDesignSourceEndedEarly27 = assert(Kenize[Count], "The design source ended early")
														assert(TheDesignSourceEndedEarly27.text == "end", `Expected end but found {TheDesignSourceEndedEarly27.text}`)
														Count += 1
														v9 = v15
														table.insert(List, v17)
														
														return { ["$template"] = v17.id }, Count
													else
														local TheDesignSourceEndedEarly = assert(Kenize[Count], "The design source ended early")
														assert(true, `Expected  but found {TheDesignSourceEndedEarly.text}`)
														Count += 1
														assert(TheDesignSourceEndedEarly.kind == "name", `Expected a name but found {TheDesignSourceEndedEarly.text}`)
														local Text = TheDesignSourceEndedEarly.text
														local v18 = Kenize[Count + 0]
														
														if (if v18 then v18.text else "") ~= "." then
														end
														local TheDesignSourceEndedEarly28 = assert(Kenize[Count], "The design source ended early")
														assert(TheDesignSourceEndedEarly28.text == ".", `Expected . but found {TheDesignSourceEndedEarly28.text}`)
														Count += 1
														local v19 = "."
														local TheDesignSourceEndedEarly29 = assert(Kenize[Count], "The design source ended early")
														assert(true, `Expected  but found {TheDesignSourceEndedEarly29.text}`)
														Count += 1
														assert(TheDesignSourceEndedEarly29.kind == "name", `Expected a name but found {TheDesignSourceEndedEarly29.text}`)
														Text ..= v19 .. TheDesignSourceEndedEarly29.text
													end
												end)
												Count = Literal2_4
												Text9 = KenizeEntry32
												Literal2_4 = type(Text9) == "number"
												assert(Literal2_4, "Datatype constructors take numeric, token or input components")
												List4[#List4 + 1] = Text9
											end
										end
										KenizeEntry33 = Kenize[Count + 0]
										Text9 = if KenizeEntry33 then KenizeEntry33.text else ""
										
										if Text9 ~= "," then continue end
										Text9 = assert(Kenize[Count], "The design source ended early")
										assert(Text9.text == ",", `Expected , but found {Text9.text}`)
										Count += 1
										continue
									end
									local TheDesignSourceEndedEarly118 = assert(Kenize[Count], "The design source ended early")
									assert(TheDesignSourceEndedEarly118.text == ")", `Expected ) but found {TheDesignSourceEndedEarly118.text}`)
									Count += 1
									
									if DottedResult == "UDim2.fromOffset" or DottedResult == "UDim2.fromScale" then
										assert(#List4 == 2, `{DottedResult} takes two components`)
										List4 = if DottedResult == "UDim2.fromOffset" then { 0, List4[1], 0, List4[2] } else { List4[1], 0, List4[2], 0 }
									end
									return { literal = DatatypeModule.literal(List4) }, nil
								end
							end
							Count = Count2
						end
					end
				end
				local Ken = token()
				
				if Ken then
					return { token = Ken }, nil
				else
					local Literal, Literal2 = readLiteral(Kenize, Count, function(p12)
						-- upvalues: Count (upval), Kenize (upval), t1 (upval), List (upval), v9 (upval), p10 (upval), annotation (upval), Callback (upval)
						Count = p12
						local v13 = Kenize[Count + 0]
						
						if (if v13 then v13.text else "") == "props" then
							local TheDesignSourceEndedEarly = assert(Kenize[Count], "The design source ended early")
							assert(TheDesignSourceEndedEarly.text == "props", `Expected props but found {TheDesignSourceEndedEarly.text}`)
							Count += 1
							local TheDesignSourceEndedEarly1 = assert(Kenize[Count], "The design source ended early")
							assert(TheDesignSourceEndedEarly1.text == ".", `Expected . but found {TheDesignSourceEndedEarly1.text}`)
							Count += 1
							local t = {}
							local TheDesignSourceEndedEarly2 = assert(Kenize[Count], "The design source ended early")
							assert(true, `Expected  but found {TheDesignSourceEndedEarly2.text}`)
							Count += 1
							assert(TheDesignSourceEndedEarly2.kind == "name", `Expected a name but found {TheDesignSourceEndedEarly2.text}`)
							t["$input"] = TheDesignSourceEndedEarly2.text
							
							return t, Count
						end
						local v14 = Kenize[Count + 0]
						
						if (if v14 then v14.text else "") == "function" then
							local TheDesignSourceEndedEarly = assert(Kenize[Count], "The design source ended early")
							assert(TheDesignSourceEndedEarly.text == "function", `Expected function but found {TheDesignSourceEndedEarly.text}`)
							Count += 1
							local TheDesignSourceEndedEarly3 = assert(Kenize[Count], "The design source ended early")
							assert(TheDesignSourceEndedEarly3.text == "(", `Expected ( but found {TheDesignSourceEndedEarly3.text}`)
							Count += 1
							local v15 = Kenize[Count + 0]
							assert((if v15 then v15.text else "") ~= "use", "Layout functions use a typed readable input: compute the value in the caller and bind props.<input>")
							
							if not Kenize[Count] or Kenize[Count].kind ~= "name" then
								local v16 = Kenize[Count + 0]
								
								if (if v16 then v16.text else "") ~= ")" then
									local TheDesignSourceEndedEarly4 = assert(Kenize[Count], "The design source ended early")
									assert(TheDesignSourceEndedEarly4.text == "...", `Expected ... but found {TheDesignSourceEndedEarly4.text}`)
									Count += 1
									local TheDesignSourceEndedEarly5 = assert(Kenize[Count], "The design source ended early")
									assert(TheDesignSourceEndedEarly5.text == ")", `Expected ) but found {TheDesignSourceEndedEarly5.text}`)
									Count += 1
									local TheDesignSourceEndedEarly6 = assert(Kenize[Count], "The design source ended early")
									assert(TheDesignSourceEndedEarly6.text == "if", `Expected if but found {TheDesignSourceEndedEarly6.text}`)
									Count += 1
									local TheDesignSourceEndedEarly7 = assert(Kenize[Count], "The design source ended early")
									assert(TheDesignSourceEndedEarly7.text == "props", `Expected props but found {TheDesignSourceEndedEarly7.text}`)
									Count += 1
									local TheDesignSourceEndedEarly8 = assert(Kenize[Count], "The design source ended early")
									assert(TheDesignSourceEndedEarly8.text == ".", `Expected . but found {TheDesignSourceEndedEarly8.text}`)
									Count += 1
									local TheDesignSourceEndedEarly9 = assert(Kenize[Count], "The design source ended early")
									assert(true, `Expected  but found {TheDesignSourceEndedEarly9.text}`)
									Count += 1
									assert(TheDesignSourceEndedEarly9.kind == "name", `Expected a name but found {TheDesignSourceEndedEarly9.text}`)
									local Text = TheDesignSourceEndedEarly9.text
									local TheDesignSourceEndedEarly10 = assert(Kenize[Count], "The design source ended early")
									assert(TheDesignSourceEndedEarly10.text == "then", `Expected then but found {TheDesignSourceEndedEarly10.text}`)
									Count += 1
									local TheDesignSourceEndedEarly11 = assert(Kenize[Count], "The design source ended early")
									assert(TheDesignSourceEndedEarly11.text == "props", `Expected props but found {TheDesignSourceEndedEarly11.text}`)
									Count += 1
									local TheDesignSourceEndedEarly12 = assert(Kenize[Count], "The design source ended early")
									assert(TheDesignSourceEndedEarly12.text == ".", `Expected . but found {TheDesignSourceEndedEarly12.text}`)
									Count += 1
									local TheDesignSourceEndedEarly13 = assert(Kenize[Count], "The design source ended early")
									assert(Text == nil or TheDesignSourceEndedEarly13.text == Text, `Expected {Text or ""} but found {TheDesignSourceEndedEarly13.text}`)
									Count += 1
									local TheDesignSourceEndedEarly14 = assert(Kenize[Count], "The design source ended early")
									assert(TheDesignSourceEndedEarly14.text == "(", `Expected ( but found {TheDesignSourceEndedEarly14.text}`)
									Count += 1
									local config = { ["$output"] = Text }
									local v17 = Kenize[Count + 0]
									
									if (if v17 then v17.text else "") == v9 then
										local v18 = v9
										local TheDesignSourceEndedEarly15 = assert(Kenize[Count], "The design source ended early")
										assert(v18 == nil or TheDesignSourceEndedEarly15.text == v18, `Expected {v18 or ""} but found {TheDesignSourceEndedEarly15.text}`)
										Count += 1
										local TheDesignSourceEndedEarly16 = assert(Kenize[Count], "The design source ended early")
										assert(TheDesignSourceEndedEarly16.text == ":", `Expected : but found {TheDesignSourceEndedEarly16.text}`)
										Count += 1
										local TheDesignSourceEndedEarly17 = assert(Kenize[Count], "The design source ended early")
										assert(TheDesignSourceEndedEarly17.text == "peek", `Expected peek but found {TheDesignSourceEndedEarly17.text}`)
										Count += 1
										local TheDesignSourceEndedEarly18 = assert(Kenize[Count], "The design source ended early")
										assert(TheDesignSourceEndedEarly18.text == "(", `Expected ( but found {TheDesignSourceEndedEarly18.text}`)
										Count += 1
										local TheDesignSourceEndedEarly19 = assert(Kenize[Count], "The design source ended early")
										assert(TheDesignSourceEndedEarly19.text == ")", `Expected ) but found {TheDesignSourceEndedEarly19.text}`)
										Count += 1
										config["$row"] = true
									else
										local TheDesignSourceEndedEarly20 = assert(Kenize[Count], "The design source ended early")
										assert(TheDesignSourceEndedEarly20.text == "...", `Expected ... but found {TheDesignSourceEndedEarly20.text}`)
										Count += 1
									end
									local TheDesignSourceEndedEarly21 = assert(Kenize[Count], "The design source ended early")
									assert(TheDesignSourceEndedEarly21.text == ")", `Expected ) but found {TheDesignSourceEndedEarly21.text}`)
									Count += 1
									local TheDesignSourceEndedEarly22 = assert(Kenize[Count], "The design source ended early")
									assert(TheDesignSourceEndedEarly22.text == "end", `Expected end but found {TheDesignSourceEndedEarly22.text}`)
									Count += 1
									local TheDesignSourceEndedEarly23 = assert(Kenize[Count], "The design source ended early")
									assert(TheDesignSourceEndedEarly23.text == "end", `Expected end but found {TheDesignSourceEndedEarly23.text}`)
									Count += 1
									
									return config, Count
								end
							end
							local v15 = v9
							local v16 = Kenize[Count + 0]
							
							if (if v16 then v16.text else "") ~= ")" then
								local TheDesignSourceEndedEarly24 = assert(Kenize[Count], "The design source ended early")
								assert(true, `Expected  but found {TheDesignSourceEndedEarly24.text}`)
								Count += 1
								assert(TheDesignSourceEndedEarly24.kind == "name", `Expected a name but found {TheDesignSourceEndedEarly24.text}`)
								local Text = TheDesignSourceEndedEarly24.text
								assert(Text ~= "use", "Layout functions use a typed readable input: compute the value in the caller and bind props.<input>")
								assert(Text ~= "props" and (Text ~= "state" and (Text ~= "refs" and Text ~= p10.parameter)), "Row parameters must not shadow Design inputs, state, references or controls")
								v9 = Text
								annotation(")")
							end
							local TheDesignSourceEndedEarly25 = assert(Kenize[Count], "The design source ended early")
							assert(TheDesignSourceEndedEarly25.text == ")", `Expected ) but found {TheDesignSourceEndedEarly25.text}`)
							Count += 1
							annotation("return")
							local TheDesignSourceEndedEarly26 = assert(Kenize[Count], "The design source ended early")
							assert(TheDesignSourceEndedEarly26.text == "return", `Expected return but found {TheDesignSourceEndedEarly26.text}`)
							Count += 1
							local v17 = Callback()
							local TheDesignSourceEndedEarly27 = assert(Kenize[Count], "The design source ended early")
							assert(TheDesignSourceEndedEarly27.text == "end", `Expected end but found {TheDesignSourceEndedEarly27.text}`)
							Count += 1
							v9 = v15
							table.insert(List, v17)
							
							return { ["$template"] = v17.id }, Count
						else
							local TheDesignSourceEndedEarly = assert(Kenize[Count], "The design source ended early")
							assert(true, `Expected  but found {TheDesignSourceEndedEarly.text}`)
							Count += 1
							assert(TheDesignSourceEndedEarly.kind == "name", `Expected a name but found {TheDesignSourceEndedEarly.text}`)
							local Text = TheDesignSourceEndedEarly.text
							local v18 = Kenize[Count + 0]
							
							if (if v18 then v18.text else "") ~= "." then
							end
							local TheDesignSourceEndedEarly28 = assert(Kenize[Count], "The design source ended early")
							assert(TheDesignSourceEndedEarly28.text == ".", `Expected . but found {TheDesignSourceEndedEarly28.text}`)
							Count += 1
							local v19 = "."
							local TheDesignSourceEndedEarly29 = assert(Kenize[Count], "The design source ended early")
							assert(true, `Expected  but found {TheDesignSourceEndedEarly29.text}`)
							Count += 1
							assert(TheDesignSourceEndedEarly29.kind == "name", `Expected a name but found {TheDesignSourceEndedEarly29.text}`)
							Text ..= v19 .. TheDesignSourceEndedEarly29.text
						end
					end)
					Count = Literal2
					
					return { literal = Literal }, nil
				end
			end
		end
	end
	
	local Ids = {}
	local Child = nil
	
	Callback = function()
		-- upvalues: Kenize (copy), Count (ref), Count1 (ref), Child (ref), Callback (ref), Ids (copy), dotted (copy), p10 (copy), value (copy), t (copy), v9 (ref), List (ref), rowAlias (copy), annotation (copy), rowBody (copy), t1 (copy)
		local KenizeEntry = Kenize[Count + 0]
		
		if (if KenizeEntry then KenizeEntry.text else "") ~= "props" then
			local KenizeEntry1 = Kenize[Count + 0]
			
			if (if KenizeEntry1 then KenizeEntry1.text else "") ~= "if" then
				local KenizeEntry2 = Kenize[Count + 0]
				
				if (if KenizeEntry2 then KenizeEntry2.text else "") == "rootContent" then
					local TheDesignSourceEndedEarly = assert(Kenize[Count], "The design source ended early")
					assert(TheDesignSourceEndedEarly.text == "rootContent", `Expected rootContent but found {TheDesignSourceEndedEarly.text}`)
					Count += 1
					local TheDesignSourceEndedEarly1 = assert(Kenize[Count], "The design source ended early")
					assert(TheDesignSourceEndedEarly1.text == "(", `Expected ( but found {TheDesignSourceEndedEarly1.text}`)
					Count += 1
					local TheDesignSourceEndedEarly2 = assert(Kenize[Count], "The design source ended early")
					assert(TheDesignSourceEndedEarly2.text == ")", `Expected ) but found {TheDesignSourceEndedEarly2.text}`)
					Count += 1
					
					return (assert(Child, "Root content needs its shared function"))
				end
				local KenizeEntry11 = Kenize[Count + 0]
				
				if (if KenizeEntry11 then KenizeEntry11.text else "") == "capture" then
					local TheDesignSourceEndedEarly = assert(Kenize[Count], "The design source ended early")
					assert(TheDesignSourceEndedEarly.text == "capture", `Expected capture but found {TheDesignSourceEndedEarly.text}`)
					Count += 1
					local TheDesignSourceEndedEarly3 = assert(Kenize[Count], "The design source ended early")
					assert(TheDesignSourceEndedEarly3.text == "(", `Expected ( but found {TheDesignSourceEndedEarly3.text}`)
					Count += 1
					local TheDesignSourceEndedEarly4 = assert(Kenize[Count], "The design source ended early")
					assert(true, `Expected  but found {TheDesignSourceEndedEarly4.text}`)
					Count += 1
					assert(TheDesignSourceEndedEarly4.kind == "string", "A captured node names its id")
					local TheDesignSourceEndedEarly1 = assert(Kenize[Count], "The design source ended early")
					assert(TheDesignSourceEndedEarly1.text == ",", `Expected , but found {TheDesignSourceEndedEarly1.text}`)
					Count += 1
					local CallbackResult = Callback()
					local TheDesignSourceEndedEarly2 = assert(Kenize[Count], "The design source ended early")
					assert(TheDesignSourceEndedEarly2.text == ")", `Expected ) but found {TheDesignSourceEndedEarly2.text}`)
					Count += 1
					Ids[string.gsub(string.sub(TheDesignSourceEndedEarly4.text, 2, -2), "\\(.)", function(Match)
						return if Match == "n" then "\n" elseif Match == "t" then "\t" else Match
					end)] = CallbackResult.id
					
					return CallbackResult
				end
				local DottedResult1 = dotted()
				local Tags = p10.tags
				
				if Tags ~= nil and DottedResult1 == Tags.call then
					local KenizeEntry3 = Kenize[Count + 0]
					
					if (if KenizeEntry3 then KenizeEntry3.text else "") == "(" then
						local TheDesignSourceEndedEarly = assert(Kenize[Count], "The design source ended early")
						assert(TheDesignSourceEndedEarly.text == "(", `Expected ( but found {TheDesignSourceEndedEarly.text}`)
						Count += 1
						local CallbackResult1 = Callback()
						local TheDesignSourceEndedEarly5 = assert(Kenize[Count], "The design source ended early")
						assert(TheDesignSourceEndedEarly5.text == ",", `Expected , but found {TheDesignSourceEndedEarly5.text}`)
						Count += 1
						local TagsNeedAValue = assert(value(), "Tags need a value")
						local TheDesignSourceEndedEarly6 = assert(Kenize[Count], "The design source ended early")
						assert(TheDesignSourceEndedEarly6.text == ")", `Expected ) but found {TheDesignSourceEndedEarly6.text}`)
						Count += 1
						
						if TagsNeedAValue.input or TagsNeedAValue.item then
							CallbackResult1.tagBinding = TagsNeedAValue
							
							return CallbackResult1
						end
						local Literal = TagsNeedAValue.literal
						local Tags1 = {}
						
						if type(Literal) == "table" then
							for _, value1 in Literal do
								if type(value1) == "string" then
									table.insert(Tags1, value1)
								end
							end
						end
						CallbackResult1.tags = Tags1
						
						return CallbackResult1
					end
				end
				local Kind = assert(t[DottedResult1], `{DottedResult1} is not a {p10.name} kind`)
				local Kind1 = p10.kinds[Kind]
				local IsTemplate = Kind1.children == "template"
				
				if Kind1.design then
					local TheDesignSourceEndedEarly = assert(Kenize[Count], "The design source ended early")
					assert(TheDesignSourceEndedEarly.text == "(", `Expected ( but found {TheDesignSourceEndedEarly.text}`)
					Count += 1
					local Parameter = p10.parameter
					local TheDesignSourceEndedEarly7 = assert(Kenize[Count], "The design source ended early")
					assert(Parameter == nil or TheDesignSourceEndedEarly7.text == Parameter, `Expected {Parameter or ""} but found {TheDesignSourceEndedEarly7.text}`)
					Count += 1
					local TheDesignSourceEndedEarly8 = assert(Kenize[Count], "The design source ended early")
					assert(TheDesignSourceEndedEarly8.text == ",", `Expected , but found {TheDesignSourceEndedEarly8.text}`)
					Count += 1
					local TheDesignSourceEndedEarly9 = assert(Kenize[Count], "The design source ended early")
					assert(TheDesignSourceEndedEarly9.text == "{", `Expected \{ but found {TheDesignSourceEndedEarly9.text}`)
					Count += 1
					local NameInput = Kind1.design.nameInput
					local TheDesignSourceEndedEarly10 = assert(Kenize[Count], "The design source ended early")
					assert(NameInput == nil or TheDesignSourceEndedEarly10.text == NameInput, `Expected {NameInput or ""} but found {TheDesignSourceEndedEarly10.text}`)
					Count += 1
					local TheDesignSourceEndedEarly11 = assert(Kenize[Count], "The design source ended early")
					assert(TheDesignSourceEndedEarly11.text == "=", `Expected = but found {TheDesignSourceEndedEarly11.text}`)
					Count += 1
				end
				local TheDesignSourceEndedEarly = assert(Kenize[Count], "The design source ended early")
				assert(true, `Expected  but found {TheDesignSourceEndedEarly.text}`)
				Count += 1
				local NameField = nil
				local NameInput = nil
				local Replaced = nil
				repeat
					if TheDesignSourceEndedEarly.text == "(" then
						local KenizeEntry4 = Kenize[Count + 0]
						
						if (if KenizeEntry4 then KenizeEntry4.text else "") == "props" then
							if TheDesignSourceEndedEarly.text == "(" then
								local TheDesignSourceEndedEarly5 = assert(Kenize[Count], "The design source ended early")
								assert(TheDesignSourceEndedEarly5.text == "props", `Expected props but found {TheDesignSourceEndedEarly5.text}`)
								Count += 1
							end
							local TheDesignSourceEndedEarly6 = assert(Kenize[Count], "The design source ended early")
							assert(TheDesignSourceEndedEarly6.text == ".", `Expected . but found {TheDesignSourceEndedEarly6.text}`)
							Count += 1
							local TheDesignSourceEndedEarly7 = assert(Kenize[Count], "The design source ended early")
							assert(true, `Expected  but found {TheDesignSourceEndedEarly7.text}`)
							Count += 1
							assert(TheDesignSourceEndedEarly7.kind == "name", `Expected a name but found {TheDesignSourceEndedEarly7.text}`)
							NameInput = TheDesignSourceEndedEarly7.text
							Replaced = Kind
							local KenizeEntry5 = Kenize[Count + 0]
							
							if (if KenizeEntry5 then KenizeEntry5.text else "") == "or" then
								local TheDesignSourceEndedEarly8 = assert(Kenize[Count], "The design source ended early")
								assert(TheDesignSourceEndedEarly8.text == "or", `Expected or but found {TheDesignSourceEndedEarly8.text}`)
								Count += 1
								local TheDesignSourceEndedEarly9 = assert(Kenize[Count], "The design source ended early")
								assert(true, `Expected  but found {TheDesignSourceEndedEarly9.text}`)
								Count += 1
								assert(TheDesignSourceEndedEarly9.kind == "string", "A named node falls back to text")
								Replaced = string.gsub(string.sub(TheDesignSourceEndedEarly9.text, 2, -2), "\\(.)", function(Match)
									return if Match == "n" then "\n" elseif Match == "t" then "\t" else Match
								end)
							end
							if TheDesignSourceEndedEarly.text ~= "(" then break end
							local TheDesignSourceEndedEarly11 = assert(Kenize[Count], "The design source ended early")
							assert(TheDesignSourceEndedEarly11.text == ")", `Expected ) but found {TheDesignSourceEndedEarly11.text}`)
							Count += 1
							break
						end
					end
					if not Kind1.design or TheDesignSourceEndedEarly.text ~= "props" then
						if TheDesignSourceEndedEarly.text == "(" or Kind1.design and TheDesignSourceEndedEarly.text == "tostring" then
							if TheDesignSourceEndedEarly.text == "(" then
								local TheDesignSourceEndedEarly13 = assert(Kenize[Count], "The design source ended early")
								assert(TheDesignSourceEndedEarly13.text == "tostring", `Expected tostring but found {TheDesignSourceEndedEarly13.text}`)
								Count += 1
							end
							local TheDesignSourceEndedEarly14 = assert(Kenize[Count], "The design source ended early")
							assert(TheDesignSourceEndedEarly14.text == "(", `Expected ( but found {TheDesignSourceEndedEarly14.text}`)
							Count += 1
							local v10 = v9
							local TheDesignSourceEndedEarly15 = assert(Kenize[Count], "The design source ended early")
							assert(v10 == nil or TheDesignSourceEndedEarly15.text == v10, `Expected {v10 or ""} but found {TheDesignSourceEndedEarly15.text}`)
							Count += 1
							local TheDesignSourceEndedEarly16 = assert(Kenize[Count], "The design source ended early")
							assert(TheDesignSourceEndedEarly16.text == ":", `Expected : but found {TheDesignSourceEndedEarly16.text}`)
							Count += 1
							local TheDesignSourceEndedEarly17 = assert(Kenize[Count], "The design source ended early")
							assert(TheDesignSourceEndedEarly17.text == "peek", `Expected peek but found {TheDesignSourceEndedEarly17.text}`)
							Count += 1
							local TheDesignSourceEndedEarly18 = assert(Kenize[Count], "The design source ended early")
							assert(TheDesignSourceEndedEarly18.text == "(", `Expected ( but found {TheDesignSourceEndedEarly18.text}`)
							Count += 1
							local TheDesignSourceEndedEarly19 = assert(Kenize[Count], "The design source ended early")
							assert(TheDesignSourceEndedEarly19.text == ")", `Expected ) but found {TheDesignSourceEndedEarly19.text}`)
							Count += 1
							local TheDesignSourceEndedEarly20 = assert(Kenize[Count], "The design source ended early")
							assert(TheDesignSourceEndedEarly20.text == ".", `Expected . but found {TheDesignSourceEndedEarly20.text}`)
							Count += 1
							local TheDesignSourceEndedEarly21 = assert(Kenize[Count], "The design source ended early")
							assert(true, `Expected  but found {TheDesignSourceEndedEarly21.text}`)
							Count += 1
							assert(TheDesignSourceEndedEarly21.kind == "name", `Expected a name but found {TheDesignSourceEndedEarly21.text}`)
							NameField = TheDesignSourceEndedEarly21.text
							local TheDesignSourceEndedEarly22 = assert(Kenize[Count], "The design source ended early")
							assert(TheDesignSourceEndedEarly22.text == ")", `Expected ) but found {TheDesignSourceEndedEarly22.text}`)
							Count += 1
							
							if TheDesignSourceEndedEarly.text == "(" then
								local TheDesignSourceEndedEarly23 = assert(Kenize[Count], "The design source ended early")
								assert(TheDesignSourceEndedEarly23.text == ")", `Expected ) but found {TheDesignSourceEndedEarly23.text}`)
								Count += 1
							end
							Replaced = Kind
							break
						end
						assert(TheDesignSourceEndedEarly.kind == "string", "Every node needs a name")
						Replaced = string.gsub(string.sub(TheDesignSourceEndedEarly.text, 2, -2), "\\(.)", function(Match)
							return if Match == "n" then "\n" elseif Match == "t" then "\t" else Match
						end)
					end
				until true
				local config = {
					id = `n{Count1}`,
					kind = Kind,
					name = Replaced,
					nameField = NameField,
					nameInput = NameInput,
					props = {},
					children = {}
				}
				Count1 += 1
				local List1 = List
				List = {}
				local v11: string = if Kind1.design then "," else "{"
				local TheDesignSourceEndedEarly12 = assert(Kenize[Count], "The design source ended early")
				assert(v11 == nil or TheDesignSourceEndedEarly12.text == v11, `Expected {v11 or ""} but found {TheDesignSourceEndedEarly12.text}`)
				Count += 1
				local From = nil
				local Literal = nil
				local Id = nil
				local ValueResult = nil
				local CallbackResult = nil
				local Text = nil
				while true do
					local KenizeEntry6 = Kenize[Count + 0]
					if (if KenizeEntry6 then KenizeEntry6.text else "") == "}" then break end
					repeat
						if Kenize[Count] and Kenize[Count].kind == "name" then
							local KenizeEntry7 = Kenize[Count + 1]
							
							if (if KenizeEntry7 then KenizeEntry7.text else "") == "=" then
								KenizeEntry7 = assert(Kenize[Count], "The design source ended early")
								assert(true, `Expected  but found {KenizeEntry7.text}`)
								Count += 1
								assert(KenizeEntry7.kind == "name", `Expected a name but found {KenizeEntry7.text}`)
								Text = KenizeEntry7.text
								KenizeEntry7 = assert(Kenize[Count], "The design source ended early")
								assert(KenizeEntry7.text == "=", `Expected = but found {KenizeEntry7.text}`)
								Count += 1
								KenizeEntry7 = Kind1.fields[Text]
								local Count3 = Count
								local DottedResult2 = if Kenize[Count] and Kenize[Count].kind == "name" then dotted() else ""
								Count = Count3
								Count3 = KenizeEntry7 and (KenizeEntry7.type == "value" and (not KenizeEntry7.perRow and (t[DottedResult2] ~= nil or (DottedResult2 == "capture" or p10.tags and DottedResult2 == p10.tags.call))))
								ValueResult = nil
								
								if Count3 then
									CallbackResult = Callback()
								else
									ValueResult, CallbackResult = value()
								end
								if CallbackResult and KenizeEntry7 and (Count3 or KenizeEntry7.type == "content") and Text ~= Kind1.slot then
									config.props[Text] = { literal = { ["$template"] = CallbackResult.id } }
									table.insert(List, CallbackResult)
									break
								elseif CallbackResult then
									assert(Text == (if Kind1.children == "slot" then Kind1.slot else Kind1.template), `{Text} cannot hold a template`)
									
									if IsTemplate then
										Id = CallbackResult.id
									end
									table.insert(config.children, CallbackResult)
									break
								elseif ValueResult and IsTemplate and Text == Kind1.source then
									From = assert(ValueResult.input or ValueResult.item, `{Text} must read a list input or item field`)
									break
								elseif ValueResult and IsTemplate and Text == Kind1.key then
									local Literal1 = ValueResult.literal
									assert(type(Literal1) == "string", "Item keys are text")
									Literal = Literal1
									break
								else
									if not ValueResult then break end
									config.props[Text] = ValueResult
									break
								end
							end
						end
						local Count2: number = Count
						local DottedResult = if Kenize[Count] and Kenize[Count].kind == "name" then dotted() else ""
						
						if p10.show ~= nil and DottedResult == p10.show then
							local TheDesignSourceEndedEarly10 = assert(Kenize[Count], "The design source ended early")
							assert(TheDesignSourceEndedEarly10.text == "(", `Expected ( but found {TheDesignSourceEndedEarly10.text}`)
							Count += 1
							local TheDesignSourceEndedEarly3 = Kenize[Count + 0]
							
							if (if TheDesignSourceEndedEarly3 then TheDesignSourceEndedEarly3.text else "") == "function" then
								local TheDesignSourceEndedEarly25 = assert(Kenize[Count], "The design source ended early")
								assert(TheDesignSourceEndedEarly25.text == "function", `Expected function but found {TheDesignSourceEndedEarly25.text}`)
								Count += 1
								TheDesignSourceEndedEarly25 = assert(Kenize[Count], "The design source ended early")
								assert(TheDesignSourceEndedEarly25.text == "(", `Expected ( but found {TheDesignSourceEndedEarly25.text}`)
								Count += 1
								local KenizeEntry8 = Kenize[Count + 0]
								TheDesignSourceEndedEarly3 = if KenizeEntry8 then KenizeEntry8.text else ""
								TheDesignSourceEndedEarly25 = TheDesignSourceEndedEarly3 == "use"
								
								if TheDesignSourceEndedEarly25 then
									TheDesignSourceEndedEarly3 = assert(Kenize[Count], "The design source ended early")
									assert(TheDesignSourceEndedEarly3.text == "use", `Expected use but found {TheDesignSourceEndedEarly3.text}`)
									Count += 1
								end
								TheDesignSourceEndedEarly3 = assert(Kenize[Count], "The design source ended early")
								assert(TheDesignSourceEndedEarly3.text == ")", `Expected ) but found {TheDesignSourceEndedEarly3.text}`)
								Count += 1
								
								if TheDesignSourceEndedEarly25 then
									rowAlias()
								end
								TheDesignSourceEndedEarly3 = assert(Kenize[Count], "The design source ended early")
								assert(TheDesignSourceEndedEarly3.text == "return", `Expected return but found {TheDesignSourceEndedEarly3.text}`)
								Count += 1
								
								if TheDesignSourceEndedEarly25 then
									TheDesignSourceEndedEarly3 = assert(Kenize[Count], "The design source ended early")
									assert(TheDesignSourceEndedEarly3.text == "use", `Expected use but found {TheDesignSourceEndedEarly3.text}`)
									Count += 1
									TheDesignSourceEndedEarly3 = assert(Kenize[Count], "The design source ended early")
									assert(TheDesignSourceEndedEarly3.text == "(", `Expected ( but found {TheDesignSourceEndedEarly3.text}`)
									Count += 1
									TheDesignSourceEndedEarly3 = v9
									KenizeEntry8 = assert(Kenize[Count], "The design source ended early")
									assert(TheDesignSourceEndedEarly3 == nil or KenizeEntry8.text == TheDesignSourceEndedEarly3, `Expected {TheDesignSourceEndedEarly3 or ""} but found {KenizeEntry8.text}`)
									Count += 1
									TheDesignSourceEndedEarly3 = assert(Kenize[Count], "The design source ended early")
									assert(TheDesignSourceEndedEarly3.text == ")", `Expected ) but found {TheDesignSourceEndedEarly3.text}`)
									Count += 1
								else
									TheDesignSourceEndedEarly3 = assert(Kenize[Count], "The design source ended early")
									assert(TheDesignSourceEndedEarly3.text == "props", `Expected props but found {TheDesignSourceEndedEarly3.text}`)
									Count += 1
								end
								TheDesignSourceEndedEarly25 = assert(Kenize[Count], "The design source ended early")
								KenizeEntry8 = TheDesignSourceEndedEarly25.text == "."
								assert(KenizeEntry8, `Expected . but found {TheDesignSourceEndedEarly25.text}`)
								Count += 1
								TheDesignSourceEndedEarly3 = assert(Kenize[Count], "The design source ended early")
								assert(true, `Expected  but found {TheDesignSourceEndedEarly3.text}`)
								Count += 1
								assert(TheDesignSourceEndedEarly3.kind == "name", `Expected a name but found {TheDesignSourceEndedEarly3.text}`)
								TheDesignSourceEndedEarly10 = TheDesignSourceEndedEarly3.text
								TheDesignSourceEndedEarly3 = assert(Kenize[Count], "The design source ended early")
								assert(TheDesignSourceEndedEarly3.text == "=", `Expected = but found {TheDesignSourceEndedEarly3.text}`)
								Count += 1
								TheDesignSourceEndedEarly3 = assert(Kenize[Count], "The design source ended early")
								assert(TheDesignSourceEndedEarly3.text == "=", `Expected = but found {TheDesignSourceEndedEarly3.text}`)
								Count += 1
								TheDesignSourceEndedEarly3 = assert(Kenize[Count], "The design source ended early")
								assert(TheDesignSourceEndedEarly3.text == "true", `Expected true but found {TheDesignSourceEndedEarly3.text}`)
								Count += 1
								TheDesignSourceEndedEarly3 = assert(Kenize[Count], "The design source ended early")
								assert(TheDesignSourceEndedEarly3.text == "end", `Expected end but found {TheDesignSourceEndedEarly3.text}`)
								Count += 1
							else
								TheDesignSourceEndedEarly3 = assert(Kenize[Count], "The design source ended early")
								assert(true, `Expected  but found {TheDesignSourceEndedEarly3.text}`)
								Count += 1
								assert(TheDesignSourceEndedEarly3.kind == "name", `Expected a name but found {TheDesignSourceEndedEarly3.text}`)
								local Text1 = TheDesignSourceEndedEarly3.text
								local IsProps: boolean = Text1 == "props" or Text1 == "state"
								assert(IsProps, "A shown node reads an input or state")
								Text1 = assert(Kenize[Count], "The design source ended early")
								IsProps = Text1.text == "."
								assert(IsProps, `Expected . but found {Text1.text}`)
								Count += 1
								TheDesignSourceEndedEarly3 = assert(Kenize[Count], "The design source ended early")
								assert(true, `Expected  but found {TheDesignSourceEndedEarly3.text}`)
								Count += 1
								assert(TheDesignSourceEndedEarly3.kind == "name", `Expected a name but found {TheDesignSourceEndedEarly3.text}`)
								TheDesignSourceEndedEarly10 = TheDesignSourceEndedEarly3.text
							end
							local TheDesignSourceEndedEarly24 = assert(Kenize[Count], "The design source ended early")
							assert(TheDesignSourceEndedEarly24.text == ",", `Expected , but found {TheDesignSourceEndedEarly24.text}`)
							Count += 1
							TheDesignSourceEndedEarly24 = assert(Kenize[Count], "The design source ended early")
							assert(TheDesignSourceEndedEarly24.text == "function", `Expected function but found {TheDesignSourceEndedEarly24.text}`)
							Count += 1
							TheDesignSourceEndedEarly24 = assert(Kenize[Count], "The design source ended early")
							assert(TheDesignSourceEndedEarly24.text == "(", `Expected ( but found {TheDesignSourceEndedEarly24.text}`)
							Count += 1
							TheDesignSourceEndedEarly24 = assert(Kenize[Count], "The design source ended early")
							assert(TheDesignSourceEndedEarly24.text == ")", `Expected ) but found {TheDesignSourceEndedEarly24.text}`)
							Count += 1
							TheDesignSourceEndedEarly24 = assert(Kenize[Count], "The design source ended early")
							assert(TheDesignSourceEndedEarly24.text == "return", `Expected return but found {TheDesignSourceEndedEarly24.text}`)
							Count += 1
							TheDesignSourceEndedEarly24 = Callback()
							TheDesignSourceEndedEarly3 = assert(Kenize[Count], "The design source ended early")
							assert(TheDesignSourceEndedEarly3.text == "end", `Expected end but found {TheDesignSourceEndedEarly3.text}`)
							Count += 1
							TheDesignSourceEndedEarly3 = assert(Kenize[Count], "The design source ended early")
							assert(TheDesignSourceEndedEarly3.text == ")", `Expected ) but found {TheDesignSourceEndedEarly3.text}`)
							Count += 1
							TheDesignSourceEndedEarly24.when = TheDesignSourceEndedEarly10
							table.insert(config.children, TheDesignSourceEndedEarly24)
							break
						end
						if p10.keyed ~= nil and DottedResult == p10.keyed then
							local TheDesignSourceEndedEarly26 = assert(Kenize[Count], "The design source ended early")
							assert(TheDesignSourceEndedEarly26.text == "{", `Expected \{ but found {TheDesignSourceEndedEarly26.text}`)
							Count += 1
							TheDesignSourceEndedEarly26 = assert(Kenize[Count], "The design source ended early")
							assert(TheDesignSourceEndedEarly26.text == "from", `Expected from but found {TheDesignSourceEndedEarly26.text}`)
							Count += 1
							TheDesignSourceEndedEarly26 = assert(Kenize[Count], "The design source ended early")
							assert(TheDesignSourceEndedEarly26.text == "=", `Expected = but found {TheDesignSourceEndedEarly26.text}`)
							Count += 1
							TheDesignSourceEndedEarly26 = assert(value(), "A keyed list reads a list")
							local Input = TheDesignSourceEndedEarly26.input or TheDesignSourceEndedEarly26.item
							local AKeyedListReadsAListInputOrItemField = assert(Input, "A keyed list reads a list input or item field")
							TheDesignSourceEndedEarly26 = assert(Kenize[Count], "The design source ended early")
							assert(TheDesignSourceEndedEarly26.text == ",", `Expected , but found {TheDesignSourceEndedEarly26.text}`)
							Count += 1
							Input = assert(Kenize[Count], "The design source ended early")
							assert(Input.text == "key", `Expected key but found {Input.text}`)
							Count += 1
							Input = assert(Kenize[Count], "The design source ended early")
							assert(Input.text == "=", `Expected = but found {Input.text}`)
							Count += 1
							Input = assert(Kenize[Count], "The design source ended early")
							assert(Input.text == "function", `Expected function but found {Input.text}`)
							Count += 1
							Input = assert(Kenize[Count], "The design source ended early")
							assert(Input.text == "(", `Expected ( but found {Input.text}`)
							Count += 1
							Input = assert(Kenize[Count], "The design source ended early")
							assert(Input.text == "row", `Expected row but found {Input.text}`)
							Count += 1
							annotation(")")
							Input = assert(Kenize[Count], "The design source ended early")
							assert(Input.text == ")", `Expected ) but found {Input.text}`)
							Count += 1
							annotation("return")
							Input = assert(Kenize[Count], "The design source ended early")
							assert(Input.text == "return", `Expected return but found {Input.text}`)
							Count += 1
							Input = assert(Kenize[Count], "The design source ended early")
							assert(Input.text == "row", `Expected row but found {Input.text}`)
							Count += 1
							Input = assert(Kenize[Count], "The design source ended early")
							assert(Input.text == ".", `Expected . but found {Input.text}`)
							Count += 1
							local TheDesignSourceEndedEarly27 = assert(Kenize[Count], "The design source ended early")
							assert(true, `Expected  but found {TheDesignSourceEndedEarly27.text}`)
							Count += 1
							assert(TheDesignSourceEndedEarly27.kind == "name", `Expected a name but found {TheDesignSourceEndedEarly27.text}`)
							Input = TheDesignSourceEndedEarly27.text
							TheDesignSourceEndedEarly27 = assert(Kenize[Count], "The design source ended early")
							assert(TheDesignSourceEndedEarly27.text == "end", `Expected end but found {TheDesignSourceEndedEarly27.text}`)
							Count += 1
							TheDesignSourceEndedEarly27 = assert(Kenize[Count], "The design source ended early")
							assert(TheDesignSourceEndedEarly27.text == ",", `Expected , but found {TheDesignSourceEndedEarly27.text}`)
							Count += 1
							TheDesignSourceEndedEarly27 = assert(Kenize[Count], "The design source ended early")
							assert(TheDesignSourceEndedEarly27.text == "render", `Expected render but found {TheDesignSourceEndedEarly27.text}`)
							Count += 1
							TheDesignSourceEndedEarly27 = assert(Kenize[Count], "The design source ended early")
							assert(TheDesignSourceEndedEarly27.text == "=", `Expected = but found {TheDesignSourceEndedEarly27.text}`)
							Count += 1
							local KenizeEntry9 = Kenize[Count + 0]
							
							if (if KenizeEntry9 then KenizeEntry9.text else "") == "function" then
								local TheDesignSourceEndedEarly28 = assert(Kenize[Count], "The design source ended early")
								assert(TheDesignSourceEndedEarly28.text == "function", `Expected function but found {TheDesignSourceEndedEarly28.text}`)
								Count += 1
								TheDesignSourceEndedEarly28 = assert(Kenize[Count], "The design source ended early")
								assert(TheDesignSourceEndedEarly28.text == "(", `Expected ( but found {TheDesignSourceEndedEarly28.text}`)
								Count += 1
								KenizeEntry9 = assert(Kenize[Count], "The design source ended early")
								assert(true, `Expected  but found {KenizeEntry9.text}`)
								Count += 1
								assert(KenizeEntry9.kind == "name", `Expected a name but found {KenizeEntry9.text}`)
								TheDesignSourceEndedEarly28 = KenizeEntry9.text
								assert(TheDesignSourceEndedEarly28 ~= "use", "Layout functions use a typed readable input: compute the value in the caller and bind props.<input>")
								local IsNotTheDesignSourceEndedEarlyMatch: boolean = TheDesignSourceEndedEarly28 ~= "props" and (TheDesignSourceEndedEarly28 ~= "state" and (TheDesignSourceEndedEarly28 ~= "refs" and TheDesignSourceEndedEarly28 ~= p10.parameter))
								assert(IsNotTheDesignSourceEndedEarlyMatch, "Row parameters must not shadow Design inputs, state, references or controls")
								annotation(")")
								KenizeEntry9 = assert(Kenize[Count], "The design source ended early")
								assert(KenizeEntry9.text == ")", `Expected ) but found {KenizeEntry9.text}`)
								Count += 1
								annotation("return")
								TheDesignSourceEndedEarly27 = rowBody(TheDesignSourceEndedEarly28)
								TheDesignSourceEndedEarly28 = assert(Kenize[Count], "The design source ended early")
								IsNotTheDesignSourceEndedEarlyMatch = TheDesignSourceEndedEarly28.text == "end"
								assert(IsNotTheDesignSourceEndedEarlyMatch, `Expected end but found {TheDesignSourceEndedEarly28.text}`)
								Count += 1
							else
								KenizeEntry9 = assert(Kenize[Count], "The design source ended early")
								assert(true, `Expected  but found {KenizeEntry9.text}`)
								Count += 1
								assert(KenizeEntry9.kind == "name", `Expected a name but found {KenizeEntry9.text}`)
								local Text2 = KenizeEntry9.text
								TheDesignSourceEndedEarly27 = assert(t1[Text2], `{Text2} is not a row function`)
							end
							KenizeEntry9 = Kenize[Count + 0]
							
							if (if KenizeEntry9 then KenizeEntry9.text else "") == "," then
								local TheDesignSourceEndedEarly29 = assert(Kenize[Count], "The design source ended early")
								assert(TheDesignSourceEndedEarly29.text == ",", `Expected , but found {TheDesignSourceEndedEarly29.text}`)
								Count += 1
							end
							local TheDesignSourceEndedEarly30 = assert(Kenize[Count], "The design source ended early")
							assert(TheDesignSourceEndedEarly30.text == "}", `Expected } but found {TheDesignSourceEndedEarly30.text}`)
							Count += 1
							From = AKeyedListReadsAListInputOrItemField
							Literal = Input
							Id = TheDesignSourceEndedEarly27.id
							table.insert(config.children, TheDesignSourceEndedEarly27)
							break
						end
						Count = Count2
						table.insert(config.children, Callback())
					until true
					local KenizeEntry21 = Kenize[Count + 0]
					
					if (if KenizeEntry21 then KenizeEntry21.text else "") ~= "," then continue end
					local TheDesignSourceEndedEarly31 = assert(Kenize[Count], "The design source ended early")
					assert(TheDesignSourceEndedEarly31.text == ",", `Expected , but found {TheDesignSourceEndedEarly31.text}`)
					Count += 1
				end
				local TheDesignSourceEndedEarly4 = assert(Kenize[Count], "The design source ended early")
				assert(TheDesignSourceEndedEarly4.text == "}", `Expected } but found {TheDesignSourceEndedEarly4.text}`)
				Count += 1
				
				if Kind1.design then
					local TheDesignSourceEndedEarly31 = assert(Kenize[Count], "The design source ended early")
					assert(TheDesignSourceEndedEarly31.text == ")", `Expected ) but found {TheDesignSourceEndedEarly31.text}`)
					Count += 1
				end
				local CountChildren = #config.children
				
				for _, value2 in List do
					table.insert(config.children, value2)
				end
				List = List1
				
				if From then
					local Key = Kind1.key
					local Field = if Key then Kind1.fields[Key] else nil
					local Default = if Field then Field.default else nil
					config.bind = {
						from = From,
						key = Literal or (if type(Default) == "string" then Default else "id"),
						row = if Id == nil or CountChildren <= 1 then nil else Id
					}
				end
				return config
			end
		end
		local KenizeEntry10 = Kenize[Count + 0]
		local IsIf = (if KenizeEntry10 then KenizeEntry10.text else "") == "if"
		local Name = nil
		
		if IsIf then
			local TheDesignSourceEndedEarly = assert(Kenize[Count], "The design source ended early")
			assert(TheDesignSourceEndedEarly.text == "if", `Expected if but found {TheDesignSourceEndedEarly.text}`)
			Count += 1
			local TheDesignSourceEndedEarly32 = assert(Kenize[Count], "The design source ended early")
			assert(TheDesignSourceEndedEarly32.text == "props", `Expected props but found {TheDesignSourceEndedEarly32.text}`)
			Count += 1
			local TheDesignSourceEndedEarly33 = assert(Kenize[Count], "The design source ended early")
			assert(TheDesignSourceEndedEarly33.text == ".", `Expected . but found {TheDesignSourceEndedEarly33.text}`)
			Count += 1
			local TheDesignSourceEndedEarly34 = assert(Kenize[Count], "The design source ended early")
			assert(true, `Expected  but found {TheDesignSourceEndedEarly34.text}`)
			Count += 1
			assert(TheDesignSourceEndedEarly34.kind == "name", `Expected a name but found {TheDesignSourceEndedEarly34.text}`)
			Name = TheDesignSourceEndedEarly34.text
			local TheDesignSourceEndedEarly35 = assert(Kenize[Count], "The design source ended early")
			assert(TheDesignSourceEndedEarly35.text == "then", `Expected then but found {TheDesignSourceEndedEarly35.text}`)
			Count += 1
		end
		local TheDesignSourceEndedEarly = assert(Kenize[Count], "The design source ended early")
		assert(TheDesignSourceEndedEarly.text == "props", `Expected props but found {TheDesignSourceEndedEarly.text}`)
		Count += 1
		local TheDesignSourceEndedEarly36 = assert(Kenize[Count], "The design source ended early")
		assert(TheDesignSourceEndedEarly36.text == ".", `Expected . but found {TheDesignSourceEndedEarly36.text}`)
		Count += 1
		local TheDesignSourceEndedEarly37 = assert(Kenize[Count], "The design source ended early")
		assert(true, `Expected  but found {TheDesignSourceEndedEarly37.text}`)
		Count += 1
		assert(TheDesignSourceEndedEarly37.kind == "name", `Expected a name but found {TheDesignSourceEndedEarly37.text}`)
		local Text = TheDesignSourceEndedEarly37.text
		local TheDesignSourceEndedEarly38 = assert(Kenize[Count], "The design source ended early")
		assert(TheDesignSourceEndedEarly38.text == "(", `Expected ( but found {TheDesignSourceEndedEarly38.text}`)
		Count += 1
		local TheDesignSourceEndedEarly39 = assert(Kenize[Count], "The design source ended early")
		assert(TheDesignSourceEndedEarly39.text == ")", `Expected ) but found {TheDesignSourceEndedEarly39.text}`)
		Count += 1
		
		if IsIf then
			assert(Name == Text, "Optional slot children test their own factory")
			local TheDesignSourceEndedEarly40 = assert(Kenize[Count], "The design source ended early")
			assert(TheDesignSourceEndedEarly40.text == "else", `Expected else but found {TheDesignSourceEndedEarly40.text}`)
			Count += 1
			local TheDesignSourceEndedEarly41 = assert(Kenize[Count], "The design source ended early")
			assert(TheDesignSourceEndedEarly41.text == "nil", `Expected nil but found {TheDesignSourceEndedEarly41.text}`)
			Count += 1
		end
		local config = {
			kind = "$slot",
			id = `n{Count1}`,
			name = Text,
			slot = Text,
			props = {},
			children = {}
		}
		Count1 += 1
		
		return config
	end
	while true do
		local KenizeEntry1 = Kenize[Count + 0]
		if (if KenizeEntry1 then KenizeEntry1.text else "") == "local" then
			KenizeEntry1 = Kenize[Count + 1]
			
			if (if KenizeEntry1 then KenizeEntry1.text else "") == "design" then break end
			KenizeEntry1 = Kenize[Count + 1]
			
			if (if KenizeEntry1 then KenizeEntry1.text else "") == "_design" then break end
		end
		assert(true, `Expected  but found {assert(Kenize[Count], "The design source ended early").text}`)
		Count += 1
	end
	local TheDesignSourceEndedEarly2 = assert(Kenize[Count], "The design source ended early")
	assert(TheDesignSourceEndedEarly2.text == "local", `Expected local but found {TheDesignSourceEndedEarly2.text}`)
	Count += 1
	assert(true, `Expected  but found {assert(Kenize[Count], "The design source ended early").text}`)
	Count += 1
	local TheDesignSourceEndedEarly3 = assert(Kenize[Count], "The design source ended early")
	assert(TheDesignSourceEndedEarly3.text == "=", `Expected = but found {TheDesignSourceEndedEarly3.text}`)
	Count += 1
	local Literal, Literal2 = readLiteral(Kenize, Count, function(p12)
		-- upvalues: Count (ref), Kenize (copy), t1 (copy), List (ref), v9 (ref), p10 (copy), annotation (copy), Callback (ref)
		Count = p12
		local v12 = Kenize[Count + 0]
		
		if (if v12 then v12.text else "") == "props" then
			local TheDesignSourceEndedEarly = assert(Kenize[Count], "The design source ended early")
			assert(TheDesignSourceEndedEarly.text == "props", `Expected props but found {TheDesignSourceEndedEarly.text}`)
			Count += 1
			local TheDesignSourceEndedEarly1 = assert(Kenize[Count], "The design source ended early")
			assert(TheDesignSourceEndedEarly1.text == ".", `Expected . but found {TheDesignSourceEndedEarly1.text}`)
			Count += 1
			local t = {}
			local TheDesignSourceEndedEarly2 = assert(Kenize[Count], "The design source ended early")
			assert(true, `Expected  but found {TheDesignSourceEndedEarly2.text}`)
			Count += 1
			assert(TheDesignSourceEndedEarly2.kind == "name", `Expected a name but found {TheDesignSourceEndedEarly2.text}`)
			t["$input"] = TheDesignSourceEndedEarly2.text
			
			return t, Count
		end
		local v13 = Kenize[Count + 0]
		
		if (if v13 then v13.text else "") == "function" then
			local TheDesignSourceEndedEarly = assert(Kenize[Count], "The design source ended early")
			assert(TheDesignSourceEndedEarly.text == "function", `Expected function but found {TheDesignSourceEndedEarly.text}`)
			Count += 1
			local TheDesignSourceEndedEarly3 = assert(Kenize[Count], "The design source ended early")
			assert(TheDesignSourceEndedEarly3.text == "(", `Expected ( but found {TheDesignSourceEndedEarly3.text}`)
			Count += 1
			local v14 = Kenize[Count + 0]
			assert((if v14 then v14.text else "") ~= "use", "Layout functions use a typed readable input: compute the value in the caller and bind props.<input>")
			
			if not Kenize[Count] or Kenize[Count].kind ~= "name" then
				local v15 = Kenize[Count + 0]
				
				if (if v15 then v15.text else "") ~= ")" then
					local TheDesignSourceEndedEarly4 = assert(Kenize[Count], "The design source ended early")
					assert(TheDesignSourceEndedEarly4.text == "...", `Expected ... but found {TheDesignSourceEndedEarly4.text}`)
					Count += 1
					local TheDesignSourceEndedEarly5 = assert(Kenize[Count], "The design source ended early")
					assert(TheDesignSourceEndedEarly5.text == ")", `Expected ) but found {TheDesignSourceEndedEarly5.text}`)
					Count += 1
					local TheDesignSourceEndedEarly6 = assert(Kenize[Count], "The design source ended early")
					assert(TheDesignSourceEndedEarly6.text == "if", `Expected if but found {TheDesignSourceEndedEarly6.text}`)
					Count += 1
					local TheDesignSourceEndedEarly7 = assert(Kenize[Count], "The design source ended early")
					assert(TheDesignSourceEndedEarly7.text == "props", `Expected props but found {TheDesignSourceEndedEarly7.text}`)
					Count += 1
					local TheDesignSourceEndedEarly8 = assert(Kenize[Count], "The design source ended early")
					assert(TheDesignSourceEndedEarly8.text == ".", `Expected . but found {TheDesignSourceEndedEarly8.text}`)
					Count += 1
					local TheDesignSourceEndedEarly9 = assert(Kenize[Count], "The design source ended early")
					assert(true, `Expected  but found {TheDesignSourceEndedEarly9.text}`)
					Count += 1
					assert(TheDesignSourceEndedEarly9.kind == "name", `Expected a name but found {TheDesignSourceEndedEarly9.text}`)
					local Text = TheDesignSourceEndedEarly9.text
					local TheDesignSourceEndedEarly10 = assert(Kenize[Count], "The design source ended early")
					assert(TheDesignSourceEndedEarly10.text == "then", `Expected then but found {TheDesignSourceEndedEarly10.text}`)
					Count += 1
					local TheDesignSourceEndedEarly11 = assert(Kenize[Count], "The design source ended early")
					assert(TheDesignSourceEndedEarly11.text == "props", `Expected props but found {TheDesignSourceEndedEarly11.text}`)
					Count += 1
					local TheDesignSourceEndedEarly12 = assert(Kenize[Count], "The design source ended early")
					assert(TheDesignSourceEndedEarly12.text == ".", `Expected . but found {TheDesignSourceEndedEarly12.text}`)
					Count += 1
					local TheDesignSourceEndedEarly13 = assert(Kenize[Count], "The design source ended early")
					assert(Text == nil or TheDesignSourceEndedEarly13.text == Text, `Expected {Text or ""} but found {TheDesignSourceEndedEarly13.text}`)
					Count += 1
					local TheDesignSourceEndedEarly14 = assert(Kenize[Count], "The design source ended early")
					assert(TheDesignSourceEndedEarly14.text == "(", `Expected ( but found {TheDesignSourceEndedEarly14.text}`)
					Count += 1
					local config = { ["$output"] = Text }
					local v16 = Kenize[Count + 0]
					
					if (if v16 then v16.text else "") == v9 then
						local v17 = v9
						local TheDesignSourceEndedEarly15 = assert(Kenize[Count], "The design source ended early")
						assert(v17 == nil or TheDesignSourceEndedEarly15.text == v17, `Expected {v17 or ""} but found {TheDesignSourceEndedEarly15.text}`)
						Count += 1
						local TheDesignSourceEndedEarly16 = assert(Kenize[Count], "The design source ended early")
						assert(TheDesignSourceEndedEarly16.text == ":", `Expected : but found {TheDesignSourceEndedEarly16.text}`)
						Count += 1
						local TheDesignSourceEndedEarly17 = assert(Kenize[Count], "The design source ended early")
						assert(TheDesignSourceEndedEarly17.text == "peek", `Expected peek but found {TheDesignSourceEndedEarly17.text}`)
						Count += 1
						local TheDesignSourceEndedEarly18 = assert(Kenize[Count], "The design source ended early")
						assert(TheDesignSourceEndedEarly18.text == "(", `Expected ( but found {TheDesignSourceEndedEarly18.text}`)
						Count += 1
						local TheDesignSourceEndedEarly19 = assert(Kenize[Count], "The design source ended early")
						assert(TheDesignSourceEndedEarly19.text == ")", `Expected ) but found {TheDesignSourceEndedEarly19.text}`)
						Count += 1
						config["$row"] = true
					else
						local TheDesignSourceEndedEarly20 = assert(Kenize[Count], "The design source ended early")
						assert(TheDesignSourceEndedEarly20.text == "...", `Expected ... but found {TheDesignSourceEndedEarly20.text}`)
						Count += 1
					end
					local TheDesignSourceEndedEarly21 = assert(Kenize[Count], "The design source ended early")
					assert(TheDesignSourceEndedEarly21.text == ")", `Expected ) but found {TheDesignSourceEndedEarly21.text}`)
					Count += 1
					local TheDesignSourceEndedEarly22 = assert(Kenize[Count], "The design source ended early")
					assert(TheDesignSourceEndedEarly22.text == "end", `Expected end but found {TheDesignSourceEndedEarly22.text}`)
					Count += 1
					local TheDesignSourceEndedEarly23 = assert(Kenize[Count], "The design source ended early")
					assert(TheDesignSourceEndedEarly23.text == "end", `Expected end but found {TheDesignSourceEndedEarly23.text}`)
					Count += 1
					
					return config, Count
				end
			end
			local v14 = v9
			local v15 = Kenize[Count + 0]
			
			if (if v15 then v15.text else "") ~= ")" then
				local TheDesignSourceEndedEarly24 = assert(Kenize[Count], "The design source ended early")
				assert(true, `Expected  but found {TheDesignSourceEndedEarly24.text}`)
				Count += 1
				assert(TheDesignSourceEndedEarly24.kind == "name", `Expected a name but found {TheDesignSourceEndedEarly24.text}`)
				local Text = TheDesignSourceEndedEarly24.text
				assert(Text ~= "use", "Layout functions use a typed readable input: compute the value in the caller and bind props.<input>")
				assert(Text ~= "props" and (Text ~= "state" and (Text ~= "refs" and Text ~= p10.parameter)), "Row parameters must not shadow Design inputs, state, references or controls")
				v9 = Text
				annotation(")")
			end
			local TheDesignSourceEndedEarly25 = assert(Kenize[Count], "The design source ended early")
			assert(TheDesignSourceEndedEarly25.text == ")", `Expected ) but found {TheDesignSourceEndedEarly25.text}`)
			Count += 1
			annotation("return")
			local TheDesignSourceEndedEarly26 = assert(Kenize[Count], "The design source ended early")
			assert(TheDesignSourceEndedEarly26.text == "return", `Expected return but found {TheDesignSourceEndedEarly26.text}`)
			Count += 1
			local v16 = Callback()
			local TheDesignSourceEndedEarly27 = assert(Kenize[Count], "The design source ended early")
			assert(TheDesignSourceEndedEarly27.text == "end", `Expected end but found {TheDesignSourceEndedEarly27.text}`)
			Count += 1
			v9 = v14
			table.insert(List, v16)
			
			return { ["$template"] = v16.id }, Count
		else
			local TheDesignSourceEndedEarly = assert(Kenize[Count], "The design source ended early")
			assert(true, `Expected  but found {TheDesignSourceEndedEarly.text}`)
			Count += 1
			assert(TheDesignSourceEndedEarly.kind == "name", `Expected a name but found {TheDesignSourceEndedEarly.text}`)
			local Text = TheDesignSourceEndedEarly.text
			local v17 = Kenize[Count + 0]
			
			if (if v17 then v17.text else "") ~= "." then
			end
			local TheDesignSourceEndedEarly28 = assert(Kenize[Count], "The design source ended early")
			assert(TheDesignSourceEndedEarly28.text == ".", `Expected . but found {TheDesignSourceEndedEarly28.text}`)
			Count += 1
			local v18 = "."
			local TheDesignSourceEndedEarly29 = assert(Kenize[Count], "The design source ended early")
			assert(true, `Expected  but found {TheDesignSourceEndedEarly29.text}`)
			Count += 1
			assert(TheDesignSourceEndedEarly29.kind == "name", `Expected a name but found {TheDesignSourceEndedEarly29.text}`)
			Text ..= v18 .. TheDesignSourceEndedEarly29.text
		end
	end)
	Count = Literal2
	assert(type(Literal) == "table", "The design header is a table")
	Contract = contractOf(Literal)
	while true do
		local KenizeEntry2 = Kenize[Count + 0]
		local IsLocal = (if KenizeEntry2 then KenizeEntry2.text else "") == "return"
		if not IsLocal then
			KenizeEntry2 = Kenize[Count + 0]
			IsLocal = (if KenizeEntry2 then KenizeEntry2.text else "") == "local"
		end
		if IsLocal then
			KenizeEntry2 = Kenize[Count + 1]
			
			if (if KenizeEntry2 then KenizeEntry2.text else "") == "function" then break end
		end
		assert(true, `Expected  but found {assert(Kenize[Count], "The design source ended early").text}`)
		Count += 1
	end
	assert(true, `Expected  but found {assert(Kenize[Count], "The design source ended early").text}`)
	Count += 1
	local TheDesignSourceEndedEarly5 = assert(Kenize[Count], "The design source ended early")
	assert(TheDesignSourceEndedEarly5.text == "function", `Expected function but found {TheDesignSourceEndedEarly5.text}`)
	Count += 1
	local RootVariant = nil
	local Tbl1 = nil
	while true do
		local KenizeEntry = Kenize[Count + 0]
		if (if KenizeEntry then KenizeEntry.text else "") == "return" then
			KenizeEntry = Kenize[Count + 1]
			
			if (if KenizeEntry then KenizeEntry.text else "") ~= "node" then break end
		end
		KenizeEntry = Kenize[Count + 0]
		
		if (if KenizeEntry then KenizeEntry.text else "") == "if" then
			KenizeEntry = Kenize[Count + 1]
			
			if (if KenizeEntry then KenizeEntry.text else "") == "props" then
				local TheDesignSourceEndedEarly6 = assert(Kenize[Count], "The design source ended early")
				assert(TheDesignSourceEndedEarly6.text == "if", `Expected if but found {TheDesignSourceEndedEarly6.text}`)
				Count += 1
				TheDesignSourceEndedEarly6 = assert(Kenize[Count], "The design source ended early")
				assert(TheDesignSourceEndedEarly6.text == "props", `Expected props but found {TheDesignSourceEndedEarly6.text}`)
				Count += 1
				TheDesignSourceEndedEarly6 = assert(Kenize[Count], "The design source ended early")
				assert(TheDesignSourceEndedEarly6.text == ".", `Expected . but found {TheDesignSourceEndedEarly6.text}`)
				Count += 1
				KenizeEntry = assert(Kenize[Count], "The design source ended early")
				assert(true, `Expected  but found {KenizeEntry.text}`)
				Count += 1
				assert(KenizeEntry.kind == "name", `Expected a name but found {KenizeEntry.text}`)
				TheDesignSourceEndedEarly6 = KenizeEntry.text
				KenizeEntry = assert(Kenize[Count], "The design source ended early")
				assert(KenizeEntry.text == "=", `Expected = but found {KenizeEntry.text}`)
				Count += 1
				KenizeEntry = assert(Kenize[Count], "The design source ended early")
				assert(KenizeEntry.text == "=", `Expected = but found {KenizeEntry.text}`)
				Count += 1
				local Literal1, Literal2_1 = readLiteral(Kenize, Count, function(p12)
					-- upvalues: Count (ref), Kenize (copy), t1 (copy), List (ref), v9 (ref), p10 (copy), annotation (copy), Callback (ref)
					Count = p12
					local v12 = Kenize[Count + 0]
					
					if (if v12 then v12.text else "") == "props" then
						local TheDesignSourceEndedEarly = assert(Kenize[Count], "The design source ended early")
						assert(TheDesignSourceEndedEarly.text == "props", `Expected props but found {TheDesignSourceEndedEarly.text}`)
						Count += 1
						local TheDesignSourceEndedEarly1 = assert(Kenize[Count], "The design source ended early")
						assert(TheDesignSourceEndedEarly1.text == ".", `Expected . but found {TheDesignSourceEndedEarly1.text}`)
						Count += 1
						local t = {}
						local TheDesignSourceEndedEarly2 = assert(Kenize[Count], "The design source ended early")
						assert(true, `Expected  but found {TheDesignSourceEndedEarly2.text}`)
						Count += 1
						assert(TheDesignSourceEndedEarly2.kind == "name", `Expected a name but found {TheDesignSourceEndedEarly2.text}`)
						t["$input"] = TheDesignSourceEndedEarly2.text
						
						return t, Count
					end
					local v13 = Kenize[Count + 0]
					
					if (if v13 then v13.text else "") == "function" then
						local TheDesignSourceEndedEarly = assert(Kenize[Count], "The design source ended early")
						assert(TheDesignSourceEndedEarly.text == "function", `Expected function but found {TheDesignSourceEndedEarly.text}`)
						Count += 1
						local TheDesignSourceEndedEarly3 = assert(Kenize[Count], "The design source ended early")
						assert(TheDesignSourceEndedEarly3.text == "(", `Expected ( but found {TheDesignSourceEndedEarly3.text}`)
						Count += 1
						local v14 = Kenize[Count + 0]
						assert((if v14 then v14.text else "") ~= "use", "Layout functions use a typed readable input: compute the value in the caller and bind props.<input>")
						
						if not Kenize[Count] or Kenize[Count].kind ~= "name" then
							local v15 = Kenize[Count + 0]
							
							if (if v15 then v15.text else "") ~= ")" then
								local TheDesignSourceEndedEarly4 = assert(Kenize[Count], "The design source ended early")
								assert(TheDesignSourceEndedEarly4.text == "...", `Expected ... but found {TheDesignSourceEndedEarly4.text}`)
								Count += 1
								local TheDesignSourceEndedEarly5 = assert(Kenize[Count], "The design source ended early")
								assert(TheDesignSourceEndedEarly5.text == ")", `Expected ) but found {TheDesignSourceEndedEarly5.text}`)
								Count += 1
								local TheDesignSourceEndedEarly6 = assert(Kenize[Count], "The design source ended early")
								assert(TheDesignSourceEndedEarly6.text == "if", `Expected if but found {TheDesignSourceEndedEarly6.text}`)
								Count += 1
								local TheDesignSourceEndedEarly7 = assert(Kenize[Count], "The design source ended early")
								assert(TheDesignSourceEndedEarly7.text == "props", `Expected props but found {TheDesignSourceEndedEarly7.text}`)
								Count += 1
								local TheDesignSourceEndedEarly8 = assert(Kenize[Count], "The design source ended early")
								assert(TheDesignSourceEndedEarly8.text == ".", `Expected . but found {TheDesignSourceEndedEarly8.text}`)
								Count += 1
								local TheDesignSourceEndedEarly9 = assert(Kenize[Count], "The design source ended early")
								assert(true, `Expected  but found {TheDesignSourceEndedEarly9.text}`)
								Count += 1
								assert(TheDesignSourceEndedEarly9.kind == "name", `Expected a name but found {TheDesignSourceEndedEarly9.text}`)
								local Text = TheDesignSourceEndedEarly9.text
								local TheDesignSourceEndedEarly10 = assert(Kenize[Count], "The design source ended early")
								assert(TheDesignSourceEndedEarly10.text == "then", `Expected then but found {TheDesignSourceEndedEarly10.text}`)
								Count += 1
								local TheDesignSourceEndedEarly11 = assert(Kenize[Count], "The design source ended early")
								assert(TheDesignSourceEndedEarly11.text == "props", `Expected props but found {TheDesignSourceEndedEarly11.text}`)
								Count += 1
								local TheDesignSourceEndedEarly12 = assert(Kenize[Count], "The design source ended early")
								assert(TheDesignSourceEndedEarly12.text == ".", `Expected . but found {TheDesignSourceEndedEarly12.text}`)
								Count += 1
								local TheDesignSourceEndedEarly13 = assert(Kenize[Count], "The design source ended early")
								assert(Text == nil or TheDesignSourceEndedEarly13.text == Text, `Expected {Text or ""} but found {TheDesignSourceEndedEarly13.text}`)
								Count += 1
								local TheDesignSourceEndedEarly14 = assert(Kenize[Count], "The design source ended early")
								assert(TheDesignSourceEndedEarly14.text == "(", `Expected ( but found {TheDesignSourceEndedEarly14.text}`)
								Count += 1
								local config = { ["$output"] = Text }
								local v16 = Kenize[Count + 0]
								
								if (if v16 then v16.text else "") == v9 then
									local v17 = v9
									local TheDesignSourceEndedEarly15 = assert(Kenize[Count], "The design source ended early")
									assert(v17 == nil or TheDesignSourceEndedEarly15.text == v17, `Expected {v17 or ""} but found {TheDesignSourceEndedEarly15.text}`)
									Count += 1
									local TheDesignSourceEndedEarly16 = assert(Kenize[Count], "The design source ended early")
									assert(TheDesignSourceEndedEarly16.text == ":", `Expected : but found {TheDesignSourceEndedEarly16.text}`)
									Count += 1
									local TheDesignSourceEndedEarly17 = assert(Kenize[Count], "The design source ended early")
									assert(TheDesignSourceEndedEarly17.text == "peek", `Expected peek but found {TheDesignSourceEndedEarly17.text}`)
									Count += 1
									local TheDesignSourceEndedEarly18 = assert(Kenize[Count], "The design source ended early")
									assert(TheDesignSourceEndedEarly18.text == "(", `Expected ( but found {TheDesignSourceEndedEarly18.text}`)
									Count += 1
									local TheDesignSourceEndedEarly19 = assert(Kenize[Count], "The design source ended early")
									assert(TheDesignSourceEndedEarly19.text == ")", `Expected ) but found {TheDesignSourceEndedEarly19.text}`)
									Count += 1
									config["$row"] = true
								else
									local TheDesignSourceEndedEarly20 = assert(Kenize[Count], "The design source ended early")
									assert(TheDesignSourceEndedEarly20.text == "...", `Expected ... but found {TheDesignSourceEndedEarly20.text}`)
									Count += 1
								end
								local TheDesignSourceEndedEarly21 = assert(Kenize[Count], "The design source ended early")
								assert(TheDesignSourceEndedEarly21.text == ")", `Expected ) but found {TheDesignSourceEndedEarly21.text}`)
								Count += 1
								local TheDesignSourceEndedEarly22 = assert(Kenize[Count], "The design source ended early")
								assert(TheDesignSourceEndedEarly22.text == "end", `Expected end but found {TheDesignSourceEndedEarly22.text}`)
								Count += 1
								local TheDesignSourceEndedEarly23 = assert(Kenize[Count], "The design source ended early")
								assert(TheDesignSourceEndedEarly23.text == "end", `Expected end but found {TheDesignSourceEndedEarly23.text}`)
								Count += 1
								
								return config, Count
							end
						end
						local v14 = v9
						local v15 = Kenize[Count + 0]
						
						if (if v15 then v15.text else "") ~= ")" then
							local TheDesignSourceEndedEarly24 = assert(Kenize[Count], "The design source ended early")
							assert(true, `Expected  but found {TheDesignSourceEndedEarly24.text}`)
							Count += 1
							assert(TheDesignSourceEndedEarly24.kind == "name", `Expected a name but found {TheDesignSourceEndedEarly24.text}`)
							local Text = TheDesignSourceEndedEarly24.text
							assert(Text ~= "use", "Layout functions use a typed readable input: compute the value in the caller and bind props.<input>")
							assert(Text ~= "props" and (Text ~= "state" and (Text ~= "refs" and Text ~= p10.parameter)), "Row parameters must not shadow Design inputs, state, references or controls")
							v9 = Text
							annotation(")")
						end
						local TheDesignSourceEndedEarly25 = assert(Kenize[Count], "The design source ended early")
						assert(TheDesignSourceEndedEarly25.text == ")", `Expected ) but found {TheDesignSourceEndedEarly25.text}`)
						Count += 1
						annotation("return")
						local TheDesignSourceEndedEarly26 = assert(Kenize[Count], "The design source ended early")
						assert(TheDesignSourceEndedEarly26.text == "return", `Expected return but found {TheDesignSourceEndedEarly26.text}`)
						Count += 1
						local v16 = Callback()
						local TheDesignSourceEndedEarly27 = assert(Kenize[Count], "The design source ended early")
						assert(TheDesignSourceEndedEarly27.text == "end", `Expected end but found {TheDesignSourceEndedEarly27.text}`)
						Count += 1
						v9 = v14
						table.insert(List, v16)
						
						return { ["$template"] = v16.id }, Count
					else
						local TheDesignSourceEndedEarly = assert(Kenize[Count], "The design source ended early")
						assert(true, `Expected  but found {TheDesignSourceEndedEarly.text}`)
						Count += 1
						assert(TheDesignSourceEndedEarly.kind == "name", `Expected a name but found {TheDesignSourceEndedEarly.text}`)
						local Text = TheDesignSourceEndedEarly.text
						local v17 = Kenize[Count + 0]
						
						if (if v17 then v17.text else "") ~= "." then
						end
						local TheDesignSourceEndedEarly28 = assert(Kenize[Count], "The design source ended early")
						assert(TheDesignSourceEndedEarly28.text == ".", `Expected . but found {TheDesignSourceEndedEarly28.text}`)
						Count += 1
						local v18 = "."
						local TheDesignSourceEndedEarly29 = assert(Kenize[Count], "The design source ended early")
						assert(true, `Expected  but found {TheDesignSourceEndedEarly29.text}`)
						Count += 1
						assert(TheDesignSourceEndedEarly29.kind == "name", `Expected a name but found {TheDesignSourceEndedEarly29.text}`)
						Text ..= v18 .. TheDesignSourceEndedEarly29.text
					end
				end)
				Count = Literal2_1
				KenizeEntry = Literal1
				Literal2_1 = type(KenizeEntry) == "string"
				assert(Literal2_1, "A root variant selects an enum option")
				Literal1 = assert(Kenize[Count], "The design source ended early")
				assert(Literal1.text == "then", `Expected then but found {Literal1.text}`)
				Count += 1
				Literal1 = assert(Kenize[Count], "The design source ended early")
				assert(Literal1.text == "return", `Expected return but found {Literal1.text}`)
				Count += 1
				Tbl1 = Callback()
				RootVariant = {
					input = TheDesignSourceEndedEarly6,
					value = KenizeEntry,
					kind = Tbl1.kind,
					props = Tbl1.props
				}
				Literal1 = assert(Kenize[Count], "The design source ended early")
				assert(Literal1.text == "end", `Expected end but found {Literal1.text}`)
				Count += 1
				continue
			end
		end
		KenizeEntry = Kenize[Count + 0]
		
		if (if KenizeEntry then KenizeEntry.text else "") == "local" then
			KenizeEntry = Kenize[Count + 1]
			
			if (if KenizeEntry then KenizeEntry.text else "") == "function" then
				KenizeEntry = Kenize[Count + 2]
				
				if (if KenizeEntry then KenizeEntry.text else "") == "rootContent" then
					local TheDesignSourceEndedEarly7 = assert(Kenize[Count], "The design source ended early")
					assert(TheDesignSourceEndedEarly7.text == "local", `Expected local but found {TheDesignSourceEndedEarly7.text}`)
					Count += 1
					TheDesignSourceEndedEarly7 = assert(Kenize[Count], "The design source ended early")
					assert(TheDesignSourceEndedEarly7.text == "function", `Expected function but found {TheDesignSourceEndedEarly7.text}`)
					Count += 1
					TheDesignSourceEndedEarly7 = assert(Kenize[Count], "The design source ended early")
					assert(TheDesignSourceEndedEarly7.text == "rootContent", `Expected rootContent but found {TheDesignSourceEndedEarly7.text}`)
					Count += 1
					TheDesignSourceEndedEarly7 = assert(Kenize[Count], "The design source ended early")
					assert(TheDesignSourceEndedEarly7.text == "(", `Expected ( but found {TheDesignSourceEndedEarly7.text}`)
					Count += 1
					TheDesignSourceEndedEarly7 = assert(Kenize[Count], "The design source ended early")
					assert(TheDesignSourceEndedEarly7.text == ")", `Expected ) but found {TheDesignSourceEndedEarly7.text}`)
					Count += 1
					annotation("return")
					TheDesignSourceEndedEarly7 = assert(Kenize[Count], "The design source ended early")
					assert(TheDesignSourceEndedEarly7.text == "return", `Expected return but found {TheDesignSourceEndedEarly7.text}`)
					Count += 1
					Child = Callback()
					TheDesignSourceEndedEarly7 = assert(Kenize[Count], "The design source ended early")
					assert(TheDesignSourceEndedEarly7.text == "end", `Expected end but found {TheDesignSourceEndedEarly7.text}`)
					Count += 1
					continue
				end
			end
		end
		KenizeEntry = Kenize[Count + 0]
		
		if (if KenizeEntry then KenizeEntry.text else "") == "local" then
			KenizeEntry = Kenize[Count + 1]
			
			if (if KenizeEntry then KenizeEntry.text else "") == "named" then
				local TheDesignSourceEndedEarly = assert(Kenize[Count], "The design source ended early")
				assert(TheDesignSourceEndedEarly.text == "local", `Expected local but found {TheDesignSourceEndedEarly.text}`)
				Count += 1
				TheDesignSourceEndedEarly = assert(Kenize[Count], "The design source ended early")
				assert(TheDesignSourceEndedEarly.text == "named", `Expected named but found {TheDesignSourceEndedEarly.text}`)
				Count += 1
				while true do
					local KenizeEntry3 = Kenize[Count + 0]
					if (if KenizeEntry3 then KenizeEntry3.text else "") == "=" then break end
					assert(true, `Expected  but found {assert(Kenize[Count], "The design source ended early").text}`)
					Count += 1
				end
				TheDesignSourceEndedEarly = assert(Kenize[Count], "The design source ended early")
				assert(TheDesignSourceEndedEarly.text == "=", `Expected = but found {TheDesignSourceEndedEarly.text}`)
				Count += 1
				TheDesignSourceEndedEarly = assert(Kenize[Count], "The design source ended early")
				assert(TheDesignSourceEndedEarly.text == "{", `Expected \{ but found {TheDesignSourceEndedEarly.text}`)
				Count += 1
				while true do
					local TheDesignSourceEndedEarly8 = Kenize[Count + 0]
					if (if TheDesignSourceEndedEarly8 then TheDesignSourceEndedEarly8.text else "") == "}" then break end
					TheDesignSourceEndedEarly8 = assert(Kenize[Count], "The design source ended early")
					assert(true, `Expected  but found {TheDesignSourceEndedEarly8.text}`)
					Count += 1
					assert(TheDesignSourceEndedEarly8.kind == "name", `Expected a name but found {TheDesignSourceEndedEarly8.text}`)
					local Text = TheDesignSourceEndedEarly8.text
					TheDesignSourceEndedEarly8 = assert(Kenize[Count], "The design source ended early")
					assert(TheDesignSourceEndedEarly8.text == "=", `Expected = but found {TheDesignSourceEndedEarly8.text}`)
					Count += 1
					TheDesignSourceEndedEarly8 = assert(Kenize[Count], "The design source ended early")
					assert(TheDesignSourceEndedEarly8.text == "refs", `Expected refs but found {TheDesignSourceEndedEarly8.text}`)
					Count += 1
					TheDesignSourceEndedEarly8 = assert(Kenize[Count], "The design source ended early")
					assert(TheDesignSourceEndedEarly8.text == ".", `Expected . but found {TheDesignSourceEndedEarly8.text}`)
					Count += 1
					local TheDesignSourceEndedEarly9 = assert(Kenize[Count], "The design source ended early")
					assert(true, `Expected  but found {TheDesignSourceEndedEarly9.text}`)
					Count += 1
					assert(TheDesignSourceEndedEarly9.kind == "name", `Expected a name but found {TheDesignSourceEndedEarly9.text}`)
					t4[Text] = TheDesignSourceEndedEarly9.text
					Text = Kenize[Count + 0]
					TheDesignSourceEndedEarly8 = if Text then Text.text else ""
					
					if TheDesignSourceEndedEarly8 ~= "," then continue end
					TheDesignSourceEndedEarly8 = assert(Kenize[Count], "The design source ended early")
					assert(TheDesignSourceEndedEarly8.text == ",", `Expected , but found {TheDesignSourceEndedEarly8.text}`)
					Count += 1
					continue
				end
				TheDesignSourceEndedEarly = assert(Kenize[Count], "The design source ended early")
				assert(TheDesignSourceEndedEarly.text == "}", `Expected } but found {TheDesignSourceEndedEarly.text}`)
				Count += 1
				continue
			end
		end
		KenizeEntry = Kenize[Count + 0]
		
		if (if KenizeEntry then KenizeEntry.text else "") == "local" and (Kenize[Count + 1] and Kenize[Count + 1].kind == "name") then
			KenizeEntry = Kenize[Count + 1]
			
			if (if KenizeEntry then KenizeEntry.text else "") ~= "refs" then
				KenizeEntry = Kenize[Count + 2]
				
				if (if KenizeEntry then KenizeEntry.text else "") == ":" then
					local TheDesignSourceEndedEarly4 = assert(Kenize[Count], "The design source ended early")
					assert(TheDesignSourceEndedEarly4.text == "local", `Expected local but found {TheDesignSourceEndedEarly4.text}`)
					Count += 1
					KenizeEntry = assert(Kenize[Count], "The design source ended early")
					assert(true, `Expected  but found {KenizeEntry.text}`)
					Count += 1
					assert(KenizeEntry.kind == "name", `Expected a name but found {KenizeEntry.text}`)
					TheDesignSourceEndedEarly4 = KenizeEntry.text
					KenizeEntry = assert(Kenize[Count], "The design source ended early")
					assert(KenizeEntry.text == ":", `Expected : but found {KenizeEntry.text}`)
					Count += 1
					while true do
						local KenizeEntry4 = Kenize[Count + 0]
						if (if KenizeEntry4 then KenizeEntry4.text else "") == "=" then break end
						assert(true, `Expected  but found {assert(Kenize[Count], "The design source ended early").text}`)
						Count += 1
					end
					KenizeEntry = assert(Kenize[Count], "The design source ended early")
					assert(KenizeEntry.text == "=", `Expected = but found {KenizeEntry.text}`)
					Count += 1
					KenizeEntry = List
					List = {}
					local Literal3, Literal2_2 = readLiteral(Kenize, Count, function(p12)
						-- upvalues: Count (ref), Kenize (copy), t1 (copy), List (ref), v9 (ref), p10 (copy), annotation (copy), Callback (ref)
						Count = p12
						local v12 = Kenize[Count + 0]
						
						if (if v12 then v12.text else "") == "props" then
							local TheDesignSourceEndedEarly = assert(Kenize[Count], "The design source ended early")
							assert(TheDesignSourceEndedEarly.text == "props", `Expected props but found {TheDesignSourceEndedEarly.text}`)
							Count += 1
							local TheDesignSourceEndedEarly1 = assert(Kenize[Count], "The design source ended early")
							assert(TheDesignSourceEndedEarly1.text == ".", `Expected . but found {TheDesignSourceEndedEarly1.text}`)
							Count += 1
							local t = {}
							local TheDesignSourceEndedEarly2 = assert(Kenize[Count], "The design source ended early")
							assert(true, `Expected  but found {TheDesignSourceEndedEarly2.text}`)
							Count += 1
							assert(TheDesignSourceEndedEarly2.kind == "name", `Expected a name but found {TheDesignSourceEndedEarly2.text}`)
							t["$input"] = TheDesignSourceEndedEarly2.text
							
							return t, Count
						end
						local v13 = Kenize[Count + 0]
						
						if (if v13 then v13.text else "") == "function" then
							local TheDesignSourceEndedEarly = assert(Kenize[Count], "The design source ended early")
							assert(TheDesignSourceEndedEarly.text == "function", `Expected function but found {TheDesignSourceEndedEarly.text}`)
							Count += 1
							local TheDesignSourceEndedEarly3 = assert(Kenize[Count], "The design source ended early")
							assert(TheDesignSourceEndedEarly3.text == "(", `Expected ( but found {TheDesignSourceEndedEarly3.text}`)
							Count += 1
							local v14 = Kenize[Count + 0]
							assert((if v14 then v14.text else "") ~= "use", "Layout functions use a typed readable input: compute the value in the caller and bind props.<input>")
							
							if not Kenize[Count] or Kenize[Count].kind ~= "name" then
								local v15 = Kenize[Count + 0]
								
								if (if v15 then v15.text else "") ~= ")" then
									local TheDesignSourceEndedEarly4 = assert(Kenize[Count], "The design source ended early")
									assert(TheDesignSourceEndedEarly4.text == "...", `Expected ... but found {TheDesignSourceEndedEarly4.text}`)
									Count += 1
									local TheDesignSourceEndedEarly5 = assert(Kenize[Count], "The design source ended early")
									assert(TheDesignSourceEndedEarly5.text == ")", `Expected ) but found {TheDesignSourceEndedEarly5.text}`)
									Count += 1
									local TheDesignSourceEndedEarly6 = assert(Kenize[Count], "The design source ended early")
									assert(TheDesignSourceEndedEarly6.text == "if", `Expected if but found {TheDesignSourceEndedEarly6.text}`)
									Count += 1
									local TheDesignSourceEndedEarly7 = assert(Kenize[Count], "The design source ended early")
									assert(TheDesignSourceEndedEarly7.text == "props", `Expected props but found {TheDesignSourceEndedEarly7.text}`)
									Count += 1
									local TheDesignSourceEndedEarly8 = assert(Kenize[Count], "The design source ended early")
									assert(TheDesignSourceEndedEarly8.text == ".", `Expected . but found {TheDesignSourceEndedEarly8.text}`)
									Count += 1
									local TheDesignSourceEndedEarly9 = assert(Kenize[Count], "The design source ended early")
									assert(true, `Expected  but found {TheDesignSourceEndedEarly9.text}`)
									Count += 1
									assert(TheDesignSourceEndedEarly9.kind == "name", `Expected a name but found {TheDesignSourceEndedEarly9.text}`)
									local Text = TheDesignSourceEndedEarly9.text
									local TheDesignSourceEndedEarly10 = assert(Kenize[Count], "The design source ended early")
									assert(TheDesignSourceEndedEarly10.text == "then", `Expected then but found {TheDesignSourceEndedEarly10.text}`)
									Count += 1
									local TheDesignSourceEndedEarly11 = assert(Kenize[Count], "The design source ended early")
									assert(TheDesignSourceEndedEarly11.text == "props", `Expected props but found {TheDesignSourceEndedEarly11.text}`)
									Count += 1
									local TheDesignSourceEndedEarly12 = assert(Kenize[Count], "The design source ended early")
									assert(TheDesignSourceEndedEarly12.text == ".", `Expected . but found {TheDesignSourceEndedEarly12.text}`)
									Count += 1
									local TheDesignSourceEndedEarly13 = assert(Kenize[Count], "The design source ended early")
									assert(Text == nil or TheDesignSourceEndedEarly13.text == Text, `Expected {Text or ""} but found {TheDesignSourceEndedEarly13.text}`)
									Count += 1
									local TheDesignSourceEndedEarly14 = assert(Kenize[Count], "The design source ended early")
									assert(TheDesignSourceEndedEarly14.text == "(", `Expected ( but found {TheDesignSourceEndedEarly14.text}`)
									Count += 1
									local config = { ["$output"] = Text }
									local v16 = Kenize[Count + 0]
									
									if (if v16 then v16.text else "") == v9 then
										local v17 = v9
										local TheDesignSourceEndedEarly15 = assert(Kenize[Count], "The design source ended early")
										assert(v17 == nil or TheDesignSourceEndedEarly15.text == v17, `Expected {v17 or ""} but found {TheDesignSourceEndedEarly15.text}`)
										Count += 1
										local TheDesignSourceEndedEarly16 = assert(Kenize[Count], "The design source ended early")
										assert(TheDesignSourceEndedEarly16.text == ":", `Expected : but found {TheDesignSourceEndedEarly16.text}`)
										Count += 1
										local TheDesignSourceEndedEarly17 = assert(Kenize[Count], "The design source ended early")
										assert(TheDesignSourceEndedEarly17.text == "peek", `Expected peek but found {TheDesignSourceEndedEarly17.text}`)
										Count += 1
										local TheDesignSourceEndedEarly18 = assert(Kenize[Count], "The design source ended early")
										assert(TheDesignSourceEndedEarly18.text == "(", `Expected ( but found {TheDesignSourceEndedEarly18.text}`)
										Count += 1
										local TheDesignSourceEndedEarly19 = assert(Kenize[Count], "The design source ended early")
										assert(TheDesignSourceEndedEarly19.text == ")", `Expected ) but found {TheDesignSourceEndedEarly19.text}`)
										Count += 1
										config["$row"] = true
									else
										local TheDesignSourceEndedEarly20 = assert(Kenize[Count], "The design source ended early")
										assert(TheDesignSourceEndedEarly20.text == "...", `Expected ... but found {TheDesignSourceEndedEarly20.text}`)
										Count += 1
									end
									local TheDesignSourceEndedEarly21 = assert(Kenize[Count], "The design source ended early")
									assert(TheDesignSourceEndedEarly21.text == ")", `Expected ) but found {TheDesignSourceEndedEarly21.text}`)
									Count += 1
									local TheDesignSourceEndedEarly22 = assert(Kenize[Count], "The design source ended early")
									assert(TheDesignSourceEndedEarly22.text == "end", `Expected end but found {TheDesignSourceEndedEarly22.text}`)
									Count += 1
									local TheDesignSourceEndedEarly23 = assert(Kenize[Count], "The design source ended early")
									assert(TheDesignSourceEndedEarly23.text == "end", `Expected end but found {TheDesignSourceEndedEarly23.text}`)
									Count += 1
									
									return config, Count
								end
							end
							local v14 = v9
							local v15 = Kenize[Count + 0]
							
							if (if v15 then v15.text else "") ~= ")" then
								local TheDesignSourceEndedEarly24 = assert(Kenize[Count], "The design source ended early")
								assert(true, `Expected  but found {TheDesignSourceEndedEarly24.text}`)
								Count += 1
								assert(TheDesignSourceEndedEarly24.kind == "name", `Expected a name but found {TheDesignSourceEndedEarly24.text}`)
								local Text = TheDesignSourceEndedEarly24.text
								assert(Text ~= "use", "Layout functions use a typed readable input: compute the value in the caller and bind props.<input>")
								assert(Text ~= "props" and (Text ~= "state" and (Text ~= "refs" and Text ~= p10.parameter)), "Row parameters must not shadow Design inputs, state, references or controls")
								v9 = Text
								annotation(")")
							end
							local TheDesignSourceEndedEarly25 = assert(Kenize[Count], "The design source ended early")
							assert(TheDesignSourceEndedEarly25.text == ")", `Expected ) but found {TheDesignSourceEndedEarly25.text}`)
							Count += 1
							annotation("return")
							local TheDesignSourceEndedEarly26 = assert(Kenize[Count], "The design source ended early")
							assert(TheDesignSourceEndedEarly26.text == "return", `Expected return but found {TheDesignSourceEndedEarly26.text}`)
							Count += 1
							local v16 = Callback()
							local TheDesignSourceEndedEarly27 = assert(Kenize[Count], "The design source ended early")
							assert(TheDesignSourceEndedEarly27.text == "end", `Expected end but found {TheDesignSourceEndedEarly27.text}`)
							Count += 1
							v9 = v14
							table.insert(List, v16)
							
							return { ["$template"] = v16.id }, Count
						else
							local TheDesignSourceEndedEarly = assert(Kenize[Count], "The design source ended early")
							assert(true, `Expected  but found {TheDesignSourceEndedEarly.text}`)
							Count += 1
							assert(TheDesignSourceEndedEarly.kind == "name", `Expected a name but found {TheDesignSourceEndedEarly.text}`)
							local Text = TheDesignSourceEndedEarly.text
							local v17 = Kenize[Count + 0]
							
							if (if v17 then v17.text else "") ~= "." then
							end
							local TheDesignSourceEndedEarly28 = assert(Kenize[Count], "The design source ended early")
							assert(TheDesignSourceEndedEarly28.text == ".", `Expected . but found {TheDesignSourceEndedEarly28.text}`)
							Count += 1
							local v18 = "."
							local TheDesignSourceEndedEarly29 = assert(Kenize[Count], "The design source ended early")
							assert(true, `Expected  but found {TheDesignSourceEndedEarly29.text}`)
							Count += 1
							assert(TheDesignSourceEndedEarly29.kind == "name", `Expected a name but found {TheDesignSourceEndedEarly29.text}`)
							Text ..= v18 .. TheDesignSourceEndedEarly29.text
						end
					end)
					Count = Literal2_2
					t2[TheDesignSourceEndedEarly4] = Literal3
					t3[TheDesignSourceEndedEarly4] = List
					List = KenizeEntry
					continue
				end
			end
		end
		KenizeEntry = Kenize[Count + 0]
		
		if (if KenizeEntry then KenizeEntry.text else "") == "local" then
			KenizeEntry = Kenize[Count + 1]
			
			if (if KenizeEntry then KenizeEntry.text else "") == "function" then
				KenizeEntry = Kenize[Count + 2]
				
				if (if KenizeEntry then KenizeEntry.text else "") ~= "capture" then
					local TheDesignSourceEndedEarly = assert(Kenize[Count], "The design source ended early")
					assert(TheDesignSourceEndedEarly.text == "local", `Expected local but found {TheDesignSourceEndedEarly.text}`)
					Count += 1
					TheDesignSourceEndedEarly = assert(Kenize[Count], "The design source ended early")
					assert(TheDesignSourceEndedEarly.text == "function", `Expected function but found {TheDesignSourceEndedEarly.text}`)
					Count += 1
					KenizeEntry = assert(Kenize[Count], "The design source ended early")
					assert(true, `Expected  but found {KenizeEntry.text}`)
					Count += 1
					assert(KenizeEntry.kind == "name", `Expected a name but found {KenizeEntry.text}`)
					TheDesignSourceEndedEarly = KenizeEntry.text
					KenizeEntry = assert(Kenize[Count], "The design source ended early")
					assert(KenizeEntry.text == "(", `Expected ( but found {KenizeEntry.text}`)
					Count += 1
					local TheDesignSourceEndedEarly10 = assert(Kenize[Count], "The design source ended early")
					assert(true, `Expected  but found {TheDesignSourceEndedEarly10.text}`)
					Count += 1
					assert(TheDesignSourceEndedEarly10.kind == "name", `Expected a name but found {TheDesignSourceEndedEarly10.text}`)
					KenizeEntry = TheDesignSourceEndedEarly10.text
					assert(KenizeEntry ~= "use", "Layout functions use a typed readable input: compute the value in the caller and bind props.<input>")
					assert(KenizeEntry ~= "props" and (KenizeEntry ~= "state" and (KenizeEntry ~= "refs" and KenizeEntry ~= p10.parameter)), "Row parameters must not shadow Design inputs, state, references or controls")
					annotation(")")
					TheDesignSourceEndedEarly10 = assert(Kenize[Count], "The design source ended early")
					assert(TheDesignSourceEndedEarly10.text == ")", `Expected ) but found {TheDesignSourceEndedEarly10.text}`)
					Count += 1
					annotation("return")
					TheDesignSourceEndedEarly10 = v9
					v9 = KenizeEntry
					rowAlias()
					t1[TheDesignSourceEndedEarly] = rowBody()
					v9 = TheDesignSourceEndedEarly10
					TheDesignSourceEndedEarly10 = assert(Kenize[Count], "The design source ended early")
					assert(TheDesignSourceEndedEarly10.text == "end", `Expected end but found {TheDesignSourceEndedEarly10.text}`)
					Count += 1
					continue
				end
			end
		end
		assert(true, `Expected  but found {assert(Kenize[Count], "The design source ended early").text}`)
		Count += 1
	end
	local TheDesignSourceEndedEarly1 = assert(Kenize[Count], "The design source ended early")
	assert(TheDesignSourceEndedEarly1.text == "return", `Expected return but found {TheDesignSourceEndedEarly1.text}`)
	Count += 1
	local Tbl = Callback()
	
	if Tbl1 and RootVariant then
		assert(if Tbl.nameInput == nil then Tbl1.name == Tbl.name and (Tbl1.nameInput == Tbl.nameInput and Tbl1.nameField == Tbl.nameField) else Tbl1.nameInput == Tbl.nameInput and Tbl1.nameField == Tbl.nameField, "Root variants keep one direct root name")
		
		if Child then
			assert(#Tbl.children == 1 and (Tbl.children[1] == Child and #Tbl1.children == 1) and Tbl1.children[1] == Child, "Root variants share their content")
		else
			RootVariant.children = Tbl1.children
		end
	end
	local TheDesignSourceEndedEarly = assert(Kenize[Count], "The design source ended early")
	assert(TheDesignSourceEndedEarly.text == "end", `Expected end but found {TheDesignSourceEndedEarly.text}`)
	Count += 1
	
	local function remap(Tbl)
		-- upvalues: Ids (copy), remap (copy)
		for _, prop in Tbl.props do
			local Node = prop.node
			
			if Node ~= nil then
				prop.node = assert(Ids[Node], `refs.{Node} names no captured node`)
			end
			local Nodes = prop.nodes
			
			if Nodes then
				local Nodes1 = {}
				
				for _, node in Nodes do
					table.insert(Nodes1, (assert(Ids[node], `refs.{node} names no captured node`)))
				end
				prop.nodes = Nodes1
			end
		end
		for _, child in Tbl.children do
			remap(child)
		end
		if Tbl.rowVariant then
			for _, cas in Tbl.rowVariant.cases do
				local Copy = table.clone(Tbl)
				Copy.rowVariant = nil
				local Children = cas.children
				Copy.props = cas.props
				Copy.children = Children
				remap(Copy)
			end
		end
	end
	
	remap(Tbl)
	
	if Tbl1 then
		local Copy = table.clone(Tbl1)
		Copy.children = if Child then {} else Tbl1.children
		remap(Copy)
	end
	local Ids1 = {}
	Count1 = 1
	
	local function renumber(p12)
		-- upvalues: Count1 (ref), Ids1 (copy), renumber (copy)
		local Text: string = `n{Count1}`
		Count1 += 1
		Ids1[p12.id] = Text
		p12.id = Text
		
		for _, child in p12.children do
			renumber(child)
		end
		if p12.rowVariant then
			for _, cas in p12.rowVariant.cases do
				for _, child1 in cas.children do
					renumber(child1)
				end
			end
		end
	end
	
	renumber(Tbl)
	
	if RootVariant and RootVariant.children then
		for _, child in RootVariant.children do
			renumber(child)
		end
	end
	local function markers(List)
		-- upvalues: Ids1 (copy), markers (copy)
		if type(List) ~= "table" then return end
		local Template = List["$template"]
		
		if type(Template) == "string" then
			List["$template"] = Ids1[Template]
		end
		for _, value in List do
			markers(value)
		end
	end
	
	local function bindings(Tbl)
		-- upvalues: Ids1 (copy), markers (copy), bindings (copy)
		for _, prop in Tbl.props do
			if prop.node then
				prop.node = Ids1[prop.node]
			end
			if prop.nodes then
				for i, node in prop.nodes do
					prop.nodes[i] = Ids1[node]
				end
			end
			if prop.literal ~= nil then
				local Literal = prop.literal
				
				if type(Literal) == "table" then
					local Template = Literal["$template"]
					
					if type(Template) == "string" then
						Literal["$template"] = Ids1[Template]
					end
					for _, value in Literal do
						markers(value)
					end
				end
			end
		end
		if Tbl.bind and Tbl.bind.row then
			Tbl.bind.row = Ids1[Tbl.bind.row]
		end
		for _, child in Tbl.children do
			bindings(child)
		end
		if Tbl.rowVariant then
			for _, cas in Tbl.rowVariant.cases do
				local Copy = table.clone(Tbl)
				Copy.rowVariant = nil
				local Children = cas.children
				Copy.props = cas.props
				Copy.children = Children
				bindings(Copy)
			end
		end
	end
	
	bindings(Tbl)
	
	if RootVariant then
		local Copy = table.clone(Tbl)
		Copy.rowVariant = nil
		Copy.props = RootVariant.props
		Copy.children = RootVariant.children or {}
		bindings(Copy)
	end
	local Editor = Literal.editor
	
	if Editor ~= nil then
		assert(type(Editor) == "table", "The editor header is a table")
		
		local function restore(p13, p14)
			-- upvalues: Editor (copy)
			local EditorEntry = Editor[p14]
			
			if EditorEntry ~= nil then
				assert(type(EditorEntry) == "table", "Editor flags are a table")
				assert(EditorEntry.hidden == nil or type(EditorEntry.hidden) == "boolean", "Hidden is a boolean")
				assert(EditorEntry.locked == nil or type(EditorEntry.locked) == "boolean", "Locked is a boolean")
				
				if EditorEntry.name ~= nil then
					local Name = EditorEntry.name
					assert(type(Name) == "string", "The design header needs text at name")
					p13.name = Name
				end
				p13.hidden = EditorEntry.hidden == true or nil
				p13.locked = EditorEntry.locked == true or nil
			end
		end
		
		editorNodes(Tbl, "root", restore)
		
		if RootVariant and RootVariant.children then
			local Copy = table.clone(Tbl)
			Copy.rowVariant = nil
			local Children = RootVariant.children
			Copy.props = RootVariant.props
			Copy.children = Children
			editorNodes(Copy, "alternative", restore)
		end
	end
	local ValidateFunction = DocumentModule.validate
	local config = { schema = "compose-design/1" }
	local Name = Literal.name
	assert(type(Name) == "string", "The design header needs text at name")
	config.name = Name
	config.library = p10.name
	config.nextId = Count1
	config.contract = Contract
	config.typeImports = Module.typeImports(p9, table.concat(p10.prelude, "\n"))
	config.state = stateFrom(Literal)
	config.sequences = sequencesFrom(Literal)
	config.root = Tbl
	config.rootVariant = RootVariant
	
	return ValidateFunction(config, p10)
end

Module.editorNodes = editorNodes

return Module