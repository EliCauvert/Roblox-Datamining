local createSignal = require(script.Parent.Parent.Parent.Signals).createSignal
local t = {}

local function _()
	return {
		isBlocked = false,
		friendStatus = nil,
		isFollowing = false
	}
end

local _ = function(p1)
	-- upvalues: t (write), createSignal (ref)
	if not t[p1] then
		local var1, var2 = createSignal({
			isBlocked = false,
			friendStatus = nil,
			isFollowing = false
		})
		t[p1] = { getter = var1, setter = var2 }
	end
	return t[p1]
end

return {
	getPlayerRelationshipReactive = function(p1)
		-- upvalues: t (write), createSignal (ref)
		if not t[p1] then
			local var1, var2 = createSignal({
				isBlocked = false,
				friendStatus = nil,
				isFollowing = false
			})
			t[p1] = { getter = var1, setter = var2 }
		end
		return t[p1].getter
	end,
	patchPlayerRelationship = function(p1, p2)
		-- upvalues: t (write), createSignal (ref)
		if not t[p1] then
			local var1, var2 = createSignal({
				isBlocked = false,
				friendStatus = nil,
				isFollowing = false
			})
			t[p1] = { getter = var1, setter = var2 }
		end
		local var3 = t[p1]
		local ter = var3.getter(false)
		var3.setter({
			isBlocked = if p2.isBlocked ~= nil then ter.isBlocked else p2.isBlocked,
			friendStatus = if p2.friendStatus ~= nil then ter.friendStatus else p2.friendStatus,
			isFollowing = if p2.isFollowing ~= nil then ter.isFollowing else p2.isFollowing
		})
	end,
	removePlayer = function(p1)
		-- upvalues: t (write)
		t[p1] = nil
	end,
	cleanUp = function()
		-- upvalues: t (write)
		t = {}
	end
}