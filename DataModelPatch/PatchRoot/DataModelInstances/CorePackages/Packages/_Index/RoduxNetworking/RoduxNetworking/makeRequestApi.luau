local Parent = script.Parent
local MakeActionCreatorModule = require(Parent.makeActionCreator)
local RequestBuilderModule = require(Parent.RequestBuilder)
local NetworkStatusModule = require(Parent.NetworkStatus)
local PromiseModule = require(Parent.Promise)
local _ = require(Parent.Types)

return function(p1, p2)
	-- upvalues: NetworkStatusModule (copy), MakeActionCreatorModule (copy), PromiseModule (copy), RequestBuilderModule (copy)
	local NetworkStatusModuleResult = NetworkStatusModule({
		keyPath = p1.keyPath,
		killRequestWithFilteredIds = p1.killRequestWithFilteredIds
	})
	
	return function(p3, Callback)
		-- upvalues: MakeActionCreatorModule (upval), PromiseModule (upval), RequestBuilderModule (upval), NetworkStatusModuleResult (copy), p1 (copy), p2 (copy)
		local ActionCreatorModule = MakeActionCreatorModule(p3)
		local MockNetworkImpl = nil
		
		local function v9(Callback, p4)
			-- upvalues: MockNetworkImpl (ref), PromiseModule (upval)
			if p4.mockNetworkImpl then
				error("Request already mocked - you may need to call `Mock.clear` between tests/uses")
			end
			if type(Callback) ~= "function" and type(Callback) ~= p4.defaultType then
				error(p4.argumentName .. " must be a " .. p4.defaultType .. " or function")
			end
			MockNetworkImpl = function(...)
				-- upvalues: Callback (copy), PromiseModule (upval), p4 (copy)
				return PromiseModule[p4.defaultResolveMethod](type(Callback) == "function" and Callback(...) or Callback)
			end
		end
		
		return {
			Mock = {
				reply = function(p4)
					-- upvalues: v9 (copy), MockNetworkImpl (ref)
					return v9(p4, {
						defaultResolveMethod = "resolve",
						argumentName = "mockResponse",
						defaultType = "table",
						mockNetworkImpl = MockNetworkImpl
					})
				end,
				replyWithError = function(p4)
					-- upvalues: v9 (copy), MockNetworkImpl (ref)
					return v9(p4, {
						defaultResolveMethod = "reject",
						argumentName = "mockError",
						defaultType = "string",
						mockNetworkImpl = MockNetworkImpl
					})
				end,
				clear = function()
					-- upvalues: MockNetworkImpl (ref)
					MockNetworkImpl = nil
				end
			},
			getStatus = function(p4, p5)
				-- upvalues: Callback (copy), RequestBuilderModule (upval), NetworkStatusModuleResult (upval)
				return NetworkStatusModuleResult.getStatus(p4, (Callback(function(p6, p7)
					-- upvalues: RequestBuilderModule (upval)
					return RequestBuilderModule.new(p6, p7)
				end, p5):makeKeyMapper()(p5)))
			end,
			API = function(p4, ...)
				-- upvalues: Callback (copy), RequestBuilderModule (upval), NetworkStatusModuleResult (upval), MockNetworkImpl (ref), p1 (upval), p2 (upval), ActionCreatorModule (copy), PromiseModule (upval)
				local CallbackResult = Callback(function(p5, p6)
					-- upvalues: RequestBuilderModule (upval)
					return RequestBuilderModule.new(p5, p6)
				end, p4, ...)
				
				return function(p5)
					-- upvalues: NetworkStatusModuleResult (upval), CallbackResult (copy), MockNetworkImpl (upval), p1 (upval), p2 (upval), ActionCreatorModule (upval), PromiseModule (upval)
					return NetworkStatusModuleResult.setStatus(p5, CallbackResult:getIds(), CallbackResult:makeKeyMapper(), function(p6, p7)
						-- upvalues: MockNetworkImpl (upval), p1 (upval), CallbackResult (upval), p2 (upval), ActionCreatorModule (upval), PromiseModule (upval)
						local Options = CallbackResult:makeOptions()
						local NamedIds = CallbackResult:getNamedIds()
						
						return (MockNetworkImpl or p1.networkImpl)(CallbackResult:makeUrl(p7), p2, Options):andThen(function(Result)
							-- upvalues: p6 (copy), ActionCreatorModule (upval), p7 (copy), NamedIds (copy), Options (copy), CallbackResult (upval)
							p6:dispatch(ActionCreatorModule.Succeeded(p7, Result.responseBody, NamedIds, Options, CallbackResult:getAdditionalData()))
							
							return Result
						end, function(p8)
							-- upvalues: p6 (copy), ActionCreatorModule (upval), p7 (copy), NamedIds (copy), Options (copy), CallbackResult (upval), PromiseModule (upval)
							p6:dispatch(ActionCreatorModule.Failed(p7, p8, NamedIds, Options, CallbackResult:getAdditionalData()))
							
							return PromiseModule.reject(p8)
						end)
					end)
				end
			end,
			Succeeded = ActionCreatorModule.Succeeded,
			Failed = ActionCreatorModule.Failed
		}
	end
end