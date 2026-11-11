local InExperienceShop = script:FindFirstAncestor("InExperienceShop")

return require(InExperienceShop.Parent.Signals).createComputed((require(InExperienceShop.Stores.createInExperienceShopStore)))