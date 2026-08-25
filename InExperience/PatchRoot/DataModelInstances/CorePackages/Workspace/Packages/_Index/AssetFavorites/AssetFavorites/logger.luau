local assetFavorites = require(script:FindFirstAncestor("AssetFavorites").Parent.Lumberyak).Logger.new(nil, "AssetFavorites")
local ok, status = pcall(function()
	return {
		level = game:DefineFastString("DebugLuaLogLevel", ""),
		pattern = game:DefineFastString("DebugLuaLogPattern", "")
	}
end)

if not ok then
	status = { level = "debug", pattern = "" }
end
assetFavorites:setContext({ prefix = "[{loggerName} - {level}] - " })
assetFavorites:addSink({
	maxLevel = assetFavorites.Levels.fromString(status.level),
	log = function(_, p0, _)
		-- upvalues: status (write)
		if p0:match(status.pattern) then
			print(p0)
		end
	end
})

return assetFavorites