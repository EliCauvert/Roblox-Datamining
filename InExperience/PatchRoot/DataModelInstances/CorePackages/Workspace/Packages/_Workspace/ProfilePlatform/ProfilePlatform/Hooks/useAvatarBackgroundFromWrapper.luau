local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local reactModule = require(profilePlatform.Parent.React)
local enumsModule = require(profilePlatform.Common.Enums)
local insertServiceLoadAssetModule = require(profilePlatform.Utils.insertServiceLoadAsset)
local useProfileJsonComponentModule = require(profilePlatform.Hooks.useProfileJsonComponent)

local function _(value)
	if value == nil then
		return nil
	end
	local assetId = value.assetId
	
	if type(assetId) == "number" and assetId > 0 then
		return assetId
	elseif type(assetId) == "string" then
		local var1 = tonumber(assetId)
		
		return if var1 and var1 > 0 then var1 else nil
	end
end

local function findInnerImageId(p1)
	if type(p1) == "table" then
		local imageId = p1.ImageId
		
		if type(imageId) == "table" then
			local value = imageId.Value
			
			return if type(value) == "number" and value > 0 then value else nil
		elseif typeof(p1) ~= "Instance" then
			return nil
		end
		for i, v in ipairs(p1:GetDescendants()) do
			local imageId = v:FindFirstChild("ImageId")
			
			if imageId ~= nil and (imageId:IsA("IntValue") or imageId:IsA("NumberValue")) then
				local value = imageId.Value
				
				if type(value) == "number" and value > 0 then
					return value
				end
			end
		end
		return nil
	end
end

return function()
	-- upvalues: useProfileJsonComponentModule (ref), enumsModule (ref), reactModule (ref), insertServiceLoadAssetModule (ref), findInnerImageId (ref)
	local var1, assetId, var2
	local var3 = useProfileJsonComponentModule(enumsModule.Components.ProfileBackground)
	
	if var3 == nil then
		var1 = nil
	else
		assetId = var3.assetId
		
		if type(assetId) == "number" and assetId > 0 then
			var1 = assetId
		elseif type(assetId) == "string" then
			var2 = tonumber(assetId)
			var1 = if var2 and var2 > 0 then var2 else nil
		end
	end
	assetId, var10 = reactModule.useState(nil)
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), var2 (ref), insertServiceLoadAssetModule (copy), findInnerImageId (copy)
		if var1 == nil then
			var2(nil)
			
			return nil
		end
		local var4 = false
		task.spawn(function()
			-- upvalues: insertServiceLoadAssetModule (copy), var1 (copy), var4 (write), findInnerImageId (copy), var2 (copy)
			local ok, status = pcall(function()
				-- upvalues: insertServiceLoadAssetModule (copy), var1 (copy)
				return insertServiceLoadAssetModule(var1)
			end)
			
			if not ok or var4 or status == nil then return end
			local var5 = findInnerImageId(status)
			
			if var4 then return end
			if var5 == nil then
				var2(nil)
				
				return
			end
			var2("rbxassetid://" .. tostring(var5))
		end)
		
		return function()
			-- upvalues: var4 (write)
			var4 = true
		end
	end, { var1, var2 })
	
	return assetId
end