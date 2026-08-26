local createSignal = require(script:FindFirstAncestor("ExpChat").Parent.Signals).createSignal

local function findFirstChildByNameAndClass(p1, p2, p3)
	if not p1 then
		return nil
	end
	for i, v in ipairs(p1:GetChildren()) do
		if v.Name == p2 and v:IsA(p3) then
			return v
		end
	end
	return nil
end

return function()
	-- upvalues: createSignal (ref), findFirstChildByNameAndClass (ref)
	local t = {}
	
	local function _(p4)
		return tostring(p4)
	end
	
	return {
		getAdornee = function(p4)
			-- upvalues: t (ref), createSignal (copy)
			local var1 = tostring(p4)
			
			if not t[var1] then
				local var2, var3 = createSignal(nil)
				t[var1] = { getter = var2, setter = var3 }
			end
			return t[var1].getter
		end,
		handleAdorneeAdded = function(p4, p5, p6)
			-- upvalues: findFirstChildByNameAndClass (copy), t (ref), createSignal (copy)
			local var1 = tostring(p4)
			local var2 = if p6.Health == 0 then findFirstChildByNameAndClass(p5, "Head", "BasePart") else p5
			
			if not t[var1] then
				local var3 = tostring(p4)
				
				if not t[var3] then
					local var4, var5 = createSignal(nil)
					t[var3] = { getter = var4, setter = var5 }
				end
				local _ = t[var3].getter
			end
			t[var1].setter(var2)
		end,
		handleHumanoidDied = function(p4)
			-- upvalues: t (ref), findFirstChildByNameAndClass (copy)
			local var1 = tostring(p4)
			local _ = nil
			
			if t[var1] then
				local ter = t[var1].getter(false)
				t[var1].setter(if ter then findFirstChildByNameAndClass(ter, "Head", "BasePart") or ter else nil)
			end
		end,
		handlePlayerRemoved = function(p4)
			-- upvalues: t (ref)
			local var1 = tostring(p4)
			
			if t[var1] then
				t[var1].setter(nil)
			end
			t[var1] = nil
		end
	}
end