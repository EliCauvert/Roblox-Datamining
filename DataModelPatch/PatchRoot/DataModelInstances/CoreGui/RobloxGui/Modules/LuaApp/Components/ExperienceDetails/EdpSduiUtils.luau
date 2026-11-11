local RobloxAppEnumsModule = require(game:GetService("CorePackages").Workspace.Packages.RobloxAppEnums)

return {
	getEdpStoreKey = function(p1): string
		-- upvalues: RobloxAppEnumsModule (copy)
		return `{RobloxAppEnumsModule.AppPage.ExperienceDetail}_{p1}`
	end,
	getUnprocessedEdpStoreKey = function(p1): string
		-- upvalues: RobloxAppEnumsModule (copy)
		return `{RobloxAppEnumsModule.AppPage.ExperienceDetail}_{p1}_unprocessed`
	end,
	checkEdpDataStaleness = function(p1: number, p2: number): boolean
		return not p1 or p1 <= 0 or p2 * 1000 < tick() * 1000 - p1
	end
}