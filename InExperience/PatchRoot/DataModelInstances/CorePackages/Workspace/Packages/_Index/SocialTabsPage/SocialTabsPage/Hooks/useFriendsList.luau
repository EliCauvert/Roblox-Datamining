local socialTabsPage = script:FindFirstAncestor("SocialTabsPage")
local parent = socialTabsPage.Parent
local reactModule = require(parent.React)
local dashModule = require(parent.Dash)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local findFriendsFromUserId = require(socialTabsPage.Networking.NetworkingFriends).FindFriendsFromUserId
local usePageSizeModule = require(socialTabsPage.Hooks.usePageSize)

local function _(p0)
	-- upvalues: dashModule (ref)
	return dashModule.map(p0, function(p1)
		return {
			id = tostring(p1.id),
			hasVerifiedBadge = p1.hasVerifiedBadge or false
		}
	end)
end

return function(p2)
	-- upvalues: useDispatch (ref), usePageSizeModule (ref), reactModule (ref), findFriendsFromUserId (ref), dashModule (ref)
	local var4 = useDispatch()
	local var5 = usePageSizeModule()
	local var6 = if p2.skip ~= true then not p2.targetUserId or p2.targetUserId == "" else true
	local var7, var8 = reactModule.useState({})
	local var9, var10 = reactModule.useState(not var6)
	local var11, var12 = reactModule.useState(nil)
	local var13, var14 = reactModule.useState(nil)
	local var15 = reactModule.useRef(0)
	local var16 = reactModule.useRef(false)
	local var17 = reactModule.useRef(true)
	reactModule.useEffect(function()
		-- upvalues: var17 (ref)
		return function()
			-- upvalues: var17 (copy)
			var17.current = false
		end
	end, {})
	local var18 = reactModule.useCallback(function(p3, p4, p5)
		-- upvalues: var10 (ref), var16 (ref), var12 (ref), var4 (ref), findFriendsFromUserId (copy), var5 (ref), var15 (ref), var17 (ref), var14 (ref), dashModule (copy), var8 (ref)
		local var19 = not p4 or p4 == ""
		
		if var19 then
			var10(true)
		end
		var16.current = true
		var12(nil)
		var4(findFriendsFromUserId.API(p3, {
			limit = var5,
			cursor = if p4 and p4 ~= "" then p4 else nil
		})):andThen(function(p7)
			-- upvalues: var15 (copy), p5 (ref), var17 (copy), var16 (copy), var14 (copy), dashModule (copy), var19 (ref), var8 (copy), var10 (copy)
			if var15.current ~= p5 or not var17.current then
				var16.current = false
				
				return
			end
			local var20 = if p7 then p7.responseBody else nil
			local var21 = if var20 then var20.PageItems else nil
			var14(if var20 and var20.NextCursor and var20.NextCursor ~= "" then var20.NextCursor else nil)
			
			if var21 then
				local var22 = dashModule.map(var21, function(p8)
					return {
						id = tostring(p8.id),
						hasVerifiedBadge = p8.hasVerifiedBadge or false
					}
				end)
				
				if var19 then
					var8(var22)
				else
					var8(function(p9)
						-- upvalues: var22 (ref)
						local cloned = table.clone(p9)
						
						for i, v in var22 do
							table.insert(cloned, v)
						end
						return cloned
					end)
				end
			elseif var19 then
				var8({})
			end
			if var19 then
				var10(false)
			end
			var16.current = false
		end):catch(function(p6)
			-- upvalues: var15 (copy), p5 (ref), var17 (copy), var16 (copy), var12 (copy), var19 (ref), var10 (copy)
			if var15.current ~= p5 or not var17.current then
				var16.current = false
				
				return
			end
			var12(p6)
			
			if var19 then
				var10(false)
			end
			var16.current = false
		end)
	end, { var4, var5 })
	reactModule.useEffect(function()
		-- upvalues: var6 (ref), var15 (ref), var14 (ref), var8 (ref), var18 (ref), p2 (ref)
		if var6 then
			return nil
		end
		var15.current += 1
		local current = var15.current
		var14(nil)
		var8({})
		var18(p2.targetUserId, nil, current)
		
		return nil
	end, { var6, p2.targetUserId, var18 })
	
	return {
		friends = var7,
		loading = var9,
		hasMore = var13 ~= nil,
		fetchMore = reactModule.useCallback(function()
			-- upvalues: var16 (ref), var13 (ref), var18 (ref), p2 (ref), var15 (ref)
			if var16.current or not var13 then
				return
			end
			var18(p2.targetUserId, var13, var15.current)
		end, { var13, var18, p2.targetUserId }),
		refresh = reactModule.useCallback(function()
			-- upvalues: var15 (ref), var14 (ref), var8 (ref), var18 (ref), p2 (ref)
			var15.current += 1
			local current = var15.current
			var14(nil)
			var8({})
			var18(p2.targetUserId, nil, current)
		end, { var18, p2.targetUserId }),
		error = var11
	}
end