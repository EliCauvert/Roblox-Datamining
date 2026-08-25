local function normalizeParticipants(p0)
	if type(p0) ~= "table" then
		return p0
	end
	local t = {}
	
	for i, v in p0 do
		t[i] = if type(v) == "table" then v else { id = tostring(v) }
	end
	return t
end

return function(p1)
	-- upvalues: normalizeParticipants (ref)
	local cloned = table.clone(p1)
	cloned.participants = normalizeParticipants(p1.participants)
	
	return cloned
end