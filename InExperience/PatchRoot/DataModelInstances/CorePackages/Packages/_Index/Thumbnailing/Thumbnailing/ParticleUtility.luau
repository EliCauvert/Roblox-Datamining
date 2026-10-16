local ParticleUtilityModule = {
	InstanceIsAParticleEffect = function(Object) --[[ Line: 10 ]]
		return Object:IsA("ParticleEmitter") or (Object:IsA("Fire") or (Object:IsA("Smoke") or Object:IsA("Sparkles")))
	end
}

local function recurFastForwardParticles(Object) --[[ Line: 14 ]]
	-- upvalues: ParticleUtilityModule (copy), recurFastForwardParticles (copy)
	if ParticleUtilityModule.InstanceIsAParticleEffect(Object) then
		Object:FastForward(240)
	end
	for _, child in Object:GetChildren() do
		recurFastForwardParticles(child)
	end
end

function ParticleUtilityModule.FastForwardParticles(p1) --[[ Line: 25 ]]
	-- upvalues: recurFastForwardParticles (copy)
	recurFastForwardParticles(p1)
end

local function findNearestBasePart(p1) --[[ Line: 30 ]]
	local Parent = p1.Parent
	local PrimaryPart = nil
	local Handle = nil
	while Parent do
		if Parent:IsA("BasePart") then
			return Parent
		end
		if Parent:IsA("Tool") then
			Handle = Parent:FindFirstChild("Handle")
			
			if Handle and Handle:IsA("BasePart") then
				return Handle
			end
		end
		if Parent:IsA("Model") then
			PrimaryPart = Parent.PrimaryPart
			
			if PrimaryPart then
				return PrimaryPart
			end
		end
		Parent = Parent.Parent
	end
	return nil
end

local function recurReparentOrphanedEffects(Object) --[[ Line: 60 ]]
	-- upvalues: ParticleUtilityModule (copy), findNearestBasePart (copy), recurReparentOrphanedEffects (copy)
	if ParticleUtilityModule.InstanceIsAParticleEffect(Object) then
		local Parent = Object.Parent
		
		if Parent and not Parent:IsA("BasePart") and not Parent:IsA("Attachment") then
			local NearestBasePart = findNearestBasePart(Object)
			
			if NearestBasePart then
				Object.Parent = NearestBasePart
			end
		end
		return
	else
		for _, child in Object:GetChildren() do
			recurReparentOrphanedEffects(child)
		end
	end
end

function ParticleUtilityModule.ReparentOrphanedParticleEffects(p2) --[[ Line: 77 ]]
	-- upvalues: recurReparentOrphanedEffects (copy)
	recurReparentOrphanedEffects(p2)
end

return ParticleUtilityModule