local CreateSignalFunction = require(script.Parent.Parent.Parent.Signals).createSignal
local t = {}

local function _() --[[ Line: 18 | Named "defaultRelationship" ]]
	return {
		isBlocked = false,
		friendStatus = nil,
		isFollowing = false
	}
end

local _ = function(Key) --[[ Line: 26 | Named "getOrCreate" ]]
	-- upvalues: t (ref), CreateSignalFunction (copy)
	if not t[Key] then
		local Signal, Signal2 = CreateSignalFunction({
			isBlocked = false,
			friendStatus = nil,
			isFollowing = false
		})
		t[Key] = { getter = Signal, setter = Signal2 }
	end
	return t[Key]
end

return {
	getPlayerRelationshipReactive = function(Key) --[[ Line: 34 ]]
		-- upvalues: t (ref), CreateSignalFunction (copy)
		if not t[Key] then
			local Signal, Signal2 = CreateSignalFunction({
				isBlocked = false,
				friendStatus = nil,
				isFollowing = false
			})
			t[Key] = { getter = Signal, setter = Signal2 }
		end
		return t[Key].getter
	end,
	patchPlayerRelationship = function(Key, p1) --[[ Line: 44 ]]
		-- upvalues: t (ref), CreateSignalFunction (copy)
		if not t[Key] then
			local Signal, Signal2 = CreateSignalFunction({
				isBlocked = false,
				friendStatus = nil,
				isFollowing = false
			})
			t[Key] = { getter = Signal, setter = Signal2 }
		end
		local Entry = t[Key]
		local Ter = Entry.getter(false)
		Entry.setter({
			isBlocked = if p1.isBlocked == nil then Ter.isBlocked else p1.isBlocked,
			friendStatus = if p1.friendStatus == nil then Ter.friendStatus else p1.friendStatus,
			isFollowing = if p1.isFollowing == nil then Ter.isFollowing else p1.isFollowing
		})
	end,
	removePlayer = function(Key) --[[ Line: 55 ]]
		-- upvalues: t (ref)
		t[Key] = nil
	end,
	cleanUp = function() --[[ Line: 59 ]]
		-- upvalues: t (ref)
		t = {}
	end
}