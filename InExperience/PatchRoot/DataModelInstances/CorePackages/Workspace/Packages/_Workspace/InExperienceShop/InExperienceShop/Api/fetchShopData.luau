local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local _ = require(inExperienceShop.Parent.Promise)
local mockShopDataModule = require(inExperienceShop.Mocks.MockShopData)
local _ = require(inExperienceShop.Types)

return function() --[[ line: 12 | named "fetchShopData" ]]
	-- upvalues: mockShopDataModule (ref)
	return mockShopDataModule.getShopData()
end