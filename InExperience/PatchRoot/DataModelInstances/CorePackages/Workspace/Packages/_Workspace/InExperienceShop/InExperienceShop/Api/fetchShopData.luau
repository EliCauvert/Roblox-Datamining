local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local _ = require(inExperienceShop.Parent.Promise)
local mockShopDataModule = require(inExperienceShop.Mocks.MockShopData)
local _ = require(inExperienceShop.Types)

return function()
	-- upvalues: mockShopDataModule (ref)
	return mockShopDataModule.getShopData()
end