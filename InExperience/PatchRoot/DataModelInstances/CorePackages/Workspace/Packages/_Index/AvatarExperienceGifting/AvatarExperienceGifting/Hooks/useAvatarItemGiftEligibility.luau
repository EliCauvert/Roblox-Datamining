local avatarExperienceGifting = script:FindFirstAncestor("AvatarExperienceGifting")
local parent = avatarExperienceGifting.Parent
local reactModule = require(parent.React)
local buildGiftItemModule = require(avatarExperienceGifting.Utils.buildGiftItem)
local useGiftEligibility = require(parent.Gifting).Hooks.useGiftEligibility

return function(p1, p2)
	-- upvalues: reactModule (ref), buildGiftItemModule (ref), useGiftEligibility (ref)
	return useGiftEligibility(reactModule.useMemo(function()
		-- upvalues: buildGiftItemModule (copy), p1 (ref)
		local var1 = buildGiftItemModule(p1)
		
		return if var1 == nil then nil else { var1 }
	end, { p1 }), p2)
end