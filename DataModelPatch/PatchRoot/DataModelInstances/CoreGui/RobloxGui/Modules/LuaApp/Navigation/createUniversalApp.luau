local CorePackages = game:GetService("CorePackages")
require(CorePackages.Packages.UIBlox).init(require(CorePackages.Workspace.Packages.RobloxAppUIBloxConfig))
local ReactModule = require(CorePackages.Packages.React)
local ReactRobloxModule = require(CorePackages.Packages.ReactRoblox)
local UniversalAppModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Components.UniversalApp)

return function()
	-- upvalues: ReactRobloxModule (copy), ReactModule (copy), UniversalAppModule (copy)
	local Folder = Instance.new("Folder")
	Folder.Parent = game:GetService("CoreGui")
	local Root = ReactRobloxModule.createRoot(Folder)
	Root:render(ReactModule.createElement(UniversalAppModule))
	
	return function()
		-- upvalues: Root (copy)
		Root:unmount()
	end
end