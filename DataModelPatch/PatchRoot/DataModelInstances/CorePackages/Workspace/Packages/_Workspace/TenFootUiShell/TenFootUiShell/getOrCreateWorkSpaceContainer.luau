local ConstantsModule = require(script:FindFirstAncestor("TenFootUiShell").Constants)

return function()
	-- upvalues: ConstantsModule (copy)
	local WORKSPACEFOLDERNAME = workspace:FindFirstChild(ConstantsModule.WORKSPACE_FOLDER_NAME)
	
	if not WORKSPACEFOLDERNAME then
		local Folder = Instance.new("Folder")
		Folder.Name = ConstantsModule.WORKSPACE_FOLDER_NAME
		Folder.Parent = workspace
		WORKSPACEFOLDERNAME = Folder
	end
	return WORKSPACEFOLDERNAME
end