local InsertService = game:GetService("InsertService")
local PromiseModule = require(script:FindFirstAncestor("AvatarExperienceCommon").Parent.Promise)
local _ = require(script.Parent.types)

return {
	create = function(InsertService) --[[ Line: 19 ]]
		-- upvalues: PromiseModule (copy)
		return function(AssetId) --[[ Line: 20 ]]
			-- upvalues: PromiseModule (upval), InsertService (copy)
			return PromiseModule.new(function(Callback1, Callback) --[[ Line: 21 ]]
				-- upvalues: InsertService (upval), AssetId (copy)
				task.spawn(function() --[[ Line: 22 ]]
					-- upvalues: InsertService (upval), AssetId (upval), Callback (copy), Callback1 (copy)
					local Success, Result = pcall(function() --[[ Line: 23 ]]
						-- upvalues: InsertService (upval), AssetId (upval)
						return InsertService:LoadAsset(AssetId)
					end)
					
					if not Success or not Result then
						return Callback(`loadAsset failed for asset {AssetId}: {tostring(Result)}`)
					end
					local AvatarBackground = Result:FindFirstChild("AvatarBackground")
					local ImageId = AvatarBackground and AvatarBackground:FindFirstChild("ImageId")
					local Color = AvatarBackground and AvatarBackground:FindFirstChild("Color")
					
					if AvatarBackground and ImageId and Color then
						local Value = ImageId.Value
						local Value1 = Color.Value
						Result:Destroy()
						
						return Callback1({ imageId = Value, backgroundColor = Value1 })
					else
						Result:Destroy()
						
						return Callback(`asset {AssetId} missing AvatarBackground/ImageId/Color`)
					end
				end)
			end)
		end
	end,
	default = function(AssetId) --[[ Line: 20 ]]
		-- upvalues: PromiseModule (copy), InsertService (copy)
		return PromiseModule.new(function(Callback1, Callback) --[[ Line: 21 ]]
			-- upvalues: InsertService (upval), AssetId (copy)
			task.spawn(function() --[[ Line: 22 ]]
				-- upvalues: InsertService (upval), AssetId (upval), Callback (copy), Callback1 (copy)
				local Success, Result = pcall(function() --[[ Line: 23 ]]
					-- upvalues: InsertService (upval), AssetId (upval)
					return InsertService:LoadAsset(AssetId)
				end)
				
				if not Success or not Result then
					return Callback(`loadAsset failed for asset {AssetId}: {tostring(Result)}`)
				end
				local AvatarBackground = Result:FindFirstChild("AvatarBackground")
				local ImageId = AvatarBackground and AvatarBackground:FindFirstChild("ImageId")
				local Color = AvatarBackground and AvatarBackground:FindFirstChild("Color")
				
				if AvatarBackground and ImageId and Color then
					local Value = ImageId.Value
					local Value1 = Color.Value
					Result:Destroy()
					
					return Callback1({ imageId = Value, backgroundColor = Value1 })
				else
					Result:Destroy()
					
					return Callback(`asset {AssetId} missing AvatarBackground/ImageId/Color`)
				end
			end)
		end)
	end
}