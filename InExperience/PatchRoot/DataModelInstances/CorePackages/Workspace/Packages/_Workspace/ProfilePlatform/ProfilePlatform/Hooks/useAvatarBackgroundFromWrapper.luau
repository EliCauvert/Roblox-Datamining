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
		local var6 = tonumber(assetId)
		
		return if var6 and var6 > 0 then var6 else nil
	end
end

local function findInnerImageId(p0)
	if type(p0) == "table" then
		local imageId = p0.ImageId
		
		if type(imageId) == "table" then
			local value = imageId.Value
			
			return if type(value) == "number" and value > 0 then value else nil
		elseif typeof(p0) ~= "Instance" then
			return nil
		end
		for i, v in ipairs(p0:GetDescendants()) do
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
	local var9, assetId, var10
	local var8 = useProfileJsonComponentModule(enumsModule.Components.ProfileBackground)
	
	if var8 == nil then
		var9 = nil
	else
		assetId = var8.assetId
		
		if type(assetId) == "number" and assetId > 0 then
			var9 = assetId
		elseif type(assetId) == "string" then
			var10 = tonumber(assetId)
			var9 = if var10 and var10 > 0 then var10 else nil
		end
	end
	assetId, var10 = reactModule.useState(nil)
	reactModule.useEffect(function()
		-- upvalues: var9 (ref), var10 (ref), insertServiceLoadAssetModule (copy), findInnerImageId (copy)
		if var9 == nil then
			var10(nil)
			
			return nil
		end
		local var11 = false
		task.spawn(function()
			-- upvalues: insertServiceLoadAssetModule (copy), var9 (copy), var11 (write), findInnerImageId (copy), var10 (copy)
			local ok, status = pcall(function()
				-- upvalues: insertServiceLoadAssetModule (copy), var9 (copy)
				return insertServiceLoadAssetModule(var9)
			end)
			
			if not ok or var11 or status == nil then return end
			local var12 = findInnerImageId(status)
			
			if var11 then return end
			if var12 == nil then
				var10(nil)
				
				return
			end
			var10("rbxassetid://" .. tostring(var12))
		end)
		
		return function()
			-- upvalues: var11 (write)
			var11 = true
		end
	end, { var9, var10 })
	
	return assetId
end