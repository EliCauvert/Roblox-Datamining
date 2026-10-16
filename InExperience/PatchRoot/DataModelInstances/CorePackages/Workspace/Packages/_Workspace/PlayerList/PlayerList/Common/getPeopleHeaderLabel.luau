local RobloxTranslatorModule = require(script.Parent.Parent.Parent.RobloxTranslator)

return function() --[[ Line: 7 | Named "getPeopleHeaderLabel" ]]
	-- upvalues: RobloxTranslatorModule (copy)
	return RobloxTranslatorModule:FormatByKey("InGame.PlayerList.Players")
end