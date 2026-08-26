local parent = script.Parent
local findOrModule = require(parent.findOr)
local sliceModule = require(parent.slice)
local parent_1 = parent.Parent
local _ = require(parent_1.ES7Types)
local MAX_SAFE_INTEGER = require(parent_1.Number).MAX_SAFE_INTEGER

return function(p1, p2, p3)
	-- upvalues: MAX_SAFE_INTEGER (ref), findOrModule (ref), sliceModule (ref)
	if p2 == nil then
		return { p1 }
	elseif p3 == 0 then
		return {}
	end
	local list
	local var1 = if p3 == nil or p3 < 0 then MAX_SAFE_INTEGER else p3
	local _ = nil
	
	if typeof(p2) == "string" then
		if p2 == "" then
			local t = {}
			
			for i in p1:gmatch(".") do
				table.insert(t, i)
			end
			return t
		else
			list = { p2 }
		end
	else
		list = p2
	end
	local var2 = 1
	local t = {}
	local var3 = nil
	local charCount, charCount_1 = utf8.len(p1)
	assert(charCount ~= nil, ("string `%s` has an invalid byte at position %s"):format(p1, tostring(charCount_1)))
	repeat
		local var4 = findOrModule(p1, list, var2)
		if var4 == nil then
			table.insert(t, sliceModule(p1, var2, nil))
		else
			table.insert(t, sliceModule(p1, var2, var4.index))
			var2 = var4.index + utf8.len(var4.match)
		end
		if var4 ~= nil then
			var3 = var4
		end
	until var4 == nil or charCount < var2 or var1 <= #t
	if var3 ~= nil then
		local charCount_2, charCount_3 = utf8.len(var3.match)
		assert(charCount_2 ~= nil, ("string `%s` has an invalid byte at position %s"):format(var3.match, tostring(charCount_3)))
		
		if var3.index + charCount_2 == charCount + 1 then
			table.insert(t, "")
		end
	end
	return t
end