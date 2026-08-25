local signalsModule = require(script:FindFirstAncestor("ExpChat").Parent.Signals)
local createSignal = signalsModule.createSignal
local createComputed = signalsModule.createComputed
local getChatStatusStoreModule = require(script.Parent.Parent.GetChatStatusStore)

return function(p0)
	-- upvalues: createSignal (ref), getChatStatusStoreModule (ref), createComputed (ref)
	local var2, var3 = createSignal(false)
	local var4, var5 = createSignal(false)
	local var6 = if p0.requiresChatEnabled ~= nil then false else p0.requiresChatEnabled
	local var7 = getChatStatusStoreModule(false)
	local _ = nil
	local _ = nil
	
	return {
		getIsSettingVisible = createComputed(function(p1)
			-- upvalues: var6 (ref), var2 (ref), var7 (ref)
			return if var6 then var2(p1) and var7.getChatStatus(p1) == "Enabled" else var2(p1)
		end),
		getIsSettingEnabled = u88,
		setIsSettingVisible = if p0.buildFeatureValueHandler then p0.buildFeatureValueHandler(var3, var5) else function(_, _) end,
		setIsSettingEnabled = function(value)
			-- upvalues: p0 (ref), var5 (ref)
			p0.onSetEnabled(value, var5)
		end,
		initialize = p0.onInitialize or function() end,
		cleanup = p0.setupListener(var3, var5)
	}
end