local _ = require(script.Parent.types)
local CreateRequestModule = require(script.Parent.createRequest)
local CreateRequestInternalNetworkModule = require(script.Parent.createRequestInternalNetwork)
local WithRetryModule = require(script.Parent.withRetry)
local DecodersModule = require(script.Parent.decoders)
local EncodersModule = require(script.Parent.encoders)
local IsSuccessFunction = require(script.Parent.httpStatus).isSuccess
local StatusCodeActionsModule = require(script.Parent.statusCodeActions)
local FFlagHttpClientRetryExtensionsModule = require(script.Parent.Flags.FFlagHttpClientRetryExtensions)
local v1 = nil

local function _() --[[ Line: 17 | Named "defaultNetwork" ]]
	-- upvalues: v1 (ref), WithRetryModule (copy), CreateRequestInternalNetworkModule (copy)
	if v1 == nil then
		v1 = WithRetryModule(CreateRequestInternalNetworkModule())
	end
	return v1
end

local _ = function(p1) --[[ Line: 24 | Named "pickNetwork" ]]
	-- upvalues: WithRetryModule (copy), CreateRequestInternalNetworkModule (copy), v1 (ref)
	local Network = p1.network
	
	if typeof(p1.retry) == "table" then
		return WithRetryModule(Network or CreateRequestInternalNetworkModule(), p1.retry)
	end
	if Network ~= nil then
		return Network
	end
	if p1.retry == false then
		return CreateRequestInternalNetworkModule()
	end
	if v1 == nil then
		v1 = WithRetryModule(CreateRequestInternalNetworkModule())
	end
	return v1
end

local function asBuffer(ResponseBody) --[[ Line: 39 ]]
	return if typeof(ResponseBody) == "buffer" then ResponseBody else buffer.fromstring(ResponseBody or "")
end

local _ = function(p1) --[[ Line: 46 | Named "buildProtobufDecoder" ]]
	-- upvalues: IsSuccessFunction (copy), asBuffer (copy)
	return function(p2) --[[ Line: 47 ]]
		-- upvalues: IsSuccessFunction (upval), p1 (copy), asBuffer (upval)
		if IsSuccessFunction(p2.statusCode) then
			return p1(asBuffer(p2.responseBody)), nil, nil
		else
			return nil, `http {p2.statusCode}`, p2.statusCode
		end
	end
end

local _ = function(List) --[[ Line: 56 | Named "resolveStatusCodeActions" ]]
	-- upvalues: StatusCodeActionsModule (copy)
	local SnapshotResult = StatusCodeActionsModule.snapshot()
	
	if SnapshotResult == nil then
		return List
	end
	if List ~= nil then
		for i, value in List do
			SnapshotResult[i] = value
		end
	end
	return SnapshotResult
end

return function(p1) --[[ Line: 69 | Named "fetch" ]]
	-- upvalues: EncodersModule (copy), IsSuccessFunction (copy), asBuffer (copy), DecodersModule (copy), CreateRequestModule (copy), WithRetryModule (copy), CreateRequestInternalNetworkModule (copy), v1 (ref), StatusCodeActionsModule (copy), FFlagHttpClientRetryExtensionsModule (copy)
	local XProtobuf = if (p1.requestEncoding or "json") == "protobuf" then EncodersModule.encodeRaw("application/x-protobuf") else nil
	
	if (p1.responseEncoding or "json") == "protobuf" then
		local DecodeFunction = p1.decode
		
		local function DecodeLegacyJsonResult(p2) --[[ Line: 47 ]]
			-- upvalues: IsSuccessFunction (upval), DecodeFunction (copy), asBuffer (upval)
			if IsSuccessFunction(p2.statusCode) then
				return DecodeFunction(asBuffer(p2.responseBody)), nil, nil
			else
				return nil, `http {p2.statusCode}`, p2.statusCode
			end
		end
	else
		local DecodeLegacyJsonResult: (any) -> any = if p1.legacy then DecodersModule.decodeLegacyJson(p1.decode) else DecodersModule.decodeJson(p1.decode)
	end
	local t = {}
	local Network = p1.network
	local WithRetryModuleResult = nil
	
	if typeof(p1.retry) == "table" then
		WithRetryModuleResult = WithRetryModule(Network or CreateRequestInternalNetworkModule(), p1.retry)
	elseif Network == nil then
		if p1.retry == false then
			WithRetryModuleResult = CreateRequestInternalNetworkModule()
		else
			if v1 == nil then
				v1 = WithRetryModule(CreateRequestInternalNetworkModule())
			end
			WithRetryModuleResult = v1
		end
	else
		WithRetryModuleResult = Network
	end
	t.networkImpl = WithRetryModuleResult
	t.method = p1.method
	t.url = p1.url
	t.body = p1.body
	t.headers = p1.headers
	t.encode = XProtobuf
	t.decode = DecodeLegacyJsonResult
	t.analyticsKey = p1.analyticsKey
	t.analytics = p1.analytics
	local StatusCodeActions = p1.statusCodeActions
	local SnapshotResult = StatusCodeActionsModule.snapshot()
	local StatusCodeActions1 = nil
	
	if SnapshotResult == nil then
		StatusCodeActions1 = StatusCodeActions
	else
		if StatusCodeActions ~= nil then
			for i, statusCodeAction in StatusCodeActions do
				SnapshotResult[i] = statusCodeAction
			end
		end
		StatusCodeActions1 = SnapshotResult
	end
	t.statusCodeActions = StatusCodeActions1
	t.onMessage = if FFlagHttpClientRetryExtensionsModule then p1.onMessage else nil
	t.priority = if FFlagHttpClientRetryExtensionsModule then p1.priority else nil
	
	return CreateRequestModule(t)
end