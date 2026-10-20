local function v0(A, B): boolean
	return B.uploadedAtTimestamp < A.uploadedAtTimestamp
end

return function(p1, List)
	-- upvalues: v0 (copy)
	local Count = 1
	local Count1 = 1
	local List1 = {}
	local t = {}
	table.sort(List, v0)
	while Count <= #List and Count1 <= #p1 do
		if p1[Count1].uploadedAtTimestamp <= List[Count].uploadedAtTimestamp then
			if not t[List[Count].postId] then
				table.insert(List1, List[Count])
				t[List[Count].postId] = true
			end
			Count += 1
		else
			if not t[p1[Count1].postId] then
				table.insert(List1, p1[Count1])
				t[p1[Count1].postId] = true
			end
			Count1 += 1
		end
	end
	if Count <= #List then
		for i = Count, #List do
			if not t[List[i].postId] then
				table.insert(List1, List[i])
				t[List[i].postId] = true
			end
		end
	end
	if Count1 <= #p1 then
		for i1 = Count1, #p1 do
			if not t[p1[i1].postId] then
				table.insert(List1, p1[i1])
				t[p1[i1].postId] = true
			end
		end
	end
	return List1
end