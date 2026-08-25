local insertService = game:GetService("InsertService")
local promiseModule = require(script:FindFirstAncestor("AvatarExperienceCommon").Parent.Promise)
local _ = require(script.Parent.types)

return {
	create = function(value)
		-- upvalues: promiseModule (ref)
		return function(p0)
			-- upvalues: promiseModule (copy), value (ref)
			return promiseModule.new(function(p1, p2)
				-- upvalues: value (copy), p0 (ref)
				task.spawn(function()
					-- upvalues: value (copy), p0 (copy), p2 (ref), p1 (ref)
					local ok, status = pcall(function()
						-- upvalues: value (copy), p0 (copy)
						return value:LoadAsset(p0)
					end)
					
					if not ok or not status then
						return p2(`loadAsset failed for asset {p0}: {tostring(status)}`)
					end
					local avatarBackground = status:FindFirstChild("AvatarBackground")
					local imageId = avatarBackground and avatarBackground:FindFirstChild("ImageId")
					local color = avatarBackground and avatarBackground:FindFirstChild("Color")
					
					if avatarBackground and imageId and color then
						local value_1 = imageId.Value
						local value_2 = color.Value
						status:Destroy()
						
						return p1({ imageId = value_1, backgroundColor = value_2 })
					end
					status:Destroy()
					
					return p2(`asset {p0} missing AvatarBackground/ImageId/Color`)
				end)
			end)
		end
	end,
	default = function(p3)
		-- upvalues: promiseModule (ref), insertService (ref)
		return promiseModule.new(function(p4, p5)
			-- upvalues: insertService (copy), p3 (ref)
			task.spawn(function()
				-- upvalues: insertService (copy), p3 (copy), p5 (ref), p4 (ref)
				local ok, status = pcall(function()
					-- upvalues: insertService (copy), p3 (copy)
					return insertService:LoadAsset(p3)
				end)
				
				if not ok or not status then
					return p5(`loadAsset failed for asset {p3}: {tostring(status)}`)
				end
				local avatarBackground = status:FindFirstChild("AvatarBackground")
				local imageId = avatarBackground and avatarBackground:FindFirstChild("ImageId")
				local color = avatarBackground and avatarBackground:FindFirstChild("Color")
				
				if avatarBackground and imageId and color then
					local value_1 = imageId.Value
					local value_2 = color.Value
					status:Destroy()
					
					return p4({ imageId = value_1, backgroundColor = value_2 })
				end
				status:Destroy()
				
				return p5(`asset {p3} missing AvatarBackground/ImageId/Color`)
			end)
		end)
	end
}