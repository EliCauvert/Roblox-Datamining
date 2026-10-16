local Parent = script:FindFirstAncestor("ExpChat").Parent
local SignalsModule = require(Parent.Signals)
local SharedFlagsModule = require(Parent.SharedFlags)
local CreateUserChatSettingStoreModule = require(script.createUserChatSettingStore)
local FFlagChatSummariesSettingEnabled = SharedFlagsModule.FFlagChatSummariesSettingEnabled

local function _(p1, p2, Callback: (any) -> (), Callback1: (any) -> ()) --[[ Line: 15 | Named "applyAIRephraseFeatureValue" ]]
	if p1 == "AIRephraseSettingStatus" then
		Callback(p2 == "Enabled" or p2 == "Disabled")
		Callback1(p2 == "Enabled")
	end
end

local function buildAIRephraseConfig() --[[ Line: 27 ]]
	return {
		requiresChatEnabled = true,
		setupListener = function(_, _) --[[ Line: 29 ]]
			return function() --[[ Line: 30 ]] end
		end,
		buildFeatureValueHandler = function(Callback, Callback1) --[[ Line: 32 ]]
			return function(p1, p2) --[[ Line: 33 ]]
				-- upvalues: Callback (copy), Callback1 (copy)
				if p1 == "AIRephraseSettingStatus" then
					Callback(p2 == "Enabled" or p2 == "Disabled")
					Callback1(p2 == "Enabled")
				end
			end
		end,
		onSetEnabled = function(p1, Callback: (any) -> ()) --[[ Line: 37 ]]
			Callback(p1)
		end
	}
end

local _ = function(p1, p2, Callback: (any) -> (), Callback1: (any) -> ()) --[[ Line: 44 | Named "applyChatSummariesFeatureValue" ]]
	if p1 == "AllowThirdPartySummary" then
		Callback(p2 == "Enabled" or p2 == "Disabled")
		Callback1(p2 == "Enabled")
	end
end

local function buildChatSummariesConfig() --[[ Line: 56 ]]
	return {
		requiresChatEnabled = false,
		setupListener = function(_, _) --[[ Line: 58 ]]
			return function() --[[ Line: 59 ]] end
		end,
		buildFeatureValueHandler = function(Callback, Callback1) --[[ Line: 61 ]]
			return function(p1, p2) --[[ Line: 62 ]]
				-- upvalues: Callback (copy), Callback1 (copy)
				if p1 == "AllowThirdPartySummary" then
					Callback(p2 == "Enabled" or p2 == "Disabled")
					Callback1(p2 == "Enabled")
				end
			end
		end,
		onSetEnabled = function(p1, Callback: (any) -> ()) --[[ Line: 66 ]]
			Callback(p1)
		end
	}
end

local Computed = if SharedFlagsModule.FFlagAIRephraseSettingEnabled then SignalsModule.createComputed(function() --[[ Line: 74 ]]
	-- upvalues: CreateUserChatSettingStoreModule (copy), buildAIRephraseConfig (copy)
	return CreateUserChatSettingStoreModule((buildAIRephraseConfig()))
end) else nil
local Computed1 = if FFlagChatSummariesSettingEnabled then SignalsModule.createComputed(function() --[[ Line: 80 ]]
	-- upvalues: CreateUserChatSettingStoreModule (copy), buildChatSummariesConfig (copy)
	return CreateUserChatSettingStoreModule((buildChatSummariesConfig()))
end) else nil

return {
	getAIRephraseSettingStore = Computed,
	getChatSummariesSettingStore = Computed1,
	updateExpChatFeatureValue = function(p1, p2) --[[ Line: 88 ]]
		-- upvalues: Computed (copy), Computed1 (copy)
		if Computed then
			Computed(false).setIsSettingVisible(p1, p2)
		end
		if Computed1 then
			Computed1(false).setIsSettingVisible(p1, p2)
		end
	end
}