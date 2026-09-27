local buildExperience = script:FindFirstAncestor("BuildExperience")
local _ = require(buildExperience.Stores.BuildLibrary.createBuildLibraryStore)
local _ = require(buildExperience.Chat.chatTypes)
local clientDataModelCollectorModule = require(buildExperience.Chat.clientDataModelCollector)

return {
	toResourceUri = function(p1)
		return "rbx-dm:" .. p0
	end,
	toResourceAttachment = function(p1)
		return {
			type = "resource_link",
			mimeType = "datamodel.instance/v1",
			name = p1.displayName,
			uri = "rbx-dm:" .. p1.path
		}
	end,
	toChatResource = function(p1)
		-- upvalues: clientDataModelCollectorModule (ref)
		return {
			path = if p1.instance ~= nil then p1.path else clientDataModelCollectorModule.getInstancePath(p1.instance),
			displayName = p1.displayName,
			className = p1.className
		}
	end
}