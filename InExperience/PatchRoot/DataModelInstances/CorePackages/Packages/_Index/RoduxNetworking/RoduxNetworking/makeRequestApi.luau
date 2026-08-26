local parent = script.Parent
local makeActionCreatorModule = require(parent.makeActionCreator)
local requestBuilderModule = require(parent.RequestBuilder)
local networkStatusModule = require(parent.NetworkStatus)
local promiseModule = require(parent.Promise)
local _ = require(parent.Types)

return function(p1, p2)
	-- upvalues: networkStatusModule (ref), makeActionCreatorModule (ref), promiseModule (ref), requestBuilderModule (ref)
	local var1 = networkStatusModule({
		keyPath = p1.keyPath,
		killRequestWithFilteredIds = p1.killRequestWithFilteredIds
	})
	
	return function(p3, p4)
		-- upvalues: makeActionCreatorModule (copy), promiseModule (copy), requestBuilderModule (copy), var1 (ref), p1 (ref), p2 (ref)
		local var2 = makeActionCreatorModule(p3)
		local var3 = nil
		
		local var4 = function(p5, p6)
			-- upvalues: var3 (write), promiseModule (copy)
			if p6.mockNetworkImpl then
				error("Request already mocked - you may need to call `Mock.clear` between tests/uses")
			end
			if type(p5) ~= "function" and type(p5) ~= p6.defaultType then
				error(p6.argumentName .. " must be a " .. p5.defaultType .. " or function")
			end
			var3 = function(...)
				-- upvalues: p5 (ref), promiseModule (copy), p6 (ref)
				return promiseModule[p6.defaultResolveMethod](type(p5) == "function" and p5(...) or p5)
			end
		end
		
		return {
			Mock = {
				reply = function(p5)
					-- upvalues: var4 (ref), var3 (write)
					return var4(p5, {
						defaultResolveMethod = "resolve",
						argumentName = "mockResponse",
						defaultType = "table",
						mockNetworkImpl = var3
					})
				end,
				replyWithError = function(p5)
					-- upvalues: var4 (ref), var3 (write)
					return var4(p5, {
						defaultResolveMethod = "reject",
						argumentName = "mockError",
						defaultType = "string",
						mockNetworkImpl = var3
					})
				end,
				clear = function()
					-- upvalues: var3 (write)
					var3 = nil
				end
			},
			getStatus = function(p5, p6)
				-- upvalues: p4 (ref), requestBuilderModule (copy), var1 (copy)
				return var1.getStatus(p5, p4(function(p7, p8)
					-- upvalues: requestBuilderModule (copy)
					return requestBuilderModule.new(p7, p8)
				end, p6):makeKeyMapper()(p6))
			end,
			API = function(p5, ...)
				-- upvalues: p4 (ref), requestBuilderModule (copy), var1 (copy), var3 (write), p1 (copy), p2 (copy), var2 (ref), promiseModule (copy)
				local var5 = p4(function(p6, p7)
					-- upvalues: requestBuilderModule (copy)
					return requestBuilderModule.new(p6, p7)
				end, p5, ...)
				
				return function(p6)
					-- upvalues: var1 (copy), var5 (ref), var3 (copy), p1 (copy), p2 (copy), var2 (copy), promiseModule (copy)
					return var1.setStatus(p6, var5:getIds(), var5:makeKeyMapper(), function(p7, p8)
						-- upvalues: var3 (copy), p1 (copy), var5 (copy), p2 (copy), var2 (copy), promiseModule (copy)
						local var6 = var3 or p1.networkImpl
						local var7 = var5:makeOptions()
						local namedIds = var5:getNamedIds()
						
						return var6(var5:makeUrl(p8), p2, var7):andThen(function(p9)
							-- upvalues: p7 (ref), var2 (copy), p8 (ref), namedIds (ref), var7 (ref), var5 (copy)
							p7:dispatch(var2.Succeeded(p8, p9.responseBody, namedIds, var7, var5:getAdditionalData()))
							
							return p9
						end, function(p9)
							-- upvalues: p7 (ref), var2 (copy), p8 (ref), namedIds (ref), var7 (ref), var5 (copy), promiseModule (copy)
							p7:dispatch(var2.Failed(p8, p9, namedIds, var7, var5:getAdditionalData()))
							
							return promiseModule.reject(p9)
						end)
					end)
				end
			end,
			Succeeded = var2.Succeeded,
			Failed = var2.Failed
		}
	end
end