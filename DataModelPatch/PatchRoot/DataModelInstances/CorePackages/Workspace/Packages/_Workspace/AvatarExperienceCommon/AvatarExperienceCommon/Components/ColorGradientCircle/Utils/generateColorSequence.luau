local function deduplicateBodyColor3s(List)
	local List1 = {}
	local t = {}
	
	for _, value in List do
		local Text = tostring(value)
		
		if not t[Text] then
			table.insert(List1, value)
			t[Text] = true
		end
	end
	return List1
end

return function(p1): ColorSequence
	-- upvalues: deduplicateBodyColor3s (copy)
	local DeduplicateBodyColor3sResult = deduplicateBodyColor3s(p1)
	local CountDeduplicateBodyColor3sResult = #DeduplicateBodyColor3sResult
	
	if CountDeduplicateBodyColor3sResult == 1 then
		local DeduplicateBodyColor3sResultEntry = DeduplicateBodyColor3sResult[1]
		
		return ColorSequence.new(DeduplicateBodyColor3sResultEntry, DeduplicateBodyColor3sResultEntry)
	end
	local ColorSequenceKeypoints = {}
	local v1 = 1 / (CountDeduplicateBodyColor3sResult - 1 + 1.6)
	
	for i, value in DeduplicateBodyColor3sResult do
		table.insert(ColorSequenceKeypoints, ColorSequenceKeypoint.new(if i == 1 then 0 elseif i == CountDeduplicateBodyColor3sResult then 1 else (i - 1 + 0.8) * v1, value))
	end
	return ColorSequence.new(ColorSequenceKeypoints)
end