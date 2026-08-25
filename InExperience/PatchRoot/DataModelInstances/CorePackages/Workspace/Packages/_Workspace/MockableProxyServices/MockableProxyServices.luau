local t = {
	["jest.config"] = script["jest.config"],
	game = game,
	waitProxy = function(p0)
		wait(p0)
	end,
	settingsProxy = function()
		return settings()
	end
}
setmetatable(t, {
	__index = function(_, p1)
		return game:GetService(p1)
	end
})

return t