local httpService = game:GetService("HttpService")
local _ = require(script.Parent.Parent.types)

local function _(p0) --[[ line: 10 | named "trim" ]]
	return p0:gsub("^%s+", ""):gsub("%s+$", "")
end

local function stripFrame(p1) --[[ line: 14 ]]
	local var2 = p1:gsub("^%s+", ""):gsub("%s+$", "")
	
	if var2 == "" then
		return nil
	elseif var2:sub(1, 1) == ":" then
		return nil
	elseif var2:sub(1, 5) == "data:" then
		var2 = var2:sub(6):gsub("^%s+", ""):gsub("%s+$", "")
		
		return if var2 == "" or var2 == "[DONE]" then nil else var2
	end
end

return function(p2) --[[ line: 31 | named "parseFrame" ]]
	-- upvalues: stripFrame (ref), httpService (ref)
	local var3 = stripFrame(p2)
	
	if var3 == nil then
		return nil
	end
	local ok, status = pcall(httpService.JSONDecode, httpService, var3)
	
	if not ok or typeof(status) ~= "table" then
		return nil
	elseif status.jsonrpc == nil then
		return nil
	end
	local var4 = typeof(status.method) == "string" and status.method ~= ""
	local var5 = status.id ~= nil
	local isTable = typeof(status.error) == "table"
	
	if var4 and not var5 then
		local params = status.params
		
		return if params == nil or typeof(params) == "table" then {
			kind = "notification",
			notification = { method = status.method, params = params or {} }
		} else nil
	end
	return if var5 and isTable and not var4 then {
		kind = "response",
		response = {
			result = nil,
			jsonrpc = status.jsonrpc,
			id = status.id,
			error = status.error
		}
	} else nil
end