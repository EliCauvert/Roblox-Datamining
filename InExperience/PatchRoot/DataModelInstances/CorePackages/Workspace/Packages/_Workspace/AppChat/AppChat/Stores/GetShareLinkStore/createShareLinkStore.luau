local HttpService = game:GetService("HttpService")
local AppChat = script:FindFirstAncestor("AppChat")
local SignalsModule = require(AppChat.Parent.Signals)
local NetworkingShareLinksModule = require(AppChat.Http.NetworkingShareLinks)
local NewResult = require(AppChat.Logger):new(script.Name)

return function() --[[ Line: 23 | Named "createShareLinkStore" ]]
	-- upvalues: SignalsModule (copy), NetworkingShareLinksModule (copy), HttpService (copy), NewResult (copy)
	local Signal, Signal2 = SignalsModule.createSignal({})
	local t = {}
	
	return {
		getShareLinkMetadataTable = function(p1) --[[ Line: 27 ]]
			-- upvalues: Signal (copy)
			return Signal(p1)
		end,
		getShareLinkMetadataComputed = function(Key) --[[ Line: 32 ]]
			-- upvalues: t (copy), SignalsModule (upval), Signal (copy)
			if not t[Key] then
				t[Key] = SignalsModule.createComputed(function(p1) --[[ Line: 34 ]]
					-- upvalues: Signal (upval), Key (copy)
					return Signal(p1)[Key]
				end)
			end
			return t[Key]
		end,
		fetchShareLinkMetadata = function(Callback, LinkId, LinkType) --[[ Line: 41 ]]
			-- upvalues: NetworkingShareLinksModule (upval), HttpService (upval), NewResult (upval), Signal2 (copy)
			Callback(NetworkingShareLinksModule.GetMetadata.API({ linkId = LinkId, linkType = LinkType })):andThen(function(Result) --[[ Line: 43 ]]
				-- upvalues: HttpService (upval), NewResult (upval), Signal2 (upval), LinkId (copy)
				local ResponseBody = Result.responseBody
				
				if ResponseBody.data then
					local Data = HttpService:JSONDecode(ResponseBody.data)
					
					if not Data.universeId then
						NewResult:warning("Invalid share link metadata: ", Data)
					end
					Signal2(function(Tbl) --[[ Line: 50 ]]
						-- upvalues: LinkId (upval), Data (copy)
						local Copy = table.clone(Tbl)
						Copy[LinkId] = Data
						
						return Copy
					end)
				end
			end):catch(function(Err) --[[ Line: 57 ]]
				-- upvalues: NewResult (upval)
				NewResult:warning("Error fetching share link metadata: ", Err)
			end)
		end
	}
end