local CorePackages = game:GetService("CorePackages")

return function()
	-- upvalues: CorePackages (copy)
	require(CorePackages.Workspace.Packages.SduiSharedContent).registerSharedActions()
	require(CorePackages.Workspace.Packages.ServerDrivenUi).registerDiscoveryActions()
end