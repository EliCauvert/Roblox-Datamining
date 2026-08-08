local songbird = script:FindFirstAncestor("Songbird")
local reactModule = require(songbird.Parent.React)
local tryLoadRbxthumbAsyncModule = require(songbird.Common.tryLoadRbxthumbAsync)
local useAsync = require(songbird.Parent.ReactUtils).useAsync
local useMemo = reactModule.useMemo
local _ = { Icon = "Icon", Masthead = "Masthead" }
local list = {
	"rbxasset://textures/ui/LuaApp/graphic/album_art_fallback_blue.png",
	"rbxasset://textures/ui/LuaApp/graphic/album_art_fallback_green.png",
	"rbxasset://textures/ui/LuaApp/graphic/album_art_fallback_magenta.png",
	"rbxasset://textures/ui/LuaApp/graphic/album_art_fallback_orange.png",
	"rbxasset://textures/ui/LuaApp/graphic/album_art_fallback_pink.png",
	"rbxasset://textures/ui/LuaApp/graphic/album_art_fallback_purple.png",
	"rbxasset://textures/ui/LuaApp/graphic/album_art_fallback_turquoise.png",
	"rbxasset://textures/ui/LuaApp/graphic/album_art_fallback_yellow.png"
}
local t = {
	Icon = Vector2.new(420, 420),
	Masthead = Vector2.new(1440, 456)
}

local function _(p0) --[[ line: 35 | named "getFallbackMusicThumbnail" ]]
	-- upvalues: list (ref)
	if p0 then
		local var5 = if typeof(p0) == "string" then tonumber(p0:match("(%d+)$")) else p0
		
		return if var5 then list[var5 % #list + 1] else "rbxasset://textures/ui/LuaApp/graphic/album_art_fallback_gray.png"
	end
end

return function(p1, p2) --[[ line: 58 | named "useSongAlbumArt" ]]
	-- upvalues: useMemo (ref), list (ref), useAsync (ref), t (ref), tryLoadRbxthumbAsyncModule (ref)
	p2 = p2 or "Icon"
	local var7 = useMemo(function() --[[ line: 61 ]]
		-- upvalues: p1 (ref), list (copy)
		if p1 then
			local var9 = if typeof(p1) == "string" then tonumber(p1:match("(%d+)$")) else p1
			
			return if var9 then list[var9 % #list + 1] else "rbxasset://textures/ui/LuaApp/graphic/album_art_fallback_gray.png"
		end
	end, { p1 })
	local var8 = useAsync(function() --[[ line: 65 ]]
		-- upvalues: p1 (ref), t (copy), p2 (ref), tryLoadRbxthumbAsyncModule (copy)
		if p1 then
			local var10 = t[p2]
			local var11 = `rbxthumb://type=Asset&id={p1}&w={var10.X}&h={var10.Y}`
			
			return if pcall(tryLoadRbxthumbAsyncModule, var11) then var11 else nil
		end
	end, { p2, p1 })
	
	return {
		status = var8.status,
		value = useMemo(function() --[[ line: 79 ]]
			-- upvalues: var8 (ref), var7 (ref)
			return if var8.status == "ok" and var8.value then var8.value else var7
		end, { var8, var7 })
	}
end