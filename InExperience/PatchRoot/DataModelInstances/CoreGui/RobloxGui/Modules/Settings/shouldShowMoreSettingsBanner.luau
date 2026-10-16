local CorePackages = game:GetService("CorePackages")
local IsPioneerLaunch = require(CorePackages.Workspace.Packages.PioneerUtils).isPioneerLaunch
local v1 = nil

local function _() --[[ Line: 12 | Named "getAccessResponseEnum" ]]
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

local function defaultGetAvailability() --[[ Line: 28 ]]
	-- upvalues: CorePackages (copy)
	return require(CorePackages.Workspace.Packages.AccountUpgrade.Eligibility).getAvailability(require(CorePackages.Workspace.Packages.AccountUpgrade.AccountUpgradeFlow).Pioneer)
end

local self = setmetatable({}, { __mode = "k" })

local _ = function(Callback) --[[ Line: 36 | Named "getAvailabilityOnce" ]]
	-- upvalues: self (copy), v1 (ref), CorePackages (copy)
	local SelfEntry = self[Callback]
	
	if SelfEntry then
		return SelfEntry
	end
	local CallbackResult = Callback()
	local Access = CallbackResult.access
	local v2 = v1
	local v3 = nil
	
	if v2 then
		v3 = v2
	else
		local AccessResponseEnum = require(CorePackages.Workspace.Packages.AccountUpgrade.Eligibility).AccessResponseEnum
		v1 = AccessResponseEnum
		v3 = AccessResponseEnum
	end
	if Access == v3.Denied then
		self[Callback] = CallbackResult
	end
	return CallbackResult
end

return function(p1, p2): boolean --[[ Line: 51 | Named "shouldShowMoreSettingsBanner" ]]
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
		local v2 = v1
		local v3 = nil
		
		if v2 then
			v3 = v2
		else
			local AccessResponseEnum = require(CorePackages.Workspace.Packages.AccountUpgrade.Eligibility).AccessResponseEnum
			v1 = AccessResponseEnum
			v3 = AccessResponseEnum
		end
		if Access == v3.Denied then
			self[Callback] = CallbackResult
		end
		SelfEntry1 = CallbackResult
	end
	local Access1 = SelfEntry1.access
	local v4 = v1
	local v5 = nil
	
	if v4 then
		v5 = v4
	else
		local AccessResponseEnum = require(CorePackages.Workspace.Packages.AccountUpgrade.Eligibility).AccessResponseEnum
		v1 = AccessResponseEnum
		v5 = AccessResponseEnum
	end
	return Access1 == v5.Denied
end