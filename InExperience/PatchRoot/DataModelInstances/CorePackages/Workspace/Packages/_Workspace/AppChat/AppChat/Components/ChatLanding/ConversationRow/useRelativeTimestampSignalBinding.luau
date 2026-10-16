local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local _DateTime = require(Parent.Time).DateTime
local GetConversationTimestampModule = require(AppChat.Utils.getConversationTimestamp)

local function computeTimestamp(p1) --[[ Line: 19 ]]
	-- upvalues: GetConversationTimestampModule (copy), _DateTime (copy)
	return if p1 == nil then "" else GetConversationTimestampModule(_DateTime.fromUnixTimestamp(p1))
end

return function(Callback1, Callback) --[[ Line: 28 | Named "useRelativeTimestampSignalBinding" ]]
	-- upvalues: ReactModule (copy), SignalsModule (copy), computeTimestamp (copy), SignalsReactModule (copy)
	local UseStateResult = ReactModule.useState(function() --[[ Line: 32 ]]
		-- upvalues: SignalsModule (upval)
		local Signal, Signal2 = SignalsModule.createSignal(0)
		
		return { signal = Signal, setSignal = Signal2 }
	end)
	ReactModule.useEffect(function() --[[ Line: 40 ]]
		-- upvalues: UseStateResult (copy)
		local Flag = false
		local Count = 0
		
		local function scheduleUpdate() --[[ Line: 44 ]]
			-- upvalues: Flag (ref), Count (ref), UseStateResult (upval), scheduleUpdate (copy)
			task.delay(30, function() --[[ Line: 45 ]]
				-- upvalues: Flag (upval), Count (upval), UseStateResult (upval), scheduleUpdate (upval)
				if not Flag then
					Count += 1
					UseStateResult.setSignal(Count)
					scheduleUpdate()
					
					return
				end
			end)
		end
		
		task.delay(30, function() --[[ Line: 45 ]]
			-- upvalues: Flag (ref), Count (ref), UseStateResult (upval), scheduleUpdate (copy)
			if not Flag then
				Count += 1
				UseStateResult.setSignal(Count)
				scheduleUpdate()
				
				return
			end
		end)
		
		return function() --[[ Line: 57 ]]
			-- upvalues: Flag (ref)
			Flag = true
		end
	end, { UseStateResult })
	local UseResult = ReactModule.useCallback(function(p1, p2) --[[ Line: 62 ]]
		-- upvalues: UseStateResult (copy), computeTimestamp (upval), Callback (copy)
		UseStateResult.signal(p2)
		
		return computeTimestamp(Callback(p1, p2))
	end, { UseStateResult, Callback })
	
	return SignalsReactModule.useSignalBinding(function(p1) --[[ Line: 67 ]]
		-- upvalues: UseResult (copy), Callback1 (copy)
		return UseResult(Callback1(p1), p1)
	end)
end