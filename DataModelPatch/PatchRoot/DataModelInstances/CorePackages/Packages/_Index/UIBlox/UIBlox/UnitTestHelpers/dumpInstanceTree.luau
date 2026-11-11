local function dumpInstanceTree(Object, p1)
	-- upvalues: dumpInstanceTree (copy)
	local P1 = p1 or ""
	assert(P1 ~= nil, "indent must be a string")
	
	if Object == nil then
		print(P1 .. "[nil Instance]")
		
		return
	end
	assert(Object ~= nil, "instance must be non-nil")
	print(P1 .. Object.Name)
	local Text = P1 .. "  "
	
	for _, child in ipairs(Object:GetChildren()) do
		dumpInstanceTree(child, Text)
	end
end

return dumpInstanceTree