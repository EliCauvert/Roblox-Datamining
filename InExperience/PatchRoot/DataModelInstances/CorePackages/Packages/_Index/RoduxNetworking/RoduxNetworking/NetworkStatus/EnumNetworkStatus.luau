local t = {}
local t_1 = {
	NotStarted = "NotStarted",
	Fetching = "Fetching",
	Done = "Done",
	Failed = "Failed"
}
setmetatable(t, {
	__newindex = function(_, _, _) end,
	__index = function(_, p0)
		-- upvalues: t_1 (ref)
		assert(t_1[p0] ~= nil, "EnumNetworkStatus has no value: " .. tostring(p0))
		
		return t_1[p0]
	end
})

return t