local createSignal = require(script:FindFirstAncestor("ExpChat").Parent.Signals).createSignal

local function findFirstChildByNameAndClass(p0, p1, p2)
	if not p0 then
		return nil
	end
	for i, v in ipairs(p0:GetChildren()) do
		if v.Name == p1 and v:IsA(p2) then
			return v
		end
	end
	return nil
end

return function()
	-- upvalues: createSignal (ref), findFirstChildByNameAndClass (ref)
	local t = {}
	
	local function _(p3)
		return tostring(p3)
	end
	
	return {
		getAdornee = function(p4)
			-- upvalues: t (ref), createSignal (copy)
			local var2 = tostring(p4)
			
			if not t[var2] then
				local var3, var4 = createSignal(nil)
				t[var2] = { getter = var3, setter = var4 }
			end
			return t[var2].getter
		end,
		handleAdorneeAdded = function(p5, p6, p7)
			-- upvalues: findFirstChildByNameAndClass (copy), t (ref), createSignal (copy)
			local var5 = tostring(p5)
			local var6 = if p7.Health == 0 then findFirstChildByNameAndClass(p6, "Head", "BasePart") else p6
			
			if not t[var5] then
				local var7 = tostring(p5)
				
				if not t[var7] then
					local var8, var9 = createSignal(nil)
					t[var7] = { getter = var8, setter = var9 }
				end
				local _ = t[var7].getter
			end
			t[var5].setter(var6)
		end,
		handleHumanoidDied = function(p8)
			-- upvalues: t (ref), findFirstChildByNameAndClass (copy)
			local var10 = tostring(p8)
			local _ = nil
			
			if t[var10] then
				local ter = t[var10].getter(false)
				t[var10].setter(if ter then findFirstChildByNameAndClass(ter, "Head", "BasePart") or ter else nil)
			end
		end,
		handlePlayerRemoved = function(p9)
			-- upvalues: t (ref)
			local var12 = tostring(p9)
			
			if t[var12] then
				t[var12].setter(nil)
			end
			t[var12] = nil
		end
	}
end