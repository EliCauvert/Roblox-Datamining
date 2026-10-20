local AvatarExperienceGifting = script:FindFirstAncestor("AvatarExperienceGifting")
local Parent = AvatarExperienceGifting.Parent
local ReactModule = require(Parent.React)
local BuildGiftItemModule = require(AvatarExperienceGifting.Utils.buildGiftItem)
local UseGiftEligibilityFunction = require(Parent.Gifting).Hooks.useGiftEligibility

return function(p1, p2)
	-- upvalues: ReactModule (copy), BuildGiftItemModule (copy), UseGiftEligibilityFunction (copy)
	return UseGiftEligibilityFunction(ReactModule.useMemo(function()
		-- upvalues: BuildGiftItemModule (upval), p1 (copy)
		local GiftItemModule = BuildGiftItemModule(p1)
		
		return if GiftItemModule == nil then nil else { GiftItemModule }
	end, { p1 }), p2)
end