return function(p0)
	return {
		getAvatarHeaderIcon = function()
			-- upvalues: p0 (ref)
			return p0.AvatarHeaderIcon or "LuaApp/icons/ic-back"
		end,
		getAvatarEditorShowBuyRobuxOnTopBar = function()
			-- upvalues: p0 (ref)
			return p0.AvatarEditorShowBuyRobuxOnTopBar or false
		end,
		getCustomOutfitNames = function()
			-- upvalues: p0 (ref)
			return p0.CustomCostumeNames == nil or p0.CustomCostumeNames
		end
	}
end