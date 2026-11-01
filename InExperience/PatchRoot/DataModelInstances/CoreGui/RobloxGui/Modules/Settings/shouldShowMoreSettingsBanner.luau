local CorePackages = game:GetService("CorePackages")
local IsPioneerLaunch = require(CorePackages.Workspace.Packages.PioneerUtils).isPioneerLaunch
local v1 = nil

local function _()
	-- upvalues: v1 (ref), CorePackages (copy)
	local v2 = v1
	
	if v2 then
		return v2
	else
		local AccessResponseEnum = require(CorePackages.Workspace.Packages.AccountUpgrade.Eligibility).AccessResponseEnum
		v1 = AccessResponseEnum
		
		return AccessResponseEnum
	end
end

local function defaultGetAvailability()
	-- upvalues: CorePackages (copy)
	return require(CorePackages.Workspace.Packages.AccountUpgrade.Eligibility).getAvailability(require(CorePackages.Workspace.Packages.AccountUpgrade.AccountUpgradeFlow).Pioneer)
end

local self = setmetatable({}, { __mode = "k" })

local _ = function(Callback)
	-- upvalues: self (copy), v1 (ref), CorePackages (copy)
	local SelfEntry = self[Callback]
	
	if SelfEntry then
		return SelfEntry
	end
	local CallbackResult = Callback()
	local Access = CallbackResult.access
	local AccessResponseEnum = v1
	
	if not AccessResponseEnum then
		AccessResponseEnum = require(CorePackages.Workspace.Packages.AccountUpgrade.Eligibility).AccessResponseEnum
		v1 = AccessResponseEnum
	end
	if Access == AccessResponseEnum.Denied then
		self[Callback] = CallbackResult
	end
	return CallbackResult
end

return function(p1, p2): boolean
	-- upvalues: IsPioneerLaunch (copy), defaultGetAvailability (copy), self (copy), v1 (ref), CorePackages (copy)
	if not (p1 or IsPioneerLaunch)() then
		return false
	end
	local Callback = p2 or defaultGetAvailability
	local SelfEntry = self[Callback]
	local SelfEntry1 = nil
	
	if SelfEntry then
		SelfEntry1 = SelfEntry
	else
		local CallbackResult = Callback()
		local Access = CallbackResult.access
		local AccessResponseEnum = v1
		
		if not AccessResponseEnum then
			AccessResponseEnum = require(CorePackages.Workspace.Packages.AccountUpgrade.Eligibility).AccessResponseEnum
			v1 = AccessResponseEnum
		end
		if Access == AccessResponseEnum.Denied then
			self[Callback] = CallbackResult
		end
		SelfEntry1 = CallbackResult
	end
	local Access1 = SelfEntry1.access
	local AccessResponseEnum1 = v1
	
	if not AccessResponseEnum1 then
		AccessResponseEnum1 = require(CorePackages.Workspace.Packages.AccountUpgrade.Eligibility).AccessResponseEnum
		v1 = AccessResponseEnum1
	end
	return Access1 == AccessResponseEnum1.Denied
end