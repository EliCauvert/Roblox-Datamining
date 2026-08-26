local insertService = game:GetService("InsertService")
local promiseModule = require(script:FindFirstAncestor("AvatarExperienceCommon").Parent.Promise)
local _ = require(script.Parent.types)

return {
	create = function(value)
		-- upvalues: promiseModule (ref)
		return function(p1)
			-- upvalues: promiseModule (copy), value (ref)
			return promiseModule.new(function(p2, p3)
				-- upvalues: value (copy), p1 (ref)
				task.spawn(function()
					-- upvalues: value (copy), p1 (copy), p3 (ref), p2 (ref)
					local ok, status = pcall(function()
						-- upvalues: value (copy), p1 (copy)
						return value:LoadAsset(p1)
					end)
					
					if not ok or not status then
						return p3(`loadAsset failed for asset {p1}: {tostring(status)}`)
					end
					local avatarBackground = status:FindFirstChild("AvatarBackground")
					local imageId = avatarBackground and avatarBackground:FindFirstChild("ImageId")
					local color = avatarBackground and avatarBackground:FindFirstChild("Color")
					
					if avatarBackground and imageId and color then
						local value_1 = imageId.Value
						local value_2 = color.Value
						status:Destroy()
						
						return p2({ imageId = value_1, backgroundColor = value_2 })
					end
					status:Destroy()
					
					return p3(`asset {p1} missing AvatarBackground/ImageId/Color`)
				end)
			end)
		end
	end,
	default = function(p1)
		-- upvalues: promiseModule (ref), insertService (ref)
		return promiseModule.new(function(p2, p3)
			-- upvalues: insertService (copy), p1 (ref)
			task.spawn(function()
				-- upvalues: insertService (copy), p1 (copy), p3 (ref), p2 (ref)
				local ok, status = pcall(function()
					-- upvalues: insertService (copy), p1 (copy)
					return insertService:LoadAsset(p1)
				end)
				
				if not ok or not status then
					return p3(`loadAsset failed for asset {p1}: {tostring(status)}`)
				end
				local avatarBackground = status:FindFirstChild("AvatarBackground")
				local imageId = avatarBackground and avatarBackground:FindFirstChild("ImageId")
				local color = avatarBackground and avatarBackground:FindFirstChild("Color")
				
				if avatarBackground and imageId and color then
					local value_1 = imageId.Value
					local value_2 = color.Value
					status:Destroy()
					
					return p2({ imageId = value_1, backgroundColor = value_2 })
				end
				status:Destroy()
				
				return p3(`asset {p1} missing AvatarBackground/ImageId/Color`)
			end)
		end)
	end
}