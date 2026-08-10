local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local httpService = game:GetService("HttpService")
local promiseModule = require(currencyTransfers.Parent.Promise)
local errorTransferModelModule = require(currencyTransfers.Models.ErrorTransferModel)
local t = {}
t.__index = t

function t.new(p0) --[[ line: 26 ]]
	-- upvalues: t (ref)
	local tbl = setmetatable({}, t)
	tbl.http = p0 or game:GetService("HttpService")
	tbl.networkImpl = nil
	
	return tbl
end

function t.fromNetworkImpl(p1) --[[ line: 39 ]]
	-- upvalues: t (ref)
	local tbl = setmetatable({}, t)
	tbl.http = nil
	tbl.networkImpl = p1
	
	return tbl
end

local function rejectFromNetworkImpl(p2, p3) --[[ line: 50 ]]
	-- upvalues: httpService (ref), errorTransferModelModule (ref)
	local var8 = if p3 then p3.StatusCode else 0
	local body = p3 and p3.Body
	local var10 = nil
	
	if type(body) == "table" then
		var10 = body
	elseif type(body) == "string" and body ~= "" then
		local ok, status = pcall(httpService.JSONDecode, httpService, body)
		
		if ok then
			var10 = status
		end
	end
	if var10 then
		p2(errorTransferModelModule.format(var10))
		
		return
	end
	p2({ status = var8, body = body })
end

function t:get(p4) --[[ line: 79 ]]
	-- upvalues: promiseModule (ref), rejectFromNetworkImpl (ref), errorTransferModelModule (ref)
	return if self.networkImpl then promiseModule.new(function(p8, p9) --[[ line: 81 ]]
		-- upvalues: self (ref), p4 (ref), rejectFromNetworkImpl (copy)
		self.networkImpl(p4, "GET", { headers = { Accept = "application/json" } }):andThen(function(p10) --[[ line: 87 ]]
			-- upvalues: p8 (ref)
			p8(p10.responseBody)
		end, function(p11) --[[ line: 89 ]]
			-- upvalues: rejectFromNetworkImpl (copy), p9 (ref)
			rejectFromNetworkImpl(p9, p11)
		end)
	end) else promiseModule.new(function(p5, p6) --[[ line: 95 ]]
		-- upvalues: self (ref), p4 (ref), errorTransferModelModule (copy)
		self.http:RequestInternal({
			Method = "GET",
			Url = p4,
			Headers = { Accept = "application/json" }
		}):Start(function(_, p7) --[[ line: 104 ]]
			-- upvalues: p5 (ref), self (copy), errorTransferModelModule (copy), p6 (ref)
			if p7.StatusCode == 200 then
				p5(self.http:JSONDecode(p7.Body))
				
				return
			elseif p7.StatusCode ~= 400 and p7.StatusCode ~= 403 then
				p6({ status = p7.StatusCode, body = p7.Body })
				
				return
			end
			local var11 = if p7.Body and p7.Body ~= "" then self.http:JSONDecode(p7.Body) else nil
			
			if var11 then
				p6(errorTransferModelModule.format(var11))
				
				return
			end
			p6({ status = p7.StatusCode, body = p7.Body })
		end)
	end)
end

function t:post(p12, p13) --[[ line: 131 ]]
	-- upvalues: promiseModule (ref), httpService (ref), rejectFromNetworkImpl (ref), errorTransferModelModule (ref)
	return if self.networkImpl then promiseModule.new(function(p17, p18) --[[ line: 133 ]]
		-- upvalues: self (ref), p12 (ref), httpService (copy), p13 (ref), rejectFromNetworkImpl (copy)
		self.networkImpl(p12, "POST", {
			headers = {
				["Content-Type"] = "application/json",
				Accept = "application/json"
			},
			postBody = httpService:JSONEncode(p13)
		}):andThen(function(p19) --[[ line: 141 ]]
			-- upvalues: p17 (ref)
			p17(p19.responseBody)
		end, function(p20) --[[ line: 143 ]]
			-- upvalues: rejectFromNetworkImpl (copy), p18 (ref)
			rejectFromNetworkImpl(p18, p20)
		end)
	end) else promiseModule.new(function(p14, p15) --[[ line: 149 ]]
		-- upvalues: self (ref), p12 (ref), p13 (ref), errorTransferModelModule (copy)
		self.http:RequestInternal({
			Method = "POST",
			Url = p12,
			Headers = {
				["Content-Type"] = "application/json",
				Accept = "application/json"
			},
			Body = self.http:JSONEncode(p13)
		}):Start(function(_, p16) --[[ line: 160 ]]
			-- upvalues: p14 (ref), self (copy), errorTransferModelModule (copy), p15 (ref)
			if p16.StatusCode == 200 then
				p14(self.http:JSONDecode(p16.Body))
				
				return
			elseif p16.StatusCode ~= 400 and p16.StatusCode ~= 403 then
				p15({ status = p16.StatusCode, body = p16.Body })
				
				return
			end
			local var12 = if p16.Body and p16.Body ~= "" then self.http:JSONDecode(p16.Body) else nil
			
			if var12 then
				p15(errorTransferModelModule.format(var12))
				
				return
			end
			p15({ status = p16.StatusCode, body = p16.Body })
		end)
	end)
end

return t