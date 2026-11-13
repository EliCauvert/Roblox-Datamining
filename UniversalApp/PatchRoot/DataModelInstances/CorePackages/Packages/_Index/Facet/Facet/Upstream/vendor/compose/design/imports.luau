local _ = require("../core")
local _ = require("./types")
local SourceModule = require("./source")
local LibraryModule = require("./library")

local function fieldsOf(Contract, ImportedDesignsNeedARootNameInput)
	local t = {}
	
	for _, input in Contract.inputs do
		if input.id ~= ImportedDesignsNeedARootNameInput then
			t[input.id] = {
				type = if input.type == "slot" then "content" elseif input.type == "number" or input.type == "string" or input.type == "boolean" or input.type == "vector3" then input.type else "value"
			}
		end
	end
	for _, output in Contract.outputs do
		t[output.id] = { type = "event" }
	end
	return t
end

local function _(List, p1): boolean
	if List == nil or p1 == nil then
		return List == p1
	end
	if #List ~= #p1 then
		return false
	end
	for i, value in List do
		if value ~= p1[i] then
			return false
		end
	end
	return true
end

local function sameFields(Fields, Fields1): boolean
	-- upvalues: sameFields (copy)
	if Fields == nil or Fields1 == nil then
		return Fields == Fields1
	end
	if #Fields ~= #Fields1 then
		return false
	end
	local IsOptionsMatch = nil
	for i, field in Fields do
		local Field = Fields1[i]
		
		if field.id == Field.id and field.type == Field.type and field.luauType == Field.luauType and sameFields(field.fields, Field.fields) then
			local Options = field.options
			local Options1 = Field.options
			
			if Options == nil or Options1 == nil then
				IsOptionsMatch = Options == Options1
			elseif #Options == #Options1 then
				IsOptionsMatch = true
				
				for i1, option in Options do
					if option ~= Options1[i1] then
						IsOptionsMatch = false
						break
					end
				end
			else
				IsOptionsMatch = false
			end
			if IsOptionsMatch then
				continue
			end
		end
		return false
	end
	return true
end

return {
	extend = function(p2, List)
		-- upvalues: SourceModule (copy), fieldsOf (copy), LibraryModule (copy)
		local Kinds = {}
		local List1 = {}
		local t = {}
		
		for _, kind in p2.kinds do
			t[kind.call] = true
		end
		local List2 = {}
		
		for i in List do
			table.insert(List2, i)
		end
		table.sort(List2)
		
		for _, value in List2 do
			local Entry = List[value]
			local Library = Entry.library or p2
			local ParseResult = SourceModule.parse(Entry.source:peek(), Library)
			local ImportedDesignsNeedARootNameInput = assert(ParseResult.root.nameInput, "Imported Designs need a root name input")
			local v1 = nil
			
			for _, input in ParseResult.contract.inputs do
				if input.id == ImportedDesignsNeedARootNameInput then
					v1 = input
				end
			end
			assert(v1 and v1.required == true, "Imported Designs need a required root name input")
			assert(string.match(Entry.call, "^[%a_][%w_%.]*$") ~= nil, "Imported Designs need a component call")
			assert(not t[Entry.call], "Imported Design calls must be distinct")
			assert(string.sub(Entry.call, -1) ~= "." and not string.find(Entry.call, "..", 1, true), "Imported Design calls have no empty path segments")
			t[Entry.call] = true
			
			for i1 in string.gmatch(Entry.call, "[^%.]+") do
				assert(string.match(i1, "^[%a_][%w_]*$") ~= nil, "Imported Design calls have identifier path segments")
			end
			Kinds[value] = {
				children = "none",
				fields = fieldsOf(ParseResult.contract, ImportedDesignsNeedARootNameInput),
				call = Entry.call,
				design = {
					source = Entry.source,
					library = Library,
					nameInput = ImportedDesignsNeedARootNameInput,
					contract = ParseResult.contract,
					save = Entry.save
				},
				build = function()
					error("Imported Designs build through Design.render", 0)
				end
			}
			local Prelude = Entry.prelude or {}
			for _, value1 in Prelude do
				if not table.find(List1, value1) then
					table.insert(List1, value1)
				end
			end
		end
		return LibraryModule.extend(p2, { kinds = Kinds, prelude = List1 })
	end,
	read = function(p3, Callback)
		-- upvalues: SourceModule (copy), sameFields (copy)
		local ParseResult = SourceModule.parse(if Callback then Callback(p3.source) else p3.source:peek(), p3.library)
		local Contract = p3.contract
		local Contract1 = ParseResult.contract
		assert(#Contract.inputs == #Contract1.inputs and #Contract.outputs == #Contract1.outputs, "Imported Design contract changed")
		assert(ParseResult.root.nameInput == p3.nameInput, "Imported Design root name input changed")
		local Flag = nil
		
		for i, input in Contract.inputs do
			local Input = Contract1.inputs[i]
			Flag = false
			
			if input.id == Input.id then
				Flag = false
				
				if input.type == Input.type then
					Flag = false
					
					if input.kind == Input.kind then
						Flag = false
						
						if input.required == Input.required then
							Flag = false
							
							if input.luauType == Input.luauType then
								Flag = sameFields(input.fields, Input.fields)
								
								if Flag then
									local Options = input.options
									local Options1 = Input.options
									
									if Options == nil or Options1 == nil then
										Flag = Options == Options1
									elseif #Options == #Options1 then
										Flag = true
										
										for i1, option in Options do
											if option ~= Options1[i1] then
												Flag = false
												break
											end
										end
									else
										Flag = false
									end
								end
							end
						end
					end
				end
			end
			assert(Flag, "Imported Design contract changed")
		end
		local Flag1 = nil
		for i2, output in Contract.outputs do
			local Output = Contract1.outputs[i2]
			Flag1 = false
			
			if output.id == Output.id then
				Flag1 = false
				
				if output.row == Output.row then
					local Args = output.args
					local Args1 = Output.args
					
					if Args == nil or Args1 == nil then
						Flag1 = Args == Args1
					elseif #Args == #Args1 then
						Flag1 = true
						
						for i3, arg in Args do
							if arg ~= Args1[i3] then
								Flag1 = false
								break
							end
						end
					else
						Flag1 = false
					end
				end
			end
			assert(Flag1, "Imported Design contract changed")
		end
		return ParseResult
	end
}