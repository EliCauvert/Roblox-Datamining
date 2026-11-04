local SignalsModule = require(script:FindFirstAncestor("Groups").Parent.Signals)

return function(GroupId, Tbl)
	-- upvalues: SignalsModule (copy)
	local function _(GroupId)
		return if GroupId then { section = "overview", groupId = GroupId } else nil
	end
	
	local Signal, Signal2 = SignalsModule.createSignal(if GroupId then { section = "overview", groupId = GroupId } else nil)
	
	local function selectedGroupId(p1)
		-- upvalues: Signal (copy)
		local SignalResult = Signal(p1)
		
		return if SignalResult then SignalResult.groupId else nil
	end
	
	local Signal1, Signal2_1 = SignalsModule.createSignal(if Tbl then table.clone(Tbl) else {})
	local Signal3, Signal2_2 = SignalsModule.createSignal({})
	local Signal4, Signal2_3 = SignalsModule.createSignal(0)
	local t = {}
	
	return {
		activeDestination = Signal,
		selectedGroupId = selectedGroupId,
		selectGroup = function(GroupId)
			-- upvalues: Signal2 (copy)
			Signal2(if GroupId then { section = "overview", groupId = GroupId } else nil)
		end,
		expanded = Signal1,
		hasEntryExpansion = Tbl ~= nil,
		setSectionFrame = function(Key, p1)
			-- upvalues: t (copy)
			t[Key] = p1
		end,
		getSectionFrame = function(p1)
			-- upvalues: t (copy)
			return t[p1]
		end,
		isVisiting = function(p1, p2): boolean
			-- upvalues: Signal3 (copy)
			return Signal3(p2)[p1] == true
		end,
		setVisitingGroups = function(List)
			-- upvalues: Signal2_2 (copy)
			local t = {}
			
			for _, value in List do
				t[value] = true
			end
			Signal2_2(t)
		end,
		sectionRefreshCount = Signal4,
		refreshSections = function()
			-- upvalues: Signal2_3 (copy), Signal4 (copy)
			Signal2_3(Signal4(false) + 1)
		end,
		setExpanded = function(Key, p1)
			-- upvalues: Signal1 (copy), Signal2_1 (copy)
			local Copy = table.clone(Signal1(false))
			Copy[Key] = p1
			Signal2_1(Copy)
		end
	}
end