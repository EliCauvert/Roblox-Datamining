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
	mockApolloClient = function(p1)
		-- upvalues: httpService (ref), serverModule (ref), buildFetch (ref), apolloClient (ref), inMemoryCache (ref), typePolicies (ref), httpLink (ref)
		local var1 = serverModule.new({
			mockResolvers = p1.mockResolvers,
			fetchImpl = buildFetch({
				RequestInternal = function(_, p2)
					-- upvalues: p1 (ref), httpService (copy)
					return {
						Start = function(_, p3)
							-- upvalues: p1 (copy), p2 (ref), httpService (copy)
							local _ = nil
							local var2 = if p1.responseMap and p1.responseMap[p2.Url] then p1.responseMap[p2.Url] else p1.defaultResponse or {}
							p3(true, {
								Body = httpService:JSONEncode(var2.Body),
								Success = var2.Success ~= nil or var2.Success,
								StatusCode = if var2.StatusCode then var2.StatusCode else 200,
								StatusMessage = if var2.StatusMessage then var2.StatusMessage else "OK",
								Headers = if var2.Headers then var2.Headers else {}
							})
							
							if p1.responseSpy then
								p1.responseSpy(p2)
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
				fetch = function(_, p2)
					-- upvalues: var1 (ref)
					return var1:fetchLocal(p2)
				end
			})
		})
	end,
	mockHttpService = function(p1)
		-- upvalues: httpService (ref)
		return {
			RequestInternal = function(_, p2)
				-- upvalues: p1 (ref), httpService (copy)
				return {
					Start = function(_, p3)
						-- upvalues: p1 (copy), p2 (ref), httpService (copy)
						local _ = nil
						local var1 = if p1.responseMap and p1.responseMap[p2.Url] then p1.responseMap[p2.Url] else p1.defaultResponse or {}
						p3(true, {
							Body = httpService:JSONEncode(var1.Body),
							Success = var1.Success ~= nil or var1.Success,
							StatusCode = if var1.StatusCode then var1.StatusCode else 200,
							StatusMessage = if var1.StatusMessage then var1.StatusMessage else "OK",
							Headers = if var1.Headers then var1.Headers else {}
						})
						
						if p1.responseSpy then
							p1.responseSpy(p2)
						end
					end
				}
			end
		}
	end,
	appendApolloClientToReducer = function(p1, p2)
		-- upvalues: object (ref)
		return function(p3, p4)
			-- upvalues: p1 (ref), object (copy), p2 (ref)
			return object.assign(table.clone(p1(p3 or {}, p4)), { ApolloClient = { apolloClient = p2 } })
		end
	end
}