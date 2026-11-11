local CoreGui = game:GetService("CoreGui")

local function _(Parent, ChildName)
	local ChildName1 = Parent:FindFirstChild(ChildName)
	
	if ChildName1 and ChildName1:IsA("Folder") then
		return ChildName1
	else
		local Folder = Instance.new("Folder")
		Folder.Name = ChildName
		Folder.Parent = Parent
		
		return Folder
	end
end

return function(ChildName, p1)
	-- upvalues: CoreGui (copy)
	local P3 = p1 or CoreGui
	local MomentMedia = P3:FindFirstChild("MomentMedia")
	local Folder = nil
	
	if MomentMedia and MomentMedia:IsA("Folder") then
		Folder = MomentMedia
	else
		local MomentMedia1 = Instance.new("Folder")
		MomentMedia1.Name = "MomentMedia"
		MomentMedia1.Parent = P3
		Folder = MomentMedia1
	end
	local ChildName1 = Folder:FindFirstChild(ChildName)
	local Folder2 = nil
	
	if ChildName1 and ChildName1:IsA("Folder") then
		Folder2 = ChildName1
	else
		local Folder1 = Instance.new("Folder")
		Folder1.Name = ChildName
		Folder1.Parent = Folder
		Folder2 = Folder1
	end
	return {
		folder = Folder2,
		dispose = function()
			-- upvalues: Folder2 (copy), Folder (copy)
			Folder2:Destroy()
			
			if #Folder:GetChildren() == 0 then
				Folder:Destroy()
			end
		end
	}
end