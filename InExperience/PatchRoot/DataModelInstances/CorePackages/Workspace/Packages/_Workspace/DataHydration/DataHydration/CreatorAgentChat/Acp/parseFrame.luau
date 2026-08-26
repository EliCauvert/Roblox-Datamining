local httpService = game:GetService("HttpService")
local _ = require(script.Parent.Parent.types)

local function _(p1)
	return p1:gsub("^%s+", ""):gsub("%s+$", "")
end

local function stripFrame(p1)
	local var1 = p1:gsub("^%s+", ""):gsub("%s+$", "")
	
	if var1 == "" then
		return nil
	elseif var1:sub(1, 1) == ":" then
		return nil
	elseif var1:sub(1, 5) == "data:" then
		var1 = var1:sub(6):gsub("^%s+", ""):gsub("%s+$", "")
		
		return if var1 == "" or var1 == "[DONE]" then nil else var1
	end
end

return function(p1)
	-- upvalues: stripFrame (ref), httpService (ref)
	local var1 = stripFrame(p1)
	
	if var1 == nil then
		return nil
	end
	local ok, status = pcall(httpService.JSONDecode, httpService, var1)
	
	if not ok or typeof(status) ~= "table" then
		return nil
	elseif status.jsonrpc == nil then
		return nil
	end
	local var2 = typeof(status.method) == "string" and status.method ~= ""
	local var3 = status.id ~= nil
	local isTable = typeof(status.error) == "table"
	
	if var2 and not var3 then
		local params = status.params
		
		return if params == nil or typeof(params) == "table" then {
			kind = "notification",
			notification = { method = status.method, params = params or {} }
		} else nil
	end
	return if var3 and isTable and not var2 then {
		kind = "response",
		response = {
			result = nil,
			jsonrpc = status.jsonrpc,
			id = status.id,
			error = status.error
		}
	} else nil
end