local t = {
	replaceNewlines = function(p1, p2)
		p2 = p2 or " "
		
		return p1:gsub("\r\n", p2):gsub("\r", p2):gsub("\n", p2)
	end,
	truncateLength = function(p1, p2)
		p2 = p2 or 140
		
		if p1:len() <= p2 then
			return p1
		end
		local var1 = ""
		local var2 = ("..."):len()
		
		for i, v in utf8.graphemes(p1) do
			local var3 = p1:sub(i, v)
			
			if p2 < var1:len() + var3:len() + var2 then break end
			var1 ..= var3
		end
		local var4, var5 = var1:gsub("%s+%S-$", "...", 1)
		
		if var5 > 0 then
			var1 = var4
			
			return var1
		end
		return var1 .. "..."
	end
}

function t.sanitizeDescription(p3)
	-- upvalues: t (ref)
	return t.truncateLength(t.replaceNewlines(p3))
end

return t