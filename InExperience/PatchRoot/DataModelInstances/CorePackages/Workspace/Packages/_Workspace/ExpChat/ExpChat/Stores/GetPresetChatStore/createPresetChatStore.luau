local createSignal = require(script:FindFirstAncestor("ExpChat").Parent.Signals).createSignal

return function()
	-- upvalues: createSignal (ref)
	local var1, var2 = createSignal(false)
	local var3, var4 = createSignal(true)
	local var5, var6 = createSignal(false)
	local var7, var8 = createSignal({})
	local var9, var10 = createSignal(1)
	local var11, var12 = createSignal("")
	local var13, var14 = createSignal("Disabled")
	local var15, var16 = createSignal(nil)
	local var17, var18 = createSignal(nil)
	local var19, var20 = createSignal(0)
	local var21, var22 = createSignal({})
	
	return {
		getIsEnabled = var1,
		getIsLoading = var3,
		getIsTrayOpen = var5,
		getCategoryGroups = var7,
		getSelectedGroupIndex = var9,
		getVersion = var11,
		getAccessLevel = var13,
		getLayoutModeOverride = var15,
		getPresetCooldownEndsAt = var17,
		getChatWindowBottomY = var19,
		getPresetClickCounts = var21,
		setIsEnabled = var2,
		setIsLoading = var4,
		setIsTrayOpen = var6,
		setCategoryGroups = var8,
		setSelectedGroupIndex = var10,
		setVersion = var12,
		setAccessLevel = var14,
		setLayoutModeOverride = var16,
		setPresetCooldownEndsAt = var18,
		setChatWindowBottomY = var20,
		incrementPresetClickCount = function(value)
			-- upvalues: var21 (ref), var22 (ref)
			local cloned = table.clone(var21(false))
			cloned[value] = if cloned[value] then cloned[value] + 1 else 1
			var22(cloned)
		end
	}
end