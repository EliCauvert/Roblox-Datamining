local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local promiseModule = require(currencyTransfers.Parent.Promise)
local errorTransferModelModule = require(currencyTransfers.Models.ErrorTransferModel)
local t = {}
t.__index = t

function t.new(p0) --[[ line: 10 ]]
	-- upvalues: t (ref)
	local tbl = setmetatable({}, t)
	tbl.http = p0 or game:GetService("HttpService")
	
	return tbl
end

function t.get(p1, p2) --[[ line: 16 ]]
	-- upvalues: promiseModule (ref), errorTransferModelModule (ref)
	return promiseModule.new(function(p3, p4) --[[ line: 17 ]]
		-- upvalues: p1 (ref), p2 (ref), errorTransferModelModule (copy)
		p1.http:RequestInternal({
			Method = "GET",
			Url = p2,
			Headers = { Accept = "application/json" }
		}):Start(function(_, p5) --[[ line: 26 ]]
			-- upvalues: p3 (ref), p1 (copy), errorTransferModelModule (copy), p4 (ref)
			if p5.StatusCode == 200 then
				p3(p1.http:JSONDecode(p5.Body))
				
				return
			elseif p5.StatusCode ~= 400 and p5.StatusCode ~= 403 then
				p4({ status = p5.StatusCode, body = p5.Body })
				
				return
			end
			local var5 = if p5.Body and p5.Body ~= "" then p1.http:JSONDecode(p5.Body) else nil
			
			if var5 then
				p4(errorTransferModelModule.format(var5))
				
				return
			end
			p4({ status = p5.StatusCode, body = p5.Body })
		end)
	end)
end

function t.post(p6, p7, p8) --[[ line: 53 ]]
	-- upvalues: promiseModule (ref), errorTransferModelModule (ref)
	return promiseModule.new(function(p9, p10) --[[ line: 54 ]]
		-- upvalues: p6 (ref), p7 (ref), p8 (ref), errorTransferModelModule (copy)
		p6.http:RequestInternal({
			Method = "POST",
			Url = p7,
			Headers = {
				["Content-Type"] = "application/json",
				Accept = "application/json"
			},
			Body = p6.http:JSONEncode(p8)
		}):Start(function(_, p11) --[[ line: 65 ]]
			-- upvalues: p9 (ref), p6 (copy), errorTransferModelModule (copy), p10 (ref)
			if p11.StatusCode == 200 then
				p9(p6.http:JSONDecode(p11.Body))
				
				return
			elseif p11.StatusCode ~= 400 and p11.StatusCode ~= 403 then
				p10({ status = p11.StatusCode, body = p11.Body })
				
				return
			end
			local var6 = if p11.Body and p11.Body ~= "" then p6.http:JSONDecode(p11.Body) else nil
			
			if var6 then
				p10(errorTransferModelModule.format(var6))
				
				return
			end
			p10({ status = p11.StatusCode, body = p11.Body })
		end)
	end)
end

return t