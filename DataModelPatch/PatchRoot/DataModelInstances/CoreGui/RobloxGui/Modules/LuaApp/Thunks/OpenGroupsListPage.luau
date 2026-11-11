local CorePackages = game:GetService("CorePackages")
local NavigateDownFunction = require(CorePackages.Workspace.Packages.NavigationRodux).Thunks.NavigateDown
local TModule = require(CorePackages.Packages.t)
local AppPage = require(CorePackages.Workspace.Packages.RobloxAppEnums).AppPage

return function(OnClose)
	-- upvalues: TModule (copy), NavigateDownFunction (copy), AppPage (copy)
	assert(TModule.callback(OnClose) or TModule.none(OnClose), "")
	
	return NavigateDownFunction({
		name = AppPage.Groups,
		extraProps = { onClose = OnClose }
	})
end