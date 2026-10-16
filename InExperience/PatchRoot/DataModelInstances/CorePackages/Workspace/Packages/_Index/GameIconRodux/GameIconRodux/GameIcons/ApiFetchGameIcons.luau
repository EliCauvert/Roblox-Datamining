local gameIconRodux = script:FindFirstAncestor("GameIconRodux")
local parent = gameIconRodux.Parent
local promiseModule = require(parent.Promise)
local apiFetchThumbnails = require(parent.Http).Utils.ApiFetchThumbnails
local gamesGetIconsModule = require(gameIconRodux.GamesGetIcons)
local setGameIconsModule = require(gameIconRodux.GameIcons.SetGameIcons)
local gameIconReducerModule = require(gameIconRodux.GameIcons.GameIconReducer)

return function(p1, p2, p3)
	-- upvalues: gameIconReducerModule (ref), promiseModule (ref), apiFetchThumbnails (ref), gamesGetIconsModule (ref), setGameIconsModule (ref)
	return function(p4)
		-- upvalues: gameIconReducerModule (copy), p2 (ref), promiseModule (copy), apiFetchThumbnails (copy), p1 (ref), p3 (ref), gamesGetIconsModule (copy), setGameIconsModule (copy)
		local key = p4:getState()[gameIconReducerModule.key]
		local t = {}
		
		for i, v in pairs(p2) do
			if key[v] == nil then
				table.insert(t, v)
			end
		end
		return if #t == 0 then promiseModule.resolve() else apiFetchThumbnails.Fetch(p1, t, p3 or "150x150", "Game", gamesGetIconsModule, setGameIconsModule, p4)
	end
end