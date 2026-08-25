local createSignal = require(script.Parent.Parent.Signals).createSignal
local t = {}

local function _(p0)
	return {
		avatarIcon = nil,
		specialGroupIcon = nil,
		isPlaceOwner = game.CreatorType == Enum.CreatorType.User and p0 == game.CreatorId
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
			local var3, var4 = createSignal({
				avatarIcon = nil,
				specialGroupIcon = nil,
				isPlaceOwner = game.CreatorType == Enum.CreatorType.User and p1 == game.CreatorId
			})
			t[p1] = { getter = var3, setter = var4 }
		end
		return t[p1].getter
	end,
	setPlayerIconInfo = function(value, p2)
		-- upvalues: t (write), createSignal (ref)
		if not t[value] then
			local var5, var6 = createSignal({
				avatarIcon = nil,
				specialGroupIcon = nil,
				isPlaceOwner = game.CreatorType == Enum.CreatorType.User and value == game.CreatorId
			})
			t[value] = { getter = var5, setter = var6 }
		end
		t[value].setter(p2)
	end,
	addPlayer = function(p3)
		-- upvalues: t (write), createSignal (ref)
		if not t[p3] then
			local var7, var8 = createSignal({
				avatarIcon = nil,
				specialGroupIcon = nil,
				isPlaceOwner = game.CreatorType == Enum.CreatorType.User and p3 == game.CreatorId
			})
			t[p3] = { getter = var7, setter = var8 }
		end
		local _ = t[p3]
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