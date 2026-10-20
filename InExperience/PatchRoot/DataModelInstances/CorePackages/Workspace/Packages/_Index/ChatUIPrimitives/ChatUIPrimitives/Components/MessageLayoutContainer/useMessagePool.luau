local ChatUIPrimitives = script:FindFirstAncestor("ChatUIPrimitives")
local Parent = ChatUIPrimitives.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsExperimentalModule = require(Parent.SignalsExperimental)
local UseStableSignalModule = require(ChatUIPrimitives.Hooks.useStableSignal)

return function(p1)
	-- upvalues: ReactModule (copy), UseStableSignalModule (copy), SignalsExperimentalModule (copy), SignalsModule (copy)
	local UseRefResult = ReactModule.useRef({})
	local UseRefResult1 = ReactModule.useRef({})
	local UseRefResult2 = ReactModule.useRef(0)
	local MaxSlots = p1.maxSlots or 50
	local UseRefResult3 = ReactModule.useRef(p1.createSlotElement)
	UseRefResult3.current = p1.createSlotElement
	local UseStableSignalModuleResult, UseStableSignalModuleResult2 = UseStableSignalModule({})
	
	local function publishChildrenFromCache()
		-- upvalues: UseRefResult (copy), UseRefResult1 (copy), UseStableSignalModuleResult2 (copy)
		local Elements = {}
		
		for _, value in UseRefResult.current do
			Elements[value.stableKey] = value.element
		end
		for _, value1 in UseRefResult1.current do
			Elements[value1.stableKey] = value1.element
		end
		UseStableSignalModuleResult2(Elements)
	end
	
	local function rebuildElementsFromFactory()
		-- upvalues: UseRefResult3 (copy), UseRefResult (copy), UseRefResult1 (copy), publishChildrenFromCache (copy)
		local CurrentFunction = UseRefResult3.current
		
		for _, value in UseRefResult.current do
			value.element = CurrentFunction({
				getMessageId = value.getMessageId,
				getLayoutOrder = value.getLayoutOrder
			})
		end
		for _, value1 in UseRefResult1.current do
			value1.element = CurrentFunction({
				getMessageId = value1.getMessageId,
				getLayoutOrder = value1.getLayoutOrder
			})
		end
		publishChildrenFromCache()
	end
	
	local function _(p2)
		-- upvalues: SignalsExperimentalModule (upval), UseRefResult (copy), UseRefResult1 (copy), MaxSlots (copy), UseRefResult2 (copy), SignalsModule (upval), UseRefResult3 (copy), publishChildrenFromCache (copy)
		SignalsExperimentalModule.batch(function()
			-- upvalues: UseRefResult (upval), UseRefResult1 (upval), p2 (copy), MaxSlots (upval), UseRefResult2 (upval), SignalsModule (upval), UseRefResult3 (upval), publishChildrenFromCache (upval)
			local Current = UseRefResult.current
			local Current1 = UseRefResult1.current
			local Flag = false
			local Count = #p2
			local Largest = math.max(1, Count - MaxSlots + 1)
			local t = {}
			
			for i = Largest, Count do
				t[p2[i]] = true
			end
			for i1, value in Current do
				if not t[i1] then
					value.setMessageId(nil)
					Current1[#Current1 + 1] = value
					Current[i1] = nil
				end
			end
			for i2 = Largest, Count do
				local v1 = p2[i2]
				
				if not Current[v1] then
					local CurrentEntry = nil
					if #Current1 > 0 then
						CurrentEntry = Current1[#Current1]
						Current1[#Current1] = nil
						CurrentEntry.setMessageId(v1)
					else
						UseRefResult2.current += 1
						local Text = "slot-" .. UseRefResult2.current
						local Signal, Signal2 = SignalsModule.createSignal(v1)
						local Signal1, Signal2_1 = SignalsModule.createSignal(0)
						CurrentEntry = {
							stableKey = Text,
							getMessageId = Signal,
							setMessageId = Signal2,
							getLayoutOrder = Signal1,
							setLayoutOrder = Signal2_1,
							element = UseRefResult3.current({ getMessageId = Signal, getLayoutOrder = Signal1 })
						}
						Flag = true
					end
					Current[v1] = CurrentEntry
				end
			end
			local v2 = 0
			
			for i3 = Largest, Count do
				local CurrentEntry = Current[p2[i3]]
				
				if CurrentEntry ~= nil then
					local LayoutOrder = CurrentEntry.getLayoutOrder(false)
					
					if LayoutOrder <= v2 then
						LayoutOrder = v2 + 1
						CurrentEntry.setLayoutOrder(LayoutOrder)
					end
					v2 = LayoutOrder
				end
			end
			if Flag then
				publishChildrenFromCache()
			end
		end)
	end
	
	local UseRefResult4 = ReactModule.useRef(false)
	
	if not UseRefResult4.current then
		UseRefResult4.current = true
		local MessageIdsSignalResult = p1.messageIdsSignal()
		SignalsExperimentalModule.batch(function()
			-- upvalues: UseRefResult (copy), UseRefResult1 (copy), MessageIdsSignalResult (copy), MaxSlots (copy), UseRefResult2 (copy), SignalsModule (upval), UseRefResult3 (copy), publishChildrenFromCache (copy)
			local Current = UseRefResult.current
			local Current1 = UseRefResult1.current
			local Flag = false
			local Count = #MessageIdsSignalResult
			local Largest = math.max(1, Count - MaxSlots + 1)
			local t = {}
			
			for i = Largest, Count do
				t[MessageIdsSignalResult[i]] = true
			end
			for i1, value in Current do
				if not t[i1] then
					value.setMessageId(nil)
					Current1[#Current1 + 1] = value
					Current[i1] = nil
				end
			end
			for i2 = Largest, Count do
				local v3 = MessageIdsSignalResult[i2]
				
				if not Current[v3] then
					local CurrentEntry = nil
					if #Current1 > 0 then
						CurrentEntry = Current1[#Current1]
						Current1[#Current1] = nil
						CurrentEntry.setMessageId(v3)
					else
						UseRefResult2.current += 1
						local Text = "slot-" .. UseRefResult2.current
						local Signal, Signal2 = SignalsModule.createSignal(v3)
						local Signal1, Signal2_1 = SignalsModule.createSignal(0)
						CurrentEntry = {
							stableKey = Text,
							getMessageId = Signal,
							setMessageId = Signal2,
							getLayoutOrder = Signal1,
							setLayoutOrder = Signal2_1,
							element = UseRefResult3.current({ getMessageId = Signal, getLayoutOrder = Signal1 })
						}
						Flag = true
					end
					Current[v3] = CurrentEntry
				end
			end
			local v4 = 0
			
			for i3 = Largest, Count do
				local CurrentEntry = Current[MessageIdsSignalResult[i3]]
				
				if CurrentEntry ~= nil then
					local LayoutOrder = CurrentEntry.getLayoutOrder(false)
					
					if LayoutOrder <= v4 then
						LayoutOrder = v4 + 1
						CurrentEntry.setLayoutOrder(LayoutOrder)
					end
					v4 = LayoutOrder
				end
			end
			if Flag then
				publishChildrenFromCache()
			end
		end)
	end
	ReactModule.useEffect(function()
		-- upvalues: SignalsModule (upval), p1 (copy), SignalsExperimentalModule (upval), UseRefResult (copy), UseRefResult1 (copy), MaxSlots (copy), UseRefResult2 (copy), UseRefResult3 (copy), publishChildrenFromCache (copy)
		return (SignalsModule.createEffect(function(p3)
			-- upvalues: p1 (upval), SignalsExperimentalModule (upval), UseRefResult (upval), UseRefResult1 (upval), MaxSlots (upval), UseRefResult2 (upval), SignalsModule (upval), UseRefResult3 (upval), publishChildrenFromCache (upval)
			local MessageIdsSignalResult = p1.messageIdsSignal(p3)
			SignalsExperimentalModule.batch(function()
				-- upvalues: UseRefResult (upval), UseRefResult1 (upval), MessageIdsSignalResult (copy), MaxSlots (upval), UseRefResult2 (upval), SignalsModule (upval), UseRefResult3 (upval), publishChildrenFromCache (upval)
				local Current = UseRefResult.current
				local Current1 = UseRefResult1.current
				local Flag = false
				local Count = #MessageIdsSignalResult
				local Largest = math.max(1, Count - MaxSlots + 1)
				local t = {}
				
				for i = Largest, Count do
					t[MessageIdsSignalResult[i]] = true
				end
				for i1, value in Current do
					if not t[i1] then
						value.setMessageId(nil)
						Current1[#Current1 + 1] = value
						Current[i1] = nil
					end
				end
				for i2 = Largest, Count do
					local v5 = MessageIdsSignalResult[i2]
					
					if not Current[v5] then
						local CurrentEntry = nil
						if #Current1 > 0 then
							CurrentEntry = Current1[#Current1]
							Current1[#Current1] = nil
							CurrentEntry.setMessageId(v5)
						else
							UseRefResult2.current += 1
							local Text = "slot-" .. UseRefResult2.current
							local Signal, Signal2 = SignalsModule.createSignal(v5)
							local Signal1, Signal2_1 = SignalsModule.createSignal(0)
							CurrentEntry = {
								stableKey = Text,
								getMessageId = Signal,
								setMessageId = Signal2,
								getLayoutOrder = Signal1,
								setLayoutOrder = Signal2_1,
								element = UseRefResult3.current({ getMessageId = Signal, getLayoutOrder = Signal1 })
							}
							Flag = true
						end
						Current[v5] = CurrentEntry
					end
				end
				local v6 = 0
				
				for i3 = Largest, Count do
					local CurrentEntry = Current[MessageIdsSignalResult[i3]]
					
					if CurrentEntry ~= nil then
						local LayoutOrder = CurrentEntry.getLayoutOrder(false)
						
						if LayoutOrder <= v6 then
							LayoutOrder = v6 + 1
							CurrentEntry.setLayoutOrder(LayoutOrder)
						end
						v6 = LayoutOrder
					end
				end
				if Flag then
					publishChildrenFromCache()
				end
			end)
		end))
	end, {
		p1.messageIdsSignal,
		UseStableSignalModuleResult2,
		MaxSlots
	})
	local UseRefResult5 = ReactModule.useRef(false)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult5 (copy), rebuildElementsFromFactory (copy)
		if UseRefResult5.current then
			rebuildElementsFromFactory()
			
			return
		else
			UseRefResult5.current = true
		end
	end, { p1.createSlotElement })
	
	return UseStableSignalModuleResult
end