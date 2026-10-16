local TextChatService = game:GetService("TextChatService")
local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local ExpChatSharedModule = require(Parent.ExpChatShared)
local ReactModule = require(Parent.React)
local GetPresetChatStoreModule = require(ExpChat.Stores.GetPresetChatStore)
local SendPresetModule = require(script.Parent.sendPreset)
local FFlagExpChatUniverseChatPresetEnabledModule = require(ExpChat.Flags.FFlagExpChatUniverseChatPresetEnabled)
local FFlagExpChatPresetChatAutocompleteEnabledModule = require(ExpChat.Flags.FFlagExpChatPresetChatAutocompleteEnabled)
local FFlagExpChatPresetTrayDismissAnalyticsModule = require(ExpChat.Flags.FFlagExpChatPresetTrayDismissAnalytics)
local FIntPresetChatCooldownLuaMsRatio = ExpChatSharedModule.Flags.FIntPresetChatCooldownLuaMs / 1000
local UseOnPresetActivated = ExpChatSharedModule.Logger:new("ExpChat/PresetChat/useOnPresetActivated")

local function _() --[[ Line: 31 | Named "getRBXGeneralChannel" ]]
	-- upvalues: TextChatService (copy)
	local RBXGeneral = TextChatService:FindFirstChild("RBXGeneral", true)
	
	return if RBXGeneral and RBXGeneral:IsA("TextChannel") then RBXGeneral else nil
end

return function(p1) --[[ Line: 39 | Named "useOnPresetActivated" ]]
	-- upvalues: GetPresetChatStoreModule (copy), ReactModule (copy), FFlagExpChatPresetTrayDismissAnalyticsModule (copy), FFlagExpChatPresetChatAutocompleteEnabledModule (copy), FIntPresetChatCooldownLuaMsRatio (copy), SendPresetModule (copy), UseOnPresetActivated (copy), TextChatService (copy), FFlagExpChatUniverseChatPresetEnabledModule (copy)
	local PresetChatStoreModule = GetPresetChatStoreModule(false)
	local TextChannel = p1.textChannel
	local ClosePresetTrayFunction = p1.closePresetTray
	
	return ReactModule.useCallback(function(PresetId) --[[ Line: 44 ]]
		-- upvalues: FFlagExpChatPresetTrayDismissAnalyticsModule (upval), PresetChatStoreModule (copy), FFlagExpChatPresetChatAutocompleteEnabledModule (upval), FIntPresetChatCooldownLuaMsRatio (upval), SendPresetModule (upval), TextChannel (copy), UseOnPresetActivated (upval), ClosePresetTrayFunction (copy), TextChatService (upval), FFlagExpChatUniverseChatPresetEnabledModule (upval)
		if FFlagExpChatPresetTrayDismissAnalyticsModule and PresetChatStoreModule.getIsTrayOpen(false) then
			PresetChatStoreModule.incrementPresetClickCount(PresetId)
		end
		if FFlagExpChatPresetChatAutocompleteEnabledModule then
			PresetChatStoreModule.setPresetCooldownEndsAt(os.clock() + FIntPresetChatCooldownLuaMsRatio)
			local SendPresetModuleResult = SendPresetModule(PresetId, TextChannel)
			
			if SendPresetModuleResult ~= "Sent" then
				PresetChatStoreModule.setPresetCooldownEndsAt(nil)
			end
			if SendPresetModuleResult == "NoChannel" then
				UseOnPresetActivated:warning("Preset {} activated but no target text channel was provided; skipping send.", PresetId)
				ClosePresetTrayFunction()
				
				return
			end
			if not FFlagExpChatPresetTrayDismissAnalyticsModule then
				PresetChatStoreModule.incrementPresetClickCount(PresetId)
			end
			ClosePresetTrayFunction()
			
			return
		else
			local TextChannel1 = TextChannel
			
			if TextChannel1 ~= nil and TextChannel1.Name ~= "RBXGeneral" then
				local RBXGeneral = TextChatService:FindFirstChild("RBXGeneral", true)
				TextChannel1 = if RBXGeneral and RBXGeneral:IsA("TextChannel") then RBXGeneral else nil
			end
			PresetChatStoreModule.setPresetCooldownEndsAt(os.clock() + FIntPresetChatCooldownLuaMsRatio)
			
			if TextChannel1 then
				if not pcall(function() --[[ Line: 105 ]]
					-- upvalues: TextChannel1 (ref), PresetId (copy)
					TextChannel1:SendPresetAsync(PresetId)
				end) then
					PresetChatStoreModule.setPresetCooldownEndsAt(nil)
				end
			else
				if not FFlagExpChatUniverseChatPresetEnabledModule then
					UseOnPresetActivated:warning("Preset {} activated but no target text channel was provided; skipping send.", PresetId)
					PresetChatStoreModule.setPresetCooldownEndsAt(nil)
					ClosePresetTrayFunction()
					
					return
				end
				if not pcall(function() --[[ Line: 98 ]]
					-- upvalues: TextChatService (upval), PresetId (copy)
					TextChatService:SendUniverseChatPresetAsync(PresetId)
				end) then
					PresetChatStoreModule.setPresetCooldownEndsAt(nil)
				end
			end
			if not FFlagExpChatPresetTrayDismissAnalyticsModule then
				PresetChatStoreModule.incrementPresetClickCount(PresetId)
			end
			ClosePresetTrayFunction()
		end
	end, {
		TextChannel,
		PresetChatStoreModule,
		ClosePresetTrayFunction
	})
end