local t = {}
local t_1 = {
	NotStarted = "NotStarted",
	Fetching = "Fetching",
	Done = "Done",
	Failed = "Failed"
}
setmetatable(t, {
	__newindex = function(_, _, _) end,
	__index = function(_, p1)
		-- upvalues: t_1 (ref)
		assert(t_1[p1] ~= nil, "EnumNetworkStatus has no value: " .. tostring(p1))
		
		return t_1[p1]
	end
})

return t