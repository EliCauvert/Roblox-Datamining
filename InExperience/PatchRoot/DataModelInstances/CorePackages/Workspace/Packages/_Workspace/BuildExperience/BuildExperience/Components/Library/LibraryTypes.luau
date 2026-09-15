local buildExperience = script:FindFirstAncestor("BuildExperience")
local _ = require(buildExperience.Parent.DataHydration.BuildLibrary)
local _ = require(buildExperience.Chat.chatTypes)

return {
	toChatReference = function(p1)
		return {
			path = p1.path,
			displayName = p1.displayName,
			className = p1.className
		}
	end
}