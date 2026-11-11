local RetrievalStatusModule = {}
local config = {
	NotStarted = "NotStarted",
	Fetching = "Fetching",
	Done = "Done",
	Failed = "Failed"
}
setmetatable(RetrievalStatusModule, {
	__newindex = function(_, _, _) end,
	__index = function(_, p1)
		-- upvalues: config (copy)
		assert(config[p1] ~= nil, "RetrievalStatus Enum has no value: " .. tostring(p1))
		
		return config[p1]
	end
})

return RetrievalStatusModule