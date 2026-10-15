local list = { require(script.Parent.MessageEffect).ChatWindowEnlarge }

return function(p1)
	-- upvalues: list (ref)
	local t = {}
	
	if p1 then
		for i, v in list do
			if table.find(p1, v) then
				table.insert(t, v)
			end
		end
	end
	return t
end