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

return function(p0, p1)
	-- upvalues: useTokens (ref), useDynamicSizeMarginModule (ref), useProfileJsonComponentModule (ref), enumsModule (ref), reactModule (ref), useAboutSectionHeightModule (ref), fFlagProfilePlatformAddCurrentlyPlayingModule (ref), useCurrentlyPlayingSectionHeightModule (ref), constantsModule (ref)
	local var9 = useTokens()
	local var10, _ = useDynamicSizeMarginModule()
	local var11 = useProfileJsonComponentModule(enumsModule.Components.About)
	local var12, _ = useAboutSectionHeightModule(reactModule.useMemo(function()
		-- upvalues: var11 (ref)
		return var11.description
	end, { var11, var11.description }), p0, var10)
	local _ = nil
	local var13 = if fFlagProfilePlatformAddCurrentlyPlayingModule then useCurrentlyPlayingSectionHeightModule(useProfileJsonComponentModule(enumsModule.Components.CurrentlyPlaying)) else nil
	
	return reactModule.useMemo(function()
		-- upvalues: constantsModule (copy), var9 (ref), p1 (ref), var12 (ref), fFlagProfilePlatformAddCurrentlyPlayingModule (copy), var13 (write), p0 (ref)
		local var14 = constantsModule.AVATAR_HEADSHOT_HEIGHT / 2 + var9.Gap.Large
		local var15 = if p1 then constantsModule.CONTEXTUAL_INFORMATION_HEIGHT + var9.Gap.XXLarge else 0
		local SOCIAL_ROW_HEIGHT = constantsModule.SOCIAL_ROW_HEIGHT
		local CTA_BUTTON_HEIGHT = constantsModule.CTA_BUTTON_HEIGHT
		local var16 = (if var12 ~= 0 then 0 else var9.Gap.XXLarge) + 10
		
		if fFlagProfilePlatformAddCurrentlyPlayingModule then
			var16 += if var13 ~= 0 then 0 else var9.Gap.XXLarge
		end
		return p0 * 0.75 + var14 + var15 + SOCIAL_ROW_HEIGHT + var12 + CTA_BUTTON_HEIGHT + var16 + (if fFlagProfilePlatformAddCurrentlyPlayingModule then var13 else 0)
	end, { p0, p1, var12, var13 or 0 })
end