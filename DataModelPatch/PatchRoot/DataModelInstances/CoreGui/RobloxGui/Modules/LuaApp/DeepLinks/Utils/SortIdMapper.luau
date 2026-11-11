local FFlagLuaAppSortDeeplinkFix = require(game:GetService("CorePackages").Workspace.Packages.SharedFlags).FFlagLuaAppSortDeeplinkFix
local FStringDeeplinkOmniSortIdMap = game:DefineFastString("FStringDeeplinkOmniSortIdMap", "        Curated = 100000008,\n        Continue = 100000003,\n        Sponsored = 400000000,\n        Favorites = 100000001,\n    ")
local FStringDeeplinkSortIdMap = game:DefineFastString("FStringDeeplinkSortIdMap", "        Continue_Playing = 100000003,\n        Sponsored = 400000000,\n        Top_Earning = Top_Earning_L7RS_V4,\n        Up_And_Coming = Up_And_Coming_V4,\n        Top_Revisited = Top_Revisited_Existing_Users_V4,\n        Top_Trending = Top_Trending_V4,\n        Fun_With_Friends = Fun_With_Friends_V4,\n        Top_Rated = Top_Rated_V4,\n        Most_Engaging = Most_engaging_V4,\n        Top_Paid = Top_Paid_V4,\n        Trending_in_Roleplay = Trending_in_Roleplay_V4,\n        Trending_in_Simulator = Trending_in_Simulator_V4,\n        Trending_in_Fighting = Trending_in_Fighting_V4,\n        Trending_in_Action = Trending_in_Action_V4,\n        Trending_in_Tycoon = Trending_in_Tycoon_V4,\n        Trending_in_Survival = Trending_in_Survival_V4,\n        Trending_in_Obby = Trending_in_Obby_V4,\n        Trending_in_Strategy = Trending_in_Strategy_V4,\n        Trending_in_Racing = Trending_in_Racing_V4,\n        Trending_in_Sports = Trending_in_Sports_V4,\n        Trending_in_Shooting = Trending_in_Shooting_V4,\n        Trending_in_Hangout = Trending_in_Hangout_V4,\n        Only_17_Plus = Only_17_Plus_V4,\n        Learn_And_Explore = Learn_And_Explore_V4,\n        More_When_You_Subscribe = More_When_You_Subscribe_V4,\n    ")
local FStringOmniSortsList = game:DefineFastString("FStringOmniSortsList", "100000003, 400000000")
local t = {}
local T = if FFlagLuaAppSortDeeplinkFix then nil else {}
local Flag = false

return function(Text: string)
	-- upvalues: FFlagLuaAppSortDeeplinkFix (copy), Flag (ref), FStringDeeplinkOmniSortIdMap (copy), t (copy), FStringDeeplinkSortIdMap (copy), FStringOmniSortsList (copy), T (copy)
	if FFlagLuaAppSortDeeplinkFix then
		if not Flag then
			for Text1, value in FStringDeeplinkOmniSortIdMap:gmatch("([_%w]+) ?= ?([_%w]+)") do
				t[Text1:lower()] = value
			end
			Flag = true
		end
		local Entry = t[Text:lower()]
		
		return Entry or Text:lower(), Entry ~= nil
	else
		if not Flag then
			for Text2, value1 in FStringDeeplinkSortIdMap:gmatch("([_%w]+) ?= ?([_%w]+)") do
				t[Text2:lower()] = value1
			end
			for i in FStringOmniSortsList:gmatch("(%w+)") do
				T[i] = true
			end
			Flag = true
		end
		local Entry = t[Text:lower()]
		
		if Entry then
			return Entry, T[Entry] or false
		else
			return Text, T[Text] or false
		end
	end
end