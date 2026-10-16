return function() --[[ Line: 4 | Named "createUniqueKey" ]]
	local t = {}
	
	return function(Key) --[[ Line: 7 ]]
		-- upvalues: t (copy)
		local Text = nil
		if t[Key] == nil then
			t[Key] = 1
			
			return Key
		end
		while true do
			t[Key] += 1
			Text = `{Key}_{t[Key]}`
			if t[Text] == nil then
				break
			end
		end
		return Text
	end
end