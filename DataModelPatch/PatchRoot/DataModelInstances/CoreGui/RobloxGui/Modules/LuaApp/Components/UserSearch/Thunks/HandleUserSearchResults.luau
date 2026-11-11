local CorePackages = game:GetService("CorePackages")
local PromiseModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Promise)
local OmniFeedConstants = require(CorePackages.Workspace.Packages.DiscoveryTypes).OmniFeedConstants
local Modules = require(CorePackages.Workspace.Packages.DiscoveryMonolith).Modules
local AddTextSearchResultsFunction = Modules.LuaApp.Actions.AddTextSearchResults
local GetFormattedTextSearchEntryFunction = Modules.LuaApp.Models.DiscoveryApi.getFormattedTextSearchEntry
local AddUsersSearchResultsModule = require(script.Parent.Parent.Actions.AddUsersSearchResults)
local UserSearchEntryModule = require(script.Parent.Parent.Models.UserSearchEntry)

return function(_, p1, p2)
	-- upvalues: PromiseModule (copy), OmniFeedConstants (copy), GetFormattedTextSearchEntryFunction (copy), AddTextSearchResultsFunction (copy), UserSearchEntryModule (copy), AddUsersSearchResultsModule (copy)
	return function(p3)
		-- upvalues: p2 (copy), PromiseModule (upval), OmniFeedConstants (upval), GetFormattedTextSearchEntryFunction (upval), AddTextSearchResultsFunction (upval), p1 (copy), UserSearchEntryModule (upval), AddUsersSearchResultsModule (upval)
		if not p2 or not p2.responseBody then
			return PromiseModule.reject()
		end
		local NextPageToken = p2.responseBody.nextPageToken
		
		if not NextPageToken or NextPageToken == "" then
			NextPageToken = "EndOfPlayerSearch"
		end
		local SearchResult = p2.responseBody.searchResults and p2.responseBody.searchResults[1]
		
		if SearchResult and SearchResult.contentGroupType == OmniFeedConstants.ContentGroupType.Text then
			local TopicId = SearchResult.topicId
			local FormattedTextSearchEntry = GetFormattedTextSearchEntryFunction(SearchResult.contents)
			
			if FormattedTextSearchEntry then
				p3:dispatch(AddTextSearchResultsFunction({
					searchUuid = p1.searchUuid,
					topicId = TopicId,
					entry = FormattedTextSearchEntry
				}))
			end
			return PromiseModule.resolve(p2)
		else
			local Entries = {}
			local Contents = p2.responseBody.searchResults and (p2.responseBody.searchResults[1] and p2.responseBody.searchResults[1].contents)
			
			if Contents then
				for i = 1, #Contents do
					UserSearchEntryModule.fromOmniJsonData(Contents[i]):match(function(p4)
						-- upvalues: Entries (copy)
						table.insert(Entries, p4)
					end):matchError(function(_)
						warn("Failure in parsing UserSearchEntry")
					end)
				end
			end
			p3:dispatch(AddUsersSearchResultsModule({
				keyword = p1.searchKeyword,
				entries = Entries,
				nextPageCursor = NextPageToken,
				curPageCursor = p1.curPageCursor,
				paginationMethod = p2.responseBody.paginationMethod
			}))
			
			return PromiseModule.resolve(p2)
		end
	end
end