local Parent = script:FindFirstAncestor("ProfilePlatform").Parent
local HttpService = game:GetService("HttpService")
local PromiseModule = require(Parent.Promise)
local Url = require(Parent.UrlBuilder).UrlBuilder.new({
	path = "modals-api/v1/prompts",
	base = require(Parent.UrlBuilder).UrlBase.APIS,
	query = { entryPoint = "SelfUserProfileOpen" }
})()

return function() --[[ Line: 18 | Named "fetchFramesPromptId" ]]
	-- upvalues: PromiseModule (copy), HttpService (copy), Url (copy)
	return PromiseModule.new(function(Callback1, Callback) --[[ Line: 19 ]]
		-- upvalues: HttpService (upval), Url (upval)
		HttpService:RequestInternal({ Method = "GET", Url = Url }):Start(function(p1, p2) --[[ Line: 24 ]]
			-- upvalues: Callback (copy), HttpService (upval), Callback1 (copy)
			if not p1 or not p2 or p2.StatusCode ~= 200 then
				Callback()
				
				return
			end
			local Body = p2.Body
			
			if typeof(Body) == "string" then
				local Success, Result = pcall(function() --[[ Line: 31 ]]
					-- upvalues: HttpService (upval), Body (ref)
					return HttpService:JSONDecode(Body)
				end)
				
				if not Success then
					Callback()
					
					return
				end
				Body = Result
			end
			local PageEntries = Body and (Body.pageEntries or Body.page_entries)
			
			if not PageEntries then
				Callback()
				
				return
			end
			local Identifier = nil
			for _, pageEntry in PageEntries do
				local PageEntry = pageEntry.pageEntry or pageEntry.page_entry
				
				if (PageEntry and (PageEntry.robloxComponent or PageEntry.roblox_component)) == "ProfileCompletionCardCarousel" then
					Identifier = PageEntry.identifier
					
					if Identifier and Identifier ~= "" then
						Callback1(Identifier)
						
						return
					end
				end
			end
			Callback()
		end)
	end)
end