return function(p1, Callback) --[[ Line: 13 | Named "last" ]]
	local v1 = nil
	for i = #p1, 1, -1 do
		v1 = p1[i]
		
		if not Callback then
			return v1
		elseif not Callback or not Callback(v1, i) then
			continue
		else
			return v1
		end
	end
	return nil
end