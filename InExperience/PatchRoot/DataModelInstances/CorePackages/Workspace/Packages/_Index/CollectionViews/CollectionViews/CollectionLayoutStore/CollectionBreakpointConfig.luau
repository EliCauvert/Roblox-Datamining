local collectionViews = script:FindFirstAncestor("CollectionViews")
local _ = require(collectionViews.CollectionViewTypes)
local var1 = if require(collectionViews.Parent.SharedFlags).FFlagLuaAppCompositionLegacyLayout then {
	{
		maxWidth = 475,
		items = {
			XSmall = 3,
			Small = 3,
			Medium = 2,
			Large = 1,
			XLarge = 1
		}
	},
	{
		maxWidth = 587,
		items = {
			XSmall = 4,
			Small = 3,
			Medium = 2,
			Large = 1,
			XLarge = 1
		}
	},
	{
		maxWidth = 679,
		items = {
			XSmall = 5,
			Small = 3,
			Medium = 2,
			Large = 1,
			XLarge = 1
		}
	},
	{
		maxWidth = 711,
		items = {
			XSmall = 5,
			Small = 3,
			Medium = 2,
			Large = 2,
			XLarge = 1
		}
	},
	{
		maxWidth = 743,
		items = {
			XSmall = 5,
			Small = 4,
			Medium = 2,
			Large = 2,
			XLarge = 1
		}
	},
	{
		maxWidth = 859,
		items = {
			XSmall = 6,
			Small = 4,
			Medium = 2,
			Large = 2,
			XLarge = 1
		}
	},
	{
		maxWidth = 893,
		items = {
			XSmall = 7,
			Small = 4,
			Medium = 2,
			Large = 2,
			XLarge = 1
		}
	},
	{
		maxWidth = 975,
		items = {
			XSmall = 7,
			Small = 6,
			Medium = 3,
			Large = 2,
			XLarge = 1
		}
	},
	{
		maxWidth = 995,
		items = {
			XSmall = 8,
			Small = 6,
			Medium = 3,
			Large = 2,
			XLarge = 1
		}
	},
	{
		maxWidth = 1091,
		items = {
			XSmall = 8,
			Small = 6,
			Medium = 3,
			Large = 3,
			XLarge = 1
		}
	},
	{
		maxWidth = 1175,
		items = {
			XSmall = 9,
			Small = 6,
			Medium = 3,
			Large = 3,
			XLarge = 1
		}
	},
	{
		maxWidth = 1207,
		items = {
			XSmall = 9,
			Small = 8,
			Medium = 4,
			Large = 3,
			XLarge = 1
		}
	},
	{
		maxWidth = 1323,
		items = {
			XSmall = 10,
			Small = 8,
			Medium = 4,
			Large = 3,
			XLarge = 1
		}
	},
	{
		maxWidth = 1439,
		items = {
			XSmall = 11,
			Small = 8,
			Medium = 4,
			Large = 4,
			XLarge = 1
		}
	},
	{
		maxWidth = 1457,
		items = {
			XSmall = 12,
			Small = 8,
			Medium = 4,
			Large = 4,
			XLarge = 1
		}
	},
	{
		maxWidth = 1667,
		items = {
			XSmall = 12,
			Small = 10,
			Medium = 5,
			Large = 4,
			XLarge = 1
		}
	},
	{
		maxWidth = 1787,
		items = {
			XSmall = 13,
			Small = 10,
			Medium = 5,
			Large = 4,
			XLarge = 1
		}
	},
	{
		maxWidth = 1847,
		items = {
			XSmall = 14,
			Small = 10,
			Medium = 5,
			Large = 4,
			XLarge = 1
		}
	},
	{
		maxWidth = 1907,
		items = {
			XSmall = 14,
			Small = 12,
			Medium = 6,
			Large = 4,
			XLarge = 1
		}
	},
	{
		maxWidth = 2027,
		items = {
			XSmall = 15,
			Small = 12,
			Medium = 6,
			Large = 4,
			XLarge = 1
		}
	},
	{
		maxWidth = 1e999,
		items = {
			XSmall = 16,
			Small = 12,
			Medium = 6,
			Large = 4,
			XLarge = 1
		}
	}
} else {
	{
		maxWidth = 499,
		items = {
			XSmall = 3,
			Small = 3,
			Medium = 2,
			Large = 1,
			XLarge = 1
		}
	},
	{
		maxWidth = 600,
		items = {
			XSmall = 4,
			Small = 4,
			Medium = 2,
			Large = 1,
			XLarge = 1
		}
	},
	{
		maxWidth = 799,
		items = {
			XSmall = 6,
			Small = 4,
			Medium = 2,
			Large = 2,
			XLarge = 1
		}
	},
	{
		maxWidth = 1140,
		items = {
			XSmall = 9,
			Small = 6,
			Medium = 3,
			Large = 3,
			XLarge = 1
		}
	},
	{
		maxWidth = 1520,
		items = {
			XSmall = 12,
			Small = 8,
			Medium = 4,
			Large = 3,
			XLarge = 1
		}
	},
	{
		maxWidth = 1919,
		items = {
			XSmall = 16,
			Small = 8,
			Medium = 4,
			Large = 4,
			XLarge = 1
		}
	},
	{
		maxWidth = 1e999,
		items = {
			XSmall = 16,
			Small = 10,
			Medium = 5,
			Large = 4,
			XLarge = 1
		}
	}
}

return {
	resolveBreakpoint = function(p0) --[[ line: 53 ]]
		-- upvalues: var1 (ref)
		for i, v in var1 do
			if p0 <= v.maxWidth then
				return i
			end
		end
		return #var1
	end,
	getItemsPerRow = function(p1, p2) --[[ line: 62 ]]
		-- upvalues: var1 (ref)
		local var2 = var1[p1]
		
		return if var2 then var2.items[p2] or 1 else 1
	end
}