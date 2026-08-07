game:DefineFastFlag("UGCValidationAnimationPackSupport", false)
local ok = pcall(function() --[[ line: 3 ]]
	local _ = Enum.BundleType.Animations
	local _ = Enum.AssetType.ClimbAnimation
end)

return function() --[[ line: 8 ]]
	-- upvalues: ok (ref)
	return ok and game:GetFastFlag("UGCValidationAnimationPackSupport")
end