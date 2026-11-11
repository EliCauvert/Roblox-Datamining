local ConstantsModule = require(script.Parent.Parent.Constants)

return {
	fixUploadInstance = function(Object)
		-- upvalues: ConstantsModule (copy)
		local HumanoidRigDescription = Object:FindFirstChildWhichIsA("HumanoidRigDescription")
		
		if not HumanoidRigDescription then return end
		for _, r15BODYPART in ConstantsModule.R15_BODY_PARTS do
			local Child = Object:FindFirstChild(r15BODYPART)
			
			if Child then
				local HumanoidRigDescription1 = Child:FindFirstChildWhichIsA("HumanoidRigDescription")
				local HumanoidRigDescription2 = nil
				
				if HumanoidRigDescription1 == nil then
					HumanoidRigDescription2 = Instance.new("HumanoidRigDescription")
					HumanoidRigDescription2.Parent = Child
				else
					HumanoidRigDescription2 = HumanoidRigDescription1
				end
				if Child.Name == "LowerTorso" then
					HumanoidRigDescription2.OriginOffset = HumanoidRigDescription.OriginOffset
				end
				for _, containedJointLabel in HumanoidRigDescription2:GetContainedJointLabels(r15BODYPART) do
					local Joint = HumanoidRigDescription:GetJoint(containedJointLabel)
					
					if Joint then
						if Joint:IsA("AnimationConstraint") then
							if not Joint.Attachment0 or not Joint.Attachment0:IsDescendantOf(Child) then
								if Joint.Attachment1 and Joint.Attachment1:IsDescendantOf(Child) then
									HumanoidRigDescription2:SetJoint(containedJointLabel, Joint.Attachment1)
								else
									continue
								end
							else
								HumanoidRigDescription2:SetJoint(containedJointLabel, Joint.Attachment0)
							end
						else
							HumanoidRigDescription2:SetJoint(containedJointLabel, Joint)
						end
						HumanoidRigDescription2:SetTposeAdjustment(containedJointLabel, HumanoidRigDescription:GetTposeAdjustment(containedJointLabel))
						HumanoidRigDescription2:SetJointSize(containedJointLabel, HumanoidRigDescription:GetJointSize(containedJointLabel))
						HumanoidRigDescription2:SetJointRangeMin(containedJointLabel, HumanoidRigDescription:GetJointRangeMin(containedJointLabel))
						HumanoidRigDescription2:SetJointRangeMax(containedJointLabel, HumanoidRigDescription:GetJointRangeMax(containedJointLabel))
					end
				end
			end
		end
		local LeftHand = Object:FindFirstChild("LeftHand")
		local RightHand = Object:FindFirstChild("RightHand")
		
		for _, DigitsRigDescription in HumanoidRigDescription:GetChildren() do
			if DigitsRigDescription:IsA("DigitsRigDescription") then
				if DigitsRigDescription.Side == Enum.DigitsRigDescriptionSide.Left and LeftHand then
					DigitsRigDescription:Clone().Parent = LeftHand
				elseif DigitsRigDescription.Side == Enum.DigitsRigDescriptionSide.Right and RightHand then
					DigitsRigDescription:Clone().Parent = RightHand
				end
			end
		end
	end
}