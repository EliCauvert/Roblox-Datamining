local t = {
	["<"] = "&lt;",
	[">"] = "&gt;",
	["\""] = "&quot;",
	["'"] = "&apos;"
}

return function(p0)
	-- upvalues: t (ref)
	local var1 = p0:gsub("&", "&amp;")
	
	for i, v in pairs(t) do
		var1 = var1:gsub(i, v)
	end
	return var1
end