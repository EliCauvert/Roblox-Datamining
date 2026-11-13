local CreateFunction = table.create

return function(Admitted, Admitted1, p1)
	-- upvalues: CreateFunction (copy)
	if Admitted1 == nil or Admitted <= Admitted1 then
		return { order = nil, pending = 0, admitted = Admitted }
	end
	local CreateResult = CreateFunction(Admitted)
	
	for i = 1, Admitted do
		CreateResult[i] = i
	end
	table.sort(CreateResult, p1)
	
	return {
		order = CreateResult,
		admitted = Admitted1,
		pending = Admitted - Admitted1
	}
end