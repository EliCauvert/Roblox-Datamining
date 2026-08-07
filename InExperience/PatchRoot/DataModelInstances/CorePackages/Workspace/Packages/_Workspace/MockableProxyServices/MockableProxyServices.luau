local t = {
	["jest.config"] = script["jest.config"],
	game = game,
	waitProxy = function(p0) --[[ line: 4 ]]
		wait(p0)
	end,
	settingsProxy = function() --[[ line: 7 ]]
		return settings()
	end
}
setmetatable(t, {
	__index = function(_, p1) --[[ line: 13 ]]
		return game:GetService(p1)
	end
})

return t