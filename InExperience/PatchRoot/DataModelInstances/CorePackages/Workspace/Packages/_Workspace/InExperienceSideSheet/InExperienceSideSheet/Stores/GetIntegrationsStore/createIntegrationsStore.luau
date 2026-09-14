local parent = script:FindFirstAncestor("InExperienceSideSheet").Parent
local _ = require(parent.Chrome)
local signalsModule = require(parent.Signals)

return function()
	-- upvalues: signalsModule (ref)
	local var1, var2 = signalsModule.createSignal({})
	local var3, var4 = signalsModule.createSignal({})
	local var5, var6 = signalsModule.createSignal({})
	local var7, var8 = signalsModule.createSignal({})
	local var9, var10 = signalsModule.createSignal({})
	local var11, var12 = signalsModule.createSignal({})
	
	return {
		getUnibarIntegrations = var1,
		setUnibarIntegrations = var2,
		getAboveFoldIntegrations = var3,
		setAboveFoldIntegrations = var4,
		getBelowFoldIntegrations = var5,
		setBelowFoldIntegrations = var6,
		getSessionActionIntegrations = var7,
		setSessionActionIntegrations = var8,
		getScrollableContentTopWidgetIntegrations = var9,
		setScrollableContentTopWidgetIntegrations = var10,
		getScrollableContentBottomWidgetIntegrations = var11,
		setScrollableContentBottomWidgetIntegrations = var12
	}
end