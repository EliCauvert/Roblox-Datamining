local Actions = game:GetService("CoreGui").RobloxGui.Modules.Shell.Actions
local InsertScreenModule = require(Actions.InsertScreen)
local RemoveScreenModule = require(Actions.RemoveScreen)
local Immutable = require(game:GetService("CorePackages").Workspace.Packages.AppCommonLib).Immutable

return function(p1, p2)
	-- upvalues: InsertScreenModule (copy), Immutable (copy), RemoveScreenModule (copy)
	local P0 = p1 or {}
	assert(P0, "")
	
	if p2.type == InsertScreenModule.name then
		local AppendResult = Immutable.Append(P0, p2.item)
		table.sort(AppendResult, function(A, B): boolean
			return if A.priority == B.priority then B.createdAt < A.createdAt else B.priority < A.priority
		end)
		
		return AppendResult
	else
		return if p2.type == RemoveScreenModule.name then Immutable.RemoveValueFromList(P0, p2.item) else P0
	end
end