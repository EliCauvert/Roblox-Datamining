return function(p1)
	local Chips = if typeof(p1) == "table" then p1.chips else nil
	local Options = if typeof(Chips) == "table" then Chips.options else nil
	
	if typeof(Options) ~= "table" then
		error("build suggestions response is missing chips.options")
	end
	local Chips1 = {}
	
	for _, option in Options do
		if typeof(option) == "table" and typeof(option.value) == "string" and option.value ~= "" then
			table.insert(Chips1, { value = option.value })
		end
	end
	return {
		prompt = if typeof(p1.prompt) == "string" then p1.prompt else nil,
		chips = Chips1
	}
end