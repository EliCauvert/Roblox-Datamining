local httpService = game:GetService("HttpService")
local appChat = script:FindFirstAncestor("AppChat")
local signalsModule = require(appChat.Parent.Signals)
local networkingShareLinksModule = require(appChat.Http.NetworkingShareLinks)
local name = require(appChat.Logger):new(script.Name)

return function()
	-- upvalues: signalsModule (ref), networkingShareLinksModule (ref), httpService (ref), name (ref)
	local var5, var6 = signalsModule.createSignal({})
	local t = {}
	
	return {
		getShareLinkMetadataTable = function(p0)
			-- upvalues: var5 (ref)
			return var5(p0)
		end,
		getShareLinkMetadataComputed = function(p1)
			-- upvalues: t (ref), signalsModule (copy), var5 (ref)
			if not t[p1] then
				t[p1] = signalsModule.createComputed(function(p2)
					-- upvalues: var5 (copy), p1 (ref)
					return var5(p2)[p1]
				end)
			end
			return t[p1]
		end,
		fetchShareLinkMetadata = function(p3, p4, p5)
			-- upvalues: networkingShareLinksModule (copy), httpService (copy), name (copy), var6 (ref)
			p3(networkingShareLinksModule.GetMetadata.API({ linkId = p4, linkType = p5 })):andThen(function(p7)
				-- upvalues: httpService (copy), name (copy), var6 (copy), p4 (ref)
				local responseBody = p7.responseBody
				
				if responseBody.data then
					local data = httpService:JSONDecode(responseBody.data)
					
					if not data.universeId then
						name:warning("Invalid share link metadata: ", data)
					end
					var6(function(p8)
						-- upvalues: p4 (copy), data (ref)
						local cloned = table.clone(p8)
						cloned[p4] = data
						
						return cloned
					end)
				end
			end):catch(function(p6)
				-- upvalues: name (copy)
				name:warning("Error fetching share link metadata: ", p6)
			end)
		end
	}
end