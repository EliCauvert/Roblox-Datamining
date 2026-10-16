local CreateSignalFunction = require(script.Parent.Parent.Signals).createSignal
local t = {}

local function _(CreatorId) --[[ Line: 25 | Named "createDefaultPlayerIconInfo" ]]
	return {
		avatarIcon = nil,
		specialGroupIcon = nil,
		isPlaceOwner = game.CreatorType == Enum.CreatorType.User and CreatorId == game.CreatorId
	}
end

local _ = function(CreatorId) --[[ Line: 33 | Named "getOrCreatePlayerSignal" ]]
	-- upvalues: t (ref), CreateSignalFunction (copy)
	if not t[CreatorId] then
		local Signal, Signal2 = CreateSignalFunction({
			avatarIcon = nil,
			specialGroupIcon = nil,
			isPlaceOwner = game.CreatorType == Enum.CreatorType.User and CreatorId == game.CreatorId
		})
		t[CreatorId] = { getter = Signal, setter = Signal2 }
	end
	return t[CreatorId]
end

return {
	getPlayerIconInfoReactive = function(CreatorId) --[[ Line: 41 ]]
		-- upvalues: t (ref), CreateSignalFunction (copy)
		if not t[CreatorId] then
			local Signal, Signal2 = CreateSignalFunction({
				avatarIcon = nil,
				specialGroupIcon = nil,
				isPlaceOwner = game.CreatorType == Enum.CreatorType.User and CreatorId == game.CreatorId
			})
			t[CreatorId] = { getter = Signal, setter = Signal2 }
		end
		return t[CreatorId].getter
	end,
	setPlayerIconInfo = function(CreatorId, p1) --[[ Line: 46 ]]
		-- upvalues: t (ref), CreateSignalFunction (copy)
		if not t[CreatorId] then
			local Signal, Signal2 = CreateSignalFunction({
				avatarIcon = nil,
				specialGroupIcon = nil,
				isPlaceOwner = game.CreatorType == Enum.CreatorType.User and CreatorId == game.CreatorId
			})
			t[CreatorId] = { getter = Signal, setter = Signal2 }
		end
		t[CreatorId].setter(p1)
	end,
	addPlayer = function(CreatorId) --[[ Line: 51 ]]
		-- upvalues: t (ref), CreateSignalFunction (copy)
		if not t[CreatorId] then
			local Signal, Signal2 = CreateSignalFunction({
				avatarIcon = nil,
				specialGroupIcon = nil,
				isPlaceOwner = game.CreatorType == Enum.CreatorType.User and CreatorId == game.CreatorId
			})
			t[CreatorId] = { getter = Signal, setter = Signal2 }
		end
		local _ = t[CreatorId]
	end,
	removePlayer = function(Key) --[[ Line: 56 ]]
		-- upvalues: t (ref)
		t[Key] = nil
	end,
	cleanUp = function() --[[ Line: 60 ]]
		-- upvalues: t (ref)
		t = {}
	end
}