game:DefineFastInt("LuaAppRecommendedGamesCount", 6)

return function() --[[ line: 3 ]]
	local luaAppRecommendedGamesCountFastInt = game:GetFastInt("LuaAppRecommendedGamesCount")
	
	if luaAppRecommendedGamesCountFastInt > 20 then
		warn("Maximum Recommended Games Fetch Count has exceeded 20: ", luaAppRecommendedGamesCountFastInt)
	end
	return luaAppRecommendedGamesCountFastInt
end