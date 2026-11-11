local Songbird = script:FindFirstAncestor("Songbird")
local TryLoadRbxthumbAsyncModule = require(Songbird.Common.tryLoadRbxthumbAsync)
local UseAsyncFunction = require(Songbird.Parent.ReactUtils).useAsync
local UseMemoFunction = require(Songbird.Parent.React).useMemo
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
local config = {
	Icon = Vector2.new(420, 420),
	Masthead = Vector2.new(1440, 456)
}

local function _(p1)
	-- upvalues: list (copy)
	if p1 then
		local Number = if typeof(p1) == "string" then tonumber((p1:match("(%d+)$"))) else p1
		
		if Number then
			return list[Number % #list + 1]
		end
	end
	return "rbxasset://textures/ui/LuaApp/graphic/album_art_fallback_gray.png"
end

return function(p1, p2)
	-- upvalues: UseMemoFunction (copy), list (copy), UseAsyncFunction (copy), config (copy), TryLoadRbxthumbAsyncModule (copy)
	local P2 = p2 or "Icon"
	local UseMemoResult = UseMemoFunction(function()
		-- upvalues: p1 (copy), list (upval)
		if p1 then
			local Number = if typeof(p1) == "string" then tonumber((p1:match("(%d+)$"))) else p1
			
			if Number then
				return list[Number % #list + 1]
			end
		end
		return "rbxasset://textures/ui/LuaApp/graphic/album_art_fallback_gray.png"
	end, { p1 })
	local UseAsyncResult = UseAsyncFunction(function(): string?
		-- upvalues: p1 (copy), config (upval), P2 (copy), TryLoadRbxthumbAsyncModule (upval)
		if p1 then
			local Entry = config[P2]
			local RbxthumbName: string = `rbxthumb://type=Asset&id={p1}&w={Entry.X}&h={Entry.Y}`
			
			if pcall(TryLoadRbxthumbAsyncModule, RbxthumbName) then
				return RbxthumbName
			end
		end
		return nil
	end, { P2, p1 })
	
	return {
		status = UseAsyncResult.status,
		value = UseMemoFunction(function()
			-- upvalues: UseAsyncResult (copy), UseMemoResult (copy)
			return if UseAsyncResult.status == "ok" and UseAsyncResult.value then UseAsyncResult.value else UseMemoResult
		end, { UseAsyncResult, UseMemoResult })
	}
end