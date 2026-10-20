local ReactModule = require(script:FindFirstAncestor("Gifting").Parent.React)
local GiftAgeCheckViewModule = require(script.Parent.GiftAgeCheckView)
local UseGiftAgeCheckViewModelModule = require(script.Parent.useGiftAgeCheckViewModel)

return function(p1)
	-- upvalues: UseGiftAgeCheckViewModelModule (copy), ReactModule (copy), GiftAgeCheckViewModule (copy)
	return ReactModule.createElement(GiftAgeCheckViewModule, (UseGiftAgeCheckViewModelModule(p1)))
end