local _ = require(script.Parent.types)
local createRequestModule = require(script.Parent.createRequest)
local createRequestInternalNetworkModule = require(script.Parent.createRequestInternalNetwork)
local withRetryModule = require(script.Parent.withRetry)
local decodersModule = require(script.Parent.decoders)
local encodersModule = require(script.Parent.encoders)
local isSuccess = require(script.Parent.httpStatus).isSuccess
local statusCodeActionsModule = require(script.Parent.statusCodeActions)
local var6 = nil

local function _()
	-- upvalues: var6 (write), withRetryModule (ref), createRequestInternalNetworkModule (ref)
	if var6 == nil then
		var6 = withRetryModule(createRequestInternalNetworkModule())
	end
	return var6
end

local _ = function(p0)
	-- upvalues: withRetryModule (ref), createRequestInternalNetworkModule (ref), var6 (write)
	local network = p0.network
	
	if typeof(p0.retry) == "table" then
		return withRetryModule(network or createRequestInternalNetworkModule(), p0.retry)
	elseif network ~= nil then
		return network
	elseif p0.retry == false then
		return createRequestInternalNetworkModule()
	elseif var6 == nil then
		var6 = withRetryModule(createRequestInternalNetworkModule())
	end
	return var6
end

local function asBuffer(p1)
	return if typeof(p1) == "buffer" then p1 else buffer.fromstring(p1 or "")
end

local _ = function(p2)
	-- upvalues: isSuccess (ref), asBuffer (ref)
	return function(p3)
		-- upvalues: isSuccess (copy), p2 (ref), asBuffer (copy)
		if isSuccess(p3.statusCode) then
			return p2(asBuffer(p3.responseBody)), nil, nil
		end
		return nil, `http {p3.statusCode}`, p3.statusCode
	end
end

local _ = function(p4)
	-- upvalues: statusCodeActionsModule (ref)
	local var8 = statusCodeActionsModule.snapshot()
	
	if var8 == nil then
		return p4
	elseif p4 ~= nil then
		for i, v in p4 do
			var8[i] = v
		end
	end
	return var8
end

return function(p5)
	-- upvalues: encodersModule (ref), isSuccess (ref), asBuffer (ref), decodersModule (ref), createRequestModule (ref), withRetryModule (ref), createRequestInternalNetworkModule (ref), var6 (write), statusCodeActionsModule (ref)
	local responseEncoding = p5.responseEncoding or "json"
	local var10 = if (p5.requestEncoding or "json") == "protobuf" then encodersModule.encodeRaw("application/x-protobuf") else nil
	local _ = nil
	
	if responseEncoding == "protobuf" then
		local decode = p5.decode
		
		local var11 = function(p6)
			-- upvalues: isSuccess (copy), decode (ref), asBuffer (copy)
			if isSuccess(p6.statusCode) then
				return decode(asBuffer(p6.responseBody)), nil, nil
			end
			return nil, `http {p6.statusCode}`, p6.statusCode
		end
	else
		local var11 = if p5.legacy then decodersModule.decodeLegacyJson(p5.decode) else decodersModule.decodeJson(p5.decode)
	end
	local var13
	local t = {}
	local network = p5.network
	
	if typeof(p5.retry) == "table" then
		var13 = withRetryModule(network or createRequestInternalNetworkModule(), p5.retry)
	elseif network ~= nil then
		var13 = network
	elseif p5.retry == false then
		var13 = createRequestInternalNetworkModule()
	elseif var6 == nil then
		var6 = withRetryModule(createRequestInternalNetworkModule())
	end
	var13 = var6
	local var15
	t.networkImpl = var13
	t.method = p5.method
	t.url = p5.url
	t.body = p5.body
	t.headers = p5.headers
	t.encode = var10
	t.decode = var11
	t.analyticsKey = p5.analyticsKey
	t.analytics = p5.analytics
	local statusCodeActions = p5.statusCodeActions
	local var14 = statusCodeActionsModule.snapshot()
	
	if var14 == nil then
		var15 = statusCodeActions
	elseif statusCodeActions ~= nil then
		for i, v in statusCodeActions do
			var14[i] = v
		end
	end
	var15 = var14
	t.statusCodeActions = var15
	
	return createRequestModule(t)
end