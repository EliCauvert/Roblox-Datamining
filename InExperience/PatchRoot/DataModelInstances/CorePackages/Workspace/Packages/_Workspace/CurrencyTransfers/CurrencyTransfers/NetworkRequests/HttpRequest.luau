local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local httpService = game:GetService("HttpService")
local promiseModule = require(currencyTransfers.Parent.Promise)
local errorTransferModelModule = require(currencyTransfers.Models.ErrorTransferModel)
local t = {}
t.__index = t

function t.new(p1)
	-- upvalues: t (ref)
	local tbl = setmetatable({}, t)
	tbl.http = p1 or game:GetService("HttpService")
	tbl.networkImpl = nil
	
	return tbl
end

function t.fromNetworkImpl(p1)
	-- upvalues: t (ref)
	local tbl = setmetatable({}, t)
	tbl.http = nil
	tbl.networkImpl = p1
	
	return tbl
end

local function rejectFromNetworkImpl(p1, p2)
	-- upvalues: httpService (ref), errorTransferModelModule (ref)
	local var1 = if p2 then p2.StatusCode else 0
	local body = p2 and p2.Body
	local var2 = nil
	
	if type(body) == "table" then
		var2 = body
	elseif type(body) == "string" and body ~= "" then
		local ok, status = pcall(httpService.JSONDecode, httpService, body)
		
		if ok then
			var2 = status
		end
	end
	if var2 then
		p1(errorTransferModelModule.format(var2))
		
		return
	end
	p1({ status = var1, body = body })
end

function t:get(p1)
	-- upvalues: promiseModule (ref), rejectFromNetworkImpl (ref), errorTransferModelModule (ref)
	return if self.networkImpl then promiseModule.new(function(p2, p3)
		-- upvalues: self (ref), p1 (ref), rejectFromNetworkImpl (copy)
		self.networkImpl(p1, "GET", { headers = { Accept = "application/json" } }):andThen(function(p4)
			-- upvalues: p2 (ref)
			p2(p4.responseBody)
		end, function(p4)
			-- upvalues: rejectFromNetworkImpl (copy), p3 (ref)
			rejectFromNetworkImpl(p3, p4)
		end)
	end) else promiseModule.new(function(p2, p3)
		-- upvalues: self (ref), p1 (ref), errorTransferModelModule (copy)
		self.http:RequestInternal({
			Method = "GET",
			Url = p1,
			Headers = { Accept = "application/json" }
		}):Start(function(_, p4)
			-- upvalues: p2 (ref), self (copy), errorTransferModelModule (copy), p3 (ref)
			if p4.StatusCode == 200 then
				p2(self.http:JSONDecode(p4.Body))
				
				return
			elseif p4.StatusCode ~= 400 and p4.StatusCode ~= 403 then
				p3({ status = p4.StatusCode, body = p4.Body })
				
				return
			end
			local var1 = if p4.Body and p4.Body ~= "" then self.http:JSONDecode(p4.Body) else nil
			
			if var1 then
				p3(errorTransferModelModule.format(var1))
				
				return
			end
			p3({ status = p4.StatusCode, body = p4.Body })
		end)
	end)
end

function t:post(p1, p2)
	-- upvalues: promiseModule (ref), httpService (ref), rejectFromNetworkImpl (ref), errorTransferModelModule (ref)
	return if self.networkImpl then promiseModule.new(function(p3, p4)
		-- upvalues: self (ref), p1 (ref), httpService (copy), p2 (ref), rejectFromNetworkImpl (copy)
		self.networkImpl(p1, "POST", {
			headers = {
				["Content-Type"] = "application/json",
				Accept = "application/json"
			},
			postBody = httpService:JSONEncode(p2)
		}):andThen(function(p5)
			-- upvalues: p3 (ref)
			p3(p5.responseBody)
		end, function(p5)
			-- upvalues: rejectFromNetworkImpl (copy), p4 (ref)
			rejectFromNetworkImpl(p4, p5)
		end)
	end) else promiseModule.new(function(p3, p4)
		-- upvalues: self (ref), p1 (ref), p2 (ref), errorTransferModelModule (copy)
		self.http:RequestInternal({
			Method = "POST",
			Url = p1,
			Headers = {
				["Content-Type"] = "application/json",
				Accept = "application/json"
			},
			Body = self.http:JSONEncode(p2)
		}):Start(function(_, p5)
			-- upvalues: p3 (ref), self (copy), errorTransferModelModule (copy), p4 (ref)
			if p5.StatusCode == 200 then
				p3(self.http:JSONDecode(p5.Body))
				
				return
			elseif p5.StatusCode ~= 400 and p5.StatusCode ~= 403 then
				p4({ status = p5.StatusCode, body = p5.Body })
				
				return
			end
			local var1 = if p5.Body and p5.Body ~= "" then self.http:JSONDecode(p5.Body) else nil
			
			if var1 then
				p4(errorTransferModelModule.format(var1))
				
				return
			end
			p4({ status = p5.StatusCode, body = p5.Body })
		end)
	end)
end

return t