local SocialTabsPage = script:FindFirstAncestor("SocialTabsPage")
local Parent = SocialTabsPage.Parent
local ReactModule = require(Parent.React)
local DashModule = require(Parent.Dash)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local FindFriendsFromUserId = require(SocialTabsPage.Networking.NetworkingFriends).FindFriendsFromUserId
local UsePageSizeModule = require(SocialTabsPage.Hooks.usePageSize)

local function _(p1)
	-- upvalues: DashModule (copy)
	return DashModule.map(p1, function(p2)
		return {
			id = tostring(p2.id),
			hasVerifiedBadge = p2.hasVerifiedBadge or false
		}
	end)
end

return function(p1)
	-- upvalues: UseDispatchFunction (copy), UsePageSizeModule (copy), ReactModule (copy), FindFriendsFromUserId (copy), DashModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UsePageSizeModuleResult = UsePageSizeModule()
	local IsSkip: boolean = p1.skip == true or (not p1.targetUserId or p1.targetUserId == "")
	local UseStateResult, UseStateResult2 = ReactModule.useState({})
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(not IsSkip)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(nil)
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(nil)
	local UseRefResult = ReactModule.useRef(0)
	local UseRefResult1 = ReactModule.useRef(false)
	local UseRefResult2 = ReactModule.useRef(true)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult2 (copy)
		return function()
			-- upvalues: UseRefResult2 (upval)
			UseRefResult2.current = false
		end
	end, {})
	local UseResult = ReactModule.useCallback(function(p2, p3, Current)
		-- upvalues: UseStateResult2_1 (copy), UseRefResult1 (copy), UseStateResult2_2 (copy), UseDispatchResult (copy), FindFriendsFromUserId (upval), UsePageSizeModuleResult (copy), UseRefResult (copy), UseRefResult2 (copy), UseStateResult2_3 (copy), DashModule (upval), UseStateResult2 (copy)
		local NoP4: boolean = not p3 or p3 == ""
		
		if NoP4 then
			UseStateResult2_1(true)
		end
		UseRefResult1.current = true
		UseStateResult2_2(nil)
		UseDispatchResult(FindFriendsFromUserId.API(p2, {
			limit = UsePageSizeModuleResult,
			cursor = if p3 and p3 ~= "" then p3 else nil
		})):andThen(function(Result)
			-- upvalues: UseRefResult (upval), Current (copy), UseRefResult2 (upval), UseRefResult1 (upval), UseStateResult2_3 (upval), DashModule (upval), NoP4 (copy), UseStateResult2 (upval), UseStateResult2_1 (upval)
			if UseRefResult.current ~= Current or not UseRefResult2.current then
				UseRefResult1.current = false
				
				return
			end
			local ResponseBody = if Result then Result.responseBody else nil
			local PageItems = if ResponseBody then ResponseBody.PageItems else nil
			UseStateResult2_3(if ResponseBody and ResponseBody.NextCursor and ResponseBody.NextCursor ~= "" then ResponseBody.NextCursor else nil)
			
			if PageItems then
				local MapResult = DashModule.map(PageItems, function(p4)
					return {
						id = tostring(p4.id),
						hasVerifiedBadge = p4.hasVerifiedBadge or false
					}
				end)
				
				if NoP4 then
					UseStateResult2(MapResult)
				else
					UseStateResult2(function(Tbl)
						-- upvalues: MapResult (copy)
						local Copy = table.clone(Tbl)
						
						for _, value in MapResult do
							table.insert(Copy, value)
						end
						return Copy
					end)
				end
			elseif NoP4 then
				UseStateResult2({})
			end
			if NoP4 then
				UseStateResult2_1(false)
			end
			UseRefResult1.current = false
		end):catch(function(Err)
			-- upvalues: UseRefResult (upval), Current (copy), UseRefResult2 (upval), UseRefResult1 (upval), UseStateResult2_2 (upval), NoP4 (copy), UseStateResult2_1 (upval)
			if UseRefResult.current ~= Current or not UseRefResult2.current then
				UseRefResult1.current = false
				
				return
			end
			UseStateResult2_2(Err)
			
			if NoP4 then
				UseStateResult2_1(false)
			end
			UseRefResult1.current = false
		end)
	end, { UseDispatchResult, UsePageSizeModuleResult })
	ReactModule.useEffect(function()
		-- upvalues: IsSkip (copy), UseRefResult (copy), UseStateResult2_3 (copy), UseStateResult2 (copy), UseResult (copy), p1 (copy)
		if IsSkip then
			return nil
		else
			UseRefResult.current += 1
			local Current = UseRefResult.current
			UseStateResult2_3(nil)
			UseStateResult2({})
			UseResult(p1.targetUserId, nil, Current)
			
			return nil
		end
	end, { IsSkip, p1.targetUserId, UseResult })
	
	return {
		friends = UseStateResult,
		loading = UseStateResult1,
		hasMore = UseStateResult4 ~= nil,
		fetchMore = ReactModule.useCallback(function()
			-- upvalues: UseRefResult1 (copy), UseStateResult4 (copy), UseResult (copy), p1 (copy), UseRefResult (copy)
			if not UseRefResult1.current and UseStateResult4 then
				UseResult(p1.targetUserId, UseStateResult4, UseRefResult.current)
				
				return
			end
		end, { UseStateResult4, UseResult, p1.targetUserId }),
		refresh = ReactModule.useCallback(function()
			-- upvalues: UseRefResult (copy), UseStateResult2_3 (copy), UseStateResult2 (copy), UseResult (copy), p1 (copy)
			UseRefResult.current += 1
			local Current = UseRefResult.current
			UseStateResult2_3(nil)
			UseStateResult2({})
			UseResult(p1.targetUserId, nil, Current)
		end, { UseResult, p1.targetUserId }),
		error = UseStateResult3
	}
end