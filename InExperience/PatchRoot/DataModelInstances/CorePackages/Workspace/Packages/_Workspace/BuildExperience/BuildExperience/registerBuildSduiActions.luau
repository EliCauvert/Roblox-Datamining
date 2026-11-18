local BuildExperience = script:FindFirstAncestor("BuildExperience")
local SduiCoreSystemModule = require(BuildExperience.Parent.SduiCoreSystem)
local SduiActionType = SduiCoreSystemModule.SduiActionType
local GetSduiActionHandlerRegistryFunction = SduiCoreSystemModule.getSduiActionHandlerRegistry

return function()
	-- upvalues: SduiActionType (copy), BuildExperience (copy), GetSduiActionHandlerRegistryFunction (copy)
	GetSduiActionHandlerRegistryFunction().registerActionHandlerConfigs({
		[SduiActionType.OpenBuildChatWithPrompt] = {
			lazyHandler = function()
				-- upvalues: BuildExperience (upval)
				return require(BuildExperience.Inspiration.SduiOpenBuildChatWithPromptAction)
			end
		},
		[SduiActionType.OpenBuildInspirationSeeMore] = {
			lazyHandler = function()
				-- upvalues: BuildExperience (upval)
				return require(BuildExperience.Inspiration.SduiOpenBuildInspirationSeeMoreAction)
			end
		}
	})
end