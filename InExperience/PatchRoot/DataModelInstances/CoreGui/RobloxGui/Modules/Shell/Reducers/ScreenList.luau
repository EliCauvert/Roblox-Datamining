local actions = game:GetService("CoreGui").RobloxGui.Modules.Shell.Actions
local insertScreenModule = require(actions.InsertScreen)
local removeScreenModule = require(actions.RemoveScreen)
local immutable = require(game:GetService("CorePackages").Workspace.Packages.AppCommonLib).Immutable

return function(p1, p2)
	-- upvalues: insertScreenModule (ref), immutable (ref), removeScreenModule (ref)
	p1 = p1 or {}
	assert(p1, "")
	
	if p2.type == insertScreenModule.name then
		p1 = immutable.Append(p1, p2.item)
		table.sort(p1, function(p3, p4)
			return if p3.priority == p4.priority then p4.createdAt < p3.createdAt else p4.priority < p3.priority
		end)
		
		return p1
	end
	return if p2.type == removeScreenModule.name then immutable.RemoveValueFromList(p1, p2.item) else p1
end