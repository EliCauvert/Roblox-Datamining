local HttpService = game:GetService("HttpService")
local Parent = script:FindFirstAncestor("ExpChat").Parent
local UrlBuilderModule = require(Parent.UrlBuilder)
local UrlBuilder = UrlBuilderModule.UrlBuilder
local UrlBase = UrlBuilderModule.UrlBase
local NewResult = require(Parent.ExpChatShared).Logger:new("ExpChat/" .. script.Name)
local Url = UrlBuilder.new({
	path = "modals-api/v1/prompts",
	base = UrlBase.APIS,
	query = {
		entryPoint = "InExperienceChatWindowOpen",
		promptStyle = "Modal"
	}
})()
local Url1 = UrlBuilder.new({
	path = "modals-api/v1/prompts/impression",
	base = UrlBase.APIS
})()
local Flag = nil

return {
	fetchEligibility = function(Callback: (any) -> (), Callback1)
		-- upvalues: Flag (ref), HttpService (copy), Url (copy), NewResult (copy)
		if Flag == nil then
			HttpService:RequestInternal({
				Method = "GET",
				Url = Url,
				Headers = { Accept = "application/json" }
			}):Start(function(_, p1)
				-- upvalues: HttpService (upval), Flag (upval), Callback (copy), NewResult (upval), Callback1 (copy)
				if p1.StatusCode == 200 then
					local Success, Result = pcall(function()
						-- upvalues: HttpService (upval), p1 (copy)
						return HttpService:JSONDecode(p1.Body)
					end)
					
					if Success and Result then
						local CustomPrompts = Result.customPrompts
						local HasGlobalChatTooltip: boolean = CustomPrompts ~= nil and (type(CustomPrompts) == "table" and CustomPrompts.GlobalChatTooltip ~= nil)
						Flag = HasGlobalChatTooltip
						
						if Callback then
							Callback({ shouldShowTooltip = HasGlobalChatTooltip })
							
							return
						end
					else
						Flag = false
						NewResult:error("Failed to decode GlobalChatTooltip eligibility response")
						
						if Callback1 then
							Callback1()
							
							return
						end
					end
				else
					Flag = false
					NewResult:error("GlobalChatTooltip eligibility request failed: {} {}", tostring(p1.StatusCode), p1.StatusMessage or "")
					
					if Callback1 then
						Callback1()
					end
				end
			end)
			
			return
		end
		if Callback then
			Callback({ shouldShowTooltip = Flag })
		end
	end,
	reportImpression = function()
		-- upvalues: HttpService (copy), Url1 (copy), NewResult (copy)
		HttpService:RequestInternal({
			Method = "POST",
			Url = Url1,
			Headers = { ["Content-Type"] = "application/json" },
			Body = HttpService:JSONEncode({
				promptType = "GlobalChatTooltip",
				promptId = "GlobalChatTooltip"
			})
		}):Start(function(_, p1)
			-- upvalues: NewResult (upval)
			if p1.StatusCode == 200 then
				NewResult:debug("GlobalChatTooltip impression reported")
				
				return
			else
				NewResult:error("GlobalChatTooltip impression failed: {} {}", tostring(p1.StatusCode), p1.StatusMessage or "")
			end
		end)
	end
}