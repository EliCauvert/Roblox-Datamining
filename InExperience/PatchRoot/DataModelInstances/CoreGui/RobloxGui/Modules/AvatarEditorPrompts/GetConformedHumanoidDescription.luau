local avatarEditorService = game:GetService("AvatarEditorService")
local promiseModule = require(game:GetService("CorePackages").Packages.Promise)
local var2 = nil
local var3 = nil

local function removeDefaultClothing(p0, p1, p2)
	-- upvalues: avatarEditorService (ref)
	local avatarRulesAsync = avatarEditorService:GetAvatarRulesAsync()
	
	if not avatarRulesAsync.DefaultClothingAssetLists then
		p2("No default clothing in avatar rules")
		
		return
	end
	local defaultShirtAssetIds = avatarRulesAsync.DefaultClothingAssetLists.DefaultShirtAssetIds
	local defaultPantAssetIds = avatarRulesAsync.DefaultClothingAssetLists.DefaultPantAssetIds
	
	if not defaultShirtAssetIds or not defaultPantAssetIds then
		p2("No default clothing ids in avatar rules")
		
		return
	end
	local var6 = nil
	
	for i, v in ipairs(defaultShirtAssetIds) do
		if v == p0.Shirt then
			var6 = var6 or p0:Clone()
			var6.Shirt = 0
		end
	end
	for i, v_1 in ipairs(defaultPantAssetIds) do
		if v_1 == p0.Pants then
			var6 = var6 or p0:Clone()
			var6.Pants = 0
		end
	end
	p1(var6 or p0)
end

return function(p3, p4)
	-- upvalues: var2 (write), promiseModule (ref), var3 (write), removeDefaultClothing (ref), avatarEditorService (ref)
	return if p3 == var2 then if p4 then promiseModule.resolve(var3) else promiseModule.new(function(p7, p8)
		-- upvalues: removeDefaultClothing (copy), var3 (copy)
		removeDefaultClothing(var3, p7, p8)
	end) else promiseModule.new(function(p5, p6)
		-- upvalues: avatarEditorService (copy), p3 (ref), var2 (copy), var3 (copy), p4 (ref), removeDefaultClothing (copy)
		coroutine.wrap(function()
			-- upvalues: avatarEditorService (copy), p3 (copy), var2 (copy), var3 (copy), p4 (copy), p5 (ref), removeDefaultClothing (copy), p6 (ref)
			local ok, status = pcall(function()
				-- upvalues: avatarEditorService (copy), p3 (copy)
				return avatarEditorService:ConformToAvatarRulesAsync(p3)
			end)
			
			if not ok then
				p6(status)
				
				return
			end
			var2 = p3
			var3 = status
			
			if p4 then
				p5(status)
				
				return
			end
			removeDefaultClothing(status, p5, p6)
		end)()
	end)
end