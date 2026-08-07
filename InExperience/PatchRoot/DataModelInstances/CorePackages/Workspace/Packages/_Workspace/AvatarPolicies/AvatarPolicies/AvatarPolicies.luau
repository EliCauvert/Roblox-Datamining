return function(p0) --[[ line: 1 | named "AvatarPolicies" ]]
	return {
		getAvatarHeaderIcon = function() --[[ line: 3 ]]
			-- upvalues: p0 (ref)
			return p0.AvatarHeaderIcon or "LuaApp/icons/ic-back"
		end,
		getAvatarEditorShowBuyRobuxOnTopBar = function() --[[ line: 6 ]]
			-- upvalues: p0 (ref)
			return p0.AvatarEditorShowBuyRobuxOnTopBar or false
		end,
		getCustomOutfitNames = function() --[[ line: 9 ]]
			-- upvalues: p0 (ref)
			return p0.CustomCostumeNames == nil or p0.CustomCostumeNames
		end
	}
end