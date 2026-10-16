local HttpService = game:GetService("HttpService")
local _ = require(script.Parent.Parent.types)

local function _(Text: string) --[[ Line: 10 | Named "trim" ]]
	return (Text:gsub("^%s+", ""):gsub("%s+$", ""))
end

local function stripFrame(Text: string) --[[ Line: 14 ]]
	local S = Text:gsub("^%s+", ""):gsub("%s+$", "")
	
	if S == "" then
		return nil
	end
	if S:sub(1, 1) == ":" then
		return nil
	end
	if S:sub(1, 5) == "data:" then
		S = S:sub(6):gsub("^%s+", ""):gsub("%s+$", "")
		
		if S == "" or S == "[DONE]" then
			return nil
		end
	end
	return S
end

return function(p1) --[[ Line: 31 | Named "parseFrame" ]]
	-- upvalues: stripFrame (copy), HttpService (copy)
	local StripFrameResult = stripFrame(p1)
	
	if StripFrameResult == nil then
		return nil
	end
	local Success, Result = pcall(HttpService.JSONDecode, HttpService, StripFrameResult)
	
	if not Success or typeof(Result) ~= "table" then
		return nil
	elseif Result.jsonrpc == nil then
		return nil
	else
		local IsNotMethodMatch: boolean = typeof(Result.method) == "string" and Result.method ~= ""
		local HasId = Result.id ~= nil
		local IsTable = typeof(Result.error) == "table"
		
		if IsNotMethodMatch and not HasId then
			local Params = Result.params
			
			return if Params == nil or typeof(Params) == "table" then {
				kind = "notification",
				notification = { method = Result.method, params = Params or {} }
			} else nil
		else
			return if HasId and IsTable and not IsNotMethodMatch then {
				kind = "response",
				response = {
					result = nil,
					jsonrpc = Result.jsonrpc,
					id = Result.id,
					error = Result.error
				}
			} else nil
		end
	end
end