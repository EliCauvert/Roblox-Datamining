local createSignal = require(script:FindFirstAncestor("ExpChat").Parent.Signals).createSignal

return function()
	-- upvalues: createSignal (ref)
	local var0, var1 = createSignal(false)
	local var2, var3 = createSignal(true)
	local var4, var5 = createSignal(false)
	local var6, var7 = createSignal({})
	local var8, var9 = createSignal(1)
	local var10, var11 = createSignal("")
	local var12, var13 = createSignal("Disabled")
	local var14, var15 = createSignal(nil)
	local var16, var17 = createSignal(nil)
	local var18, var19 = createSignal(0)
	local var20, var21 = createSignal({})
	
	return {
		getIsEnabled = var0,
		getIsLoading = var2,
		getIsTrayOpen = var4,
		getCategoryGroups = var6,
		getSelectedGroupIndex = var8,
		getVersion = var10,
		getAccessLevel = var12,
		getLayoutModeOverride = var14,
		getPresetCooldownEndsAt = var16,
		getChatWindowBottomY = var18,
		getPresetClickCounts = var20,
		setIsEnabled = var1,
		setIsLoading = var3,
		setIsTrayOpen = var5,
		setCategoryGroups = var7,
		setSelectedGroupIndex = var9,
		setVersion = var11,
		setAccessLevel = var13,
		setLayoutModeOverride = var15,
		setPresetCooldownEndsAt = var17,
		setChatWindowBottomY = var19,
		incrementPresetClickCount = function(value)
			-- upvalues: var20 (ref), var21 (ref)
			local cloned = table.clone(var20(false))
			cloned[value] = if cloned[value] then cloned[value] + 1 else 1
			var21(cloned)
		end
	}
end