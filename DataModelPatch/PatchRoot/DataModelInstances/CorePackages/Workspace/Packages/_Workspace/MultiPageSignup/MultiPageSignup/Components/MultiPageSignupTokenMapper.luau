local Parent = script:FindFirstAncestor("MultiPageSignup").Parent
local _ = require(Parent.RobloxAppHooks)
local _ = require(Parent.Style)

return function(_, p1)
	return {
		EnterUserIdentifier = { SmallPaddingPx = p1.Size.Size_200 }
	}
end