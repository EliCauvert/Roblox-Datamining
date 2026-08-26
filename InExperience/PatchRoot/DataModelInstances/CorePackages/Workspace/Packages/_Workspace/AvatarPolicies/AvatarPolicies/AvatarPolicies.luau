return function(p1)
	return {
		getAvatarHeaderIcon = function()
			-- upvalues: p1 (ref)
			return p1.AvatarHeaderIcon or "LuaApp/icons/ic-back"
		end,
		getAvatarEditorShowBuyRobuxOnTopBar = function()
			-- upvalues: p1 (ref)
			return p1.AvatarEditorShowBuyRobuxOnTopBar or false
		end,
		getCustomOutfitNames = function()
			-- upvalues: p1 (ref)
			return p1.CustomCostumeNames == nil or p1.CustomCostumeNames
		end
	}
end