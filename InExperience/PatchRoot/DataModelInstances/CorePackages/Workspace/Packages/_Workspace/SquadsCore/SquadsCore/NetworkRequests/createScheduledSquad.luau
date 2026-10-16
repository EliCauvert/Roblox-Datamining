local HttpService = game:GetService("HttpService")
local SquadsCore = script:FindFirstAncestor("SquadsCore")
local Parent = SquadsCore.Parent
local UrlBuilderModule = require(Parent.UrlBuilder)
local TModule = require(Parent.t)
local LoggerModule = require(SquadsCore.Logger)
local ScheduledSquadModelModule = require(SquadsCore.Models.ScheduledSquadModel)
local SerializeTableModule = require(SquadsCore.Utils.serializeTable)
local _ = require(SquadsCore.Types)
local StrictInterfaceResult = TModule.strictInterface({
	parentChannelId = TModule.string,
	title = TModule.string,
	startTime = TModule.string
})
local Url = UrlBuilderModule.UrlBuilder.new({
	path = "group-up/v1/create-scheduled-group-up",
	base = UrlBuilderModule.UrlBase.APIS
})()

return function(p1, Callback, Callback1) --[[ Line: 36 ]]
	-- upvalues: StrictInterfaceResult (copy), HttpService (copy), Url (copy), ScheduledSquadModelModule (copy), LoggerModule (copy), SerializeTableModule (copy)
	assert(StrictInterfaceResult(p1))
	
	return HttpService:RequestInternal({
		Method = "POST",
		Body = HttpService:JSONEncode({
			parentChannelId = p1.parentChannelId,
			title = p1.title,
			startTime = p1.startTime
		}),
		Headers = {
			["Content-Type"] = "application/json",
			Accept = "application/json"
		},
		Url = Url
	}):Start(function(_, p2) --[[ Line: 57 ]]
		-- upvalues: Callback (copy), ScheduledSquadModelModule (upval), HttpService (upval), LoggerModule (upval), SerializeTableModule (upval), Callback1 (copy)
		if p2.StatusCode == 200 then
			local Body = p2.Body
			
			if Callback then
				Callback(ScheduledSquadModelModule.format(HttpService:JSONDecode(Body)))
			end
			LoggerModule:debug("Response: {}", SerializeTableModule(Body))
			
			return p2
		else
			if Callback1 then
				Callback1(p2.StatusCode)
			end
			LoggerModule:error("Error creating scheduled squad: {}", p2.StatusMessage)
			
			return p2
		end
	end)
end