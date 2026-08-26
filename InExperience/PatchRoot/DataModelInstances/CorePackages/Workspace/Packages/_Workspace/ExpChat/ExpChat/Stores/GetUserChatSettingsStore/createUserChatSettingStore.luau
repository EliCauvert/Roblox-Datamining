local signalsModule = require(script:FindFirstAncestor("ExpChat").Parent.Signals)
local createSignal = signalsModule.createSignal
local createComputed = signalsModule.createComputed
local getChatStatusStoreModule = require(script.Parent.Parent.GetChatStatusStore)

return function(p1)
	-- upvalues: createSignal (ref), getChatStatusStoreModule (ref), createComputed (ref)
	local var1, var2 = createSignal(false)
	local var3, var4 = createSignal(false)
	local var5 = if p1.requiresChatEnabled ~= nil then false else p1.requiresChatEnabled
	local var6 = getChatStatusStoreModule(false)
	local _ = nil
	local _ = nil
	
	return {
		getIsSettingVisible = createComputed(function(p2)
			-- upvalues: var5 (ref), var1 (ref), var6 (ref)
			return if var5 then var1(p2) and var6.getChatStatus(p2) == "Enabled" else var1(p2)
		end),
		getIsSettingEnabled = u88,
		setIsSettingVisible = if p1.buildFeatureValueHandler then p1.buildFeatureValueHandler(var2, var4) else function(_, _) end,
		setIsSettingEnabled = function(value)
			-- upvalues: p1 (ref), var4 (ref)
			p1.onSetEnabled(value, var4)
		end,
		initialize = p1.onInitialize or function() end,
		cleanup = p1.setupListener(var2, var4)
	}
end