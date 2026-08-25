local createSignal = require(script.Parent.Parent.Parent.Signals).createSignal
local t = {}

local function _()
	return {
		isBlocked = false,
		friendStatus = nil,
		isFollowing = false
	}
end

local _ = function(p0)
	-- upvalues: t (write), createSignal (ref)
	if not t[p0] then
		local var1, var2 = createSignal({
			isBlocked = false,
			friendStatus = nil,
			isFollowing = false
		})
		t[p0] = { getter = var1, setter = var2 }
	end
	return t[p0]
end

return {
	getPlayerRelationshipReactive = function(p1)
		-- upvalues: t (write), createSignal (ref)
		if not t[p1] then
			local var3, var4 = createSignal({
				isBlocked = false,
				friendStatus = nil,
				isFollowing = false
			})
			t[p1] = { getter = var3, setter = var4 }
		end
		return t[p1].getter
	end,
	patchPlayerRelationship = function(p2, p3)
		-- upvalues: t (write), createSignal (ref)
		if not t[p2] then
			local var5, var6 = createSignal({
				isBlocked = false,
				friendStatus = nil,
				isFollowing = false
			})
			t[p2] = { getter = var5, setter = var6 }
		end
		local var7 = t[p2]
		local ter = var7.getter(false)
		var7.setter({
			isBlocked = if p3.isBlocked ~= nil then ter.isBlocked else p3.isBlocked,
			friendStatus = if p3.friendStatus ~= nil then ter.friendStatus else p3.friendStatus,
			isFollowing = if p3.isFollowing ~= nil then ter.isFollowing else p3.isFollowing
		})
	end,
	removePlayer = function(p4)
		-- upvalues: t (write)
		t[p4] = nil
	end,
	cleanUp = function()
		-- upvalues: t (write)
		t = {}
	end
}