local CreateSignalFunction = require(script.Parent.Parent.Signals).createSignal
local t = {}

local function _(CreatorId)
	return {
		avatarIcon = nil,
		specialGroupIcon = nil,
		isPlaceOwner = game.CreatorType == Enum.CreatorType.User and CreatorId == game.CreatorId
	}
end

local _ = function(CreatorId)
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
	getPlayerIconInfoReactive = function(CreatorId)
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
	setPlayerIconInfo = function(CreatorId, p1)
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
	addPlayer = function(CreatorId)
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
	removePlayer = function(Key)
		-- upvalues: t (ref)
		t[Key] = nil
	end,
	cleanUp = function()
		-- upvalues: t (ref)
		t = {}
	end
}