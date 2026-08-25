local chatUIPrimitives = script:FindFirstAncestor("ChatUIPrimitives")
local parent = chatUIPrimitives.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsExperimentalModule = require(parent.SignalsExperimental)
local useStableSignalModule = require(chatUIPrimitives.Hooks.useStableSignal)

return function(p0)
	-- upvalues: reactModule (ref), useStableSignalModule (ref), signalsExperimentalModule (ref), signalsModule (ref)
	local var5 = reactModule.useRef({})
	local var6 = reactModule.useRef({})
	local var7 = reactModule.useRef(0)
	local maxSlots = p0.maxSlots or 50
	local var9 = reactModule.useRef(p0.createSlotElement)
	var9.current = p0.createSlotElement
	local var10, var11 = useStableSignalModule({})
	
	local function publishChildrenFromCache()
		-- upvalues: var5 (ref), var6 (ref), var11 (ref)
		local t = {}
		
		for i, v in var5.current do
			t[v.stableKey] = v.element
		end
		for i, v_1 in var6.current do
			t[v_1.stableKey] = v_1.element
		end
		var11(t)
	end
	
	local function rebuildElementsFromFactory()
		-- upvalues: var9 (ref), var5 (ref), var6 (ref), publishChildrenFromCache (ref)
		local current = var9.current
		
		for i, v in var5.current do
			v.element = current({
				getMessageId = v.getMessageId,
				getLayoutOrder = v.getLayoutOrder
			})
		end
		for i, v_1 in var6.current do
			v_1.element = current({
				getMessageId = v_1.getMessageId,
				getLayoutOrder = v_1.getLayoutOrder
			})
		end
		publishChildrenFromCache()
	end
	
	local function _(p1)
		-- upvalues: signalsExperimentalModule (copy), var5 (ref), var6 (ref), maxSlots (ref), var7 (ref), signalsModule (copy), var9 (ref), publishChildrenFromCache (ref)
		signalsExperimentalModule.batch(function()
			-- upvalues: var5 (copy), var6 (copy), p1 (ref), maxSlots (copy), var7 (copy), signalsModule (copy), var9 (copy), publishChildrenFromCache (copy)
			local current = var5.current
			local current_1 = var6.current
			local var18 = false
			local p1Count = #p1
			local maxValue = math.max(1, p1Count - maxSlots + 1)
			local t = {}
			
			for i = maxValue, p1Count do
				t[p1[i]] = true
			end
			for i_1, v in current do
				if not t[i_1] then
					v.setMessageId(nil)
					current_1[#current_1 + 1] = v
					current[i_1] = nil
				end
			end
			local var22
			for i_2 = maxValue, p1Count do
				var22 = p1[i_2]
				
				if current[var22] then
					continue
				end
				local var23
				local _ = nil
				
				if #current_1 > 0 then
					var23 = current_1[#current_1]
					current_1[#current_1] = nil
					var23.setMessageId(var22)
				else
					var7.current += 1
					local text = "slot-" .. var7.current
					local var25, var26 = signalsModule.createSignal(var22)
					local var27, var28 = signalsModule.createSignal(0)
					var23 = {
						stableKey = text,
						getMessageId = var25,
						setMessageId = var26,
						getLayoutOrder = var27,
						setLayoutOrder = var28,
						element = var9.current({ getMessageId = var25, getLayoutOrder = var27 })
					}
					var18 = true
				end
				current[var22] = var23
			end
			local var29 = 0
			
			for var22 = maxValue, p1Count do
				local var30 = current[p1[var22]]
				
				if var30 == nil then
					continue
				end
				local layoutOrder = var30.getLayoutOrder(false)
				
				if layoutOrder <= var29 then
					layoutOrder = var29 + 1
					var30.setLayoutOrder(layoutOrder)
				end
				var29 = layoutOrder
			end
			if var18 then
				publishChildrenFromCache()
			end
		end)
	end
	
	local var14 = reactModule.useRef(false)
	
	if not var14.current then
		var14.current = true
		local var15 = p0.messageIdsSignal()
		signalsExperimentalModule.batch(function()
			-- upvalues: var5 (ref), var6 (ref), var15 (ref), maxSlots (ref), var7 (ref), signalsModule (copy), var9 (ref), publishChildrenFromCache (ref)
			local current = var5.current
			local current_1 = var6.current
			local var18 = false
			local p1Count = #var15
			local maxValue = math.max(1, p1Count - maxSlots + 1)
			local t = {}
			
			for i = maxValue, p1Count do
				t[var15[i]] = true
			end
			for i_1, v in current do
				if not t[i_1] then
					v.setMessageId(nil)
					current_1[#current_1 + 1] = v
					current[i_1] = nil
				end
			end
			local var22
			for i_2 = maxValue, p1Count do
				var22 = var15[i_2]
				
				if current[var22] then
					continue
					continue
				end
				local var23
				local _ = nil
				
				if #current_1 > 0 then
					var23 = current_1[#current_1]
					current_1[#current_1] = nil
					var23.setMessageId(var22)
				else
					var7.current += 1
					local text = "slot-" .. var7.current
					local var25, var26 = signalsModule.createSignal(var22)
					local var27, var28 = signalsModule.createSignal(0)
					var23 = {
						stableKey = text,
						getMessageId = var25,
						setMessageId = var26,
						getLayoutOrder = var27,
						setLayoutOrder = var28,
						element = var9.current({ getMessageId = var25, getLayoutOrder = var27 })
					}
					var18 = true
				end
				current[var22] = var23
			end
			local var29 = 0
			
			for var22 = maxValue, p1Count do
				local var30 = current[var15[var22]]
				
				if var30 == nil then
					continue
					continue
				end
				local layoutOrder = var30.getLayoutOrder(false)
				
				if layoutOrder <= var29 then
					layoutOrder = var29 + 1
					var30.setLayoutOrder(layoutOrder)
				end
				var29 = layoutOrder
			end
			if var18 then
				publishChildrenFromCache()
			end
		end)
	end
	reactModule.useEffect(function()
		-- upvalues: signalsModule (copy), p0 (ref), signalsExperimentalModule (copy), var5 (ref), var6 (ref), maxSlots (ref), var7 (ref), var9 (ref), publishChildrenFromCache (ref)
		return signalsModule.createEffect(function(p2)
			-- upvalues: p0 (copy), signalsExperimentalModule (copy), var5 (copy), var6 (copy), maxSlots (copy), var7 (copy), signalsModule (copy), var9 (copy), publishChildrenFromCache (copy)
			local var32 = p0.messageIdsSignal(p2)
			signalsExperimentalModule.batch(function()
				-- upvalues: var5 (copy), var6 (copy), var32 (ref), maxSlots (copy), var7 (copy), signalsModule (copy), var9 (copy), publishChildrenFromCache (copy)
				local current = var5.current
				local current_1 = var6.current
				local var18 = false
				local p1Count = #var32
				local maxValue = math.max(1, p1Count - maxSlots + 1)
				local t = {}
				
				for i = maxValue, p1Count do
					t[var32[i]] = true
				end
				for i_1, v in current do
					if not t[i_1] then
						v.setMessageId(nil)
						current_1[#current_1 + 1] = v
						current[i_1] = nil
					end
				end
				local var22
				for i_2 = maxValue, p1Count do
					var22 = var32[i_2]
					
					if current[var22] then
						continue
						continue
						continue
					end
					local var23
					local _ = nil
					
					if #current_1 > 0 then
						var23 = current_1[#current_1]
						current_1[#current_1] = nil
						var23.setMessageId(var22)
					else
						var7.current += 1
						local text = "slot-" .. var7.current
						local var25, var26 = signalsModule.createSignal(var22)
						local var27, var28 = signalsModule.createSignal(0)
						var23 = {
							stableKey = text,
							getMessageId = var25,
							setMessageId = var26,
							getLayoutOrder = var27,
							setLayoutOrder = var28,
							element = var9.current({ getMessageId = var25, getLayoutOrder = var27 })
						}
						var18 = true
					end
					current[var22] = var23
				end
				local var29 = 0
				
				for var22 = maxValue, p1Count do
					local var30 = current[var32[var22]]
					
					if var30 == nil then
						continue
						continue
						continue
					end
					local layoutOrder = var30.getLayoutOrder(false)
					
					if layoutOrder <= var29 then
						layoutOrder = var29 + 1
						var30.setLayoutOrder(layoutOrder)
					end
					var29 = layoutOrder
				end
				if var18 then
					publishChildrenFromCache()
				end
			end)
		end)
	end, { p0.messageIdsSignal, var11, maxSlots })
	local var16 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: var16 (ref), rebuildElementsFromFactory (ref)
		if var16.current then
			rebuildElementsFromFactory()
			
			return
		end
		var16.current = true
	end, { p0.createSlotElement })
	
	return var10
end