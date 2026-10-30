local Parent = script:FindFirstAncestor("FriendsChat").Parent
local ReactModule = require(Parent.React)
local FetchMessagePageModule = require(Parent.AppChat.fetchMessagePage)
local NewResult = require(Parent.ExpChatShared).Logger:new(script.Name)

return function(p1, p2, p3): boolean
	-- upvalues: ReactModule (copy), FetchMessagePageModule (copy), NewResult (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	ReactModule.useEffect(function()
		-- upvalues: p2 (copy), FetchMessagePageModule (upval), p1 (copy), NewResult (upval), p3 (copy), UseStateResult2 (copy)
		if not p2 then return end
		local Flag = false
		FetchMessagePageModule(p1, nil):catch(function(Err)
			-- upvalues: Flag (ref), NewResult (upval), p1 (upval)
			if not Flag then
				NewResult:warning(`Failed to fetch conversation messages for {p1}: {tostring(Err)}`)
			end
		end):finally(function()
			-- upvalues: Flag (ref), p3 (upval), UseStateResult2 (upval), p1 (upval)
			if not Flag and p3 then
				UseStateResult2(p1)
			end
		end)
		
		return function()
			-- upvalues: Flag (ref)
			Flag = true
		end
	end, { p1, p2, p3 })
	
	return not p2 or (not p3 or UseStateResult == p1)
end