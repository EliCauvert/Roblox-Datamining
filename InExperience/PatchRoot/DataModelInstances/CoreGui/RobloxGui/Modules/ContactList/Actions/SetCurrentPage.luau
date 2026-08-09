local _ = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.ContactList.Enums.Pages)

return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(p0) --[[ line: 9 ]]
	return { page = p0 }
end)