local t = {
	InstanceIsAParticleEffect = function(p1)
		return p1:IsA("ParticleEmitter") or (p1:IsA("Fire") or (p1:IsA("Smoke") or p1:IsA("Sparkles")))
	end
}

local function recurFastForwardParticles(p1)
	-- upvalues: t (ref), recurFastForwardParticles (ref)
	if t.InstanceIsAParticleEffect(p1) then
		p1:FastForward(240)
	end
	for i, v in p1:GetChildren() do
		recurFastForwardParticles(v)
	end
end

function t.FastForwardParticles(p2)
	-- upvalues: recurFastForwardParticles (ref)
	recurFastForwardParticles(p2)
end

local function findNearestBasePart(p2)
	local parent = p2.Parent
	while parent do
		if not parent:IsA("BasePart") then
			local handle
			if parent:IsA("Tool") then
				handle = parent:FindFirstChild("Handle")
				
				if not handle or not handle:IsA("BasePart") then
					if parent:IsA("Model") then
						handle = parent.PrimaryPart
						
						if not handle then
							parent = parent.Parent
							continue
						end
						return handle
					end
				end
				return handle
			end
		end
		return parent
	end
	return nil
end

local function recurReparentOrphanedEffects(p3)
	-- upvalues: t (ref), findNearestBasePart (ref), recurReparentOrphanedEffects (ref)
	if t.InstanceIsAParticleEffect(p3) then
		local parent = p3.Parent
		
		if parent and not parent:IsA("BasePart") and not parent:IsA("Attachment") then
			local var1 = findNearestBasePart(p3)
			
			if var1 then
				p3.Parent = var1
			end
		end
		return
	else
		for i, v in p3:GetChildren() do
			recurReparentOrphanedEffects(v)
		end
	end
end

function t.ReparentOrphanedParticleEffects(p4)
	-- upvalues: recurReparentOrphanedEffects (ref)
	recurReparentOrphanedEffects(p4)
end

return t