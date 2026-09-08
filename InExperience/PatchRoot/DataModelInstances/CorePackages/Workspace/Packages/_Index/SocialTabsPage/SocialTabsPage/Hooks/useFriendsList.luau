local socialTabsPage = script:FindFirstAncestor("SocialTabsPage")
local parent = socialTabsPage.Parent
local reactModule = require(parent.React)
local dashModule = require(parent.Dash)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local findFriendsFromUserId = require(socialTabsPage.Networking.NetworkingFriends).FindFriendsFromUserId
local usePageSizeModule = require(socialTabsPage.Hooks.usePageSize)

local function mapPageItemsToFriends(p1)
	-- upvalues: dashModule (ref)
	local t = {}
	
	for i, v in dashModule.map(p1, function(p2)
		return {
			id = tostring(p2.id),
			hasVerifiedBadge = p2.hasVerifiedBadge or false
		}
	end) do
		local var1 = tonumber(v.id)
		
		if var1 ~= nil and var1 > 0 then
			table.insert(t, v)
		end
	end
	return t
end

return function(p2)
	-- upvalues: useDispatch (ref), usePageSizeModule (ref), reactModule (ref), findFriendsFromUserId (ref), mapPageItemsToFriends (ref)
	local var2 = useDispatch()
	local var3 = usePageSizeModule()
	local var4 = if p2.skip ~= true then not p2.targetUserId or p2.targetUserId == "" else true
	local var5, var6 = reactModule.useState({})
	local var7, var8 = reactModule.useState(not var4)
	local var9, var10 = reactModule.useState(nil)
	local var11, var12 = reactModule.useState(nil)
	local var13 = reactModule.useRef(0)
	local var14 = reactModule.useRef(false)
	local var15 = reactModule.useRef(true)
	reactModule.useEffect(function()
		-- upvalues: var15 (ref)
		return function()
			-- upvalues: var15 (copy)
			var15.current = false
		end
	end, {})
	local var16 = reactModule.useCallback(function(p3, p4, p5)
		-- upvalues: var8 (ref), var14 (ref), var10 (ref), var2 (ref), findFriendsFromUserId (copy), var3 (ref), var13 (ref), var15 (ref), var12 (ref), mapPageItemsToFriends (copy), var6 (ref)
		local var17 = not p4 or p4 == ""
		
		if var17 then
			var8(true)
		end
		var14.current = true
		var10(nil)
		var2(findFriendsFromUserId.API(p3, {
			limit = var3,
			cursor = if p4 and p4 ~= "" then p4 else nil
		})):andThen(function(p6)
			-- upvalues: var13 (copy), p5 (ref), var15 (copy), var14 (copy), var12 (copy), mapPageItemsToFriends (copy), var17 (ref), var6 (copy), var8 (copy)
			if var13.current ~= p5 or not var15.current then
				var14.current = false
				
				return
			end
			local var18 = if p6 then p6.responseBody else nil
			local var19 = if var18 then var18.PageItems else nil
			var12(if var18 and var18.NextCursor and var18.NextCursor ~= "" then var18.NextCursor else nil)
			
			if var19 then
				local var20 = mapPageItemsToFriends(var19)
				
				if var17 then
					var6(var20)
				else
					var6(function(p7)
						-- upvalues: var20 (ref)
						local cloned = table.clone(p7)
						
						for i, v in var20 do
							table.insert(cloned, v)
						end
						return cloned
					end)
				end
			elseif var17 then
				var6({})
			end
			if var17 then
				var8(false)
			end
			var14.current = false
		end):catch(function(p7)
			-- upvalues: var13 (copy), p5 (ref), var15 (copy), var14 (copy), var10 (copy), var17 (ref), var8 (copy)
			if var13.current ~= p5 or not var15.current then
				var14.current = false
				
				return
			end
			var10(p7)
			
			if var17 then
				var8(false)
			end
			var14.current = false
		end)
	end, { var2, var3 })
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), var13 (ref), var12 (ref), var6 (ref), var16 (ref), p2 (ref)
		if var4 then
			return nil
		end
		var13.current += 1
		local current = var13.current
		var12(nil)
		var6({})
		var16(p2.targetUserId, nil, current)
		
		return nil
	end, { var4, p2.targetUserId, var16 })
	
	return {
		friends = var5,
		loading = var7,
		hasMore = var11 ~= nil,
		fetchMore = reactModule.useCallback(function()
			-- upvalues: var14 (ref), var11 (ref), var16 (ref), p2 (ref), var13 (ref)
			if var14.current or not var11 then
				return
			end
			var16(p2.targetUserId, var11, var13.current)
		end, { var11, var16, p2.targetUserId }),
		refresh = reactModule.useCallback(function()
			-- upvalues: var13 (ref), var12 (ref), var6 (ref), var16 (ref), p2 (ref)
			var13.current += 1
			local current = var13.current
			var12(nil)
			var6({})
			var16(p2.targetUserId, nil, current)
		end, { var16, p2.targetUserId }),
		error = var9
	}
end