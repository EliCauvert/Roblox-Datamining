local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local _DateTime = require(Parent.Time).DateTime
local GetConversationTimestampModule = require(AppChat.Utils.getConversationTimestamp)

local function computeTimestamp(p1)
	-- upvalues: GetConversationTimestampModule (copy), _DateTime (copy)
	return if p1 == nil then "" else GetConversationTimestampModule(_DateTime.fromUnixTimestamp(p1))
end

return function(Callback1, Callback)
	-- upvalues: ReactModule (copy), SignalsModule (copy), computeTimestamp (copy), SignalsReactModule (copy)
	local UseStateResult = ReactModule.useState(function()
		-- upvalues: SignalsModule (upval)
		local Signal, Signal2 = SignalsModule.createSignal(0)
		
		return { signal = Signal, setSignal = Signal2 }
	end)
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult (copy)
		local Flag = false
		local Count = 0
		
		local function scheduleUpdate()
			-- upvalues: Flag (ref), Count (ref), UseStateResult (upval), scheduleUpdate (copy)
			task.delay(30, function()
				-- upvalues: Flag (upval), Count (upval), UseStateResult (upval), scheduleUpdate (upval)
				if not Flag then
					Count += 1
					UseStateResult.setSignal(Count)
					scheduleUpdate()
					
					return
				end
			end)
		end
		
		task.delay(30, function()
			-- upvalues: Flag (ref), Count (ref), UseStateResult (upval), scheduleUpdate (copy)
			if not Flag then
				Count += 1
				UseStateResult.setSignal(Count)
				scheduleUpdate()
				
				return
			end
		end)
		
		return function()
			-- upvalues: Flag (ref)
			Flag = true
		end
	end, { UseStateResult })
	local UseResult = ReactModule.useCallback(function(p1, p2)
		-- upvalues: UseStateResult (copy), computeTimestamp (upval), Callback (copy)
		UseStateResult.signal(p2)
		
		return computeTimestamp(Callback(p1, p2))
	end, { UseStateResult, Callback })
	
	return SignalsReactModule.useSignalBinding(function(p1)
		-- upvalues: UseResult (copy), Callback1 (copy)
		return UseResult(Callback1(p1), p1)
	end)
end