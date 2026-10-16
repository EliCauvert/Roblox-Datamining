return function(p1) --[[ Line: 1 | Named "AvatarPolicies" ]]
	return {
		getAvatarHeaderIcon = function() --[[ Line: 3 ]]
			-- upvalues: p1 (copy)
			return p1.AvatarHeaderIcon or "LuaApp/icons/ic-back"
		end,
		getAvatarEditorShowBuyRobuxOnTopBar = function() --[[ Line: 6 ]]
			-- upvalues: p1 (copy)
			return p1.AvatarEditorShowBuyRobuxOnTopBar or false
		end,
		getCustomOutfitNames = function() --[[ Line: 9 ]]
			-- upvalues: p1 (copy)
			return p1.CustomCostumeNames == nil or p1.CustomCostumeNames
		end
	}
end