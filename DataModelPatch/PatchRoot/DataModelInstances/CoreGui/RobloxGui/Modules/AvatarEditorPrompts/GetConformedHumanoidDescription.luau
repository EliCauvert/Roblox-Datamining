local AvatarEditorService = game:GetService("AvatarEditorService")
local PromiseModule = require(game:GetService("CorePackages").Packages.Promise)
local HumanoidDescription = nil
local v1 = nil

local function removeDefaultClothing(Object, Callback1: (any) -> (), Callback: (any) -> ())
	-- upvalues: AvatarEditorService (copy)
	local AvatarRulesAsync = if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then AvatarEditorService:GetAvatarRulesAsync() else AvatarEditorService:GetAvatarRules()
	
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

return function(HumanoidDescription1, p1)
	-- upvalues: HumanoidDescription (ref), PromiseModule (copy), v1 (ref), removeDefaultClothing (copy), AvatarEditorService (copy)
	return if HumanoidDescription1 == HumanoidDescription then if p1 then PromiseModule.resolve(v1) else PromiseModule.new(function(p2, p3)
		-- upvalues: removeDefaultClothing (upval), v1 (upval)
		removeDefaultClothing(v1, p2, p3)
	end) else PromiseModule.new(function(Callback, Callback1)
		-- upvalues: AvatarEditorService (upval), HumanoidDescription1 (copy), HumanoidDescription (upval), v1 (upval), p1 (copy), removeDefaultClothing (upval)
		coroutine.wrap(function()
			-- upvalues: AvatarEditorService (upval), HumanoidDescription1 (upval), HumanoidDescription (upval), v1 (upval), p1 (upval), Callback (copy), removeDefaultClothing (upval), Callback1 (copy)
			local Success, Result = pcall(function()
				-- upvalues: AvatarEditorService (upval), HumanoidDescription1 (upval)
				return if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then AvatarEditorService:ConformToAvatarRulesAsync(HumanoidDescription1) else AvatarEditorService:ConformToAvatarRules(HumanoidDescription1)
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