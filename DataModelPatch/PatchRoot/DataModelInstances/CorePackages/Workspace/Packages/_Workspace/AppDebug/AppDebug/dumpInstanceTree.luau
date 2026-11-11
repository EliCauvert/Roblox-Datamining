local function _(p1, p2)
	local Success, Result = pcall(function()
		-- upvalues: p1 (copy), p2 (copy)
		return p1[p2]
	end)
	
	return if Success then tostring(Result) else nil
end

local function dumpInstance(p1, p2): string
	local Name = p1.Name
	local Flag = false
	local P3 = p2 or {}
	for _, value in P3 do
		local Success, Result = pcall(function()
			-- upvalues: p1 (copy), value (copy)
			return p1[value]
		end)
		local Text = if Success then tostring(Result) else nil
		
		if Text then
			local Text1 = nil
			if Flag then
				Text1 = Name .. ", "
			else
				Flag = true
				Text1 = Name .. "   ("
			end
			Name = Text1 .. value .. "=" .. Text
		end
	end
	if Flag then
		Name ..= ")"
	end
	return Name .. "\n"
end

local function dumpInstanceTree(Object, p3, Text): string
	-- upvalues: dumpInstance (copy), dumpInstanceTree (copy)
	if Object == nil then
		return Text .. "[nil Instance]\n"
	end
	if Object.Name == nil then
		return Text .. "[Invalid Instance]\n"
	end
	local Text1 = Text .. dumpInstance(Object, p3)
	
	for _, child in Object:GetChildren() do
		Text1 ..= dumpInstanceTree(child, p3, Text .. "   ")
	end
	return Text1
end

return function(p4, p5)
	-- upvalues: dumpInstanceTree (copy)
	return (dumpInstanceTree(p4, p5, ""))
end