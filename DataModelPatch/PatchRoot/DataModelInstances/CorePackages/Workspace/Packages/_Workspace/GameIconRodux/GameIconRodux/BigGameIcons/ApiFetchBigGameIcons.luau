local GameIconRodux = script:FindFirstAncestor("GameIconRodux")
local GamesGetIconsModule = require(GameIconRodux.GamesGetIcons)
local SetBigGameIconsModule = require(GameIconRodux.BigGameIcons.SetBigGameIcons)
local BigGameIconReducerModule = require(GameIconRodux.BigGameIcons.BigGameIconReducer)
local Parent = GameIconRodux.Parent
local PromiseModule = require(Parent.Promise)
local ApiFetchThumbnails = require(Parent.Http).Utils.ApiFetchThumbnails

return function(p1, p2, p3)
	-- upvalues: BigGameIconReducerModule (copy), PromiseModule (copy), ApiFetchThumbnails (copy), GamesGetIconsModule (copy), SetBigGameIconsModule (copy)
	return function(p4)
		-- upvalues: BigGameIconReducerModule (upval), p2 (copy), PromiseModule (upval), ApiFetchThumbnails (upval), p1 (copy), p3 (copy), GamesGetIconsModule (upval), SetBigGameIconsModule (upval)
		local StateEntry = p4:getState()[BigGameIconReducerModule.key]
		local List = {}
		
		for _, value in pairs(p2) do
			if StateEntry[value] == nil then
				table.insert(List, value)
			end
		end
		return if #List == 0 then PromiseModule.resolve() else ApiFetchThumbnails.Fetch(p1, List, p3 or "512x512", "Game", GamesGetIconsModule, SetBigGameIconsModule, p4)
	end
end