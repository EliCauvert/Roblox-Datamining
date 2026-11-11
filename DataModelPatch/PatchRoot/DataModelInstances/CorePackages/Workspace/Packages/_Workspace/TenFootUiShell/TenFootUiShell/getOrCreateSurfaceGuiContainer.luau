local CoreGui = game:GetService("CoreGui")
local ConstantsModule = require(script:FindFirstAncestor("TenFootUiShell").Constants)

return function()
	-- upvalues: CoreGui (copy), ConstantsModule (copy)
	local SURFACEGUIFOLDERNAME = CoreGui:FindFirstChild(ConstantsModule.SURFACE_GUI_FOLDER_NAME)
	
	if not SURFACEGUIFOLDERNAME then
		local Folder = Instance.new("Folder")
		Folder.Name = ConstantsModule.SURFACE_GUI_FOLDER_NAME
		Folder.Parent = CoreGui
		SURFACEGUIFOLDERNAME = Folder
	end
	return SURFACEGUIFOLDERNAME
end