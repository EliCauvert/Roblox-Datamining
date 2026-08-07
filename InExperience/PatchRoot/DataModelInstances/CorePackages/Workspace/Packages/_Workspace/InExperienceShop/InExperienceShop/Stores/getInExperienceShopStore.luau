local inExperienceShop = script:FindFirstAncestor("InExperienceShop")

return require(inExperienceShop.Parent.Signals).createComputed(require(inExperienceShop.Stores.createInExperienceShopStore))