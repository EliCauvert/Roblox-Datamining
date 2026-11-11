local RobloxTranslatorModule = require(script.Parent.Parent.Parent.RobloxTranslator)

return function()
	-- upvalues: RobloxTranslatorModule (copy)
	return RobloxTranslatorModule:FormatByKey("InGame.PlayerList.Players")
end