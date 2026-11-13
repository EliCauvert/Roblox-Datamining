local function format(p1, p2, p3): string
	local List = { ("Compose[%s]: %s"):format(p1, p2) }
	
	if p3 ~= nil then
		local function _(p4, p5)
			-- upvalues: List (copy)
			if p5 ~= nil then
				table.insert(List, ("  %s: %s"):format(p4, (tostring(p5))))
			end
		end
		
		local Component = p3.component
		
		if Component ~= nil then
			table.insert(List, ("  %s: %s"):format("component", (tostring(Component))))
		end
		local Node = p3.node
		
		if Node ~= nil then
			table.insert(List, ("  %s: %s"):format("node", (tostring(Node))))
		end
		local Kind = p3.kind
		
		if Kind ~= nil then
			table.insert(List, ("  %s: %s"):format("kind", (tostring(Kind))))
		end
		local Key = p3.key
		
		if Key ~= nil then
			table.insert(List, ("  %s: %s"):format("key", (tostring(Key))))
		end
		local Event = p3.event
		
		if Event ~= nil then
			table.insert(List, ("  %s: %s"):format("event", (tostring(Event))))
		end
		local Index = p3.index
		
		if Index ~= nil then
			table.insert(List, ("  %s: %s"):format("index", (tostring(Index))))
		end
		local Expected = p3.expected
		
		if Expected ~= nil then
			table.insert(List, ("  %s: %s"):format("expected", (tostring(Expected))))
		end
		local Actual = p3.actual
		
		if Actual ~= nil then
			table.insert(List, ("  %s: %s"):format("actual", (tostring(Actual))))
		end
		local Detail = p3.detail
		
		if Detail ~= nil then
			table.insert(List, ("  %s: %s"):format("detail", (tostring(Detail))))
		end
		local Contract = p3.contract
		
		if Contract ~= nil then
			table.insert(List, ("  %s: %s"):format("contract", (tostring(Contract))))
		end
		local Fix = p3.fix
		
		if Fix ~= nil then
			table.insert(List, ("  %s: %s"):format("fix", (tostring(Fix))))
		end
	end
	table.insert(List, "  see: docs/index.md")
	
	return table.concat(List, "\n")
end

return {
	raise = function(p1, p2, p3, p4)
		-- upvalues: format (copy)
		error(format(p1, p2, p3), if p4 == nil then 0 else p4)
	end,
	format = format,
	describe = function(p1): string
		local ValueType = typeof(p1)
		
		return if type(p1) == "string" then ("string %q"):format(p1) elseif ValueType == "number" or ValueType == "boolean" or ValueType == "nil" then ("%s %s"):format(ValueType, (tostring(p1))) else ValueType
	end,
	parse = function(Text: string)
		local FoundAt: number? = string.find(Text, "Compose[", 1, true)
		
		if FoundAt == nil then
			return nil
		end
		local Segment = string.sub(Text, FoundAt)
		local Match, Match2 = string.match(Segment, "^Compose%[([^%]]+)%]:%s*([^\n]*)")
		
		if Match == nil or Match2 == nil then
			return nil
		end
		local Fields = {}
		
		for i in string.gmatch(Segment, "\n([^\n]*)") do
			local Match1, Match2_1 = string.match(i, "^%s%s([%w_]+):%s(.*)$")
			
			if Match1 ~= nil and Match2_1 ~= nil then
				Fields[Match1] = Match2_1
			end
		end
		return { code = Match, summary = Match2, fields = Fields }
	end
}