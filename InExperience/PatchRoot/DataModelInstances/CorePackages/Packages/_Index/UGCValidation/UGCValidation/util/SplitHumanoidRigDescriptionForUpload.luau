local constantsModule = require(script.Parent.Parent.Constants)

return {
	fixUploadInstance = function(p1)
		-- upvalues: constantsModule (ref)
		local humanoidRigDescription = p1:FindFirstChildWhichIsA("HumanoidRigDescription")
		
		if not humanoidRigDescription then return end
		for i, v in constantsModule.R15_BODY_PARTS do
			local i_1 = p1:FindFirstChild(v)
			
			if i_1 then
				local humanoidRigDescription_2
				local _ = nil
				local humanoidRigDescription_1 = i_1:FindFirstChildWhichIsA("HumanoidRigDescription")
				
				if humanoidRigDescription_1 == nil then
					humanoidRigDescription_2 = Instance.new("HumanoidRigDescription")
					humanoidRigDescription_2.Parent = i_1
				else
					humanoidRigDescription_2 = humanoidRigDescription_1
				end
				if i_1.Name == "LowerTorso" then
					humanoidRigDescription_2.OriginOffset = humanoidRigDescription.OriginOffset
				end
				for i_2, v_1 in humanoidRigDescription_2:GetContainedJointLabels(v) do
					local var1 = humanoidRigDescription:GetJoint(v_1)
					
					if var1 then
						if var1:IsA("AnimationConstraint") then
							if var1.Attachment0 and var1.Attachment0:IsDescendantOf(i_1) then
								humanoidRigDescription_2:SetJoint(v_1, var1.Attachment0)
							elseif var1.Attachment1 and var1.Attachment1:IsDescendantOf(i_1) then
								humanoidRigDescription_2:SetJoint(v_1, var1.Attachment1)
							end
						else
							humanoidRigDescription_2:SetJoint(v_1, var1)
						end
						humanoidRigDescription_2:SetTposeAdjustment(v_1, humanoidRigDescription:GetTposeAdjustment(v_1))
						humanoidRigDescription_2:SetJointSize(v_1, humanoidRigDescription:GetJointSize(v_1))
						humanoidRigDescription_2:SetJointRangeMin(v_1, humanoidRigDescription:GetJointRangeMin(v_1))
						humanoidRigDescription_2:SetJointRangeMax(v_1, humanoidRigDescription:GetJointRangeMax(v_1))
					end
				end
			end
		end
		local leftHand = p1:FindFirstChild("LeftHand")
		local rightHand = p1:FindFirstChild("RightHand")
		
		for i_1, v_1 in humanoidRigDescription:GetChildren() do
			if v_1:IsA("DigitsRigDescription") then
				if v_1.Side == Enum.DigitsRigDescriptionSide.Left and leftHand then
					v_1:Clone().Parent = leftHand
				elseif v_1.Side == Enum.DigitsRigDescriptionSide.Right and rightHand then
					v_1:Clone().Parent = rightHand
				end
			end
		end
	end
}