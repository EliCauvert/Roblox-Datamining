local EnumNetworkStatusModule = {}
local config = {
	NotStarted = "NotStarted",
	Fetching = "Fetching",
	Done = "Done",
	Failed = "Failed"
}
setmetatable(EnumNetworkStatusModule, {
	__newindex = function(_, _, _) --[[ Line: 12 ]] end,
	__index = function(_, p1) --[[ Line: 14 ]]
		-- upvalues: config (copy)
		assert(config[p1] ~= nil, "EnumNetworkStatus has no value: " .. tostring(p1))
		
		return config[p1]
	end
})

return EnumNetworkStatusModule