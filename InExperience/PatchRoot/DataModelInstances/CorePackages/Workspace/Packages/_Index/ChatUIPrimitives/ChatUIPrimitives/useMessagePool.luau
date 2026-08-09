local parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local useStableSignalModule = require(script.Parent.Hooks.useStableSignal)

return function(p0) --[[ line: 53 | named "useMessagePool" ]]
	-- upvalues: reactModule (ref), useStableSignalModule (ref), signalsModule (ref)
	local var3 = reactModule.useRef({})
	local var4 = reactModule.useRef({})
	local var5 = reactModule.useRef(0)
	local var6 = reactModule.useRef(0)
	local var7, var8 = useStableSignalModule({})
	
	local function reconcile(p1) --[[ line: 74 ]]
		-- upvalues: var3 (ref), var4 (ref), var6 (ref), var5 (ref), signalsModule (copy), p0 (ref), reactModule (copy), var8 (ref)
		local current = var3.current
		local current_1 = var4.current
		local var11 = false
		local p1Count = #p1
		local maxValue = math.max(1, p1Count - 50 + 1)
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
		for i_2 = maxValue, p1Count do
			local var15 = p1[i_2]
			
			if current[var15] then
				continue
			end
			local var17
			local var16 = var6.current + 1
			var6.current = var16
			local _ = nil
			
			if #current_1 > 0 then
				var17 = current_1[#current_1]
				current_1[#current_1] = nil
				var17.setMessageId(var15)
				var17.setLayoutOrder(var16)
			else
				var5.current += 1
				local text = "slot-" .. var5.current
				local var19, var20 = signalsModule.createSignal(var15)
				local var21, var22 = signalsModule.createSignal(var16)
				var17 = {
					stableKey = text,
					getMessageId = var19,
					setMessageId = var20,
					getLayoutOrder = var21,
					setLayoutOrder = var22,
					component = p0.createSlotElement({ getMessageId = var19, getLayoutOrder = var21 })
				}
				var11 = true
			end
			current[var15] = var17
		end
		if var11 then
			local t_1 = {
				["$layout"] = reactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, 2)
				})
			}
			
			for i_3, v_1 in current do
				t_1[v_1.stableKey] = v_1.component
			end
			for i_4, v_2 in current_1 do
				t_1[v_2.stableKey] = v_2.component
			end
			var8(t_1)
		end
	end
	
	local var10 = reactModule.useRef(false)
	
	if not var10.current then
		var10.current = true
		reconcile(p0.messageIdsSignal())
	end
	reactModule.useEffect(function() --[[ line: 167 ]]
		-- upvalues: signalsModule (copy), reconcile (ref), p0 (ref)
		return signalsModule.createEffect(function(p2) --[[ line: 168 ]]
			-- upvalues: reconcile (copy), p0 (copy)
			reconcile(p0.messageIdsSignal(p2))
		end)
	end, { p0.messageIdsSignal, var8 })
	
	return var7
end