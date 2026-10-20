local DiscoveryMonolith = script:FindFirstAncestor("DiscoveryMonolith")
local Parent = DiscoveryMonolith.Parent
local TModule = require(Parent.t)
local ArgCheckModule = require(Parent.ArgCheck)
local PromiseModule = require(Parent.Promise)
local StatusCodes = require(Parent.Http).StatusCodes
local Modules = DiscoveryMonolith.Modules
local HttpErrorModule = require(Modules.LuaApp.Http.HttpError)
local HttpResponseModule = require(Modules.LuaApp.Http.HttpResponse)
local MockRequestModule = {
	simpleSuccessRequest = function(p1)
		-- upvalues: PromiseModule (copy), HttpResponseModule (copy), StatusCodes (copy)
		assert(p1 ~= nil, "Expected responseBody not to be nil")
		
		return function(p2, _, _)
			-- upvalues: PromiseModule (upval), HttpResponseModule (upval), p1 (copy), StatusCodes (upval)
			return PromiseModule.resolve(HttpResponseModule.new(p2, p1, 0, StatusCodes.OK))
		end
	end,
	simpleOngoingRequest = function()
		-- upvalues: PromiseModule (copy)
		return function(_, _, _)
			-- upvalues: PromiseModule (upval)
			return PromiseModule.new(function(_, _) end)
		end
	end,
	simpleFailRequest = function(p1, p2: string, p3)
		-- upvalues: PromiseModule (copy), HttpErrorModule (copy)
		assert(p1 ~= nil, "Expected errKind not to be nil")
		
		if p2 == nil then
			p2 = "Fake request failed"
		end
		assert(p2, "Cannot be nil")
		
		return function(p4, _, _)
			-- upvalues: PromiseModule (upval), HttpErrorModule (upval), p1 (copy), p2 (ref), p3 (copy)
			return PromiseModule.reject(HttpErrorModule.new(p4, p1, p2, p3))
		end
	end
}

function MockRequestModule.failThenSuccessRequests(p1, p2, p3: number, p4, p5)
	-- upvalues: MockRequestModule (copy)
	if not p3 then
		p3 = 1
	end
	local Count = 0
	
	return function(p6, p7, p8)
		-- upvalues: Count (ref), p3 (ref), MockRequestModule (upval), p2 (copy), p4 (copy), p5 (copy), p1 (copy)
		if Count < p3 then
			Count += 1
			
			return MockRequestModule.simpleFailRequest(p2, p4, p5)(p6, p7, p8)
		else
			return MockRequestModule.simpleSuccessRequest(p1)(p6, p7, p8)
		end
	end
end

local InterfaceResult = TModule.interface({
	url = TModule.string,
	usePatterns = TModule.optional(TModule.boolean),
	request = TModule.callback
})
local TupleResult = TModule.tuple(TModule.array(InterfaceResult), TModule.string)

local function _getRequestCallbackForUrl(List, p1: string)
	-- upvalues: ArgCheckModule (copy), TupleResult (copy)
	ArgCheckModule.assert(TupleResult(List, p1))
	
	for _, value in ipairs(List) do
		if if value.usePatterns then p1:match(value.url) else p1:find(value.url, nil, true) then
			return value.request
		end
	end
	return nil
end

local ArrayResult = TModule.array(InterfaceResult)

function MockRequestModule.mockEndpoints(p2)
	-- upvalues: ArgCheckModule (copy), ArrayResult (copy), _getRequestCallbackForUrl (copy)
	ArgCheckModule.assert(ArrayResult(p2))
	
	return function(p3, p4, p5)
		-- upvalues: _getRequestCallbackForUrl (upval), p2 (copy)
		local RequestCallbackForUrl = _getRequestCallbackForUrl(p2, p3)
		assert(RequestCallbackForUrl, ("Url %q needs a request associated with it. (mockEndpoints requires all APIs to be mocked)"):format(p3))
		
		return RequestCallbackForUrl(p3, p4, p5)
	end
end

return MockRequestModule