local parent = script:FindFirstAncestor("ExpChat").Parent
local signalsModule = require(parent.Signals)
local sharedFlagsModule = require(parent.SharedFlags)
local createUserChatSettingStoreModule = require(script.createUserChatSettingStore)
local fFlagAIRephraseSettingEnabled = sharedFlagsModule.FFlagAIRephraseSettingEnabled
local fFlagChatSummariesSettingEnabled = sharedFlagsModule.FFlagChatSummariesSettingEnabled

local function _(p0, p1, p2, p3)
	if p0 == "AIRephraseSettingStatus" then
		p2(if p1 ~= "Enabled" then p1 == "Disabled" else true)
		p3(p1 == "Enabled")
	end
end

local function buildAIRephraseConfig()
	return {
		requiresChatEnabled = true,
		setupListener = function(_, _)
			return function() end
		end,
		buildFeatureValueHandler = function(p4, p5)
			return function(p6, p7)
				-- upvalues: p4 (ref), p5 (ref)
				if p6 == "AIRephraseSettingStatus" then
					p4(if p7 ~= "Enabled" then p7 == "Disabled" else true)
					p5(p7 == "Enabled")
				end
			end
		end,
		onSetEnabled = function(value, p8)
			p8(value)
		end
	}
end

local _ = function(p9, p10, p11, p12)
	if p9 == "AllowThirdPartySummary" then
		p11(if p10 ~= "Enabled" then p10 == "Disabled" else true)
		p12(p10 == "Enabled")
	end
end

local function buildChatSummariesConfig()
	return {
		requiresChatEnabled = false,
		setupListener = function(_, _)
			return function() end
		end,
		buildFeatureValueHandler = function(p13, p14)
			return function(p15, p16)
				-- upvalues: p13 (ref), p14 (ref)
				if p15 == "AllowThirdPartySummary" then
					p13(if p16 ~= "Enabled" then p16 == "Disabled" else true)
					p14(p16 == "Enabled")
				end
			end
		end,
		onSetEnabled = function(value, p17)
			p17(value)
		end
	}
end

local var5 = if fFlagAIRephraseSettingEnabled then signalsModule.createComputed(function()
	-- upvalues: createUserChatSettingStoreModule (ref), buildAIRephraseConfig (ref)
	return createUserChatSettingStoreModule(buildAIRephraseConfig())
end) else nil
local var6 = if fFlagChatSummariesSettingEnabled then signalsModule.createComputed(function()
	-- upvalues: createUserChatSettingStoreModule (ref), buildChatSummariesConfig (ref)
	return createUserChatSettingStoreModule(buildChatSummariesConfig())
end) else nil

return {
	getAIRephraseSettingStore = var5,
	getChatSummariesSettingStore = var6,
	updateExpChatFeatureValue = function(p18, p19)
		-- upvalues: var5 (ref), var6 (ref)
		if var5 then
			var5(false).setIsSettingVisible(p18, p19)
		end
		if var6 then
			var6(false).setIsSettingVisible(p18, p19)
		end
	end
}