local corePackagesService = game:GetService("CorePackages")
local isPioneerLaunch = require(corePackagesService.Workspace.Packages.PioneerUtils).isPioneerLaunch
local var1 = nil

local function _()
	-- upvalues: var1 (write), corePackagesService (ref)
	if var1 then
		return var1
	end
	local accessResponseEnum = require(corePackagesService.Workspace.Packages.AccountUpgrade.Eligibility).AccessResponseEnum
	var1 = accessResponseEnum
	
	return accessResponseEnum
end

local function defaultGetAvailability()
	-- upvalues: corePackagesService (ref)
	return require(corePackagesService.Workspace.Packages.AccountUpgrade.Eligibility).getAvailability(require(corePackagesService.Workspace.Packages.AccountUpgrade.AccountUpgradeFlow).Pioneer)
end

local tbl = setmetatable({}, { __mode = "k" })

local _ = function(p1)
	-- upvalues: tbl (ref), var1 (write), corePackagesService (ref)
	local var2 = tbl[p1]
	
	if var2 then
		return var2
	end
	local var3
	local var4 = p1()
	local access = var4.access
	local var5 = var1
	
	if var5 then
		var3 = var5
	else
		var5 = require(corePackagesService.Workspace.Packages.AccountUpgrade.Eligibility).AccessResponseEnum
		var1 = var5
		var3 = var5
	end
	if access == var3.Denied then
		tbl[p1] = var4
	end
	return var4
end

return function(value, p1)
	-- upvalues: isPioneerLaunch (ref), defaultGetAvailability (ref), tbl (ref), var1 (write), corePackagesService (ref)
	if not (value or isPioneerLaunch)() then
		return false
	end
	local var2
	p1 = p1 or defaultGetAvailability
	local var3 = tbl[p1]
	
	if var3 then
		var2 = var3
	else
		local var4
		local var5 = p1()
		local access = var5.access
		local var6 = var1
		
		if var6 then
			var4 = var6
		else
			var6 = require(corePackagesService.Workspace.Packages.AccountUpgrade.Eligibility).AccessResponseEnum
			var1 = var6
			var4 = var6
		end
		if access == var4.Denied then
			tbl[p1] = var5
		end
		var2 = var5
	end
	local var7
	local access = var2.access
	local var8 = var1
	
	if var8 then
		var7 = var8
	else
		var8 = require(corePackagesService.Workspace.Packages.AccountUpgrade.Eligibility).AccessResponseEnum
		var1 = var8
		var7 = var8
	end
	return access == var7.Denied
end