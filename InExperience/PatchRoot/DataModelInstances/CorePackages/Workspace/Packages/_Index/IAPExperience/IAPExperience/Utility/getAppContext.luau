return function(): string --[[ Line: 5 | Named "getAppContext" ]]
	return if game.GameId == 0 then "UA" else "IN_EXPERIENCE"
end