local httpService = game:GetService("HttpService")
local parent = script:FindFirstAncestor("ExpChat").Parent
local urlBuilderModule = require(parent.UrlBuilder)
local urlBuilder = urlBuilderModule.UrlBuilder
local urlBase = urlBuilderModule.UrlBase
local expChatSharedModule = require(parent.ExpChatShared)
local var3 = expChatSharedModule.Logger:new("ExpChat/" .. script.Name)
local fFlagExpChatUseUnifiedTooltipStore = expChatSharedModule.Flags.FFlagExpChatUseUnifiedTooltipStore
local var4 = urlBuilder.new({
	path = "modals-api/v1/prompts",
	base = urlBase.APIS,
	query = {
		entryPoint = "InExperienceChatWindowOpen",
		promptStyle = if game:DefineFastFlag("ExpChatUseTooltipPromptStyle", false) then "Tooltip" else "Modal"
	}
})()
local var5 = urlBuilder.new({
	path = "modals-api/v1/prompts/impression",
	base = urlBase.APIS
})()
local var6 = nil

return {
	fetchAllTooltipEligibility = function(p0, p1)
		-- upvalues: fFlagExpChatUseUnifiedTooltipStore (ref), var6 (write), httpService (ref), var4 (ref), var3 (ref)
		if not fFlagExpChatUseUnifiedTooltipStore then return end
		if var6 == nil then
			httpService:RequestInternal({
				Method = "GET",
				Url = var4,
				Headers = { Accept = "application/json" }
			}):Start(function(_, p2)
				-- upvalues: httpService (copy), var6 (copy), p0 (ref), var3 (copy), p1 (ref)
				if p2.StatusCode == 200 then
					local ok, status = pcall(function()
						-- upvalues: httpService (copy), p2 (ref)
						return httpService:JSONDecode(p2.Body)
					end)
					
					if ok and status then
						local customPrompts = status.customPrompts
						
						if type(customPrompts) ~= "table" then
							customPrompts = {}
						end
						var6 = customPrompts
						
						if p0 then
							p0({ customPrompts = customPrompts })
							
							return
						end
					else
						var6 = {}
						var3:error("Failed to decode ChatTooltip eligibility response")
						
						if p1 then
							p1()
							
							return
						end
					end
				else
					var6 = {}
					var3:error("ChatTooltip eligibility request failed: {} {}", tostring(p2.StatusCode), p2.StatusMessage or "")
					
					if p1 then
						p1()
					end
				end
			end)
			
			return
		elseif p0 then
			p0({ customPrompts = var6 })
		end
	end,
	reportImpression = function(p3)
		-- upvalues: fFlagExpChatUseUnifiedTooltipStore (ref), httpService (ref), var5 (ref), var3 (ref)
		if fFlagExpChatUseUnifiedTooltipStore then
			httpService:RequestInternal({
				Method = "POST",
				Url = var5,
				Headers = { ["Content-Type"] = "application/json" },
				Body = httpService:JSONEncode({ promptType = p3, promptId = p3 })
			}):Start(function(_, p4)
				-- upvalues: var3 (copy), p3 (ref)
				if p4.StatusCode == 200 then
					var3:debug("ChatTooltip impression reported: {}", p3)
					
					return
				end
				var3:error("ChatTooltip impression failed for {}: {} {}", p3, tostring(p4.StatusCode), p4.StatusMessage or "")
			end)
			
			return
		end
	end
}