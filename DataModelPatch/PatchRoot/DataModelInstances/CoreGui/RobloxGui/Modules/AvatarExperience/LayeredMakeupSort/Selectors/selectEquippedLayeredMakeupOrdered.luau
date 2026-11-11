local CorePackages = game:GetService("CorePackages")
local MAKEUPTYPETOASSETTYPEID = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Constants.MAKEUP_TYPE_TO_ASSET_TYPE_ID
local MemoizeResult = require(CorePackages.Workspace.Packages.AppCommonLib).memoize(function(List)
	-- upvalues: MAKEUPTYPETOASSETTYPEID (copy)
	local List1 = {}
	local Orders = {}
	
	for _, value in List do
		local MAKEUPTYPETOASSETTYPEIDEntry = MAKEUPTYPETOASSETTYPEID[value.MakeupType]
		Orders[tostring(value.AssetId)] = value.Order
		table.insert(List1, {
			id = tostring(value.AssetId),
			typeId = MAKEUPTYPETOASSETTYPEIDEntry
		})
	end
	table.sort(List1, function(A, B): boolean
		-- upvalues: Orders (copy)
		return Orders[B.id] < Orders[A.id]
	end)
	
	return List1
end)

return function(p1)
	-- upvalues: MemoizeResult (copy)
	local CurrentCharacter = p1.AvatarExperience.AvatarScene.Character.CurrentCharacter
	
	if not CurrentCharacter then
		return {}
	end
	local List = {}
	
	for _, MakeupDescription in CurrentCharacter.Humanoid.HumanoidDescription:GetChildren() do
		if MakeupDescription:IsA("MakeupDescription") then
			table.insert(List, MakeupDescription)
		end
	end
	return MemoizeResult(List)
end