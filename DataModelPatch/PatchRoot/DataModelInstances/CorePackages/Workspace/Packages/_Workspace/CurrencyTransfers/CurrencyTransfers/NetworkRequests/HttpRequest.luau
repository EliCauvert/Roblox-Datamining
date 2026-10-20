local CurrencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local PromiseModule = require(CurrencyTransfers.Parent.Promise)
local ErrorTransferModelModule = require(CurrencyTransfers.Models.ErrorTransferModel)
local HttpRequestModule = {}
HttpRequestModule.__index = HttpRequestModule

function HttpRequestModule.new(p1)
	-- upvalues: HttpRequestModule (copy)
	local self = setmetatable({}, HttpRequestModule)
	self.http = p1 or game:GetService("HttpService")
	
	return self
end

function HttpRequestModule.get(p1, Url)
	-- upvalues: PromiseModule (copy), ErrorTransferModelModule (copy)
	return PromiseModule.new(function(Callback, Callback1)
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
	-- upvalues: PromiseModule (copy), ErrorTransferModelModule (copy)
	return PromiseModule.new(function(Callback, Callback1)
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

return HttpRequestModule