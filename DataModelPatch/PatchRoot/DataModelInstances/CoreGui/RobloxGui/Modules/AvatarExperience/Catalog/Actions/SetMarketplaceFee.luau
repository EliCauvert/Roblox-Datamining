local CorePackages = game:GetService("CorePackages")
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)

return require(CorePackages.Packages.Rodux).makeActionCreator(script.Name, function(MarketplaceFeeInfo)
	-- upvalues: ArgCheckModule (copy)
	ArgCheckModule.isType(MarketplaceFeeInfo, "table", "marketplaceFeeInfo")
	
	return { marketplaceFeeInfo = MarketplaceFeeInfo }
end)