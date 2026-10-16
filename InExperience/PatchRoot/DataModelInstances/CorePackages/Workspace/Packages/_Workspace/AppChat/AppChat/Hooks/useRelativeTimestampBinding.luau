local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local _DateTime = require(Parent.Time).DateTime
local GetConversationTimestampModule = require(AppChat.Utils.getConversationTimestamp)

local function computeTimestamp(p1) --[[ Line: 10 ]]
	-- upvalues: GetConversationTimestampModule (copy), _DateTime (copy)
	return if p1 == nil then "" else GetConversationTimestampModule(_DateTime.fromUnixTimestamp(p1))
end

return function(p1) --[[ Line: 17 | Named "useRelativeTimestampBinding" ]]
	-- upvalues: ReactModule (copy), computeTimestamp (copy)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(computeTimestamp(p1))
	ReactModule.useEffect(function() --[[ Line: 20 ]]
		-- upvalues: UseBindingResult2 (copy), computeTimestamp (upval), p1 (copy)
		UseBindingResult2(computeTimestamp(p1))
		
		if p1 == nil then
			return function() --[[ Line: 24 ]] end
		else
			local Flag = false
			
			local function scheduleUpdate() --[[ Line: 29 ]]
				-- upvalues: Flag (ref), UseBindingResult2 (upval), computeTimestamp (upval), p1 (upval), scheduleUpdate (copy)
				task.delay(30, function() --[[ Line: 30 ]]
					-- upvalues: Flag (upval), UseBindingResult2 (upval), computeTimestamp (upval), p1 (upval), scheduleUpdate (upval)
					if not Flag then
						UseBindingResult2(computeTimestamp(p1))
						scheduleUpdate()
						
						return
					end
				end)
			end
			
			task.delay(30, function() --[[ Line: 30 ]]
				-- upvalues: Flag (ref), UseBindingResult2 (upval), computeTimestamp (upval), p1 (upval), scheduleUpdate (copy)
				if not Flag then
					UseBindingResult2(computeTimestamp(p1))
					scheduleUpdate()
					
					return
				end
			end)
			
			return function() --[[ Line: 41 ]]
				-- upvalues: Flag (ref)
				Flag = true
			end
		end
	end, { p1 })
	
	return UseBindingResult
end