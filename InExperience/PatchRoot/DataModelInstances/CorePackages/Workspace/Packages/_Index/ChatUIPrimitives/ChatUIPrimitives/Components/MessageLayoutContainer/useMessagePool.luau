local chatUIPrimitives = script:FindFirstAncestor("ChatUIPrimitives")
local parent = chatUIPrimitives.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsExperimentalModule = require(parent.SignalsExperimental)
local useStableSignalModule = require(chatUIPrimitives.Hooks.useStableSignal)

return function(p1)
	-- upvalues: reactModule (ref), useStableSignalModule (ref), signalsExperimentalModule (ref), signalsModule (ref)
	local var1 = reactModule.useRef({})
	local var2 = reactModule.useRef({})
	local var3 = reactModule.useRef(0)
	local maxSlots = p1.maxSlots or 50
	local var4 = reactModule.useRef(p1.createSlotElement)
	var4.current = p1.createSlotElement
	local var5, var6 = useStableSignalModule({})
	
	local function publishChildrenFromCache()
		-- upvalues: var1 (ref), var2 (ref), var6 (ref)
		local t = {}
		
		for i, v in var1.current do
			t[v.stableKey] = v.element
		end
		for i, v_1 in var2.current do
			t[v_1.stableKey] = v_1.element
		end
		var6(t)
	end
	
	local function rebuildElementsFromFactory()
		-- upvalues: var4 (ref), var1 (ref), var2 (ref), publishChildrenFromCache (ref)
		local current = var4.current
		
		for i, v in var1.current do
			v.element = current({
				getMessageId = v.getMessageId,
				getLayoutOrder = v.getLayoutOrder
			})
		end
		for i, v_1 in var2.current do
			v_1.element = current({
				getMessageId = v_1.getMessageId,
				getLayoutOrder = v_1.getLayoutOrder
			})
		end
		publishChildrenFromCache()
	end
	
	local function _(p2)
		-- upvalues: signalsExperimentalModule (copy), var1 (ref), var2 (ref), maxSlots (ref), var3 (ref), signalsModule (copy), var4 (ref), publishChildrenFromCache (ref)
		signalsExperimentalModule.batch(function()
			-- upvalues: var1 (copy), var2 (copy), p2 (ref), maxSlots (copy), var3 (copy), signalsModule (copy), var4 (copy), publishChildrenFromCache (copy)
			local current = var1.current
			local current_1 = var2.current
			local var7 = false
			local p1Count = #p2
			local maxValue = math.max(1, p1Count - maxSlots + 1)
			local t = {}
			
			for i = maxValue, p1Count do
				t[p2[i]] = true
			end
			for i_1, v in current do
				if not t[i_1] then
					v.setMessageId(nil)
					current_1[#current_1 + 1] = v
					current[i_1] = nil
				end
			end
			local var8
			for i_2 = maxValue, p1Count do
				var8 = p2[i_2]
				
				if current[var8] then
					continue
				end
				local var9
				local _ = nil
				
				if #current_1 > 0 then
					var9 = current_1[#current_1]
					current_1[#current_1] = nil
					var9.setMessageId(var8)
				else
					var3.current += 1
					local text = "slot-" .. var7.current
					local var10, var11 = signalsModule.createSignal(var8)
					local var12, var13 = signalsModule.createSignal(0)
					var9 = {
						stableKey = text,
						getMessageId = var10,
						setMessageId = var11,
						getLayoutOrder = var12,
						setLayoutOrder = var13,
						element = var4.current({ getMessageId = var10, getLayoutOrder = var12 })
					}
					var7 = true
				end
				current[var8] = var9
			end
			local var14 = 0
			
			for var8 = maxValue, p1Count do
				local var15 = current[p2[var8]]
				
				if var15 == nil then
					continue
				end
				local layoutOrder = var15.getLayoutOrder(false)
				
				if layoutOrder <= var14 then
					layoutOrder = var14 + 1
					var15.setLayoutOrder(layoutOrder)
				end
				var14 = layoutOrder
			end
			if var7 then
				publishChildrenFromCache()
			end
		end)
	end
	
	local var16 = reactModule.useRef(false)
	
	if not var16.current then
		var16.current = true
		local var17 = p1.messageIdsSignal()
		signalsExperimentalModule.batch(function()
			-- upvalues: var1 (ref), var2 (ref), var17 (ref), maxSlots (ref), var3 (ref), signalsModule (copy), var4 (ref), publishChildrenFromCache (ref)
			local current = var1.current
			local current_1 = var2.current
			local var18 = false
			local p1Count = #var17
			local maxValue = math.max(1, p1Count - maxSlots + 1)
			local t = {}
			
			for i = maxValue, p1Count do
				t[var17[i]] = true
			end
			for i_1, v in current do
				if not t[i_1] then
					v.setMessageId(nil)
					current_1[#current_1 + 1] = v
					current[i_1] = nil
				end
			end
			local var19
			for i_2 = maxValue, p1Count do
				var19 = var17[i_2]
				
				if current[var19] then
					continue
					continue
				end
				local var20
				local _ = nil
				
				if #current_1 > 0 then
					var20 = current_1[#current_1]
					current_1[#current_1] = nil
					var20.setMessageId(var19)
				else
					var3.current += 1
					local text = "slot-" .. var7.current
					local var21, var22 = signalsModule.createSignal(var19)
					local var23, var24 = signalsModule.createSignal(0)
					var20 = {
						stableKey = text,
						getMessageId = var21,
						setMessageId = var22,
						getLayoutOrder = var23,
						setLayoutOrder = var24,
						element = var4.current({ getMessageId = var21, getLayoutOrder = var23 })
					}
					var18 = true
				end
				current[var19] = var20
			end
			local var25 = 0
			
			for var19 = maxValue, p1Count do
				local var26 = current[var17[var19]]
				
				if var26 == nil then
					continue
					continue
				end
				local layoutOrder = var26.getLayoutOrder(false)
				
				if layoutOrder <= var25 then
					layoutOrder = var25 + 1
					var26.setLayoutOrder(layoutOrder)
				end
				var25 = layoutOrder
			end
			if var18 then
				publishChildrenFromCache()
			end
		end)
	end
	reactModule.useEffect(function()
		-- upvalues: signalsModule (copy), p1 (ref), signalsExperimentalModule (copy), var1 (ref), var2 (ref), maxSlots (ref), var3 (ref), var4 (ref), publishChildrenFromCache (ref)
		return signalsModule.createEffect(function(p3)
			-- upvalues: p1 (copy), signalsExperimentalModule (copy), var1 (copy), var2 (copy), maxSlots (copy), var3 (copy), signalsModule (copy), var4 (copy), publishChildrenFromCache (copy)
			local var27 = p1.messageIdsSignal(p3)
			signalsExperimentalModule.batch(function()
				-- upvalues: var1 (copy), var2 (copy), var27 (ref), maxSlots (copy), var3 (copy), signalsModule (copy), var4 (copy), publishChildrenFromCache (copy)
				local current = var1.current
				local current_1 = var2.current
				local var28 = false
				local p1Count = #var27
				local maxValue = math.max(1, p1Count - maxSlots + 1)
				local t = {}
				
				for i = maxValue, p1Count do
					t[var27[i]] = true
				end
				for i_1, v in current do
					if not t[i_1] then
						v.setMessageId(nil)
						current_1[#current_1 + 1] = v
						current[i_1] = nil
					end
				end
				local var29
				for i_2 = maxValue, p1Count do
					var29 = var27[i_2]
					
					if current[var29] then
						continue
						continue
						continue
					end
					local var30
					local _ = nil
					
					if #current_1 > 0 then
						var30 = current_1[#current_1]
						current_1[#current_1] = nil
						var30.setMessageId(var29)
					else
						var3.current += 1
						local text = "slot-" .. var7.current
						local var31, var32 = signalsModule.createSignal(var29)
						local var33, var34 = signalsModule.createSignal(0)
						var30 = {
							stableKey = text,
							getMessageId = var31,
							setMessageId = var32,
							getLayoutOrder = var33,
							setLayoutOrder = var34,
							element = var4.current({ getMessageId = var31, getLayoutOrder = var33 })
						}
						var28 = true
					end
					current[var29] = var30
				end
				local var35 = 0
				
				for var29 = maxValue, p1Count do
					local var36 = current[var27[var29]]
					
					if var36 == nil then
						continue
						continue
						continue
					end
					local layoutOrder = var36.getLayoutOrder(false)
					
					if layoutOrder <= var35 then
						layoutOrder = var35 + 1
						var36.setLayoutOrder(layoutOrder)
					end
					var35 = layoutOrder
				end
				if var28 then
					publishChildrenFromCache()
				end
			end)
		end)
	end, { p1.messageIdsSignal, var6, maxSlots })
	local var37 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: var37 (ref), rebuildElementsFromFactory (ref)
		if var37.current then
			rebuildElementsFromFactory()
			
			return
		end
		var37.current = true
	end, { p1.createSlotElement })
	
	return var5
end