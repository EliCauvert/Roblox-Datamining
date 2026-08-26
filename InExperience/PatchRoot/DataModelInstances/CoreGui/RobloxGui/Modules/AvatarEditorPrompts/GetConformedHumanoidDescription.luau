local avatarEditorService = game:GetService("AvatarEditorService")
local promiseModule = require(game:GetService("CorePackages").Packages.Promise)
local var1 = nil
local var2 = nil

local function removeDefaultClothing(p1, p2, p3)
	-- upvalues: avatarEditorService (ref)
	local avatarRulesAsync = avatarEditorService:GetAvatarRulesAsync()
	
	if not avatarRulesAsync.DefaultClothingAssetLists then
		p3("No default clothing in avatar rules")
		
		return
	end
	local defaultShirtAssetIds = avatarRulesAsync.DefaultClothingAssetLists.DefaultShirtAssetIds
	local defaultPantAssetIds = avatarRulesAsync.DefaultClothingAssetLists.DefaultPantAssetIds
	
	if not defaultShirtAssetIds or not defaultPantAssetIds then
		p3("No default clothing ids in avatar rules")
		
		return
	end
	local var3 = nil
	
	for i, v in ipairs(defaultShirtAssetIds) do
		if v == p1.Shirt then
			var3 = var3 or p1:Clone()
			var3.Shirt = 0
		end
	end
	for i, v_1 in ipairs(defaultPantAssetIds) do
		if v_1 == p1.Pants then
			var3 = var3 or p1:Clone()
			var3.Pants = 0
		end
	end
	p2(var3 or p1)
end

return function(p4, p5)
	-- upvalues: var1 (write), promiseModule (ref), var2 (write), removeDefaultClothing (ref), avatarEditorService (ref)
	return if p4 == var1 then if p5 then promiseModule.resolve(var2) else promiseModule.new(function(p6, p7)
		-- upvalues: removeDefaultClothing (copy), var2 (copy)
		removeDefaultClothing(var2, p6, p7)
	end) else promiseModule.new(function(p6, p7)
		-- upvalues: avatarEditorService (copy), p4 (ref), var1 (copy), var2 (copy), p5 (ref), removeDefaultClothing (copy)
		coroutine.wrap(function()
			-- upvalues: avatarEditorService (copy), p4 (copy), var1 (copy), var2 (copy), p5 (copy), p6 (ref), removeDefaultClothing (copy), p7 (ref)
			local ok, status = pcall(function()
				-- upvalues: avatarEditorService (copy), p4 (copy)
				return avatarEditorService:ConformToAvatarRulesAsync(p4)
			end)
			
			if not ok then
				p7(status)
				
				return
			end
			var1 = p4
			var2 = status
			
			if p5 then
				p6(status)
				
				return
			end
			removeDefaultClothing(status, p6, p7)
		end)()
	end)
end