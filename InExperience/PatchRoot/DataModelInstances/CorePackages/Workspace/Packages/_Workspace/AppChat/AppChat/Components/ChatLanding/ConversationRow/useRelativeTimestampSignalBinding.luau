local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local dateTime = require(parent.Time).DateTime
local getConversationTimestampModule = require(appChat.Utils.getConversationTimestamp)

local function computeTimestamp(p1)
	-- upvalues: getConversationTimestampModule (ref), dateTime (ref)
	return if p1 == nil then "" else getConversationTimestampModule(dateTime.fromUnixTimestamp(p1))
end

return function(value, p1)
	-- upvalues: reactModule (ref), signalsModule (ref), computeTimestamp (ref), signalsReactModule (ref)
	local var1 = reactModule.useState(function()
		-- upvalues: signalsModule (copy)
		local var2, var3 = signalsModule.createSignal(0)
		
		return { signal = var2, setSignal = var3 }
	end)
	reactModule.useEffect(function()
		-- upvalues: var1 (ref)
		local var2 = false
		local var3 = 0
		
		local function scheduleUpdate()
			-- upvalues: var2 (write), var3 (write), var1 (copy), scheduleUpdate (ref)
			task.delay(30, function()
				-- upvalues: var2 (copy), var3 (copy), var1 (copy), scheduleUpdate (copy)
				if var2 then
					return
				end
				var3 += 1
				var1.setSignal(var3)
				scheduleUpdate()
			end)
		end
		
		task.delay(30, function()
			-- upvalues: var2 (write), var3 (write), var1 (copy), scheduleUpdate (ref)
			if var2 then
				return
			end
			var3 += 1
			var1.setSignal(var3)
			scheduleUpdate()
		end)
		
		return function()
			-- upvalues: var2 (write)
			var2 = true
		end
	end, { var1 })
	local var2 = reactModule.useCallback(function(p2, p3)
		-- upvalues: var1 (ref), computeTimestamp (copy), p1 (ref)
		var1.signal(p3)
		
		return computeTimestamp(p1(p2, p3))
	end, { var1, p1 })
	
	return signalsReactModule.useSignalBinding(function(p2)
		-- upvalues: var2 (ref), value (ref)
		return var2(value(p2), p2)
	end)
end