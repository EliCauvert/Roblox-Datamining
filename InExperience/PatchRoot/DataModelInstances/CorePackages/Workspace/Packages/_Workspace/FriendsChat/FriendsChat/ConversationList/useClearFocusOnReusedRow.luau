local Parent = script:FindFirstAncestor("FriendsChat").Parent
local ReactModule = require(Parent.React)
local FocusNavigationContext = require(Parent.ReactFocusNavigation).FocusNavigationContext

local function noop() end

return function(p1, p2)
	-- upvalues: ReactModule (copy), FocusNavigationContext (copy), noop (copy)
	local UseContextResult = ReactModule.useContext(FocusNavigationContext)
	ReactModule.useEffect(function()
		-- upvalues: UseContextResult (copy), noop (upval), p1 (copy), p2 (copy)
		if UseContextResult == nil then
			return nil
		else
			local OnRowReusedResult: (() -> ())? = noop
			
			local function onFocusChanged(p3)
				-- upvalues: OnRowReusedResult (ref), noop (upval), p1 (upval), p2 (upval), UseContextResult (copy)
				if p3 == nil then return end
				OnRowReusedResult()
				OnRowReusedResult = noop
				local Current = p1.current
				local ConversationId = if Current == nil then nil else Current.getConversationId(p3)
				
				if Current ~= nil and ConversationId ~= nil then
					p2.current = nil
					OnRowReusedResult = Current.onRowReused(p3, function()
						-- upvalues: OnRowReusedResult (upval), noop (upval), UseContextResult (upval), p3 (copy), p2 (upval), ConversationId (copy)
						OnRowReusedResult()
						OnRowReusedResult = noop
						local Value = UseContextResult.focusedGuiObject:getValue()
						
						if Value ~= p3 and Value ~= nil then return end
						p2.current = ConversationId
						
						if Value == p3 then
							UseContextResult:focusGuiObject(nil, false)
						end
					end)
					
					return
				end
			end
			
			local SubscribeResult = UseContextResult.focusedGuiObject:subscribe(onFocusChanged)
			onFocusChanged(UseContextResult.focusedGuiObject:getValue())
			
			return function()
				-- upvalues: SubscribeResult (copy), OnRowReusedResult (ref)
				SubscribeResult:unsubscribe()
				OnRowReusedResult()
			end
		end
	end, { UseContextResult, p1, p2 })
end