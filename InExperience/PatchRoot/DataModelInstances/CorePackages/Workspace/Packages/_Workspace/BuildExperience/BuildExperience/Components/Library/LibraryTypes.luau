local BuildExperience = script:FindFirstAncestor("BuildExperience")
local _ = require(BuildExperience.Stores.BuildLibrary.createBuildLibraryStore)
local _ = require(BuildExperience.Chat.chatTypes)
local ClientDataModelCollectorModule = require(BuildExperience.Chat.clientDataModelCollector)

return {
	toResourceUri = function(Text): string
		return "rbx-dm:" .. Text
	end,
	toResourceAttachment = function(ChatResource)
		return {
			type = "resource_link",
			mimeType = "datamodel.instance/v1",
			name = ChatResource.displayName,
			uri = "rbx-dm:" .. ChatResource.path
		}
	end,
	toChatResource = function(ChatResource)
		-- upvalues: ClientDataModelCollectorModule (copy)
		return {
			path = if ChatResource.instance == nil then ChatResource.path else ClientDataModelCollectorModule.getInstancePath(ChatResource.instance),
			displayName = ChatResource.displayName,
			className = ChatResource.className
		}
	end
}