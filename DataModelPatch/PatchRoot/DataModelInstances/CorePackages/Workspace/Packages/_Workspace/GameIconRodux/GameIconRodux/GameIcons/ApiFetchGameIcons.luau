local GameIconRodux = script:FindFirstAncestor("GameIconRodux")
local Parent = GameIconRodux.Parent
local PromiseModule = require(Parent.Promise)
local ApiFetchThumbnails = require(Parent.Http).Utils.ApiFetchThumbnails
local GamesGetIconsModule = require(GameIconRodux.GamesGetIcons)
local SetGameIconsModule = require(GameIconRodux.GameIcons.SetGameIcons)
local GameIconReducerModule = require(GameIconRodux.GameIcons.GameIconReducer)

return function(p1, p2, p3)
	-- upvalues: GameIconReducerModule (copy), PromiseModule (copy), ApiFetchThumbnails (copy), GamesGetIconsModule (copy), SetGameIconsModule (copy)
	return function(p4)
		-- upvalues: GameIconReducerModule (upval), p2 (copy), PromiseModule (upval), ApiFetchThumbnails (upval), p1 (copy), p3 (copy), GamesGetIconsModule (upval), SetGameIconsModule (upval)
		local StateEntry = p4:getState()[GameIconReducerModule.key]
		local List = {}
		
		for _, value in pairs(p2) do
			if StateEntry[value] == nil then
				table.insert(List, value)
			end
		end
		return if #List == 0 then PromiseModule.resolve() else ApiFetchThumbnails.Fetch(p1, List, p3 or "150x150", "Game", GamesGetIconsModule, SetGameIconsModule, p4)
	end
end