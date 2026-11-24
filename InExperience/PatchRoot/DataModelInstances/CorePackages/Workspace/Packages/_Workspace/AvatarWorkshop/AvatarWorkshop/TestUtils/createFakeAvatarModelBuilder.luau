local _ = require(script:FindFirstAncestor("AvatarWorkshop").Components.AvatarPreview.AvatarModelBuilder)

return function()
	local v1 = nil
	
	local function syncWrapLayer(Parent, Humanoid: Humanoid)
		-- upvalues: v1 (ref)
		local FakeLayeredClothing = Parent:FindFirstChild("FakeLayeredClothing")
		
		if FakeLayeredClothing then
			FakeLayeredClothing:Destroy()
		end
		if #Humanoid:GetAccessories(false) > 0 and v1.wrapsLayeredAccessories then
			local FakeLayeredClothing1 = Instance.new("MeshPart")
			FakeLayeredClothing1.Name = "FakeLayeredClothing"
			Instance.new("WrapLayer").Parent = FakeLayeredClothing1
			FakeLayeredClothing1.Parent = Parent
		end
	end
	
	v1 = {
		wrapsLayeredAccessories = true,
		createdModels = {},
		createdDescriptions = {},
		appliedDescriptions = {},
		applyDefaultClothing = function(p1)
			return p1
		end,
		createModel = function(Humanoid, p1)
			-- upvalues: syncWrapLayer (copy), v1 (ref)
			local Model = Instance.new("Model")
			Model.Name = p1.Name
			local HumanoidRootPart = Instance.new("Part")
			HumanoidRootPart.Name = "HumanoidRootPart"
			HumanoidRootPart.Size = vector.create(2, 2, 1)
			HumanoidRootPart.Parent = Model
			Instance.new("Humanoid").Parent = Model
			syncWrapLayer(Model, Humanoid)
			table.insert(v1.createdModels, Model)
			table.insert(v1.createdDescriptions, Humanoid)
			
			return Model
		end,
		applyDescription = function(p1, Humanoid)
			-- upvalues: v1 (ref), syncWrapLayer (copy)
			table.insert(v1.appliedDescriptions, Humanoid)
			local Parent = p1.Parent
			
			if Parent and Parent:IsA("Model") then
				syncWrapLayer(Parent, Humanoid)
			end
		end
	}
	
	return v1
end