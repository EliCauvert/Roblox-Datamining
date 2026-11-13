local Groups = script:FindFirstAncestor("Groups")
local SignalsModule = require(Groups.Parent.Signals)
local FoldSearchTextModule = require(Groups.Common.foldSearchText)

return function(GroupId, Tbl, p1)
	-- upvalues: SignalsModule (copy), FoldSearchTextModule (copy)
	local function _(GroupId)
		return if GroupId then { section = "overview", groupId = GroupId } else nil
	end
	
	local Signal, Signal2 = SignalsModule.createSignal(if GroupId then { section = "overview", groupId = GroupId } else nil)
	
	local function selectedGroupId(p2)
		-- upvalues: Signal (copy)
		local SignalResult = Signal(p2)
		
		return if SignalResult then SignalResult.groupId else nil
	end
	
	local Signal1, Signal2_1 = SignalsModule.createSignal("")
	local Signal3, Signal2_2 = SignalsModule.createSignal(false)
	local Signal4, Signal2_3 = SignalsModule.createSignal("")
	local Signal5, Signal2_4 = SignalsModule.createSignal(if Tbl then table.clone(Tbl) else {})
	local Signal6, Signal2_5 = SignalsModule.createSignal(Vector2.zero)
	local Signal7, Signal2_6 = SignalsModule.createSignal({})
	local Signal8, Signal2_7 = SignalsModule.createSignal(p1)
	local Signal9, Signal2_8 = SignalsModule.createSignal(0)
	local t = {}
	local DelayedThread = nil
	
	local _ = function(p2)
		-- upvalues: Signal4 (copy), Signal2_5 (copy), Signal2_3 (copy)
		if p2 ~= Signal4(false) then
			Signal2_5(Vector2.zero)
			Signal2_3(p2)
		end
	end
	
	return {
		activeDestination = Signal,
		selectedGroupId = selectedGroupId,
		selectGroup = function(GroupId)
			-- upvalues: Signal2 (copy)
			Signal2(if GroupId then { section = "overview", groupId = GroupId } else nil)
		end,
		searchText = Signal1,
		searchVisible = Signal3,
		setSearchVisible = Signal2_2,
		query = Signal4,
		expanded = Signal5,
		hasEntryExpansion = Tbl ~= nil,
		scrollPosition = Signal6,
		setScrollPosition = Signal2_5,
		revealTarget = Signal8,
		clearReveal = function()
			-- upvalues: Signal2_7 (copy)
			Signal2_7(nil)
		end,
		setSectionFrame = function(Key, p2)
			-- upvalues: t (copy)
			t[Key] = p2
		end,
		getSectionFrame = function(p2)
			-- upvalues: t (copy)
			return t[p2]
		end,
		isVisiting = function(p2, p3): boolean
			-- upvalues: Signal7 (copy)
			return Signal7(p3)[p2] == true
		end,
		setVisitingGroups = function(List)
			-- upvalues: Signal2_6 (copy)
			local t = {}
			
			for _, value in List do
				t[value] = true
			end
			Signal2_6(t)
		end,
		sectionRefreshCount = Signal9,
		refreshSections = function()
			-- upvalues: Signal2_8 (copy), Signal9 (copy)
			Signal2_8(Signal9(false) + 1)
		end,
		setExpanded = function(Key, p2)
			-- upvalues: Signal5 (copy), Signal2_4 (copy)
			local Copy = table.clone(Signal5(false))
			Copy[Key] = p2
			Signal2_4(Copy)
		end,
		setSearchText = function(p2)
			-- upvalues: DelayedThread (ref), Signal2_7 (copy), Signal2_1 (copy), Signal4 (copy), Signal2_5 (copy), Signal2_3 (copy), FoldSearchTextModule (upval)
			if DelayedThread then
				task.cancel(DelayedThread)
				DelayedThread = nil
			end
			Signal2_7(nil)
			Signal2_1(p2)
			
			if p2 ~= "" then
				DelayedThread = task.delay(0.4, function()
					-- upvalues: DelayedThread (upval), FoldSearchTextModule (upval), p2 (copy), Signal4 (upval), Signal2_5 (upval), Signal2_3 (upval)
					DelayedThread = nil
					local FoldSearchTextModuleResult = FoldSearchTextModule(p2)
					
					if FoldSearchTextModuleResult ~= Signal4(false) then
						Signal2_5(Vector2.zero)
						Signal2_3(FoldSearchTextModuleResult)
					end
				end)
			elseif Signal4(false) ~= "" then
				Signal2_5(Vector2.zero)
				Signal2_3("")
				
				return
			end
		end,
		dispose = function()
			-- upvalues: DelayedThread (ref)
			if DelayedThread then
				task.cancel(DelayedThread)
				DelayedThread = nil
			end
		end
	}
end