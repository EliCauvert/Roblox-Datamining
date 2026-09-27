local parent = script.Parent.Parent
local signalsModule = require(parent.Signals)
local sharedFlagsModule = require(parent.SharedFlags)
local robloxReplicatedStorageService = game:GetService("RobloxReplicatedStorage")
local fFlagChatSummariesSettingEnabled = sharedFlagsModule.FFlagChatSummariesSettingEnabled
local fFlagEnableClientSummarySystemMessageOnLua = sharedFlagsModule.FFlagEnableClientSummarySystemMessageOnLua
local fFlagExpChatTextChannelWindowWelcomeAndSummaryModule = require(script.Parent.Flags.FFlagExpChatTextChannelWindowWelcomeAndSummary)

return {
	create = function(p1)
		-- upvalues: signalsModule (ref), fFlagExpChatTextChannelWindowWelcomeAndSummaryModule (ref), robloxReplicatedStorageService (ref), fFlagChatSummariesSettingEnabled (ref), fFlagEnableClientSummarySystemMessageOnLua (ref)
		local var1, var2 = signalsModule.createSignal(false)
		
		if fFlagExpChatTextChannelWindowWelcomeAndSummaryModule then
			coroutine.wrap(function()
				-- upvalues: robloxReplicatedStorageService (copy), p1 (ref), fFlagChatSummariesSettingEnabled (copy), fFlagEnableClientSummarySystemMessageOnLua (copy), var2 (ref)
				local expChatFeatureValueChanged = robloxReplicatedStorageService:WaitForChild("ExpChatFeatureValueChanged", 10)
				
				if expChatFeatureValueChanged then
					expChatFeatureValueChanged.OnClientEvent:Connect(function(p2, p3, p4)
						-- upvalues: p1 (copy), fFlagChatSummariesSettingEnabled (copy), fFlagEnableClientSummarySystemMessageOnLua (copy), var2 (copy)
						if tostring(p2) ~= p1 then return end
						local isEnabled
						local var3 = fFlagEnableClientSummarySystemMessageOnLua
						
						if fFlagChatSummariesSettingEnabled then
							if p3 == "AllowThirdPartySummary" then
								isEnabled = p4 == "Enabled"
								isEnabled = nil
							else
								isEnabled = nil
							end
							if isEnabled ~= nil then
								var2(isEnabled)
							end
							return
						elseif var3 and p3 == "EligibleForThirdPartySummary" then
							isEnabled = p4 == "true"
							isEnabled = nil
						end
					end)
					
					return
				end
			end)()
		end
		return { getIsEligible = var1 }
	end,
	resolveEligible = function(p1, p2, p3, p4)
		if p3 then
			if p1 == "AllowThirdPartySummary" then
				return p2 == "Enabled"
			end
		else
			return if p4 and p1 == "EligibleForThirdPartySummary" then p2 == "true" else nil
		end
	end
}