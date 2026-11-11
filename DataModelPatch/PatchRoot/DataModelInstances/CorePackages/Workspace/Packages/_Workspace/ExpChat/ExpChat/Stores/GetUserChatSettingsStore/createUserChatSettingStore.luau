local SignalsModule = require(script:FindFirstAncestor("ExpChat").Parent.Signals)
local CreateSignalFunction = SignalsModule.createSignal
local CreateComputedFunction = SignalsModule.createComputed
local GetChatStatusStoreModule = require(script.Parent.Parent.GetChatStatusStore)

return function(p1)
	-- upvalues: CreateSignalFunction (copy), GetChatStatusStoreModule (copy), CreateComputedFunction (copy)
	local Signal, Signal2 = CreateSignalFunction(false)
	local Signal1, Signal2_1 = CreateSignalFunction(false)
	local RequiresChatEnabled = p1.requiresChatEnabled ~= nil and p1.requiresChatEnabled
	local ChatStatusStoreModule = GetChatStatusStoreModule(false)
	
	return {
		getIsSettingVisible = CreateComputedFunction(function(p2)
			-- upvalues: RequiresChatEnabled (copy), Signal (copy), ChatStatusStoreModule (copy)
			return if RequiresChatEnabled then Signal(p2) and ChatStatusStoreModule.getChatStatus(p2) == "Enabled" else Signal(p2)
		end),
		getIsSettingEnabled = CreateComputedFunction(function(p2)
			-- upvalues: RequiresChatEnabled (copy), Signal1 (copy), ChatStatusStoreModule (copy)
			return if RequiresChatEnabled then Signal1(p2) and ChatStatusStoreModule.getChatStatus(p2) == "Enabled" else Signal1(p2)
		end),
		setIsSettingVisible = if p1.buildFeatureValueHandler then p1.buildFeatureValueHandler(Signal2, Signal2_1) else function(_, _) end,
		setIsSettingEnabled = function(p2)
			-- upvalues: p1 (copy), Signal2_1 (copy)
			p1.onSetEnabled(p2, Signal2_1)
		end,
		initialize = p1.onInitialize or function() end,
		cleanup = p1.setupListener(Signal2, Signal2_1)
	}
end