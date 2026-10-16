local HttpService = game:GetService("HttpService")
local Parent = script:FindFirstAncestor("GraphQLServer").Parent
local ApolloClientModule = require(Parent.ApolloClient)
local ApolloClient = ApolloClientModule.ApolloClient
local HttpLink = ApolloClientModule.HttpLink
local InMemoryCache = ApolloClientModule.InMemoryCache
local TypePolicies = require(Parent.ApolloLocalState).typePolicies
local ServerModule = require(script.Parent.Server)
local BuildFetchFunction = require(Parent.Fetch).buildFetch
local Object = require(Parent.LuauPolyfill).Object
local _ = require(script.ApolloClientTestUtilsTypes)

return {
	mockApolloClient = function(p1) --[[ Line: 53 ]]
		-- upvalues: HttpService (copy), ServerModule (copy), BuildFetchFunction (copy), ApolloClient (copy), InMemoryCache (copy), TypePolicies (copy), HttpLink (copy)
		local NewServer = ServerModule.new({
			mockResolvers = p1.mockResolvers,
			fetchImpl = BuildFetchFunction({
				RequestInternal = function(_, p2) --[[ Line: 25 ]]
					-- upvalues: p1 (copy), HttpService (upval)
					return {
						Start = function(_, Callback: (any, any) -> ()) --[[ Line: 27 ]]
							-- upvalues: p1 (upval), p2 (copy), HttpService (upval)
							local Response = if p1.responseMap and p1.responseMap[p2.Url] then p1.responseMap[p2.Url] else p1.defaultResponse or {}
							Callback(true, {
								Body = HttpService:JSONEncode(Response.Body),
								Success = Response.Success == nil or Response.Success,
								StatusCode = if Response.StatusCode then Response.StatusCode else 200,
								StatusMessage = if Response.StatusMessage then Response.StatusMessage else "OK",
								Headers = if Response.Headers then Response.Headers else {}
							})
							
							if p1.responseSpy then
								p1.responseSpy(p2)
							end
						end
					}
				end
			})
		})
		
		return (ApolloClient.new({
			cache = InMemoryCache.new({ typePolicies = TypePolicies }),
			link = HttpLink.new({
				uri = "/api",
				fetch = function(_, p2) --[[ Line: 65 ]]
					-- upvalues: NewServer (copy)
					return NewServer:fetchLocal(p2)
				end
			})
		}))
	end,
	mockHttpService = function(p1) --[[ Line: 23 ]]
		-- upvalues: HttpService (copy)
		return {
			RequestInternal = function(_, p2) --[[ Line: 25 ]]
				-- upvalues: p1 (copy), HttpService (upval)
				return {
					Start = function(_, Callback: (any, any) -> ()) --[[ Line: 27 ]]
						-- upvalues: p1 (upval), p2 (copy), HttpService (upval)
						local Response = if p1.responseMap and p1.responseMap[p2.Url] then p1.responseMap[p2.Url] else p1.defaultResponse or {}
						Callback(true, {
							Body = HttpService:JSONEncode(Response.Body),
							Success = Response.Success == nil or Response.Success,
							StatusCode = if Response.StatusCode then Response.StatusCode else 200,
							StatusMessage = if Response.StatusMessage then Response.StatusMessage else "OK",
							Headers = if Response.Headers then Response.Headers else {}
						})
						
						if p1.responseSpy then
							p1.responseSpy(p2)
						end
					end
				}
			end
		}
	end,
	appendApolloClientToReducer = function(Callback, ApolloClient) --[[ Line: 74 ]]
		-- upvalues: Object (copy)
		return function(p1, p2) --[[ Line: 75 ]]
			-- upvalues: Callback (copy), Object (upval), ApolloClient (copy)
			return (Object.assign(table.clone((Callback(p1 or {}, p2))), { ApolloClient = { apolloClient = ApolloClient } }))
		end
	end
}