local httpService = game:GetService("HttpService")
local parent = script:FindFirstAncestor("ExpChat").Parent
local urlBuilderModule = require(parent.UrlBuilder)
local urlBuilder = urlBuilderModule.UrlBuilder
local urlBase = urlBuilderModule.UrlBase
local expChatSharedModule = require(parent.ExpChatShared)
local var1 = expChatSharedModule.Logger:new("ExpChat/" .. script.Name)
local fFlagExpChatUseUnifiedTooltipStore = expChatSharedModule.Flags.FFlagExpChatUseUnifiedTooltipStore
local var2 = urlBuilder.new({
	path = "modals-api/v1/prompts",
	base = urlBase.APIS,
	query = {
		entryPoint = "InExperienceChatWindowOpen",
		promptStyle = if game:DefineFastFlag("ExpChatUseTooltipPromptStyle", false) then "Tooltip" else "Modal"
	}
})()
local var3 = urlBuilder.new({
	path = "modals-api/v1/prompts/impression",
	base = urlBase.APIS
})()
local var4 = nil

return {
	fetchAllTooltipEligibility = function(p1, p2)
		-- upvalues: fFlagExpChatUseUnifiedTooltipStore (ref), var4 (write), httpService (ref), var2 (ref), var1 (ref)
		if not fFlagExpChatUseUnifiedTooltipStore then return end
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
						
						if type(customPrompts) ~= "table" then
							customPrompts = {}
						end
						var4 = customPrompts
						
						if p1 then
							p1({ customPrompts = customPrompts })
							
							return
						end
					else
						var4 = {}
						var1:error("Failed to decode ChatTooltip eligibility response")
						
						if p2 then
							p2()
							
							return
						end
					end
				else
					var4 = {}
					var1:error("ChatTooltip eligibility request failed: {} {}", tostring(p3.StatusCode), p3.StatusMessage or "")
					
					if p2 then
						p2()
					end
				end
			end)
			
			return
		elseif p1 then
			p1({ customPrompts = var4 })
		end
	end,
	reportImpression = function(p1)
		-- upvalues: fFlagExpChatUseUnifiedTooltipStore (ref), httpService (ref), var3 (ref), var1 (ref)
		if fFlagExpChatUseUnifiedTooltipStore then
			httpService:RequestInternal({
				Method = "POST",
				Url = var3,
				Headers = { ["Content-Type"] = "application/json" },
				Body = httpService:JSONEncode({ promptType = p1, promptId = p1 })
			}):Start(function(_, p2)
				-- upvalues: var1 (copy), p1 (ref)
				if p2.StatusCode == 200 then
					var1:debug("ChatTooltip impression reported: {}", p1)
					
					return
				end
				var1:error("ChatTooltip impression failed for {}: {} {}", p1, tostring(p2.StatusCode), p2.StatusMessage or "")
			end)
			
			return
		end
	end
}