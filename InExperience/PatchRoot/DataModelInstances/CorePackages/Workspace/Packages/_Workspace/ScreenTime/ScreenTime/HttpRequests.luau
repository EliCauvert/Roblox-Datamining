local parent = script:FindFirstAncestor("ScreenTime").Parent
local url = require(parent.Http).Url
local urlBuilder = require(parent.UrlBuilder).UrlBuilder
local logging = require(parent.AppCommonLib).Logging
local argCheckModule = require(parent.ArgCheck)
local _ = {
	GET_INSTRUCTIONS = "timed-entertainment-allowance/v1/instructions",
	REPORT_EXECUTION = "timed-entertainment-allowance/v1/reportExecute"
}
local t = {
	GET_INSTRUCTIONS = { errorCode = "number", instructions = "table" },
	INSTRUCTION = {
		type = "number",
		instructionName = "string",
		serialId = "string",
		title = "string",
		message = "string",
		url = "string",
		modalType = "number",
		data = "string"
	},
	REPORT_EXECUTION = { errorCode = "number" }
}
local var2 = urlBuilder.new({
	path = "timed-entertainment-allowance/v1/instructions",
	base = url.APIS_URL
})()
local var3 = urlBuilder.new({
	path = "timed-entertainment-allowance/v1/reportExecute",
	base = url.APIS_URL
})()
local var4 = urlBuilder.new({ path = "v1/logout", base = url.AUTH_URL })()

local function checkFormat(p0, p1)
	for i, v in pairs(p0) do
		assert(p1[i] ~= nil, "Missing key")
		assert(type(p1[i]) == v, "Wrong type")
	end
end

return {
	httpService = nil,
	new = function(p2, p3)
		-- upvalues: argCheckModule (ref)
		argCheckModule.isNotNil(p3, "httpService")
		local t = { httpService = p3 }
		setmetatable(t, p2)
		p2.__index = p2
		
		return t
	end,
	getInstructions = function(p4, p5)
		-- upvalues: argCheckModule (ref), var2 (ref), checkFormat (ref), t (ref), logging (ref)
		argCheckModule.isNotNil(p4.httpService, "httpService")
		argCheckModule.isNotNil(p5, "callback")
		p4.httpService:RequestInternal({ Method = "GET", Url = var2 }):Start(function(p6, p7)
			-- upvalues: p4 (ref), checkFormat (copy), t (copy), logging (copy), var2 (copy), p5 (ref)
			local var9, var10
			local _ = nil
			local _ = nil
			local var7 = false
			local t_1 = {}
			
			if not p6 then
				var9 = false
				var10 = "Connection error"
			elseif p7.StatusCode == 401 then
				var9 = false
				var7 = true
				var10 = "Unauthorized"
			elseif p7.StatusCode < 200 or p7.StatusCode >= 400 then
				var9 = false
				var10 = "Status code: " .. p7.StatusCode
			else
				local ok, status = pcall(function()
					-- upvalues: p4 (copy), p7 (ref), checkFormat (copy), t (copy), t_1 (write)
					local body = p4.httpService:JSONDecode(p7.Body)
					checkFormat(t.GET_INSTRUCTIONS, body)
					assert(body.errorCode == 0, "Error code is not 0")
					
					for i, v in ipairs(body.instructions) do
						checkFormat(t.INSTRUCTION, v)
					end
					t_1 = body.instructions
				end)
				var9 = ok
				var10 = status
			end
			if not var9 then
				logging.warn("HttpRequests" .. " getInstructions failed: " .. var2 .. ", " .. var10)
			end
			p5(var9, var7, t_1)
		end)
	end,
	reportExecution = function(p8, p9, p10, p11)
		-- upvalues: argCheckModule (ref), var3 (ref), checkFormat (ref), t (ref), logging (ref)
		argCheckModule.isNotNil(p8.httpService, "httpService")
		p8.httpService:RequestInternal({
			Method = "POST",
			Url = var3,
			Headers = { ["Content-Type"] = "application/json" },
			Body = p8.httpService:JSONEncode({
				instructionName = p9,
				serialId = p10,
				execTime = os.date("%Y-%m-%dT%H:%M:%SZ")
			})
		}):Start(function(p12, p13)
			-- upvalues: p8 (ref), checkFormat (copy), t (copy), logging (copy), var3 (copy), p11 (ref)
			local var12, var13
			local _ = nil
			local _ = nil
			
			if not p12 then
				var12 = false
				var13 = "Connection error"
			elseif p13.StatusCode < 200 and p13.StatusCode >= 400 then
				var12 = false
				var13 = "Status code: " .. p13.StatusCode
			else
				local ok, status = pcall(function()
					-- upvalues: p8 (copy), p13 (ref), checkFormat (copy), t (copy)
					local body = p8.httpService:JSONDecode(p13.Body)
					checkFormat(t.REPORT_EXECUTION, body)
					assert(body.errorCode == 0, "Error code is not 0")
				end)
				var12 = ok
				var13 = status
			end
			if not var12 then
				logging.warn("HttpRequests" .. " reportExecution failed: " .. var3 .. ", " .. var13)
			end
			if p11 ~= nil then
				p11(var12)
			end
		end)
	end,
	logout = function(p14)
		-- upvalues: argCheckModule (ref), var4 (ref)
		argCheckModule.isNotNil(p14.httpService, "httpService")
		local var15 = p14.httpService:RequestInternal({
			Method = "POST",
			Body = "",
			Url = var4,
			Headers = { ["Content-Type"] = "application/json" }
		})
		pcall(function()
			-- upvalues: var15 (ref)
			var15:Start(function(_, _) end)
		end)
	end
}