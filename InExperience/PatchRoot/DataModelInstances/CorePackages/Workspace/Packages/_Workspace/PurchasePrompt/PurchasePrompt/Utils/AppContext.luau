return {
	Enum = { IN_APP = "IN_APP", IN_EXPERIENCE = "IN_EXPERIENCE" },
	get = function() --[[ line: 14 ]]
		return if game.GameId == 0 then "IN_APP" else "IN_EXPERIENCE"
	end
}