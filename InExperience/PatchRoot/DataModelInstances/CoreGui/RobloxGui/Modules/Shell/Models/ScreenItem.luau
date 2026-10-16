return {
	Priority = { Default = 1, Overlay = 2, Elevated = 3, Immediate = 4 },
	new = function(Id, Priority, Data) --[[ Line: 10 ]]
		return {
			id = Id,
			priority = Priority,
			createdAt = tick(),
			data = Data
		}
	end
}