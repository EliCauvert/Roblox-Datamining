local parent = script:FindFirstAncestor("ExpChat").Parent
local signalsModule = require(parent.Signals)
local sharedFlagsModule = require(parent.SharedFlags)
local createUserChatSettingStoreModule = require(script.createUserChatSettingStore)
local fFlagAIRephraseSettingEnabled = sharedFlagsModule.FFlagAIRephraseSettingEnabled
local fFlagChatSummariesSettingEnabled = sharedFlagsModule.FFlagChatSummariesSettingEnabled

local function _(p1, p2, p3, p4)
	if p1 == "AIRephraseSettingStatus" then
		p3(if p2 ~= "Enabled" then p2 == "Disabled" else true)
		p4(p2 == "Enabled")
	end
end

local function buildAIRephraseConfig()
	return {
		requiresChatEnabled = true,
		setupListener = function(_, _)
			return function() end
		end,
		buildFeatureValueHandler = function(p1, p2)
			return function(p3, p4)
				-- upvalues: p1 (ref), p2 (ref)
				if p3 == "AIRephraseSettingStatus" then
					p1(if p4 ~= "Enabled" then p4 == "Disabled" else true)
					p2(p4 == "Enabled")
				end
			end
		end,
		onSetEnabled = function(value, p1)
			p1(value)
		end
	}
end

local _ = function(p1, p2, p3, p4)
	if p1 == "AllowThirdPartySummary" then
		p3(if p2 ~= "Enabled" then p2 == "Disabled" else true)
		p4(p2 == "Enabled")
	end
end

local function buildChatSummariesConfig()
	return {
		requiresChatEnabled = false,
		setupListener = function(_, _)
			return function() end
		end,
		buildFeatureValueHandler = function(p1, p2)
			return function(p3, p4)
				-- upvalues: p1 (ref), p2 (ref)
				if p3 == "AllowThirdPartySummary" then
					p1(if p4 ~= "Enabled" then p4 == "Disabled" else true)
					p2(p4 == "Enabled")
				end
			end
		end,
		onSetEnabled = function(value, p1)
			p1(value)
		end
	}
end

local var1 = if fFlagAIRephraseSettingEnabled then signalsModule.createComputed(function()
	-- upvalues: createUserChatSettingStoreModule (ref), buildAIRephraseConfig (ref)
	return createUserChatSettingStoreModule(buildAIRephraseConfig())
end) else nil
local var2 = if fFlagChatSummariesSettingEnabled then signalsModule.createComputed(function()
	-- upvalues: createUserChatSettingStoreModule (ref), buildChatSummariesConfig (ref)
	return createUserChatSettingStoreModule(buildChatSummariesConfig())
end) else nil

return {
	getAIRephraseSettingStore = var1,
	getChatSummariesSettingStore = var2,
	updateExpChatFeatureValue = function(p1, p2)
		-- upvalues: var1 (ref), var2 (ref)
		if var1 then
			var1(false).setIsSettingVisible(p1, p2)
		end
		if var2 then
			var2(false).setIsSettingVisible(p1, p2)
		end
	end
}