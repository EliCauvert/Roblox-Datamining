game:DefineFastInt("LuaAppRecommendedGamesCount", 6)

return function(): number
	local LuaAppRecommendedGamesCountFastInt: number = game:GetFastInt("LuaAppRecommendedGamesCount")
	
	if LuaAppRecommendedGamesCountFastInt > 20 then
		warn("Maximum Recommended Games Fetch Count has exceeded 20: ", LuaAppRecommendedGamesCountFastInt)
	end
	return LuaAppRecommendedGamesCountFastInt
end