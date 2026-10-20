local CurrencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local HttpService = game:GetService("HttpService")
local PromiseModule = require(CurrencyTransfers.Parent.Promise)
local ErrorTransferModelModule = require(CurrencyTransfers.Models.ErrorTransferModel)
local HttpRequestModule = {}
HttpRequestModule.__index = HttpRequestModule

function HttpRequestModule.new(p1)
	-- upvalues: HttpRequestModule (copy)
	local self = setmetatable({}, HttpRequestModule)
	self.http = p1 or game:GetService("HttpService")
	self.networkImpl = nil
	
	return self
end

function HttpRequestModule.fromNetworkImpl(NetworkImpl)
	-- upvalues: HttpRequestModule (copy)
	local self = setmetatable({}, HttpRequestModule)
	self.http = nil
	self.networkImpl = NetworkImpl
	
	return self
end

local function rejectFromNetworkImpl(Callback: (any) -> (), p1)
	-- upvalues: HttpService (copy), ErrorTransferModelModule (copy)
	local StatusCode = p1 and p1.StatusCode or 0
	local Body = p1 and p1.Body
	local v1 = nil
	
	if type(Body) == "table" then
		v1 = Body
	elseif type(Body) == "string" and Body ~= "" then
		local Success, Result = pcall(HttpService.JSONDecode, HttpService, Body)
		
		if Success then
			v1 = Result
		end
	end
	if v1 then
		Callback(ErrorTransferModelModule.format(v1))
		
		return
	else
		Callback({ status = StatusCode, body = Body })
	end
end

function HttpRequestModule.get(p1, Url)
	-- upvalues: PromiseModule (copy), rejectFromNetworkImpl (copy), ErrorTransferModelModule (copy)
	return if p1.networkImpl then PromiseModule.new(function(Callback, p2)
		-- upvalues: p1 (copy), Url (copy), rejectFromNetworkImpl (upval)
		p1.networkImpl(Url, "GET", { headers = { Accept = "application/json" } }):andThen(function(Result)
			-- upvalues: Callback (copy)
			Callback(Result.responseBody)
		end, function(p3)
			-- upvalues: rejectFromNetworkImpl (upval), p2 (copy)
			rejectFromNetworkImpl(p2, p3)
		end)
	end) else PromiseModule.new(function(Callback, Callback1)
		-- upvalues: p1 (copy), Url (copy), ErrorTransferModelModule (upval)
		p1.http:RequestInternal({
			Method = "GET",
			Url = Url,
			Headers = { Accept = "application/json" }
		}):Start(function(_, p2)
			-- upvalues: Callback (copy), p1 (upval), ErrorTransferModelModule (upval), Callback1 (copy)
			if p2.StatusCode == 200 then
				Callback(p1.http:JSONDecode(p2.Body))
				
				return
			end
			if p2.StatusCode ~= 400 and p2.StatusCode ~= 403 then
				Callback1({ status = p2.StatusCode, body = p2.Body })
				
				return
			end
			local Data = if p2.Body and p2.Body ~= "" then p1.http:JSONDecode(p2.Body) else nil
			
			if Data then
				Callback1((ErrorTransferModelModule.format(Data)))
				
				return
			else
				Callback1({ status = p2.StatusCode, body = p2.Body })
			end
		end)
	end)
end

function HttpRequestModule.post(p1, Url, Input)
	-- upvalues: PromiseModule (copy), HttpService (copy), rejectFromNetworkImpl (copy), ErrorTransferModelModule (copy)
	return if p1.networkImpl then PromiseModule.new(function(Callback, p2)
		-- upvalues: p1 (copy), Url (copy), HttpService (upval), Input (copy), rejectFromNetworkImpl (upval)
		p1.networkImpl(Url, "POST", {
			headers = {
				["Content-Type"] = "application/json",
				Accept = "application/json"
			},
			postBody = HttpService:JSONEncode(Input)
		}):andThen(function(Result)
			-- upvalues: Callback (copy)
			Callback(Result.responseBody)
		end, function(p3)
			-- upvalues: rejectFromNetworkImpl (upval), p2 (copy)
			rejectFromNetworkImpl(p2, p3)
		end)
	end) else PromiseModule.new(function(Callback1, Callback)
		-- upvalues: p1 (copy), Url (copy), Input (copy), ErrorTransferModelModule (upval)
		p1.http:RequestInternal({
			Method = "POST",
			Url = Url,
			Headers = {
				["Content-Type"] = "application/json",
				Accept = "application/json"
			},
			Body = p1.http:JSONEncode(Input)
		}):Start(function(_, p2)
			-- upvalues: Callback1 (copy), p1 (upval), ErrorTransferModelModule (upval), Callback (copy)
			if p2.StatusCode == 200 then
				Callback1(p1.http:JSONDecode(p2.Body))
				
				return
			end
			if p2.StatusCode ~= 400 and p2.StatusCode ~= 403 then
				Callback({ status = p2.StatusCode, body = p2.Body })
				
				return
			end
			local Data = if p2.Body and p2.Body ~= "" then p1.http:JSONDecode(p2.Body) else nil
			
			if Data then
				Callback((ErrorTransferModelModule.format(Data)))
				
				return
			else
				Callback({ status = p2.StatusCode, body = p2.Body })
			end
		end)
	end)
end

return HttpRequestModule