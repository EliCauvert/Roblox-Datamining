local signalsModule = require(script:FindFirstAncestor("UserProfiles").Parent.Signals)
local createSignal = signalsModule.createSignal
local createComputed = signalsModule.createComputed
local t = {}
local var1 = require(script.Parent.UserProfileStore).get()

local function _(value)
	-- upvalues: t (write), createSignal (ref)
	if not t[value] then
		local var2, var3 = createSignal(false)
		t[value] = { getter = var2, setter = var3 }
	end
	return t[value]
end

local function hasUserVerifiedBadge(p1, p2)
	-- upvalues: var1 (ref)
	local ok, status = pcall(var1.fetchNamesByUserIds({ tostring(p1) }), p2)
	
	if not ok then
		status = { status = "failed", data = {} }
	end
	return if status.status == "success" and #status.data > 0 and status.data[1].getIsVerified then status.data[1].getIsVerified(p2) else false
end

local t_1 = {
	setBadgeVisibility = function(value, p1)
		-- upvalues: t (write), createSignal (ref)
		if not t[value] then
			local var2, var3 = createSignal(false)
			t[value] = { getter = var2, setter = var3 }
		end
		t[value].setter(p1)
	end,
	getBadgeVisibilitySignal = function(value)
		-- upvalues: t (write), createSignal (ref), createComputed (ref), hasUserVerifiedBadge (ref)
		if not t[value] then
			local var2, var3 = createSignal(false)
			t[value] = { getter = var2, setter = var3 }
		end
		local var4 = t[value]
		
		return createComputed(function(p1)
			-- upvalues: hasUserVerifiedBadge (copy), value (ref), var4 (ref)
			return hasUserVerifiedBadge(value, p1) and var4.getter(p1)
		end)
	end,
	isBadgeVisible = function(p1)
		-- upvalues: hasUserVerifiedBadge (ref), t (write), createSignal (ref)
		local var2 = hasUserVerifiedBadge(p1, false)
		
		if not t[p1] then
			local var3, var4 = createSignal(false)
			t[p1] = { getter = var3, setter = var4 }
		end
		return var2 and t[p1].getter(false)
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