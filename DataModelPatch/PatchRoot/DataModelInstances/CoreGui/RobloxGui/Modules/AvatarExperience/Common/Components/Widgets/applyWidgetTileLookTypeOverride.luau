local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)

return function(p1, LookType)
	-- upvalues: CryoModule (copy)
	return if LookType == nil then p1 elseif p1 == nil or p1.lookType ~= LookType then CryoModule.Dictionary.join(p1 or {}, { lookType = LookType }) else p1
end