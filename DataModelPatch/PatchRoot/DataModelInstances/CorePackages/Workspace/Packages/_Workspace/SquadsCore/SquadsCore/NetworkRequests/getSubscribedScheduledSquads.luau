local HttpService = game:GetService("HttpService")
local SquadsCore = script:FindFirstAncestor("SquadsCore")
local UrlBuilderModule = require(SquadsCore.Parent.UrlBuilder)
local LoggerModule = require(SquadsCore.Logger)
local SerializeTableModule = require(SquadsCore.Utils.serializeTable)
local _ = require(SquadsCore.Types)
local Url = UrlBuilderModule.UrlBuilder.new({
	path = "group-up/v1/get-subscribed-scheduled-group-ups",
	base = UrlBuilderModule.UrlBase.APIS
})()

return function(Callback, Callback1)
	-- upvalues: HttpService (copy), Url (copy), LoggerModule (copy), SerializeTableModule (copy)
	return HttpService:RequestInternal({
		Method = "GET",
		Headers = {
			["Content-Type"] = "application/json",
			Accept = "application/json"
		},
		Url = Url
	}):Start(function(_, p1)
		-- upvalues: Callback (copy), HttpService (upval), LoggerModule (upval), SerializeTableModule (upval), Callback1 (copy)
		if p1.StatusCode == 200 then
			local Body = p1.Body
			
			if Callback then
				Callback(HttpService:JSONDecode(Body))
			end
			LoggerModule:debug("Response: {}", SerializeTableModule(Body))
			
			return p1
		else
			if Callback1 then
				Callback1()
			end
			LoggerModule:error("Error getting subscribed scheduled squads: {}", p1.StatusMessage)
			
			return p1
		end
	end)
end