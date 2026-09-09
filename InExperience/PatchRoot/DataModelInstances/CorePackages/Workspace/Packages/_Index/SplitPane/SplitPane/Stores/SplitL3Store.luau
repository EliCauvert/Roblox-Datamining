local signalsModule = require(script:FindFirstAncestor("SplitPane").Parent.Signals)

local function createSplitL3Store()
	-- upvalues: signalsModule (ref)
	local var1, var2 = signalsModule.createSignal(nil)
	local var3, var4 = signalsModule.createSignal(nil)
	local var5, var6 = signalsModule.createSignal(0)
	local var7, var8 = signalsModule.createSignal(nil)
	
	return {
		getPendingSplitSubPaneTag = var1,
		setPendingSplitSubPaneTag = var2,
		getPendingSplitSubPaneDetail = var3,
		setPendingSplitSubPaneDetail = var4,
		getSplitL2SessionVersion = var5,
		setSplitL2SessionVersion = var6,
		getSplitL3AppliedDetail = var7,
		setSplitL3AppliedDetail = var8
	}
end

local var1 = nil

return {
	getStore = function()
		-- upvalues: var1 (write), createSplitL3Store (ref)
		if var1 == nil then
			var1 = createSplitL3Store()
		end
		return var1
	end
}