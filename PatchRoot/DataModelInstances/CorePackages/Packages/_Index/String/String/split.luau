-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:27 2026 Pacific Standard Time.

local parent = script.Parent
local findOrModule = require(parent.findOr)
local sliceModule = require(parent.slice)
local parent_1 = parent.Parent
local _ = require(parent_1.ES7Types)
local MAX_SAFE_INTEGER = require(parent_1.Number).MAX_SAFE_INTEGER

return function(p0, p1, p2) --[[ line: 27 | named "split" ]]
	-- upvalues: MAX_SAFE_INTEGER (ref), findOrModule (ref), sliceModule (ref)
	if p1 == nil then
		return { p0 }
	elseif p2 == 0 then
		return {}
	end
	local list
	local var2 = if p2 == nil or p2 < 0 then MAX_SAFE_INTEGER else p2
	local _ = nil
	
	if typeof(p1) == "string" then
		if p1 == "" then
			local t = {}
			
			for i in p0:gmatch(".") do
				table.insert(t, i)
			end
			return t
		else
			list = { p1 }
		end
	else
		list = p1
	end
	local var5 = 1
	local t = {}
	local var7 = nil
	local charCount, charCount_1 = utf8.len(p0)
	assert(charCount ~= nil, ("string `%s` has an invalid byte at position %s"):format(p0, tostring(charCount_1)))
	repeat
		local var10 = findOrModule(p0, list, var5)
		if var10 == nil then
			table.insert(t, sliceModule(p0, var5, nil))
		else
			table.insert(t, sliceModule(p0, var5, var10.index))
			var5 = var10.index + utf8.len(var10.match)
		end
		if var10 ~= nil then
			var7 = var10
		end
	until var10 == nil or charCount < var5 or var2 <= #t
	if var7 ~= nil then
		local charCount_2, charCount_3 = utf8.len(var7.match)
		assert(charCount_2 ~= nil, ("string `%s` has an invalid byte at position %s"):format(var7.match, tostring(charCount_3)))
		
		if var7.index + charCount_2 == charCount + 1 then
			table.insert(t, "")
		end
	end
	return t
end