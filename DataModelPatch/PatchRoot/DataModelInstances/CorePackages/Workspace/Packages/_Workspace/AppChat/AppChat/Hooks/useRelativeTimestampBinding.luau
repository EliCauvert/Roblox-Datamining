local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local _DateTime = require(Parent.Time).DateTime
local GetConversationTimestampModule = require(AppChat.Utils.getConversationTimestamp)

local function computeTimestamp(p1)
	-- upvalues: GetConversationTimestampModule (copy), _DateTime (copy)
	return if p1 == nil then "" else GetConversationTimestampModule(_DateTime.fromUnixTimestamp(p1))
end

return function(p1)
	-- upvalues: ReactModule (copy), computeTimestamp (copy)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(computeTimestamp(p1))
	ReactModule.useEffect(function()
		-- upvalues: UseBindingResult2 (copy), computeTimestamp (upval), p1 (copy)
		UseBindingResult2(computeTimestamp(p1))
		
		if p1 == nil then
			return function() end
		else
			local Flag = false
			
			local function scheduleUpdate()
				-- upvalues: Flag (ref), UseBindingResult2 (upval), computeTimestamp (upval), p1 (upval), scheduleUpdate (copy)
				task.delay(30, function()
					-- upvalues: Flag (upval), UseBindingResult2 (upval), computeTimestamp (upval), p1 (upval), scheduleUpdate (upval)
					if not Flag then
						UseBindingResult2(computeTimestamp(p1))
						scheduleUpdate()
						
						return
					end
				end)
			end
			
			task.delay(30, function()
				-- upvalues: Flag (ref), UseBindingResult2 (upval), computeTimestamp (upval), p1 (upval), scheduleUpdate (copy)
				if not Flag then
					UseBindingResult2(computeTimestamp(p1))
					scheduleUpdate()
					
					return
				end
			end)
			
			return function()
				-- upvalues: Flag (ref)
				Flag = true
			end
		end
	end, { p1 })
	
	return UseBindingResult
end