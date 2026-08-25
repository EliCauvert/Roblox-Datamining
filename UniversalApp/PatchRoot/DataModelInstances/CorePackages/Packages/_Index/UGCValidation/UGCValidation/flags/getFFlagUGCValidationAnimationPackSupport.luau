game:DefineFastFlag("UGCValidationAnimationPackSupport", false)
local ok = pcall(function()
	local _ = Enum.BundleType.Animations
	local _ = Enum.AssetType.ClimbAnimation
end)

return function()
	-- upvalues: ok (ref)
	return ok and game:GetFastFlag("UGCValidationAnimationPackSupport")
end