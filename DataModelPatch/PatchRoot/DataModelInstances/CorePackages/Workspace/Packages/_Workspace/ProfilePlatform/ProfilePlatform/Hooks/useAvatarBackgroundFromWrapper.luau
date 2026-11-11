local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local ReactModule = require(ProfilePlatform.Parent.React)
local EnumsModule = require(ProfilePlatform.Common.Enums)
local InsertServiceLoadAssetModule = require(ProfilePlatform.Utils.insertServiceLoadAsset)
local UseProfileJsonComponentModule = require(ProfilePlatform.Hooks.useProfileJsonComponent)

local function _(p1): number?
	if p1 == nil then
		return nil
	end
	local AssetId: number = p1.assetId
	
	if type(AssetId) == "number" and AssetId > 0 then
		return AssetId
	end
	if type(AssetId) == "string" then
		local Number: number? = tonumber(AssetId)
		
		if Number and Number > 0 then
			return Number
		end
	end
	return nil
end

local function findInnerImageId(Object): number?
	if type(Object) == "table" then
		local ImageId = Object.ImageId
		
		if type(ImageId) == "table" then
			local Value: number = ImageId.Value
			
			if type(Value) == "number" and Value > 0 then
				return Value
			end
		end
		return nil
	else
		if typeof(Object) ~= "Instance" then
			return nil
		end
		local Value = nil
		for _, descendant in ipairs(Object:GetDescendants()) do
			local ImageId = descendant:FindFirstChild("ImageId")
			
			if ImageId ~= nil and (ImageId:IsA("IntValue") or ImageId:IsA("NumberValue")) then
				Value = ImageId.Value
				
				if type(Value) == "number" and Value > 0 then
					return Value
				end
			end
		end
		return nil
	end
end

return function()
	-- upvalues: UseProfileJsonComponentModule (copy), EnumsModule (copy), ReactModule (copy), InsertServiceLoadAssetModule (copy), findInnerImageId (copy)
	local UseProfileJsonComponentModuleResult = UseProfileJsonComponentModule(EnumsModule.Components.ProfileBackground)
	local v1 = nil
	repeat
		if UseProfileJsonComponentModuleResult == nil then
			v1 = nil
			break
		end
		local AssetId: number = UseProfileJsonComponentModuleResult.assetId
		
		if type(AssetId) == "number" and AssetId > 0 then
			v1 = AssetId
			break
		end
		if type(AssetId) == "string" then
			local Number: number? = tonumber(AssetId)
			
			if Number and Number > 0 then
				v1 = Number
				break
			end
		end
		v1 = nil
	until true
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	ReactModule.useEffect(function()
		-- upvalues: v1 (copy), UseStateResult2 (copy), InsertServiceLoadAssetModule (upval), findInnerImageId (upval)
		if v1 == nil then
			UseStateResult2(nil)
			
			return nil
		else
			local Flag = false
			task.spawn(function()
				-- upvalues: InsertServiceLoadAssetModule (upval), v1 (upval), Flag (ref), findInnerImageId (upval), UseStateResult2 (upval)
				local Success, Result = pcall(function()
					-- upvalues: InsertServiceLoadAssetModule (upval), v1 (upval)
					return InsertServiceLoadAssetModule(v1)
				end)
				
				if not Success or Flag or Result == nil then return end
				local InnerImageId = findInnerImageId(Result)
				
				if Flag then return end
				if InnerImageId == nil then
					UseStateResult2(nil)
					
					return
				else
					UseStateResult2("rbxassetid://" .. tostring(InnerImageId))
				end
			end)
			
			return function()
				-- upvalues: Flag (ref)
				Flag = true
			end
		end
	end, { v1, UseStateResult2 })
	
	return UseStateResult
end