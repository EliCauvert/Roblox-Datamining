local t = {
	replaceNewlines = function(p0, p1)
		p1 = p1 or " "
		
		return p0:gsub("\r\n", p1):gsub("\r", p1):gsub("\n", p1)
	end,
	truncateLength = function(p2, p3)
		p3 = p3 or 140
		
		if p2:len() <= p3 then
			return p2
		end
		local var1 = ""
		local var2 = ("..."):len()
		
		for i, v in utf8.graphemes(p2) do
			local var3 = p2:sub(i, v)
			
			if p3 < var1:len() + var3:len() + var2 then break end
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

function t.sanitizeDescription(p4)
	-- upvalues: t (ref)
	return t.truncateLength(t.replaceNewlines(p4))
end

return t