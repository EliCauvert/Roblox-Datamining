local httpService = game:GetService("HttpService")
local parent = script:FindFirstAncestor("ExpChat").Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local useStableSignal = require(parent.ChatUIPrimitives).Hooks.useStableSignal
local friendsChatTextMessageModule = require(script.Parent.FriendsChatTextMessage)

return function(p0) --[[ line: 47 | named "useFriendsChatMessagePool" ]]
	-- upvalues: reactModule (ref), useStableSignal (ref), signalsModule (ref), httpService (ref), friendsChatTextMessageModule (ref)
	local var4 = reactModule.useRef({})
	local var5 = reactModule.useRef({})
	local var6 = reactModule.useRef(0)
	local var7, var8 = useStableSignal({})
	
	local function reconcile(p1) --[[ line: 68 ]]
		-- upvalues: var4 (ref), var5 (ref), var6 (ref), signalsModule (copy), httpService (copy), reactModule (copy), friendsChatTextMessageModule (copy), p0 (ref), var8 (ref)
		local minValue = math.min(#p1, 50)
		local list = table.create(minValue)
		local t = {}
		
		for i = 1, minValue do
			local var14 = p1[i]
			list[minValue - i + 1] = var14
			t[var14] = true
		end
		local var15 = false
		
		for i_1, v in var4.current do
			if not t[i_1] then
				v.setMessageId(nil)
				table.insert(var5.current, v)
				var4.current[i_1] = nil
			end
		end
		for i_2, v_1 in list do
			if var4.current[v_1] == nil then
				local var18
				local _ = nil
				local var17 = var6.current + 1
				var6.current = var17
				local current = var5.current
				
				if #current > 0 then
					var18 = current[#current]
					current[#current] = nil
					var18.setMessageId(v_1)
					var18.setLayoutOrder(var17)
				else
					local var19, var20 = signalsModule.createSignal(v_1)
					local var21, var22 = signalsModule.createSignal(var17)
					local var23 = httpService:GenerateGUID(false)
					var18 = {
						getMessageId = var19,
						setMessageId = var20,
						getLayoutOrder = var21,
						setLayoutOrder = var22,
						stableKey = var23,
						component = reactModule.createElement(friendsChatTextMessageModule, {
							key = var23,
							getMessageId = var19,
							getLayoutOrder = var21,
							chatWindowSettings = p0.chatWindowSettings,
							textTransparency = p0.textTransparency,
							isSpatialUIEnabled = p0.isSpatialUIEnabled
						})
					}
					var15 = true
				end
				var4.current[v_1] = var18
			end
		end
		if var15 then
			local t_1 = {}
			
			for v_1, v_2 in var4.current do
				t_1[v_2.stableKey] = v_2.component
			end
			for v_1, v_3 in var5.current do
				t_1[v_3.stableKey] = v_3.component
			end
			t_1["$layout"] = reactModule.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder })
			var8(t_1)
		end
	end
	
	local var10 = reactModule.useRef(false)
	
	if not var10.current then
		var10.current = true
		reconcile(p0.messageIdsSignal())
	end
	reactModule.useEffect(function() --[[ line: 183 ]]
		-- upvalues: signalsModule (copy), reconcile (ref), p0 (ref)
		local var24 = signalsModule.createEffect(function(p2) --[[ line: 184 ]]
			-- upvalues: reconcile (copy), p0 (copy)
			reconcile(p0.messageIdsSignal(p2))
		end)
		
		return function() --[[ line: 188 ]]
			-- upvalues: var24 (ref)
			var24()
		end
	end, { p0.messageIdsSignal, var8 })
	
	return var7
end