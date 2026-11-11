local CorePackages = game:GetService("CorePackages")
local AppPage = require(CorePackages.Workspace.Packages.RobloxAppEnums).AppPage
local _ = require(CorePackages.Workspace.Packages.Navigation)

return function()
	-- upvalues: AppPage (copy)
	return {
		{
			[AppPage.Groups] = {
				getScreen = function()
					return require(script.Parent.GroupsUniversalAppWrapper)
				end,
				navigationOptions = { disableBackButton = false }
			}
		}
	}
end