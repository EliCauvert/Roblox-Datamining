local coreGuiService = game:GetService("CoreGui")

local function _(p0, p1)
	local var1 = p0:FindFirstChild(p1)
	
	if var1 and var1:IsA("Folder") then
		return var1
	end
	local folder = Instance.new("Folder")
	folder.Name = p1
	folder.Parent = p0
	
	return folder
end

return function(p2, p3)
	-- upvalues: coreGuiService (ref)
	local var6
	p3 = p3 or coreGuiService
	local momentMedia = p3:FindFirstChild("MomentMedia")
	
	if momentMedia and momentMedia:IsA("Folder") then
		var6 = momentMedia
	else
		local momentMedia_1 = Instance.new("Folder")
		momentMedia_1.Name = "MomentMedia"
		momentMedia_1.Parent = p3
		var6 = momentMedia_1
	end
	local var7 = var6:FindFirstChild(p2)
	
	if var7 and var7:IsA("Folder") then
		momentMedia = var7
	else
		local folder = Instance.new("Folder")
		folder.Name = p2
		folder.Parent = var6
		momentMedia = folder
	end
	return {
		folder = momentMedia,
		dispose = function()
			-- upvalues: momentMedia (ref), var6 (ref)
			momentMedia:Destroy()
			
			if #var6:GetChildren() == 0 then
				var6:Destroy()
			end
		end
	}
end