local gameIconRodux = script:FindFirstAncestor("GameIconRodux")
local gamesGetIconsModule = require(gameIconRodux.GamesGetIcons)
local setBigGameIconsModule = require(gameIconRodux.BigGameIcons.SetBigGameIcons)
local bigGameIconReducerModule = require(gameIconRodux.BigGameIcons.BigGameIconReducer)
local parent = gameIconRodux.Parent
local promiseModule = require(parent.Promise)
local apiFetchThumbnails = require(parent.Http).Utils.ApiFetchThumbnails

return function(p0, p1, p2)
	-- upvalues: bigGameIconReducerModule (ref), promiseModule (ref), apiFetchThumbnails (ref), gamesGetIconsModule (ref), setBigGameIconsModule (ref)
	return function(p3)
		-- upvalues: bigGameIconReducerModule (copy), p1 (ref), promiseModule (copy), apiFetchThumbnails (copy), p0 (ref), p2 (ref), gamesGetIconsModule (copy), setBigGameIconsModule (copy)
		local key = p3:getState()[bigGameIconReducerModule.key]
		local t = {}
		
		for i, v in pairs(p1) do
			if key[v] == nil then
				table.insert(t, v)
			end
		end
		return if #t == 0 then promiseModule.resolve() else apiFetchThumbnails.Fetch(p0, t, p2 or "512x512", "Game", gamesGetIconsModule, setBigGameIconsModule, p3)
	end
end