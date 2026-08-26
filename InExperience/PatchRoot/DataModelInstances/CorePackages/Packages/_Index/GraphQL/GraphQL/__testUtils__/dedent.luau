local luauPolyfillModule = require(script.Parent.Parent.Parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local string = luauPolyfillModule.String

function dedent(p1, ...)
	-- upvalues: array (ref)
	local list = { ... }
	local var1 = ""
	
	if array.isArray(p1) then
		for i = 1, #p1 do
			var1 ..= p1[i]
			
			if i <= #list then
				var1 ..= list[i]
			end
		end
	else
		var1 = p1
	end
	local var2 = removeTrailingSpacesAndTabs(removeLeadingNewLines(var1))
	local var3 = ""
	
	for i_1 = 1, string.len(var2) do
		local substring = string.sub(var2, i_1, i_1)
		
		if substring ~= " " and substring ~= "\t" then break end
		var3 ..= substring
	end
	return removeCommonIndent(var2, var3)
end

function removeLeadingNewLines(p2)
	-- upvalues: string (ref)
	local var4 = string.findOr(p2, { "\n*" })
	
	if var4 ~= nil and var4.index == 1 then
		p2 = string.sub(p2, string.len(var4.match) + 1)
	end
	return p2
end

function removeTrailingSpacesAndTabs(value)
	-- upvalues: string (ref)
	local _ = nil
	local var4 = nil
	local var5 = 1
	repeat
		local var6 = string.findOr(value, { " +", "\t+" }, var5)
		if var6 == nil then continue end
		var4 = if var4 == nil or var4.index + string.len(var4.match) ~= var6.index then var6 else { index = var4.index, match = var4.match .. var9.match }
		var5 = var6.index + string.len(var6.match)
	until var6 == nil or string.len(value) < var5
	return if var4 == nil or var4.index + string.len(var4.match) ~= string.len(value) + 1 then value else string.sub(value, 1, var4.index - 1)
end

function removeCommonIndent(p2, p3)
	return string.gsub(string.gsub(p2, p3, "", 1), "\n" .. p3, "\n")
end

return { dedent = dedent }