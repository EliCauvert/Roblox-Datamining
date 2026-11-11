local Parent = script.Parent
local FindOrModule = require(Parent.findOr)
local SliceModule = require(Parent.slice)
local Parent1 = Parent.Parent
local _ = require(Parent1.ES7Types)
local MAXSAFEINTEGER = require(Parent1.Number).MAX_SAFE_INTEGER

return function(Text: string, p1, p2: number)
	-- upvalues: MAXSAFEINTEGER (copy), FindOrModule (copy), SliceModule (copy)
	if p1 == nil then
		return { Text }
	end
	if p2 == 0 then
		return {}
	end
	local MAXSAFEINTEGER1 = if p2 == nil or p2 < 0 then MAXSAFEINTEGER else p2
	local v1 = nil
	
	if typeof(p1) == "string" then
		if p1 == "" then
			local List = {}
			
			for i in Text:gmatch(".") do
				table.insert(List, i)
			end
			return List
		else
			v1 = { p1 }
		end
	else
		v1 = p1
	end
	local NewIndex = 1
	local List = {}
	local v2 = nil
	local Length, Length2 = utf8.len(Text)
	assert(Length ~= nil, ("string `%s` has an invalid byte at position %s"):format(Text, (tostring(Length2))))
	repeat
		local OrModule = FindOrModule(Text, v1, NewIndex)
		if OrModule == nil then
			table.insert(List, SliceModule(Text, NewIndex, nil))
		else
			table.insert(List, SliceModule(Text, NewIndex, OrModule.index))
			NewIndex = OrModule.index + utf8.len(OrModule.match)
		end
		if OrModule ~= nil then
			v2 = OrModule
		end
	until OrModule == nil or Length < NewIndex or MAXSAFEINTEGER1 <= #List
	if v2 ~= nil then
		local Length1, Length2_1 = utf8.len(v2.match)
		assert(Length1 ~= nil, ("string `%s` has an invalid byte at position %s"):format(v2.match, (tostring(Length2_1))))
		
		if v2.index + Length1 == Length + 1 then
			table.insert(List, "")
		end
	end
	return List
end