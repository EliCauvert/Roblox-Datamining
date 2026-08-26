local coreGuiService = game:GetService("CoreGui")

local function _(p1, p2)
	local var1 = p1:FindFirstChild(p2)
	
	if var1 and var1:IsA("Folder") then
		return var1
	end
	local folder = Instance.new("Folder")
	folder.Name = p2
	folder.Parent = p1
	
	return folder
end

return function(p1, p2)
	-- upvalues: coreGuiService (ref)
	local var1
	p2 = p2 or coreGuiService
	local momentMedia = p2:FindFirstChild("MomentMedia")
	
	if momentMedia and momentMedia:IsA("Folder") then
		var1 = momentMedia
	else
		local momentMedia_1 = Instance.new("Folder")
		momentMedia_1.Name = "MomentMedia"
		momentMedia_1.Parent = p2
		var1 = momentMedia_1
	end
	local var2 = var1:FindFirstChild(p1)
	
	if var2 and var2:IsA("Folder") then
		momentMedia = var2
	else
		local folder = Instance.new("Folder")
		folder.Name = p1
		folder.Parent = var1
		momentMedia = folder
	end
	return {
		folder = momentMedia,
		dispose = function()
			-- upvalues: momentMedia (ref), var1 (ref)
			momentMedia:Destroy()
			
			if #var1:GetChildren() == 0 then
				var1:Destroy()
			end
		end
	}
end