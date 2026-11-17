local FriendsChat = script:FindFirstAncestor("FriendsChat")
local Parent = FriendsChat.Parent
local RunService = game:GetService("RunService")
local ReactModule = require(Parent.React)
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local SignalsModule = require(Parent.Signals)
local GetFriendsChatNavigationStoreModule = require(FriendsChat.Stores.GetFriendsChatNavigationStore)
local IsFocusRequestFreshModule = require(FriendsChat.Focus.isFocusRequestFresh)
local UseClearFocusOnReusedRowModule = require(script.Parent.useClearFocusOnReusedRow)
local FocusNavigationContext = ReactFocusNavigationModule.FocusNavigationContext

return function(Current, Callback)
	-- upvalues: ReactModule (copy), FocusNavigationContext (copy), UseClearFocusOnReusedRowModule (copy), GetFriendsChatNavigationStoreModule (copy), SignalsModule (copy), IsFocusRequestFreshModule (copy), RunService (copy)
	local UseContextResult = ReactModule.useContext(FocusNavigationContext)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(Current)
	UseRefResult1.current = Current
	local UseRefResult2 = ReactModule.useRef(nil)
	UseClearFocusOnReusedRowModule(UseRefResult, UseRefResult2)
	local UseRefResult3 = ReactModule.useRef(nil)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy), UseRefResult1 (copy)
		local Current = UseRefResult.current
		local Current1 = UseRefResult1.current
		
		return if Current == nil or Current1 == nil then nil else Current.findRow(Current1)
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: GetFriendsChatNavigationStoreModule (upval), UseContextResult (copy), SignalsModule (upval), UseRefResult3 (copy), IsFocusRequestFreshModule (upval), UseResult (copy), Callback (copy), RunService (upval)
		local FriendsChatNavigationStoreModule = GetFriendsChatNavigationStoreModule(false)
		
		local function _()
			-- upvalues: UseContextResult (upval)
			return if UseContextResult == nil then nil else UseContextResult.focusedGuiObject:getValue()
		end
		
		local HeartbeatConnection = nil
		
		local _ = function()
			-- upvalues: HeartbeatConnection (ref)
			if HeartbeatConnection ~= nil then
				HeartbeatConnection:Disconnect()
				HeartbeatConnection = nil
			end
		end
		
		local Effect = SignalsModule.createEffect(function(p1)
			-- upvalues: HeartbeatConnection (ref), FriendsChatNavigationStoreModule (copy), UseRefResult3 (upval), UseContextResult (upval), IsFocusRequestFreshModule (upval), UseResult (upval), Callback (upval), RunService (upval)
			if HeartbeatConnection ~= nil then
				HeartbeatConnection:Disconnect()
				HeartbeatConnection = nil
			end
			local ConversationListFocusRequestTime = FriendsChatNavigationStoreModule.getConversationListFocusRequestTime(p1)
			
			if ConversationListFocusRequestTime == nil then return end
			local Current = UseRefResult3.current
			local Value = nil
			
			if Current == nil or Current.requestTime ~= ConversationListFocusRequestTime then
				Value = if UseContextResult == nil then nil else UseContextResult.focusedGuiObject:getValue()
				UseRefResult3.current = {
					requestTime = ConversationListFocusRequestTime,
					focused = Value
				}
			else
				Value = Current.focused
			end
			local function tryConsume(): boolean
				-- upvalues: UseContextResult (upval), IsFocusRequestFreshModule (upval), ConversationListFocusRequestTime (copy), Value (ref), UseResult (upval), Callback (upval), FriendsChatNavigationStoreModule (upval)
				local Value1 = if UseContextResult == nil then nil else UseContextResult.focusedGuiObject:getValue()
				local NoValue: boolean = IsFocusRequestFreshModule(ConversationListFocusRequestTime, os.clock(), 5) and (Value1 == nil or Value1 == Value)
				local UseResultResult = if NoValue then UseResult() else nil
				
				if NoValue and UseResultResult == nil then
					return false
				end
				if UseResultResult ~= nil then
					Callback(UseResultResult)
				end
				FriendsChatNavigationStoreModule.clearConversationListFocusRequest()
				
				return true
			end
			
			if not tryConsume() then
				HeartbeatConnection = RunService.Heartbeat:Connect(function()
					-- upvalues: tryConsume (copy), HeartbeatConnection (upval)
					if tryConsume() and HeartbeatConnection ~= nil then
						HeartbeatConnection:Disconnect()
						HeartbeatConnection = nil
					end
				end)
			end
		end)
		
		return function()
			-- upvalues: Effect (copy), HeartbeatConnection (ref)
			Effect()
			
			if HeartbeatConnection ~= nil then
				HeartbeatConnection:Disconnect()
				HeartbeatConnection = nil
			end
		end
	end, { UseContextResult, UseResult, Callback })
	
	return UseRefResult, (ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy), UseRefResult2 (copy), UseResult (copy)
		local Current = UseRefResult.current
		
		if Current == nil then
			return {}
		else
			local Current1 = UseRefResult2.current
			local Row = (if Current1 == nil then nil else Current.findRow(Current1)) or UseResult()
			
			return if Row == nil then {} else { Row }
		end
	end, { UseResult }))
end