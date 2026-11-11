local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local Modules = require(CorePackages.Workspace.Packages.DiscoveryMonolith).Modules
local AddTextSearchResults = Modules.LuaApp.Actions.AddTextSearchResults
local RemoveTextSearchResults = Modules.LuaApp.Actions.RemoveTextSearchResults

return function(p1, p2)
	-- upvalues: AddTextSearchResults (copy), CryoModule (copy), RemoveTextSearchResults (copy)
	local P0 = p1 or {}
	
	if p2.type == AddTextSearchResults.name then
		local SearchUuid = p2.searchUuid
		P0 = CryoModule.Dictionary.join(P0, {
			[SearchUuid] = CryoModule.Dictionary.join(P0[SearchUuid] or {}, { [p2.topicId] = p2.entry })
		})
		
		return P0
	end
	if p2.type == RemoveTextSearchResults.name then
		P0 = CryoModule.Dictionary.join(P0, { [p2.searchUuid] = CryoModule.None })
	end
	return P0
end