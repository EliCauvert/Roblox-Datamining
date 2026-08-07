local t = {
	InstanceIsAParticleEffect = function(p0) --[[ line: 10 ]]
		return p0:IsA("ParticleEmitter") or (p0:IsA("Fire") or (p0:IsA("Smoke") or p0:IsA("Sparkles")))
	end
}

local function recurFastForwardParticles(p1) --[[ line: 14 ]]
	-- upvalues: t (ref), recurFastForwardParticles (ref)
	if t.InstanceIsAParticleEffect(p1) then
		p1:FastForward(240)
	end
	for i, v in p1:GetChildren() do
		recurFastForwardParticles(v)
	end
end

function t.FastForwardParticles(p2) --[[ line: 25 ]]
	-- upvalues: recurFastForwardParticles (ref)
	recurFastForwardParticles(p2)
end

local function findNearestBasePart(p3) --[[ line: 30 ]]
	local parent = p3.Parent
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

local function recurReparentOrphanedEffects(p4) --[[ line: 60 ]]
	-- upvalues: t (ref), findNearestBasePart (ref), recurReparentOrphanedEffects (ref)
	if t.InstanceIsAParticleEffect(p4) then
		local parent = p4.Parent
		
		if parent and not parent:IsA("BasePart") and not parent:IsA("Attachment") then
			local var5 = findNearestBasePart(p4)
			
			if var5 then
				p4.Parent = var5
			end
		end
		return
	else
		for i, v in p4:GetChildren() do
			recurReparentOrphanedEffects(v)
		end
	end
end

function t.ReparentOrphanedParticleEffects(p5) --[[ line: 77 ]]
	-- upvalues: recurReparentOrphanedEffects (ref)
	recurReparentOrphanedEffects(p5)
end

return t