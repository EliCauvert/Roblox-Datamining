local t = {}
local t_1 = {
	NotStarted = "NotStarted",
	Fetching = "Fetching",
	Done = "Done",
	Failed = "Failed"
}
setmetatable(t, {
	__newindex = function(_, _, _) --[[ line: 11 ]] end,
	__index = function(_, p0) --[[ line: 12 ]]
		-- upvalues: t_1 (ref)
		assert(t_1[p0] ~= nil, "RetrievalStatus Enum has no value: " .. tostring(p0))
		
		return t_1[p0]
	end
})

return t