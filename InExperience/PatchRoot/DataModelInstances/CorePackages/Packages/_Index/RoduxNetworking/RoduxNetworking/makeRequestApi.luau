local parent = script.Parent
local makeActionCreatorModule = require(parent.makeActionCreator)
local requestBuilderModule = require(parent.RequestBuilder)
local networkStatusModule = require(parent.NetworkStatus)
local promiseModule = require(parent.Promise)
local _ = require(parent.Types)

return function(p0, p1) --[[ line: 12 ]]
	-- upvalues: networkStatusModule (ref), makeActionCreatorModule (ref), promiseModule (ref), requestBuilderModule (ref)
	local var4 = networkStatusModule({
		keyPath = p0.keyPath,
		killRequestWithFilteredIds = p0.killRequestWithFilteredIds
	})
	
	return function(p2, p3) --[[ line: 21 ]]
		-- upvalues: makeActionCreatorModule (copy), promiseModule (copy), requestBuilderModule (copy), var4 (ref), p0 (ref), p1 (ref)
		local var5 = makeActionCreatorModule(p2)
		local var6 = nil
		
		local var7 = function(p4, p5) --[[ line: 25 ]]
			-- upvalues: var6 (write), promiseModule (copy)
			if p5.mockNetworkImpl then
				error("Request already mocked - you may need to call `Mock.clear` between tests/uses")
			end
			if type(p4) ~= "function" and type(p4) ~= p5.defaultType then
				error(p5.argumentName .. " must be a " .. p5.defaultType .. " or function")
			end
			var6 = function(...) --[[ line: 39 ]]
				-- upvalues: p4 (ref), promiseModule (copy), p5 (ref)
				return promiseModule[p5.defaultResolveMethod](type(p4) == "function" and p4(...) or p4)
			end
		end
		
		return {
			Mock = {
				reply = function(p6) --[[ line: 84 ]]
					-- upvalues: var7 (ref), var6 (write)
					return var7(p6, {
						defaultResolveMethod = "resolve",
						argumentName = "mockResponse",
						defaultType = "table",
						mockNetworkImpl = var6
					})
				end,
				replyWithError = function(p7) --[[ line: 93 ]]
					-- upvalues: var7 (ref), var6 (write)
					return var7(p7, {
						defaultResolveMethod = "reject",
						argumentName = "mockError",
						defaultType = "string",
						mockNetworkImpl = var6
					})
				end,
				clear = function() --[[ line: 102 ]]
					-- upvalues: var6 (write)
					var6 = nil
				end
			},
			getStatus = function(p8, p9) --[[ line: 72 ]]
				-- upvalues: p3 (ref), requestBuilderModule (copy), var4 (copy)
				return var4.getStatus(p8, p3(function(p10, p11) --[[ line: 73 ]]
					-- upvalues: requestBuilderModule (copy)
					return requestBuilderModule.new(p10, p11)
				end, p9):makeKeyMapper()(p9))
			end,
			API = function(p12, ...) --[[ line: 46 ]]
				-- upvalues: p3 (ref), requestBuilderModule (copy), var4 (copy), var6 (write), p0 (copy), p1 (copy), var5 (ref), promiseModule (copy)
				local var8 = p3(function(p13, p14) --[[ line: 47 ]]
					-- upvalues: requestBuilderModule (copy)
					return requestBuilderModule.new(p13, p14)
				end, p12, ...)
				
				return function(p15) --[[ line: 51 ]]
					-- upvalues: var4 (copy), var8 (ref), var6 (copy), p0 (copy), p1 (copy), var5 (copy), promiseModule (copy)
					return var4.setStatus(p15, var8:getIds(), var8:makeKeyMapper(), function(p16, p17) --[[ line: 52 ]]
						-- upvalues: var6 (copy), p0 (copy), var8 (copy), p1 (copy), var5 (copy), promiseModule (copy)
						local var6_1 = var6 or p0.networkImpl
						local var10 = var8:makeOptions()
						local namedIds = var8:getNamedIds()
						
						return var6_1(var8:makeUrl(p17), p1, var10):andThen(function(p18) --[[ line: 58 ]]
							-- upvalues: p16 (ref), var5 (copy), p17 (ref), namedIds (ref), var10 (ref), var8 (copy)
							p16:dispatch(var5.Succeeded(p17, p18.responseBody, namedIds, var10, var8:getAdditionalData()))
							
							return p18
						end, function(p19) --[[ line: 62 ]]
							-- upvalues: p16 (ref), var5 (copy), p17 (ref), namedIds (ref), var10 (ref), var8 (copy), promiseModule (copy)
							p16:dispatch(var5.Failed(p17, p19, namedIds, var10, var8:getAdditionalData()))
							
							return promiseModule.reject(p19)
						end)
					end)
				end
			end,
			Succeeded = var5.Succeeded,
			Failed = var5.Failed
		}
	end
end