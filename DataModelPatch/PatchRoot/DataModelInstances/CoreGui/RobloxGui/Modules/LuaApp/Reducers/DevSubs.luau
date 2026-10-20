local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CryoModule = require(game:GetService("CorePackages").Packages.Cryo)
local SetDevSubsModule = require(Modules.LuaApp.Actions.SetDevSubs)
local SetDevSubModule = require(Modules.LuaApp.Actions.SetDevSub)

return function(p1, p2)
	-- upvalues: SetDevSubsModule (copy), CryoModule (copy), SetDevSubModule (copy)
	local P0 = p1 or {}
	
	if p2.type == SetDevSubsModule.name then
		P0 = CryoModule.List.join({}, p2.devSubs)
		
		return P0
	end
	if p2.type == SetDevSubModule.name then
		local List = {}
		
		for _, value in pairs(P0) do
			if value.id == p2.devSub.id then
				table.insert(List, p2.devSub)
			else
				table.insert(List, value)
			end
		end
		P0 = List
	end
	return P0
end