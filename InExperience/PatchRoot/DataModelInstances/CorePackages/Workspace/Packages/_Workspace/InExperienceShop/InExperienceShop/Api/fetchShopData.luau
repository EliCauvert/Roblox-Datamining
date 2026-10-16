local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local _ = require(InExperienceShop.Parent.Promise)
local MockShopDataModule = require(InExperienceShop.Mocks.MockShopData)
local _ = require(InExperienceShop.Types)

return function() --[[ Line: 12 | Named "fetchShopData" ]]
	-- upvalues: MockShopDataModule (copy)
	return MockShopDataModule.getShopData()
end