local HttpService = game:GetService("HttpService")
local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local _ = require(Parent.Http)
local PromiseModule = require(Parent.Promise)
local _ = require(AppChat.AppChatData.Ports.createHttpPort)

local function _(p1)
	-- upvalues: HttpService (copy)
	local PostBody = if p1 == nil then nil else p1.postBody
	
	if type(PostBody) == "string" then
		local Success, Result = pcall(function()
			-- upvalues: HttpService (upval), PostBody (copy)
			return HttpService:JSONDecode(PostBody)
		end)
		
		return if Success then Result else PostBody
	else
		return PostBody
	end
end

return function()
	-- upvalues: HttpService (copy), PromiseModule (copy)
	local t = {}
	local List = {}
	
	return {
		request = function(Endpoint, Url, Method, p1)
			-- upvalues: HttpService (upval), List (copy), t (copy), PromiseModule (upval)
			local config = { endpoint = Endpoint, url = Url, method = Method }
			local PostBody = if p1 == nil then nil else p1.postBody
			local Body = nil
			
			if type(PostBody) == "string" then
				local Success, Result = pcall(function()
					-- upvalues: HttpService (upval), PostBody (copy)
					return HttpService:JSONDecode(PostBody)
				end)
				Body = if Success then Result else PostBody
			else
				Body = PostBody
			end
			config.body = Body
			table.insert(List, config)
			local Entry = t[Endpoint]
			
			if Entry == nil then
				return PromiseModule.reject(`AppChatData.Testing: no response scripted for {Endpoint}`)
			end
			local EntryResult = if type(Entry) == "function" then Entry(config) else Entry
			local Status = EntryResult.status or 200
			local config1 = {
				responseBody = EntryResult.body,
				responseCode = Status,
				StatusCode = Status
			}
			
			if Status >= 200 and Status < 300 then
				return PromiseModule.resolve(config1)
			end
			if EntryResult.body ~= nil then
				config1.Body = HttpService:JSONEncode(EntryResult.body)
			end
			return PromiseModule.reject(config1)
		end,
		respond = function(Key, p2)
			-- upvalues: t (copy)
			t[Key] = p2
		end,
		getCalls = function(Endpoint)
			-- upvalues: List (copy)
			if Endpoint == nil then
				return table.clone(List)
			end
			local List1 = {}
			
			for _, value in List do
				if value.endpoint == Endpoint then
					table.insert(List1, value)
				end
			end
			return List1
		end
	}
end