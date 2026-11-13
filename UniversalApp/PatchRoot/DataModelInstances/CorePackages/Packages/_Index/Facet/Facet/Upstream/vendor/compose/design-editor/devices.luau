local function insets(Left, Top, Right, Bottom)
	return table.freeze({ left = Left, top = Top, right = Right, bottom = Bottom })
end

local function profile(Id, Name, X: number, Y, InputMode, TextScale, VerifyId, Orientation, p1, p2)
	return table.freeze({
		id = Id,
		name = Name,
		size = table.freeze({ X = X, Y = Y }),
		aspect = X / Y,
		guiInset = table.freeze({ left = 0, top = 58, right = 0, bottom = 0 }),
		topbar = table.freeze({
			x = 164,
			y = 0,
			height = 58,
			width = math.max(0, X - 164)
		}),
		notch = p1 or table.freeze({ left = 0, top = 0, right = 0, bottom = 0 }),
		safeArea = p2 or table.freeze({ left = 0, top = 58, right = 0, bottom = 0 }),
		inputMode = InputMode,
		textScale = TextScale,
		tenFoot = Id == "tv",
		fieldOfView = if InputMode == "VR" then 90 else 50,
		verifyId = VerifyId,
		orientation = Orientation
	})
end

local Tbl = {
	profile("phone-portrait", "Phone portrait", 389, 762, "touch", 1, "iphone_14", "Portrait", insets(0, 47, 0, 34)),
	profile("phone-landscape", "Phone landscape", 749, 389, "touch", 1, "iphone_14", "LandscapeLeft", insets(47, 0, 47, 0)),
	profile("tablet-portrait", "Tablet portrait", 820, 1180, "touch", 1),
	profile("tablet-landscape", "Tablet landscape", 1180, 820, "touch", 1),
	profile("monitor", "Monitor", 1919, 1080, "mouse", 1, "hd_1080"),
	profile("ultrawide", "Ultrawide monitor", 3439, 1440, "mouse", 1),
	profile("tv", "TV · 10-foot", 1919, 1080, "gamepad", 1.3, "xbox", nil, nil, insets(96, 112, 96, 54)),
	profile("vr", "VR headset", 2064, 2208, "VR", 1.15)
}
local GenericHandheld720 = profile("generic_handheld_720", "Handheld", 1279, 720, "gamepad", 1, "generic_handheld_720")

return table.freeze({
	all = table.freeze(Tbl),
	get = function(Id)
		-- upvalues: Tbl (copy), GenericHandheld720 (copy)
		for _, value in Tbl do
			if value.id == Id or value.name == Id or value.verifyId == Id and value.orientation ~= "Portrait" then
				return value
			end
		end
		assert(Id == GenericHandheld720.id, "Unknown Design device: " .. Id)
		
		return GenericHandheld720
	end,
	area = function(p1, p2)
		if p2 == "TopbarSafeInsets" then
			return table.clone(p1.topbar)
		else
			local Frozen = if p2 == "None" then table.freeze({
				left = -p1.notch.left,
				top = -p1.notch.top,
				right = -p1.notch.right,
				bottom = -p1.notch.bottom
			}) elseif p2 == "DeviceSafeInsets" then table.freeze({ left = 0, top = 0, right = 0, bottom = 0 }) elseif p2 == "SafeArea" then p1.safeArea else p1.guiInset
			
			return {
				x = Frozen.left,
				y = Frozen.top,
				width = p1.size.X - Frozen.left - Frozen.right,
				height = p1.size.Y - Frozen.top - Frozen.bottom
			}
		end
	end,
	custom = function(Id, Vector)
		-- upvalues: profile (copy)
		assert(Vector.X > 0 and Vector.Y > 0, "Design device resolution must be positive")
		
		return profile(Id, Id, Vector.X, Vector.Y, "mouse", 1)
	end
})