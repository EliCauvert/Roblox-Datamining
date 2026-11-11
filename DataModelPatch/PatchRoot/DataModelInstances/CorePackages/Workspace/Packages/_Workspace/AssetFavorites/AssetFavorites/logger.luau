local AssetFavorites = require(script:FindFirstAncestor("AssetFavorites").Parent.Lumberyak).Logger.new(nil, "AssetFavorites")
local Success, Result = pcall(function()
	return {
		level = game:DefineFastString("DebugLuaLogLevel", ""),
		pattern = game:DefineFastString("DebugLuaLogPattern", "")
	}
end)

if not Success then
	Result = { level = "debug", pattern = "" }
end
AssetFavorites:setContext({ prefix = "[{loggerName} - {level}] - " })
AssetFavorites:addSink({
	maxLevel = AssetFavorites.Levels.fromString(Result.level),
	log = function(_, p1, _)
		-- upvalues: Result (ref)
		if p1:match(Result.pattern) then
			print(p1)
		end
	end
})

return AssetFavorites