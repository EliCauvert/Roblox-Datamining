local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local AddUsersSearchResultsModule = require(script.Parent.Parent.Actions.AddUsersSearchResults)
local RemoveUsersSearchResultsModule = require(script.Parent.Parent.Actions.RemoveUsersSearchResults)
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)
local PaginationMethod = require(CorePackages.Workspace.Packages.DiscoveryMonolith).Modules.LuaApp.Enum.PaginationMethod

return function(p1, p2)
	-- upvalues: AddUsersSearchResultsModule (copy), CryoModule (copy), PaginationMethod (copy), ArgCheckModule (copy), RemoveUsersSearchResultsModule (copy)
	local P0 = p1 or {}
	
	if p2.type == AddUsersSearchResultsModule.name then
		local SearchUuid = if p2.searchUuid then p2.searchUuid else p2.keyword
		local Entry = P0[SearchUuid] or {}
		local NextPageCursor = Entry.nextPageCursor
		local JoinResult = if NextPageCursor and NextPageCursor ~= "" and NextPageCursor == p2.curPageCursor then CryoModule.List.join(Entry.entries or {}, p2.entries) else p2.entries
		
		if p2.paginationMethod then
			local PaginationMethodEntry = PaginationMethod[p2.paginationMethod]
			ArgCheckModule.assert(PaginationMethodEntry, `Unknown pagination method: {PaginationMethodEntry}`)
		end
		P0 = CryoModule.Dictionary.join(P0, {
			[SearchUuid] = CryoModule.Dictionary.join(Entry, {
				nextPageCursor = p2.nextPageCursor or CryoModule.None,
				keyword = p2.keyword,
				entries = JoinResult,
				paginationMethod = p2.paginationMethod
			})
		})
		
		return P0
	else
		if p2.type == RemoveUsersSearchResultsModule.name then
			P0 = CryoModule.Dictionary.join(P0, {
				[if p2.searchUuid then p2.searchUuid else p2.keyword] = CryoModule.None
			})
		end
		return P0
	end
end