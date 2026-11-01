local Parent = script:FindFirstAncestor("InExperienceShop").Parent

return game:DefineFastFlag("EnableFreeTrialShopMenuBadge", false) and (require(script.Parent.FFlagLuaAppEnableGamePassFreeTrials) and require(Parent.SharedFlags).FFlagEnableCustomTextInMenuTrailingBadge)