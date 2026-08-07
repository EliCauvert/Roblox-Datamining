local songbird = script:FindFirstAncestor("Songbird")
local reactModule = require(songbird.Parent.React)
local tryLoadRbxthumbAsyncModule = require(songbird.Common.tryLoadRbxthumbAsync)
local useAsync = require(songbird.Parent.ReactUtils).useAsync
local useMemo = reactModule.useMemo
local t = { Icon = "Icon", Masthead = "Masthead" }
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
local t_1 = {
	[t.Icon] = Vector2.new(420, 420),
	[t.Masthead] = Vector2.new(1440, 456)
}

local function _(p0) --[[ line: 35 | named "getFallbackMusicThumbnail" ]]
	-- upvalues: list (ref)
	if p0 then
		local var6 = if typeof(p0) == "string" then tonumber(p0:match("(%d+)$")) else p0
		
		return if var6 then list[var6 % #list + 1] else "rbxasset://textures/ui/LuaApp/graphic/album_art_fallback_gray.png"
	end
end

return function(p1, p2) --[[ line: 58 | named "useSongAlbumArt" ]]
	-- upvalues: t (ref), useMemo (ref), list (ref), useAsync (ref), t_1 (ref), tryLoadRbxthumbAsyncModule (ref)
	local var7 = p2 or t.Icon
	local var8 = useMemo(function() --[[ line: 61 ]]
		-- upvalues: p1 (ref), list (copy)
		if p1 then
			local var10 = if typeof(p1) == "string" then tonumber(p1:match("(%d+)$")) else p1
			
			return if var10 then list[var10 % #list + 1] else "rbxasset://textures/ui/LuaApp/graphic/album_art_fallback_gray.png"
		end
	end, { p1 })
	local var9 = useAsync(function() --[[ line: 65 ]]
		-- upvalues: p1 (ref), t_1 (copy), var7 (ref), tryLoadRbxthumbAsyncModule (copy)
		if p1 then
			local var11 = t_1[var7]
			local var12 = `rbxthumb://type=Asset&id={p1}&w={var11.X}&h={var11.Y}`
			
			return if pcall(tryLoadRbxthumbAsyncModule, var12) then var12 else nil
		end
	end, { var7, p1 })
	
	return {
		status = var9.status,
		value = useMemo(function() --[[ line: 79 ]]
			-- upvalues: var9 (ref), var8 (ref)
			return if var9.status == "ok" and var9.value then var9.value else var8
		end, { var9, var8 })
	}
end