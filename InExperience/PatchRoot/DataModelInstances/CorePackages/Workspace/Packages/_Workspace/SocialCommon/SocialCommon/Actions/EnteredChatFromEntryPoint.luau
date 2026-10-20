local SocialCommon = script:FindFirstAncestor("SocialCommon")
local _ = require(SocialCommon.Enums.ChatEntryPointNames)

return require(SocialCommon.Parent.Rodux).makeActionCreator(script.Name, function(EntryPoint)
	return { entryPoint = EntryPoint }
end)