local function normalizeParticipants(p1)
	if type(p1) ~= "table" then
		return p1
	end
	local t = {}
	
	for i, v in p1 do
		t[i] = if type(v) == "table" then v else { id = tostring(v) }
	end
	return t
end

return function(p2)
	-- upvalues: normalizeParticipants (ref)
	local cloned = table.clone(p2)
	cloned.participants = normalizeParticipants(p2.participants)
	
	return cloned
end