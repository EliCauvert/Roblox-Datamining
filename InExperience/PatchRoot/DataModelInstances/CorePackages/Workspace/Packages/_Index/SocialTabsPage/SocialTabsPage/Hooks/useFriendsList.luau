local socialTabsPage = script:FindFirstAncestor("SocialTabsPage")
local parent = socialTabsPage.Parent
local reactModule = require(parent.React)
local dashModule = require(parent.Dash)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local findFriendsFromUserId = require(socialTabsPage.Networking.NetworkingFriends).FindFriendsFromUserId
local usePageSizeModule = require(socialTabsPage.Hooks.usePageSize)

local function _(p1)
	-- upvalues: dashModule (ref)
	return dashModule.map(p1, function(p2)
		return {
			id = tostring(p2.id),
			hasVerifiedBadge = p2.hasVerifiedBadge or false
		}
	end)
end

return function(p1)
	-- upvalues: useDispatch (ref), usePageSizeModule (ref), reactModule (ref), findFriendsFromUserId (ref), dashModule (ref)
	local var1 = useDispatch()
	local var2 = usePageSizeModule()
	local var3 = if p1.skip ~= true then not p1.targetUserId or p1.targetUserId == "" else true
	local var4, var5 = reactModule.useState({})
	local var6, var7 = reactModule.useState(not var3)
	local var8, var9 = reactModule.useState(nil)
	local var10, var11 = reactModule.useState(nil)
	local var12 = reactModule.useRef(0)
	local var13 = reactModule.useRef(false)
	local var14 = reactModule.useRef(true)
	reactModule.useEffect(function()
		-- upvalues: var14 (ref)
		return function()
			-- upvalues: var14 (copy)
			var14.current = false
		end
	end, {})
	local var15 = reactModule.useCallback(function(p2, p3, p4)
		-- upvalues: var7 (ref), var13 (ref), var9 (ref), var1 (ref), findFriendsFromUserId (copy), var2 (ref), var12 (ref), var14 (ref), var11 (ref), dashModule (copy), var5 (ref)
		local var16 = not p3 or p3 == ""
		
		if var16 then
			var7(true)
		end
		var13.current = true
		var9(nil)
		var1(findFriendsFromUserId.API(p2, {
			limit = var2,
			cursor = if p3 and p3 ~= "" then p3 else nil
		})):andThen(function(p5)
			-- upvalues: var12 (copy), p4 (ref), var14 (copy), var13 (copy), var11 (copy), dashModule (copy), var16 (ref), var5 (copy), var7 (copy)
			if var12.current ~= p4 or not var14.current then
				var13.current = false
				
				return
			end
			local var17 = if p5 then p5.responseBody else nil
			local var18 = if var17 then var17.PageItems else nil
			var11(if var17 and var17.NextCursor and var17.NextCursor ~= "" then var17.NextCursor else nil)
			
			if var18 then
				local var19 = dashModule.map(var18, function(p6)
					return {
						id = tostring(p6.id),
						hasVerifiedBadge = p6.hasVerifiedBadge or false
					}
				end)
				
				if var16 then
					var5(var19)
				else
					var5(function(p6)
						-- upvalues: var19 (ref)
						local cloned = table.clone(p6)
						
						for i, v in var19 do
							table.insert(cloned, v)
						end
						return cloned
					end)
				end
			elseif var16 then
				var5({})
			end
			if var16 then
				var7(false)
			end
			var13.current = false
		end):catch(function(p6)
			-- upvalues: var12 (copy), p4 (ref), var14 (copy), var13 (copy), var9 (copy), var16 (ref), var7 (copy)
			if var12.current ~= p4 or not var14.current then
				var13.current = false
				
				return
			end
			var9(p6)
			
			if var16 then
				var7(false)
			end
			var13.current = false
		end)
	end, { var1, var2 })
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), var12 (ref), var11 (ref), var5 (ref), var15 (ref), p1 (ref)
		if var3 then
			return nil
		end
		var12.current += 1
		local current = var12.current
		var11(nil)
		var5({})
		var15(p1.targetUserId, nil, current)
		
		return nil
	end, { var3, p1.targetUserId, var15 })
	
	return {
		friends = var4,
		loading = var6,
		hasMore = var10 ~= nil,
		fetchMore = reactModule.useCallback(function()
			-- upvalues: var13 (ref), var10 (ref), var15 (ref), p1 (ref), var12 (ref)
			if var13.current or not var10 then
				return
			end
			var15(p1.targetUserId, var10, var12.current)
		end, { var10, var15, p1.targetUserId }),
		refresh = reactModule.useCallback(function()
			-- upvalues: var12 (ref), var11 (ref), var5 (ref), var15 (ref), p1 (ref)
			var12.current += 1
			local current = var12.current
			var11(nil)
			var5({})
			var15(p1.targetUserId, nil, current)
		end, { var15, p1.targetUserId }),
		error = var8
	}
end