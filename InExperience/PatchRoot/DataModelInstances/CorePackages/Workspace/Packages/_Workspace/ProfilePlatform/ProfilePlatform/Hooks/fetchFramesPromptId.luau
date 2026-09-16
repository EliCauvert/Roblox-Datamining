local parent = script:FindFirstAncestor("ProfilePlatform").Parent
local httpService = game:GetService("HttpService")
local promiseModule = require(parent.Promise)
local var1 = require(parent.UrlBuilder).UrlBuilder.new({
	path = "modals-api/v1/prompts",
	base = require(parent.UrlBuilder).UrlBase.APIS,
	query = { entryPoint = "SelfUserProfileOpen" }
})()

return function()
	-- upvalues: promiseModule (ref), httpService (ref), var1 (ref)
	return promiseModule.new(function(p1, p2)
		-- upvalues: httpService (copy), var1 (copy)
		httpService:RequestInternal({ Method = "GET", Url = var1 }):Start(function(p3, p4)
			-- upvalues: p2 (ref), httpService (copy), p1 (ref)
			if not p3 or not p4 or p4.StatusCode ~= 200 then
				p2()
				
				return
			end
			local body = p4.Body
			
			if typeof(body) == "string" then
				local ok, status = pcall(function()
					-- upvalues: httpService (copy), body (write)
					return httpService:JSONDecode(body)
				end)
				
				if not ok then
					p2()
					
					return
				end
				body = status
			end
			local pageEntries = body and (body.pageEntries or body.page_entries)
			
			if not pageEntries then
				p2()
				
				return
			end
			for i, v in pageEntries do
				local pageEntry = v.pageEntry or v.page_entry
				
				if (pageEntry and (pageEntry.robloxComponent or pageEntry.roblox_component)) == "ProfileCompletionCardCarousel" then
					local identifier = pageEntry.identifier
					
					if identifier and identifier ~= "" then
						p1(identifier)
						
						return
					end
				end
			end
			p2()
		end)
	end)
end