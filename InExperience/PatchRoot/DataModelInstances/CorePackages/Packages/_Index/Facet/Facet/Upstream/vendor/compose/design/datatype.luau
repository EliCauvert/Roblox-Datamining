local _ = require("./types")

local function _(List, p1)
	if type(List) ~= "table" then
		return nil
	end
	local Entry = List[p1]
	
	if type(Entry) ~= "string" then
		return nil
	end
	for i in List do
		if i ~= p1 then
			return nil
		end
	end
	return Entry
end

return {
	arity = {
		UDim2 = 4,
		UDim = 2,
		Vector2 = 2,
		Vector3 = 3,
		Rect = 4,
		NumberRange = 2
	},
	token = function(List)
		if type(List) ~= "table" then
			return nil
		end
		local Token = List.token
		
		if type(Token) ~= "string" then
			return nil
		end
		for i in List do
			if i ~= "token" then
				return nil
			end
		end
		return Token
	end,
	input = function(List)
		if type(List) ~= "table" then
			return nil
		end
		local Input = List.input
		
		if type(Input) ~= "string" then
			return nil
		end
		for i in List do
			if i ~= "input" then
				return nil
			end
		end
		return Input
	end,
	literal = function(List)
		local t = {}
		
		for i, value in List do
			if type(value) == "number" then
				t[i] = value
				continue
			end
			local t1 = {}
			
			for i1, value1 in value do
				t1[i1] = value1
			end
			t[i] = t1
		end
		return t
	end
}