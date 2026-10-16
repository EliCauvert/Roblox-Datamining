local SignalsModule = require(script:FindFirstAncestor("SplitPane").Parent.Signals)

local function createSplitL3Store() --[[ Line: 17 ]]
	-- upvalues: SignalsModule (copy)
	local Signal, Signal2 = SignalsModule.createSignal(nil)
	local Signal1, Signal2_1 = SignalsModule.createSignal(nil)
	local Signal3, Signal2_2 = SignalsModule.createSignal(0)
	local Signal4, Signal2_3 = SignalsModule.createSignal(nil)
	
	return {
		getPendingSplitSubPaneTag = Signal,
		setPendingSplitSubPaneTag = Signal2,
		getPendingSplitSubPaneDetail = Signal1,
		setPendingSplitSubPaneDetail = Signal2_1,
		getSplitL2SessionVersion = Signal3,
		setSplitL2SessionVersion = Signal2_2,
		getSplitL3AppliedDetail = Signal4,
		setSplitL3AppliedDetail = Signal2_3
	}
end

local v1 = nil

return {
	getStore = function() --[[ Line: 36 ]]
		-- upvalues: v1 (ref), createSplitL3Store (copy)
		if v1 == nil then
			v1 = createSplitL3Store()
		end
		return v1
	end
}