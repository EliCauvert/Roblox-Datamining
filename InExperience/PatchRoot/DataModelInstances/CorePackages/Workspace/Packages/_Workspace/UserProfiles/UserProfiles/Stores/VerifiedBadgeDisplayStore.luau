local SignalsModule = require(script:FindFirstAncestor("UserProfiles").Parent.Signals)
local CreateSignalFunction = SignalsModule.createSignal
local CreateComputedFunction = SignalsModule.createComputed
local t = {}
local GetResult = require(script.Parent.UserProfileStore).get()

local function _(Key) --[[ Line: 22 | Named "getOrCreateUserSignal" ]]
	-- upvalues: t (ref), CreateSignalFunction (copy)
	if not t[Key] then
		local Signal, Signal2 = CreateSignalFunction(false)
		t[Key] = { getter = Signal, setter = Signal2 }
	end
	return t[Key]
end

local function hasUserVerifiedBadge(Key, p1) --[[ Line: 35 ]]
	-- upvalues: GetResult (copy)
	local Success, Result = pcall(GetResult.fetchNamesByUserIds({ (tostring(Key)) }), p1)
	
	if not Success then
		Result = { status = "failed", data = {} }
	end
	return if Result.status == "success" and #Result.data > 0 and Result.data[1].getIsVerified then Result.data[1].getIsVerified(p1) else false
end

local config = {
	setBadgeVisibility = function(Key, p1) --[[ Line: 30 ]]
		-- upvalues: t (ref), CreateSignalFunction (copy)
		if not t[Key] then
			local Signal, Signal2 = CreateSignalFunction(false)
			t[Key] = { getter = Signal, setter = Signal2 }
		end
		t[Key].setter(p1)
	end,
	getBadgeVisibilitySignal = function(Key) --[[ Line: 51 ]]
		-- upvalues: t (ref), CreateSignalFunction (copy), CreateComputedFunction (copy), hasUserVerifiedBadge (copy)
		if not t[Key] then
			local Signal, Signal2 = CreateSignalFunction(false)
			t[Key] = { getter = Signal, setter = Signal2 }
		end
		local Entry = t[Key]
		
		return CreateComputedFunction(function(p1) --[[ Line: 54 ]]
			-- upvalues: hasUserVerifiedBadge (upval), Key (copy), Entry (copy)
			local Ter = Entry.getter(p1)
			
			return hasUserVerifiedBadge(Key, p1) and Ter
		end)
	end,
	isBadgeVisible = function(Key) --[[ Line: 61 ]]
		-- upvalues: hasUserVerifiedBadge (copy), t (ref), CreateSignalFunction (copy)
		local HasUserVerifiedBadge = hasUserVerifiedBadge(Key, false)
		
		if not t[Key] then
			local Signal, Signal2 = CreateSignalFunction(false)
			t[Key] = { getter = Signal, setter = Signal2 }
		end
		local Ter = t[Key].getter(false)
		
		return HasUserVerifiedBadge and Ter
	end,
	reset = function() --[[ Line: 69 ]]
		-- upvalues: t (ref)
		t = {}
	end
}

return {
	get = function() --[[ Line: 81 ]]
		-- upvalues: config (copy)
		return config
	end
}