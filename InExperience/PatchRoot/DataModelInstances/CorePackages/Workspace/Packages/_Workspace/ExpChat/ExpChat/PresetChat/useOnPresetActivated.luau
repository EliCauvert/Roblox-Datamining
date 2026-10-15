local textChatService = game:GetService("TextChatService")
local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local expChatSharedModule = require(parent.ExpChatShared)
local reactModule = require(parent.React)
local getPresetChatStoreModule = require(expChat.Stores.GetPresetChatStore)
local sendPresetModule = require(script.Parent.sendPreset)
local fFlagExpChatUniverseChatPresetEnabledModule = require(expChat.Flags.FFlagExpChatUniverseChatPresetEnabled)
local fFlagExpChatPresetChatAutocompleteEnabledModule = require(expChat.Flags.FFlagExpChatPresetChatAutocompleteEnabled)
local fFlagExpChatPresetTrayDismissAnalyticsModule = require(expChat.Flags.FFlagExpChatPresetTrayDismissAnalytics)
local var1 = expChatSharedModule.Flags.FIntPresetChatCooldownLuaMs / 1000
local useOnPresetActivated = expChatSharedModule.Logger:new("ExpChat/PresetChat/useOnPresetActivated")

local function _()
	-- upvalues: textChatService (ref)
	local RBXGeneral = textChatService:FindFirstChild("RBXGeneral", true)
	
	return if RBXGeneral and RBXGeneral:IsA("TextChannel") then RBXGeneral else nil
end

return function(value)
	-- upvalues: getPresetChatStoreModule (ref), reactModule (ref), fFlagExpChatPresetTrayDismissAnalyticsModule (ref), fFlagExpChatPresetChatAutocompleteEnabledModule (ref), var1 (ref), sendPresetModule (ref), useOnPresetActivated (ref), textChatService (ref), fFlagExpChatUniverseChatPresetEnabledModule (ref)
	local var2 = getPresetChatStoreModule(false)
	local textChannel = value.textChannel
	local closePresetTray = value.closePresetTray
	
	return reactModule.useCallback(function(p1)
		-- upvalues: fFlagExpChatPresetTrayDismissAnalyticsModule (copy), var2 (ref), fFlagExpChatPresetChatAutocompleteEnabledModule (copy), var1 (copy), sendPresetModule (copy), textChannel (ref), useOnPresetActivated (copy), closePresetTray (ref), textChatService (copy), fFlagExpChatUniverseChatPresetEnabledModule (copy)
		if fFlagExpChatPresetTrayDismissAnalyticsModule and var2.getIsTrayOpen(false) then
			var2.incrementPresetClickCount(p1)
		end
		if fFlagExpChatPresetChatAutocompleteEnabledModule then
			var2.setPresetCooldownEndsAt(os.clock() + var1)
			local var3 = sendPresetModule(p1, textChannel)
			
			if var3 ~= "Sent" then
				var2.setPresetCooldownEndsAt(nil)
			end
			if var3 == "NoChannel" then
				useOnPresetActivated:warning("Preset {} activated but no target text channel was provided; skipping send.", p1)
				closePresetTray()
				
				return
			elseif not fFlagExpChatPresetTrayDismissAnalyticsModule then
				var2.incrementPresetClickCount(p1)
			end
			closePresetTray()
			
			return
		else
			local var4 = textChannel
			
			if var4 ~= nil and var4.Name ~= "RBXGeneral" then
				local RBXGeneral = textChatService:FindFirstChild("RBXGeneral", true)
				var4 = if RBXGeneral and RBXGeneral:IsA("TextChannel") then RBXGeneral else nil
			end
			var2.setPresetCooldownEndsAt(os.clock() + var1)
			
			if not var4 then
				if not fFlagExpChatUniverseChatPresetEnabledModule then
					useOnPresetActivated:warning("Preset {} activated but no target text channel was provided; skipping send.", p1)
					var2.setPresetCooldownEndsAt(nil)
					closePresetTray()
					
					return
				elseif not pcall(function()
					-- upvalues: textChatService (copy), p1 (ref)
					textChatService:SendUniverseChatPresetAsync(p1)
				end) then
					var2.setPresetCooldownEndsAt(nil)
				end
			elseif not pcall(function()
				-- upvalues: var4 (write), p1 (ref)
				var4:SendPresetAsync(p1)
			end) then
				var2.setPresetCooldownEndsAt(nil)
			end
			if not fFlagExpChatPresetTrayDismissAnalyticsModule then
				var2.incrementPresetClickCount(p1)
			end
			closePresetTray()
		end
	end, { textChannel, var2, closePresetTray })
end