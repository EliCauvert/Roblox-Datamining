local Count = 1
local self = setmetatable({}, { __mode = "k" })

return function(Key)
	-- upvalues: self (copy), Count (ref)
	if Key == nil then
		return 0
	end
	local SelfEntry = self[Key]
	
	if not SelfEntry then
		SelfEntry = Count
		Count += 1
		self[Key] = SelfEntry
	end
	return SelfEntry
end