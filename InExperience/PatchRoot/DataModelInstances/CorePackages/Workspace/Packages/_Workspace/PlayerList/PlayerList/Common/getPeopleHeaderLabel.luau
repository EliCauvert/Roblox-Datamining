local robloxTranslatorModule = require(script.Parent.Parent.Parent.RobloxTranslator)

return function()
	-- upvalues: robloxTranslatorModule (ref)
	return robloxTranslatorModule:FormatByKey("InGame.PlayerList.Players")
end