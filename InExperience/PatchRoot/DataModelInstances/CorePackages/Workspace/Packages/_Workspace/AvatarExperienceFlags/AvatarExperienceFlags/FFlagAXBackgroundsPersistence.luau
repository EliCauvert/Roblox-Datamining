local FFlagAXBackgroundsCustomizeHydrationModule = require(script.Parent.FFlagAXBackgroundsCustomizeHydration)
local AXBackgroundsPersistence = game:DefineFastFlag("AXBackgroundsPersistence", false)
local Success = pcall(function() --[[ Line: 7 ]]
	local _ = Enum.AvatarAssetType.AvatarBackground
	local _ = game:GetService("AvatarEditorService").PromptApplyProfileConfigurationCompleted
	assert(typeof(game:GetService("Players").GetProfileConfigurationFromUserIdAsync) == "function", "GetProfileConfigurationFromUserIdAsync is unavailable")
end)

return require(script.Parent.FFlagAXBackgroundsRoot) and (FFlagAXBackgroundsCustomizeHydrationModule and (AXBackgroundsPersistence and Success))