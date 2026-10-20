local _ = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.ContactList.Enums.Pages)

return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(Page)
	return { page = Page }
end)