local Parent = script:FindFirstAncestor("ScreenTime").Parent
local Url = require(Parent.Http).Url
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local Logging = require(Parent.AppCommonLib).Logging
local ArgCheckModule = require(Parent.ArgCheck)
local config = {
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
local Url1 = UrlBuilder.new({
	path = "timed-entertainment-allowance/v1/instructions",
	base = Url.APIS_URL
})()
local Url2 = UrlBuilder.new({
	path = "timed-entertainment-allowance/v1/reportExecute",
	base = Url.APIS_URL
})()
local Url3 = UrlBuilder.new({ path = "v1/logout", base = Url.AUTH_URL })()

local function checkFormat(GETINSTRUCTIONS, p1) --[[ Line: 60 ]]
	for i, gETINSTRUCTION in pairs(GETINSTRUCTIONS) do
		assert(p1[i] ~= nil, "Missing key")
		assert(type(p1[i]) == gETINSTRUCTION, "Wrong type")
	end
end

return {
	httpService = nil,
	new = function(Module, HttpService) --[[ Line: 77 ]]
		-- upvalues: ArgCheckModule (copy)
		ArgCheckModule.isNotNil(HttpService, "httpService")
		local config = { httpService = HttpService }
		setmetatable(config, Module)
		Module.__index = Module
		
		return config
	end,
	getInstructions = function(p2, Callback) --[[ Line: 99 ]]
		-- upvalues: ArgCheckModule (copy), Url1 (copy), checkFormat (copy), config (copy), Logging (copy)
		ArgCheckModule.isNotNil(p2.httpService, "httpService")
		ArgCheckModule.isNotNil(Callback, "callback")
		p2.httpService:RequestInternal({ Method = "GET", Url = Url1 }):Start(function(p3, p4) --[[ Line: 106 ]]
			-- upvalues: p2 (copy), checkFormat (upval), config (upval), Logging (upval), Url1 (upval), Callback (copy)
			local Flag = false
			local Instructions = {}
			local Flag1 = nil
			local v1 = nil
			
			if p3 then
				if p4.StatusCode == 401 then
					Flag1 = false
					Flag = true
					v1 = "Unauthorized"
				elseif p4.StatusCode < 200 or p4.StatusCode >= 400 then
					Flag1 = false
					v1 = "Status code: " .. p4.StatusCode
				else
					Flag1, v14 = pcall(function() --[[ Line: 123 ]]
						-- upvalues: p2 (upval), p4 (copy), checkFormat (upval), config (upval), Instructions (ref)
						local Data = p2.httpService:JSONDecode(p4.Body)
						checkFormat(config.GET_INSTRUCTIONS, Data)
						assert(Data.errorCode == 0, "Error code is not 0")
						
						for _, instruction in ipairs(Data.instructions) do
							checkFormat(config.INSTRUCTION, instruction)
						end
						Instructions = Data.instructions
					end)
				end
			else
				Flag1 = false
				v1 = "Connection error"
			end
			if not Flag1 then
				Logging.warn("HttpRequests" .. " getInstructions failed: " .. Url1 .. ", " .. v1)
			end
			Callback(Flag1, Flag, Instructions)
		end)
	end,
	reportExecution = function(p3, InstructionName, SerialId, Callback) --[[ Line: 148 ]]
		-- upvalues: ArgCheckModule (copy), Url2 (copy), checkFormat (copy), config (copy), Logging (copy)
		ArgCheckModule.isNotNil(p3.httpService, "httpService")
		p3.httpService:RequestInternal({
			Method = "POST",
			Url = Url2,
			Headers = { ["Content-Type"] = "application/json" },
			Body = p3.httpService:JSONEncode({
				instructionName = InstructionName,
				serialId = SerialId,
				execTime = os.date("%Y-%m-%dT%H:%M:%SZ")
			})
		}):Start(function(p4, p5) --[[ Line: 165 ]]
			-- upvalues: p3 (copy), checkFormat (upval), config (upval), Logging (upval), Url2 (upval), Callback (copy)
			local Flag = nil
			local v1 = nil
			if p4 then
				if p5.StatusCode < 200 and p5.StatusCode >= 400 then
					Flag = false
					v1 = "Status code: " .. p5.StatusCode
				else
					Flag, v17 = pcall(function() --[[ Line: 176 ]]
						-- upvalues: p3 (upval), p5 (copy), checkFormat (upval), config (upval)
						local Data = p3.httpService:JSONDecode(p5.Body)
						checkFormat(config.REPORT_EXECUTION, Data)
						assert(Data.errorCode == 0, "Error code is not 0")
					end)
				end
			else
				Flag = false
				v1 = "Connection error"
			end
			if not Flag then
				Logging.warn("HttpRequests" .. " reportExecution failed: " .. Url2 .. ", " .. v1)
			end
			if Callback ~= nil then
				Callback(Flag)
			end
		end)
	end,
	logout = function(p3) --[[ Line: 191 ]]
		-- upvalues: ArgCheckModule (copy), Url3 (copy)
		ArgCheckModule.isNotNil(p3.httpService, "httpService")
		local RequestInternalResult = p3.httpService:RequestInternal({
			Method = "POST",
			Body = "",
			Url = Url3,
			Headers = { ["Content-Type"] = "application/json" }
		})
		pcall(function() --[[ Line: 201 ]]
			-- upvalues: RequestInternalResult (copy)
			RequestInternalResult:Start(function(_, _) --[[ Line: 202 ]] end)
		end)
	end
}