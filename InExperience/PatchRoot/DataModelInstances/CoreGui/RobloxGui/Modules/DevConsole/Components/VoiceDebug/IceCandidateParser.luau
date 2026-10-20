local config = {
	candidateType = nil,
	protocol = nil,
	priority = nil,
	component = nil
}

return function(Text: string)
	-- upvalues: config (copy)
	if Text == nil or Text == "" then
		return config
	end
	local List = {}
	
	for i in string.gmatch(Text, "%S+") do
		table.insert(List, i)
	end
	local CandidateType = nil
	
	for i1, value in List do
		if value == "typ" then
			CandidateType = List[i1 + 1]
			break
		end
	end
	return if CandidateType == nil then config else {
		candidateType = CandidateType,
		protocol = List[3],
		priority = List[4],
		component = List[2]
	}
end