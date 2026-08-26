local gameIconRodux = script:FindFirstAncestor("GameIconRodux")
local gamesGetIconsModule = require(gameIconRodux.GamesGetIcons)
local setBigGameIconsModule = require(gameIconRodux.BigGameIcons.SetBigGameIcons)
local bigGameIconReducerModule = require(gameIconRodux.BigGameIcons.BigGameIconReducer)
local parent = gameIconRodux.Parent
local promiseModule = require(parent.Promise)
local apiFetchThumbnails = require(parent.Http).Utils.ApiFetchThumbnails

return function(p1, p2, p3)
	-- upvalues: bigGameIconReducerModule (ref), promiseModule (ref), apiFetchThumbnails (ref), gamesGetIconsModule (ref), setBigGameIconsModule (ref)
	return function(p4)
		-- upvalues: bigGameIconReducerModule (copy), p2 (ref), promiseModule (copy), apiFetchThumbnails (copy), p1 (ref), p3 (ref), gamesGetIconsModule (copy), setBigGameIconsModule (copy)
		local key = p4:getState()[bigGameIconReducerModule.key]
		local t = {}
		
		for i, v in pairs(p2) do
			if key[v] == nil then
				table.insert(t, v)
			end
		end
		return if #t == 0 then promiseModule.resolve() else apiFetchThumbnails.Fetch(p1, t, p3 or "512x512", "Game", gamesGetIconsModule, setBigGameIconsModule, p4)
	end
end