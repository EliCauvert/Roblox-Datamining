local _ = require(script.Parent.types)
local createRequestModule = require(script.Parent.createRequest)
local createRequestInternalNetworkModule = require(script.Parent.createRequestInternalNetwork)
local withRetryModule = require(script.Parent.withRetry)
local decodersModule = require(script.Parent.decoders)
local encodersModule = require(script.Parent.encoders)
local isSuccess = require(script.Parent.httpStatus).isSuccess
local statusCodeActionsModule = require(script.Parent.statusCodeActions)
local fFlagHttpClientRetryExtensionsModule = require(script.Parent.Flags.FFlagHttpClientRetryExtensions)
local var1 = nil

local function _()
	-- upvalues: var1 (write), withRetryModule (ref), createRequestInternalNetworkModule (ref)
	if var1 == nil then
		var1 = withRetryModule(createRequestInternalNetworkModule())
	end
	return var1
end

local _ = function(p1)
	-- upvalues: withRetryModule (ref), createRequestInternalNetworkModule (ref), var1 (write)
	local network = p1.network
	
	if typeof(p1.retry) == "table" then
		return withRetryModule(network or createRequestInternalNetworkModule(), p1.retry)
	elseif network ~= nil then
		return network
	elseif p1.retry == false then
		return createRequestInternalNetworkModule()
	elseif var1 == nil then
		var1 = withRetryModule(createRequestInternalNetworkModule())
	end
	return var1
end

local function asBuffer(p1)
	return if typeof(p1) == "buffer" then p1 else buffer.fromstring(p1 or "")
end

local _ = function(p1)
	-- upvalues: isSuccess (ref), asBuffer (ref)
	return function(p2)
		-- upvalues: isSuccess (copy), p1 (ref), asBuffer (copy)
		if isSuccess(p2.statusCode) then
			return p1(asBuffer(p2.responseBody)), nil, nil
		end
		return nil, `http {p2.statusCode}`, p2.statusCode
	end
end

local _ = function(p1)
	-- upvalues: statusCodeActionsModule (ref)
	local var2 = statusCodeActionsModule.snapshot()
	
	if var2 == nil then
		return p1
	elseif p1 ~= nil then
		for i, v in p1 do
			var2[i] = v
		end
	end
	return var2
end

return function(p2)
	-- upvalues: encodersModule (ref), isSuccess (ref), asBuffer (ref), decodersModule (ref), createRequestModule (ref), withRetryModule (ref), createRequestInternalNetworkModule (ref), var1 (write), statusCodeActionsModule (ref), fFlagHttpClientRetryExtensionsModule (ref)
	local responseEncoding = p2.responseEncoding or "json"
	local var3 = if (p2.requestEncoding or "json") == "protobuf" then encodersModule.encodeRaw("application/x-protobuf") else nil
	local _ = nil
	
	if responseEncoding == "protobuf" then
		local decode = p2.decode
		
		local var4 = function(p3)
			-- upvalues: isSuccess (copy), decode (ref), asBuffer (copy)
			if isSuccess(p3.statusCode) then
				return decode(asBuffer(p3.responseBody)), nil, nil
			end
			return nil, `http {p3.statusCode}`, p3.statusCode
		end
	else
		local var4 = if p2.legacy then decodersModule.decodeLegacyJson(p2.decode) else decodersModule.decodeJson(p2.decode)
	end
	local var5
	local t = {}
	local network = p2.network
	
	if typeof(p2.retry) == "table" then
		var5 = withRetryModule(network or createRequestInternalNetworkModule(), p2.retry)
	elseif network ~= nil then
		var5 = network
	elseif p2.retry == false then
		var5 = createRequestInternalNetworkModule()
	elseif var1 == nil then
		var1 = withRetryModule(createRequestInternalNetworkModule())
	end
	var5 = var1
	local var6
	t.networkImpl = var5
	t.method = p2.method
	t.url = p2.url
	t.body = p2.body
	t.headers = p2.headers
	t.encode = var3
	t.decode = var4
	t.analyticsKey = p2.analyticsKey
	t.analytics = p2.analytics
	local statusCodeActions = p2.statusCodeActions
	local var7 = statusCodeActionsModule.snapshot()
	
	if var7 == nil then
		var6 = statusCodeActions
	elseif statusCodeActions ~= nil then
		for i, v in statusCodeActions do
			var7[i] = v
		end
	end
	var6 = var7
	t.statusCodeActions = var6
	t.onMessage = if fFlagHttpClientRetryExtensionsModule then p2.onMessage else nil
	t.priority = if fFlagHttpClientRetryExtensionsModule then p2.priority else nil
	
	return createRequestModule(t)
end