local ItemTypeModule = { Invalid = "Invalid", CollectibleItem = "CollectibleItem" }
local t = {}

for _, value in pairs(ItemTypeModule) do
	t[value] = true
end
function ItemTypeModule.fromValue(p1) --[[ Line: 13 ]]
	-- upvalues: t (copy)
	return if p1 == nil or not t[p1] then nil else p1
end

return ItemTypeModule