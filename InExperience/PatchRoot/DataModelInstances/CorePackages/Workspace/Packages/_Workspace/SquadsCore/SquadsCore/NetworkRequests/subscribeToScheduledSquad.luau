local HttpService = game:GetService("HttpService")
local SquadsCore = script:FindFirstAncestor("SquadsCore")
local Parent = SquadsCore.Parent
local UrlBuilderModule = require(Parent.UrlBuilder)
local TModule = require(Parent.t)
local LoggerModule = require(SquadsCore.Logger)
local SerializeTableModule = require(SquadsCore.Utils.serializeTable)
local StrictInterfaceResult = TModule.strictInterface({ scheduledGroupUpId = TModule.number })
local Url = UrlBuilderModule.UrlBuilder.new({
	path = "group-up/v1/subscribe-to-scheduled-group-up",
	base = UrlBuilderModule.UrlBase.APIS
})()

return function(p1, Callback, Callback1) --[[ Line: 28 ]]
	-- upvalues: StrictInterfaceResult (copy), HttpService (copy), Url (copy), LoggerModule (copy), SerializeTableModule (copy)
	assert(StrictInterfaceResult(p1))
	
	return HttpService:RequestInternal({
		Method = "POST",
		Body = HttpService:JSONEncode({ scheduledGroupUpId = p1.scheduledGroupUpId }),
		Headers = {
			["Content-Type"] = "application/json",
			Accept = "application/json"
		},
		Url = Url
	}):Start(function(_, p2) --[[ Line: 47 ]]
		-- upvalues: Callback (copy), HttpService (upval), LoggerModule (upval), SerializeTableModule (upval), Callback1 (copy), p1 (copy)
		if p2.StatusCode == 200 then
			local Body = p2.Body
			
			if Callback then
				Callback(HttpService:JSONDecode(Body))
			end
			LoggerModule:debug("Response: {}", SerializeTableModule(Body))
			
			return p2
		else
			if Callback1 then
				Callback1()
			end
			LoggerModule:error("Error subscribing to scheduledSquadId: {}. Status: {}", p1.scheduledGroupUpId, p2.StatusMessage)
			
			return p2
		end
	end)
end