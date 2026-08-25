local signalsModule = require(script:FindFirstAncestor("UserProfiles").Parent.Signals)
local createSignal = signalsModule.createSignal
local createComputed = signalsModule.createComputed
local t = {}
local var2 = require(script.Parent.UserProfileStore).get()

local function _(value)
	-- upvalues: t (write), createSignal (ref)
	if not t[value] then
		local var5, var6 = createSignal(false)
		t[value] = { getter = var5, setter = var6 }
	end
	return t[value]
end

local function hasUserVerifiedBadge(p0, p1)
	-- upvalues: var2 (ref)
	local ok, status = pcall(var2.fetchNamesByUserIds({ tostring(p0) }), p1)
	
	if not ok then
		status = { status = "failed", data = {} }
	end
	return if status.status == "success" and #status.data > 0 and status.data[1].getIsVerified then status.data[1].getIsVerified(p1) else false
end

local t_1 = {
	setBadgeVisibility = function(value, p2)
		-- upvalues: t (write), createSignal (ref)
		if not t[value] then
			local var7, var8 = createSignal(false)
			t[value] = { getter = var7, setter = var8 }
		end
		t[value].setter(p2)
	end,
	getBadgeVisibilitySignal = function(value)
		-- upvalues: t (write), createSignal (ref), createComputed (ref), hasUserVerifiedBadge (ref)
		if not t[value] then
			local var9, var10 = createSignal(false)
			t[value] = { getter = var9, setter = var10 }
		end
		local var11 = t[value]
		
		return createComputed(function(p3)
			-- upvalues: hasUserVerifiedBadge (copy), value (ref), var11 (ref)
			return hasUserVerifiedBadge(value, p3) and var11.getter(p3)
		end)
	end,
	isBadgeVisible = function(p4)
		-- upvalues: hasUserVerifiedBadge (ref), t (write), createSignal (ref)
		local var12 = hasUserVerifiedBadge(p4, false)
		
		if not t[p4] then
			local var13, var14 = createSignal(false)
			t[p4] = { getter = var13, setter = var14 }
		end
		return var12 and t[p4].getter(false)
	end,
	reset = function()
		-- upvalues: t (write)
		t = {}
	end
}

return {
	get = function()
		-- upvalues: t_1 (ref)
		return t_1
	end
}