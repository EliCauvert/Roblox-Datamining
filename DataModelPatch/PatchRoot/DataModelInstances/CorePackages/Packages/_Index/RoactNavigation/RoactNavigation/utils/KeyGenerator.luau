local Text = "id-" .. tostring(math.random(100000, 1000000))
local Count = 0

return {
	_TESTING_ONLY_normalize_keys = function()
		-- upvalues: Text (ref), Count (ref)
		Text = "id-"
		Count = 0
	end,
	generateKey = function(): string
		-- upvalues: Text (ref), Count (ref)
		local Text1 = Text .. tostring(Count)
		Count += 1
		
		return Text1
	end
}