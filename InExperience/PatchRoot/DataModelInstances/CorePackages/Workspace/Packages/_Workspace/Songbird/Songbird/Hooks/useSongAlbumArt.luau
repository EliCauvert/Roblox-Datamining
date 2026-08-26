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

local function _(p1)
	-- upvalues: list (ref)
	if p1 then
		local var1 = if typeof(p1) == "string" then tonumber(p1:match("(%d+)$")) else p1
		
		return if var1 then list[var1 % #list + 1] else "rbxasset://textures/ui/LuaApp/graphic/album_art_fallback_gray.png"
	end
end

return function(p1, p2)
	-- upvalues: useMemo (ref), list (ref), useAsync (ref), t (ref), tryLoadRbxthumbAsyncModule (ref)
	p2 = p2 or "Icon"
	local var1 = useMemo(function()
		-- upvalues: p1 (ref), list (copy)
		if p1 then
			local var2 = if typeof(p1) == "string" then tonumber(p1:match("(%d+)$")) else p1
			
			return if var2 then list[var2 % #list + 1] else "rbxasset://textures/ui/LuaApp/graphic/album_art_fallback_gray.png"
		end
	end, { p1 })
	local var2 = useAsync(function()
		-- upvalues: p1 (ref), t (copy), p2 (ref), tryLoadRbxthumbAsyncModule (copy)
		if p1 then
			local var3 = t[p2]
			local var4 = `rbxthumb://type=Asset&id={p1}&w={var3.X}&h={var3.Y}`
			
			return if pcall(tryLoadRbxthumbAsyncModule, var4) then var4 else nil
		end
	end, { p2, p1 })
	
	return {
		status = var2.status,
		value = useMemo(function()
			-- upvalues: var2 (ref), var1 (ref)
			return if var2.status == "ok" and var2.value then var2.value else var1
		end, { var2, var1 })
	}
end