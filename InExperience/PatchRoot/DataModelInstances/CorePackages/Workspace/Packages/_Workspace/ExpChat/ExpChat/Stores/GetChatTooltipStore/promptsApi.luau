local HttpService = game:GetService("HttpService")
local Parent = script:FindFirstAncestor("ExpChat").Parent
local UrlBuilderModule = require(Parent.UrlBuilder)
local UrlBuilder = UrlBuilderModule.UrlBuilder
local UrlBase = UrlBuilderModule.UrlBase
local ExpChatSharedModule = require(Parent.ExpChatShared)
local NewResult = ExpChatSharedModule.Logger:new("ExpChat/" .. script.Name)
local FFlagExpChatUseUnifiedTooltipStore = ExpChatSharedModule.Flags.FFlagExpChatUseUnifiedTooltipStore
local Url = UrlBuilder.new({
	path = "modals-api/v1/prompts",
	base = UrlBase.APIS,
	query = {
		entryPoint = "InExperienceChatWindowOpen",
		promptStyle = if game:DefineFastFlag("ExpChatUseTooltipPromptStyle", false) then "Tooltip" else "Modal"
	}
})()
local Url1 = UrlBuilder.new({
	path = "modals-api/v1/prompts/impression",
	base = UrlBase.APIS
})()
local CustomPrompts = nil

return {
	fetchAllTooltipEligibility = function(Callback: (any) -> (), Callback1) --[[ Line: 87 ]]
		-- upvalues: FFlagExpChatUseUnifiedTooltipStore (copy), CustomPrompts (ref), HttpService (copy), Url (copy), NewResult (copy)
		if not FFlagExpChatUseUnifiedTooltipStore then return end
		if CustomPrompts == nil then
			HttpService:RequestInternal({
				Method = "GET",
				Url = Url,
				Headers = { Accept = "application/json" }
			}):Start(function(_, p1) --[[ Line: 107 ]]
				-- upvalues: HttpService (upval), CustomPrompts (upval), Callback (copy), NewResult (upval), Callback1 (copy)
				if p1.StatusCode == 200 then
					local Success, Result = pcall(function() --[[ Line: 109 ]]
						-- upvalues: HttpService (upval), p1 (copy)
						return HttpService:JSONDecode(p1.Body)
					end)
					
					if Success and Result then
						local CustomPrompts1 = Result.customPrompts
						
						if type(CustomPrompts1) ~= "table" then
							CustomPrompts1 = {}
						end
						CustomPrompts = CustomPrompts1
						
						if Callback then
							Callback({ customPrompts = CustomPrompts1 })
							
							return
						end
					else
						CustomPrompts = {}
						NewResult:error("Failed to decode ChatTooltip eligibility response")
						
						if Callback1 then
							Callback1()
							
							return
						end
					end
				else
					CustomPrompts = {}
					NewResult:error("ChatTooltip eligibility request failed: {} {}", tostring(p1.StatusCode), p1.StatusMessage or "")
					
					if Callback1 then
						Callback1()
					end
				end
			end)
			
			return
		end
		if Callback then
			Callback({ customPrompts = CustomPrompts })
		end
	end,
	reportImpression = function(PromptId) --[[ Line: 50 ]]
		-- upvalues: FFlagExpChatUseUnifiedTooltipStore (copy), HttpService (copy), Url1 (copy), NewResult (copy)
		if FFlagExpChatUseUnifiedTooltipStore then
			HttpService:RequestInternal({
				Method = "POST",
				Url = Url1,
				Headers = { ["Content-Type"] = "application/json" },
				Body = HttpService:JSONEncode({ promptType = PromptId, promptId = PromptId })
			}):Start(function(_, p1) --[[ Line: 69 ]]
				-- upvalues: NewResult (upval), PromptId (copy)
				if p1.StatusCode == 200 then
					NewResult:debug("ChatTooltip impression reported: {}", PromptId)
					
					return
				else
					NewResult:error("ChatTooltip impression failed for {}: {} {}", PromptId, tostring(p1.StatusCode), p1.StatusMessage or "")
				end
			end)
			
			return
		end
	end
}