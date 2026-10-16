local AvatarEditorService = game:GetService("AvatarEditorService")
local PromiseModule = require(game:GetService("CorePackages").Packages.Promise)
local HumanoidDescription = nil
local v1 = nil

local function removeDefaultClothing(Object, Callback1: (any) -> (), Callback: (any) -> ()) --[[ Line: 14 ]]
	-- upvalues: AvatarEditorService (copy)
	local AvatarRulesAsync = AvatarEditorService:GetAvatarRulesAsync()
	
	if not AvatarRulesAsync.DefaultClothingAssetLists then
		Callback("No default clothing in avatar rules")
		
		return
	end
	local DefaultShirtAssetIds = AvatarRulesAsync.DefaultClothingAssetLists.DefaultShirtAssetIds
	local DefaultPantAssetIds = AvatarRulesAsync.DefaultClothingAssetLists.DefaultPantAssetIds
	
	if not DefaultShirtAssetIds or not DefaultPantAssetIds then
		Callback("No default clothing ids in avatar rules")
		
		return
	end
	local v2 = nil
	
	for _, defaultShirtAssetId in ipairs(DefaultShirtAssetIds) do
		if defaultShirtAssetId == Object.Shirt then
			v2 = v2 or Object:Clone()
			v2.Shirt = 0
		end
	end
	for _, defaultPantAssetId in ipairs(DefaultPantAssetIds) do
		if defaultPantAssetId == Object.Pants then
			v2 = v2 or Object:Clone()
			v2.Pants = 0
		end
	end
	Callback1(v2 or Object)
end

return function(HumanoidDescription1, p1) --[[ Line: 48 | Named "GetConformedHumanoidDescription" ]]
	-- upvalues: HumanoidDescription (ref), PromiseModule (copy), v1 (ref), removeDefaultClothing (copy), AvatarEditorService (copy)
	return if HumanoidDescription1 == HumanoidDescription then if p1 then PromiseModule.resolve(v1) else PromiseModule.new(function(p2, p3) --[[ Line: 53 ]]
		-- upvalues: removeDefaultClothing (upval), v1 (upval)
		removeDefaultClothing(v1, p2, p3)
	end) else PromiseModule.new(function(Callback, Callback1) --[[ Line: 59 ]]
		-- upvalues: AvatarEditorService (upval), HumanoidDescription1 (copy), HumanoidDescription (upval), v1 (upval), p1 (copy), removeDefaultClothing (upval)
		coroutine.wrap(function() --[[ Line: 60 ]]
			-- upvalues: AvatarEditorService (upval), HumanoidDescription1 (upval), HumanoidDescription (upval), v1 (upval), p1 (upval), Callback (copy), removeDefaultClothing (upval), Callback1 (copy)
			local Success, Result = pcall(function() --[[ Line: 61 ]]
				-- upvalues: AvatarEditorService (upval), HumanoidDescription1 (upval)
				return AvatarEditorService:ConformToAvatarRulesAsync(HumanoidDescription1)
			end)
			
			if not Success then
				Callback1(Result)
				
				return
			end
			HumanoidDescription = HumanoidDescription1
			v1 = Result
			
			if p1 then
				Callback(Result)
				
				return
			else
				removeDefaultClothing(Result, Callback, Callback1)
			end
		end)()
	end)
end