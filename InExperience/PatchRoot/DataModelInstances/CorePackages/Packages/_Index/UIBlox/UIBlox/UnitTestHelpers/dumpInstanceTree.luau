local function dumpInstanceTree(p1, p2)
	-- upvalues: dumpInstanceTree (ref)
	p2 = p2 or ""
	assert(p2 ~= nil, "indent must be a string")
	
	if p1 == nil then
		print(p2 .. "[nil Instance]")
		
		return
	end
	assert(p1 ~= nil, "instance must be non-nil")
	print(p2 .. p0.Name)
	p2 ..= "  "
	
	for i, v in ipairs(p1:GetChildren()) do
		dumpInstanceTree(v, p2)
	end
end

return dumpInstanceTree