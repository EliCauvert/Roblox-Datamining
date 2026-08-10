local robloxTranslatorModule = require(script.Parent.Parent.Parent.RobloxTranslator)

return function() --[[ line: 7 | named "getPeopleHeaderLabel" ]]
	-- upvalues: robloxTranslatorModule (ref)
	return robloxTranslatorModule:FormatByKey("InGame.PlayerList.Players")
end