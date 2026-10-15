local reactModule = require(script:FindFirstAncestor("Gifting").Parent.React)
local giftAgeCheckViewModule = require(script.Parent.GiftAgeCheckView)
local useGiftAgeCheckViewModelModule = require(script.Parent.useGiftAgeCheckViewModel)

return function(p1)
	-- upvalues: useGiftAgeCheckViewModelModule (ref), reactModule (ref), giftAgeCheckViewModule (ref)
	return reactModule.createElement(giftAgeCheckViewModule, useGiftAgeCheckViewModelModule(p1))
end