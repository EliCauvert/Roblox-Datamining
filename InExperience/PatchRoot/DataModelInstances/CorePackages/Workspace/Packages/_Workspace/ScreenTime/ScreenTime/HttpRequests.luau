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
local var1 = urlBuilder.new({
	path = "timed-entertainment-allowance/v1/instructions",
	base = url.APIS_URL
})()
local var2 = urlBuilder.new({
	path = "timed-entertainment-allowance/v1/reportExecute",
	base = url.APIS_URL
})()
local var3 = urlBuilder.new({ path = "v1/logout", base = url.AUTH_URL })()

local function checkFormat(p1, p2)
	for i, v in pairs(p1) do
		assert(p2[i] ~= nil, "Missing key")
		assert(type(p2[i]) == v, "Wrong type")
	end
end

return {
	httpService = nil,
	new = function(p3, p4)
		-- upvalues: argCheckModule (ref)
		argCheckModule.isNotNil(p4, "httpService")
		local t = { httpService = p4 }
		setmetatable(t, p3)
		p3.__index = p3
		
		return t
	end,
	getInstructions = function(p3, p4)
		-- upvalues: argCheckModule (ref), var1 (ref), checkFormat (ref), t (ref), logging (ref)
		argCheckModule.isNotNil(p3.httpService, "httpService")
		argCheckModule.isNotNil(p4, "callback")
		p3.httpService:RequestInternal({ Method = "GET", Url = var1 }):Start(function(p5, p6)
			-- upvalues: p3 (ref), checkFormat (copy), t (copy), logging (copy), var1 (copy), p4 (ref)
			local var4, var5
			local _ = nil
			local _ = nil
			local var6 = false
			local t_1 = {}
			
			if not p5 then
				var4 = false
				var5 = "Connection error"
			elseif p6.StatusCode == 401 then
				var4 = false
				var6 = true
				var5 = "Unauthorized"
			elseif p6.StatusCode < 200 or p6.StatusCode >= 400 then
				var4 = false
				var5 = "Status code: " .. p7.StatusCode
			else
				local ok, status = pcall(function()
					-- upvalues: p3 (copy), p6 (ref), checkFormat (copy), t (copy), t_1 (write)
					local body = p3.httpService:JSONDecode(p6.Body)
					checkFormat(t.GET_INSTRUCTIONS, body)
					assert(body.errorCode == 0, "Error code is not 0")
					
					for i, v in ipairs(body.instructions) do
						checkFormat(t.INSTRUCTION, v)
					end
					t_1 = body.instructions
				end)
				var4 = ok
				var5 = status
			end
			if not var4 then
				logging.warn("HttpRequests" .. " getInstructions failed: " .. var2 .. ", " .. var10)
			end
			p4(var4, var6, t_1)
		end)
	end,
	reportExecution = function(p5, p6, p7, p8)
		-- upvalues: argCheckModule (ref), var2 (ref), checkFormat (ref), t (ref), logging (ref)
		argCheckModule.isNotNil(p5.httpService, "httpService")
		p5.httpService:RequestInternal({
			Method = "POST",
			Url = var2,
			Headers = { ["Content-Type"] = "application/json" },
			Body = p5.httpService:JSONEncode({
				instructionName = p6,
				serialId = p7,
				execTime = os.date("%Y-%m-%dT%H:%M:%SZ")
			})
		}):Start(function(p9, p10)
			-- upvalues: p5 (ref), checkFormat (copy), t (copy), logging (copy), var2 (copy), p8 (ref)
			local var4, var5
			local _ = nil
			local _ = nil
			
			if not p9 then
				var4 = false
				var5 = "Connection error"
			elseif p10.StatusCode < 200 and p10.StatusCode >= 400 then
				var4 = false
				var5 = "Status code: " .. p13.StatusCode
			else
				local ok, status = pcall(function()
					-- upvalues: p5 (copy), p10 (ref), checkFormat (copy), t (copy)
					local body = p5.httpService:JSONDecode(p10.Body)
					checkFormat(t.REPORT_EXECUTION, body)
					assert(body.errorCode == 0, "Error code is not 0")
				end)
				var4 = ok
				var5 = status
			end
			if not var4 then
				logging.warn("HttpRequests" .. " reportExecution failed: " .. var3 .. ", " .. var13)
			end
			if p8 ~= nil then
				p8(var4)
			end
		end)
	end,
	logout = function(p5)
		-- upvalues: argCheckModule (ref), var3 (ref)
		argCheckModule.isNotNil(p5.httpService, "httpService")
		local var4 = p5.httpService:RequestInternal({
			Method = "POST",
			Body = "",
			Url = var3,
			Headers = { ["Content-Type"] = "application/json" }
		})
		pcall(function()
			-- upvalues: var4 (ref)
			var4:Start(function(_, _) end)
		end)
	end
}