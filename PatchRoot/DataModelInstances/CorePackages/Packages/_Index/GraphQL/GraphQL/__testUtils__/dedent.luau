-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:33 2026 Pacific Standard Time.

local luauPolyfillModule = require(script.Parent.Parent.Parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local string = luauPolyfillModule.String

function dedent(p0, ...) --[[ line: 18 ]]
	-- upvalues: array (ref)
	local list = { ... }
	local var2 = ""
	
	if array.isArray(p0) then
		for i = 1, #p0 do
			var2 ..= p0[i]
			
			if i <= #list then
				var2 ..= list[i]
			end
		end
	else
		var2 = p0
	end
	local var3 = removeTrailingSpacesAndTabs(removeLeadingNewLines(var2))
	local var4 = ""
	
	for i_1 = 1, string.len(var3) do
		local substring = string.sub(var3, i_1, i_1)
		
		if substring ~= " " and substring ~= "\t" then break end
		var4 ..= substring
	end
	return removeCommonIndent(var3, var4)
end

function removeLeadingNewLines(p1) --[[ line: 50 ]]
	-- upvalues: string (ref)
	local var6 = string.findOr(p1, { "\n*" })
	
	if var6 ~= nil and var6.index == 1 then
		p1 = string.sub(p1, string.len(var6.match) + 1)
	end
	return p1
end

function removeTrailingSpacesAndTabs(value) --[[ line: 59 ]]
	-- upvalues: string (ref)
	local _ = nil
	local var7 = nil
	local var8 = 1
	repeat
		local var9 = string.findOr(value, { " +", "\t+" }, var8)
		if var9 == nil then continue end
		var7 = if var7 == nil or var7.index + string.len(var7.match) ~= var9.index then var9 else { index = var7.index, match = var7.match .. var9.match }
		var8 = var9.index + string.len(var9.match)
	until var9 == nil or string.len(value) < var8
	return if var7 == nil or var7.index + string.len(var7.match) ~= string.len(value) + 1 then value else string.sub(value, 1, var7.index - 1)
end

function removeCommonIndent(p2, p3) --[[ line: 90 ]]
	return string.gsub(string.gsub(p2, p3, "", 1), "\n" .. p3, "\n")
end

return { dedent = dedent }