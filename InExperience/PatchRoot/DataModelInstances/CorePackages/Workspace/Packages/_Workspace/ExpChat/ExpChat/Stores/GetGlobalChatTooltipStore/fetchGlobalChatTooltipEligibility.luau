local httpService = game:GetService("HttpService")
local parent = script:FindFirstAncestor("ExpChat").Parent
local urlBuilderModule = require(parent.UrlBuilder)
local urlBuilder = urlBuilderModule.UrlBuilder
local urlBase = urlBuilderModule.UrlBase
local var1 = require(parent.ExpChatShared).Logger:new("ExpChat/" .. script.Name)
local var2 = urlBuilder.new({
	path = "modals-api/v1/prompts",
	base = urlBase.APIS,
	query = {
		entryPoint = "InExperienceChatWindowOpen",
		promptStyle = "Modal"
	}
})()
local var3 = urlBuilder.new({
	path = "modals-api/v1/prompts/impression",
	base = urlBase.APIS
})()
local var4 = nil

return {
	fetchEligibility = function(p1, p2)
		-- upvalues: var4 (write), httpService (ref), var2 (ref), var1 (ref)
		if var4 == nil then
			httpService:RequestInternal({
				Method = "GET",
				Url = var2,
				Headers = { Accept = "application/json" }
			}):Start(function(_, p3)
				-- upvalues: httpService (copy), var4 (copy), p1 (ref), var1 (copy), p2 (ref)
				if p3.StatusCode == 200 then
					local ok, status = pcall(function()
						-- upvalues: httpService (copy), p3 (ref)
						return httpService:JSONDecode(p3.Body)
					end)
					
					if ok and status then
						local customPrompts = status.customPrompts
						local var5 = customPrompts ~= nil and (type(customPrompts) == "table" and customPrompts.GlobalChatTooltip ~= nil)
						var4 = var5
						
						if p1 then
							p1({ shouldShowTooltip = var5 })
							
							return
						end
					else
						var4 = false
						var1:error("Failed to decode GlobalChatTooltip eligibility response")
						
						if p2 then
							p2()
							
							return
						end
					end
				else
					var4 = false
					var1:error("GlobalChatTooltip eligibility request failed: {} {}", tostring(p3.StatusCode), p3.StatusMessage or "")
					
					if p2 then
						p2()
					end
				end
			end)
			
			return
		elseif p1 then
			p1({ shouldShowTooltip = var4 })
		end
	end,
	reportImpression = function()
		-- upvalues: httpService (ref), var3 (ref), var1 (ref)
		httpService:RequestInternal({
			Method = "POST",
			Url = var3,
			Headers = { ["Content-Type"] = "application/json" },
			Body = httpService:JSONEncode({
				promptType = "GlobalChatTooltip",
				promptId = "GlobalChatTooltip"
			})
		}):Start(function(_, p1)
			-- upvalues: var1 (copy)
			if p1.StatusCode == 200 then
				var1:debug("GlobalChatTooltip impression reported")
				
				return
			end
			var1:error("GlobalChatTooltip impression failed: {} {}", tostring(p1.StatusCode), p1.StatusMessage or "")
		end)
	end
}