local Parent = script.Parent.Parent
local SignalsModule = require(Parent.Signals)
local SharedFlagsModule = require(Parent.SharedFlags)
local RobloxReplicatedStorage = game:GetService("RobloxReplicatedStorage")
local FFlagChatSummariesSettingEnabled = SharedFlagsModule.FFlagChatSummariesSettingEnabled
local FFlagEnableClientSummarySystemMessageOnLua = SharedFlagsModule.FFlagEnableClientSummarySystemMessageOnLua
local FFlagExpChatTextChannelWindowWelcomeAndSummaryModule = require(script.Parent.Flags.FFlagExpChatTextChannelWindowWelcomeAndSummary)

return {
	create = function(p1) --[[ Line: 42 ]]
		-- upvalues: SignalsModule (copy), FFlagExpChatTextChannelWindowWelcomeAndSummaryModule (copy), RobloxReplicatedStorage (copy), FFlagChatSummariesSettingEnabled (copy), FFlagEnableClientSummarySystemMessageOnLua (copy)
		local Signal, Signal2 = SignalsModule.createSignal(false)
		
		if FFlagExpChatTextChannelWindowWelcomeAndSummaryModule then
			coroutine.wrap(function() --[[ Line: 46 ]]
				-- upvalues: RobloxReplicatedStorage (upval), p1 (copy), FFlagChatSummariesSettingEnabled (upval), FFlagEnableClientSummarySystemMessageOnLua (upval), Signal2 (copy)
				local ExpChatFeatureValueChanged = RobloxReplicatedStorage:WaitForChild("ExpChatFeatureValueChanged", 10)
				
				if ExpChatFeatureValueChanged then
					ExpChatFeatureValueChanged.OnClientEvent:Connect(function(p2, p3, p4) --[[ Line: 53 ]]
						-- upvalues: p1 (upval), FFlagChatSummariesSettingEnabled (upval), FFlagEnableClientSummarySystemMessageOnLua (upval), Signal2 (upval)
						local IsEnabled = nil
						if tostring(p2) ~= p1 then return end
						repeat
							if FFlagChatSummariesSettingEnabled then
								if p3 == "AllowThirdPartySummary" then
									IsEnabled = p4 == "Enabled"
									break
								end
							elseif FFlagEnableClientSummarySystemMessageOnLua and p3 == "EligibleForThirdPartySummary" then
								IsEnabled = p4 == "true"
								break
							end
							IsEnabled = nil
						until true
						if IsEnabled ~= nil then
							Signal2(IsEnabled)
						end
					end)
					
					return
				end
			end)()
		end
		return { getIsEligible = Signal }
	end,
	resolveEligible = function(p1, p2, p3, p4): boolean? --[[ Line: 24 ]]
		if p3 then
			if p1 == "AllowThirdPartySummary" then
				return p2 == "Enabled"
			end
		elseif p4 and p1 == "EligibleForThirdPartySummary" then
			return p2 == "true"
		end
		return nil
	end
}