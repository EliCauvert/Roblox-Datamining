local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local useTokens = require(parent.Foundation).Hooks.useTokens
local constantsModule = require(profilePlatform.Common.Constants)
local enumsModule = require(profilePlatform.Common.Enums)
local useAboutSectionHeightModule = require(profilePlatform.Hooks.useAboutSectionHeight)
local useProfileJsonComponentModule = require(profilePlatform.Hooks.useProfileJsonComponent)
local useDynamicSizeMarginModule = require(profilePlatform.Hooks.useDynamicSizeMargin)
local useCurrentlyPlayingSectionHeightModule = require(profilePlatform.Hooks.useCurrentlyPlayingSectionHeight)
local fFlagProfilePlatformAddCurrentlyPlayingModule = require(profilePlatform.Flags.FFlagProfilePlatformAddCurrentlyPlaying)

return function(p1, p2)
	-- upvalues: useTokens (ref), useDynamicSizeMarginModule (ref), useProfileJsonComponentModule (ref), enumsModule (ref), reactModule (ref), useAboutSectionHeightModule (ref), fFlagProfilePlatformAddCurrentlyPlayingModule (ref), useCurrentlyPlayingSectionHeightModule (ref), constantsModule (ref)
	local var1 = useTokens()
	local var2, _ = useDynamicSizeMarginModule()
	local var3 = useProfileJsonComponentModule(enumsModule.Components.About)
	local var4, _ = useAboutSectionHeightModule(reactModule.useMemo(function()
		-- upvalues: var3 (ref)
		return var3.description
	end, { var3, var3.description }), p1, var2)
	local _ = nil
	local var5 = if fFlagProfilePlatformAddCurrentlyPlayingModule then useCurrentlyPlayingSectionHeightModule(useProfileJsonComponentModule(enumsModule.Components.CurrentlyPlaying)) else nil
	
	return reactModule.useMemo(function()
		-- upvalues: constantsModule (copy), var1 (ref), p2 (ref), var4 (ref), fFlagProfilePlatformAddCurrentlyPlayingModule (copy), var5 (write), p1 (ref)
		local var6 = constantsModule.AVATAR_HEADSHOT_HEIGHT / 2 + var1.Gap.Large
		local var7 = if p2 then constantsModule.CONTEXTUAL_INFORMATION_HEIGHT + var1.Gap.XXLarge else 0
		local SOCIAL_ROW_HEIGHT = constantsModule.SOCIAL_ROW_HEIGHT
		local CTA_BUTTON_HEIGHT = constantsModule.CTA_BUTTON_HEIGHT
		local var8 = (if var4 ~= 0 then 0 else var1.Gap.XXLarge) + 10
		
		if fFlagProfilePlatformAddCurrentlyPlayingModule then
			var8 += if var5 ~= 0 then 0 else var1.Gap.XXLarge
		end
		return p1 * 0.75 + var6 + var7 + SOCIAL_ROW_HEIGHT + var4 + CTA_BUTTON_HEIGHT + var8 + (if fFlagProfilePlatformAddCurrentlyPlayingModule then var5 else 0)
	end, { p1, p2, var4, var5 or 0 })
end