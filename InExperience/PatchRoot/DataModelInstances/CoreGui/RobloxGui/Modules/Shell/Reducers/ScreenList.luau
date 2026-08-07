local actions = game:GetService("CoreGui").RobloxGui.Modules.Shell.Actions
local insertScreenModule = require(actions.InsertScreen)
local removeScreenModule = require(actions.RemoveScreen)
local immutable = require(game:GetService("CorePackages").Workspace.Packages.AppCommonLib).Immutable

return function(p0, p1) --[[ line: 19 ]]
	-- upvalues: insertScreenModule (ref), immutable (ref), removeScreenModule (ref)
	p0 = p0 or {}
	assert(p0, "")
	
	if p1.type == insertScreenModule.name then
		p0 = immutable.Append(p0, p1.item)
		table.sort(p0, function(p2, p3) --[[ line: 26 ]]
			return if p2.priority == p3.priority then p3.createdAt < p2.createdAt else p3.priority < p2.priority
		end)
		
		return p0
	end
	return if p1.type == removeScreenModule.name then immutable.RemoveValueFromList(p0, p1.item) else p0
end