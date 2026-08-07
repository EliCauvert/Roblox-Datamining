local httpService = game:GetService("HttpService")
local parent = script:FindFirstAncestor("ExpChat").Parent
local urlBuilderModule = require(parent.UrlBuilder)
local urlBuilder = urlBuilderModule.UrlBuilder
local urlBase = urlBuilderModule.UrlBase
local var2 = require(parent.ExpChatShared).Logger:new("ExpChat/" .. script.Name)
local var3 = urlBuilder.new({
	path = "modals-api/v1/prompts",
	base = urlBase.APIS,
	query = {
		entryPoint = "InExperienceChatWindowOpen",
		promptStyle = "Modal"
	}
})()
local var4 = urlBuilder.new({
	path = "modals-api/v1/prompts/impression",
	base = urlBase.APIS
})()
local var5 = nil

return {
	fetchEligibility = function(p0, p1) --[[ line: 66 ]]
		-- upvalues: var5 (write), httpService (ref), var3 (ref), var2 (ref)
		if var5 == nil then
			httpService:RequestInternal({
				Method = "GET",
				Url = var3,
				Headers = { Accept = "application/json" }
			}):Start(function(_, p2) --[[ line: 82 ]]
				-- upvalues: httpService (copy), var5 (copy), p0 (ref), var2 (copy), p1 (ref)
				if p2.StatusCode == 200 then
					local ok, status = pcall(function() --[[ line: 84 ]]
						-- upvalues: httpService (copy), p2 (ref)
						return httpService:JSONDecode(p2.Body)
					end)
					
					if ok and status then
						local customPrompts = status.customPrompts
						local var6 = customPrompts ~= nil and (type(customPrompts) == "table" and customPrompts.GlobalChatTooltip ~= nil)
						var5 = var6
						
						if p0 then
							p0({ shouldShowTooltip = var6 })
							
							return
						end
					else
						var5 = false
						var2:error("Failed to decode GlobalChatTooltip eligibility response")
						
						if p1 then
							p1()
							
							return
						end
					end
				else
					var5 = false
					var2:error("GlobalChatTooltip eligibility request failed: {} {}", tostring(p2.StatusCode), p2.StatusMessage or "")
					
					if p1 then
						p1()
					end
				end
			end)
			
			return
		elseif p0 then
			p0({ shouldShowTooltip = var5 })
		end
	end,
	reportImpression = function() --[[ line: 34 ]]
		-- upvalues: httpService (ref), var4 (ref), var2 (ref)
		httpService:RequestInternal({
			Method = "POST",
			Url = var4,
			Headers = { ["Content-Type"] = "application/json" },
			Body = httpService:JSONEncode({
				promptType = "GlobalChatTooltip",
				promptId = "GlobalChatTooltip"
			})
		}):Start(function(_, p3) --[[ line: 49 ]]
			-- upvalues: var2 (copy)
			if p3.StatusCode == 200 then
				var2:debug("GlobalChatTooltip impression reported")
				
				return
			end
			var2:error("GlobalChatTooltip impression failed: {} {}", tostring(p3.StatusCode), p3.StatusMessage or "")
		end)
	end
}