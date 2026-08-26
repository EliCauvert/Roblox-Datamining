local createSignal = require(script.Parent.Parent.Signals).createSignal
local t = {}

local function _(p1)
	return {
		avatarIcon = nil,
		specialGroupIcon = nil,
		isPlaceOwner = game.CreatorType == Enum.CreatorType.User and p1 == game.CreatorId
	}
end

local _ = function(value)
	-- upvalues: t (write), createSignal (ref)
	if not t[value] then
		local var1, var2 = createSignal({
			avatarIcon = nil,
			specialGroupIcon = nil,
			isPlaceOwner = game.CreatorType == Enum.CreatorType.User and value == game.CreatorId
		})
		t[value] = { getter = var1, setter = var2 }
	end
	return t[value]
end

return {
	getPlayerIconInfoReactive = function(p1)
		-- upvalues: t (write), createSignal (ref)
		if not t[p1] then
			local var1, var2 = createSignal({
				avatarIcon = nil,
				specialGroupIcon = nil,
				isPlaceOwner = game.CreatorType == Enum.CreatorType.User and p1 == game.CreatorId
			})
			t[p1] = { getter = var1, setter = var2 }
		end
		return t[p1].getter
	end,
	setPlayerIconInfo = function(value, p1)
		-- upvalues: t (write), createSignal (ref)
		if not t[value] then
			local var1, var2 = createSignal({
				avatarIcon = nil,
				specialGroupIcon = nil,
				isPlaceOwner = game.CreatorType == Enum.CreatorType.User and value == game.CreatorId
			})
			t[value] = { getter = var1, setter = var2 }
		end
		t[value].setter(p1)
	end,
	addPlayer = function(p1)
		-- upvalues: t (write), createSignal (ref)
		if not t[p1] then
			local var1, var2 = createSignal({
				avatarIcon = nil,
				specialGroupIcon = nil,
				isPlaceOwner = game.CreatorType == Enum.CreatorType.User and p1 == game.CreatorId
			})
			t[p1] = { getter = var1, setter = var2 }
		end
		local _ = t[p1]
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