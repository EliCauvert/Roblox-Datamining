local socialCommon = script:FindFirstAncestor("SocialCommon")
local _ = require(socialCommon.Enums.ChatEntryPointNames)

return require(socialCommon.Parent.Rodux).makeActionCreator(script.Name, function(p1)
	return { entryPoint = p1 }
end)