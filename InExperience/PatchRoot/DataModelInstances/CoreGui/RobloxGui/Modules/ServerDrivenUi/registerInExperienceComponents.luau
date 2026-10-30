local CorePackages = game:GetService("CorePackages")

return function()
	-- upvalues: CorePackages (copy)
	require(CorePackages.Workspace.Packages.SduiSharedContent).registerSharedUiComponents()
	require(CorePackages.Workspace.Packages.SduiFoundation).registerFoundationComponents()
	require(CorePackages.Workspace.Packages.ServerDrivenUi).registerDiscoveryUiComponents()
end