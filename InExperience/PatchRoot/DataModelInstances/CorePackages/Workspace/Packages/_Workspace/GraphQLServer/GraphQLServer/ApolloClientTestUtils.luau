local httpService = game:GetService("HttpService")
local parent = script:FindFirstAncestor("GraphQLServer").Parent
local apolloClientModule = require(parent.ApolloClient)
local apolloClient = apolloClientModule.ApolloClient
local httpLink = apolloClientModule.HttpLink
local inMemoryCache = apolloClientModule.InMemoryCache
local typePolicies = require(parent.ApolloLocalState).typePolicies
local serverModule = require(script.Parent.Server)
local buildFetch = require(parent.Fetch).buildFetch
local object = require(parent.LuauPolyfill).Object
local _ = require(script.ApolloClientTestUtilsTypes)

return {
	mockApolloClient = function(p0) --[[ line: 53 ]]
		-- upvalues: httpService (ref), serverModule (ref), buildFetch (ref), apolloClient (ref), inMemoryCache (ref), typePolicies (ref), httpLink (ref)
		local var3 = serverModule.new({
			mockResolvers = p0.mockResolvers,
			fetchImpl = buildFetch({
				RequestInternal = function(_, p1) --[[ line: 25 ]]
					-- upvalues: p0 (ref), httpService (copy)
					return {
						Start = function(_, p2) --[[ line: 27 ]]
							-- upvalues: p0 (copy), p1 (ref), httpService (copy)
							local _ = nil
							local var4 = if p0.responseMap and p0.responseMap[p1.Url] then p0.responseMap[p1.Url] else p0.defaultResponse or {}
							p2(true, {
								Body = httpService:JSONEncode(var4.Body),
								Success = var4.Success ~= nil or var4.Success,
								StatusCode = if var4.StatusCode then var4.StatusCode else 200,
								StatusMessage = if var4.StatusMessage then var4.StatusMessage else "OK",
								Headers = if var4.Headers then var4.Headers else {}
							})
							
							if p0.responseSpy then
								p0.responseSpy(p1)
							end
						end
					}
				end
			})
		})
		
		return apolloClient.new({
			cache = inMemoryCache.new({ typePolicies = typePolicies }),
			link = httpLink.new({
				uri = "/api",
				fetch = function(_, p3) --[[ line: 65 ]]
					-- upvalues: var3 (ref)
					return var3:fetchLocal(p3)
				end
			})
		})
	end,
	mockHttpService = function(p4) --[[ line: 23 ]]
		-- upvalues: httpService (ref)
		return {
			RequestInternal = function(_, p5) --[[ line: 25 ]]
				-- upvalues: p4 (ref), httpService (copy)
				return {
					Start = function(_, p6) --[[ line: 27 ]]
						-- upvalues: p4 (copy), p5 (ref), httpService (copy)
						local _ = nil
						local var4 = if p4.responseMap and p4.responseMap[p5.Url] then p4.responseMap[p5.Url] else p4.defaultResponse or {}
						p6(true, {
							Body = httpService:JSONEncode(var4.Body),
							Success = var4.Success ~= nil or var4.Success,
							StatusCode = if var4.StatusCode then var4.StatusCode else 200,
							StatusMessage = if var4.StatusMessage then var4.StatusMessage else "OK",
							Headers = if var4.Headers then var4.Headers else {}
						})
						
						if p4.responseSpy then
							p4.responseSpy(p5)
						end
					end
				}
			end
		}
	end,
	appendApolloClientToReducer = function(p7, p8) --[[ line: 74 ]]
		-- upvalues: object (ref)
		return function(p9, p10) --[[ line: 75 ]]
			-- upvalues: p7 (ref), object (copy), p8 (ref)
			return object.assign(table.clone(p7(p9 or {}, p10)), { ApolloClient = { apolloClient = p8 } })
		end
	end
}