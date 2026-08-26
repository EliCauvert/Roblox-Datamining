local httpService = game:GetService("HttpService")
local appChat = script:FindFirstAncestor("AppChat")
local signalsModule = require(appChat.Parent.Signals)
local networkingShareLinksModule = require(appChat.Http.NetworkingShareLinks)
local name = require(appChat.Logger):new(script.Name)

return function()
	-- upvalues: signalsModule (ref), networkingShareLinksModule (ref), httpService (ref), name (ref)
	local var1, var2 = signalsModule.createSignal({})
	local t = {}
	
	return {
		getShareLinkMetadataTable = function(p1)
			-- upvalues: var1 (ref)
			return var1(p1)
		end,
		getShareLinkMetadataComputed = function(p1)
			-- upvalues: t (ref), signalsModule (copy), var1 (ref)
			if not t[p1] then
				t[p1] = signalsModule.createComputed(function(p2)
					-- upvalues: var1 (copy), p1 (ref)
					return var1(p2)[p1]
				end)
			end
			return t[p1]
		end,
		fetchShareLinkMetadata = function(p1, p2, p3)
			-- upvalues: networkingShareLinksModule (copy), httpService (copy), name (copy), var2 (ref)
			p1(networkingShareLinksModule.GetMetadata.API({ linkId = p2, linkType = p3 })):andThen(function(p4)
				-- upvalues: httpService (copy), name (copy), var2 (copy), p2 (ref)
				local responseBody = p4.responseBody
				
				if responseBody.data then
					local data = httpService:JSONDecode(responseBody.data)
					
					if not data.universeId then
						name:warning("Invalid share link metadata: ", data)
					end
					var2(function(p5)
						-- upvalues: p2 (copy), data (ref)
						local cloned = table.clone(p5)
						cloned[p2] = data
						
						return cloned
					end)
				end
			end):catch(function(p4)
				-- upvalues: name (copy)
				name:warning("Error fetching share link metadata: ", p4)
			end)
		end
	}
end