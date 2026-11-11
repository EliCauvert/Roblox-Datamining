local CreateSignalFunction = require(script:FindFirstAncestor("ExpChat").Parent.Signals).createSignal

local function findFirstChildByNameAndClass(Ter, Name, ClassName)
	if not Ter then
		return nil
	end
	for _, child in ipairs(Ter:GetChildren()) do
		if child.Name == Name and child:IsA(ClassName) then
			return child
		end
	end
	return nil
end

return function()
	-- upvalues: CreateSignalFunction (copy), findFirstChildByNameAndClass (copy)
	local t = {}
	
	local function _(p1): string
		return (tostring(p1))
	end
	
	return {
		getAdornee = function(p1)
			-- upvalues: t (copy), CreateSignalFunction (upval)
			local Text = tostring(p1)
			
			if not t[Text] then
				local Signal, Signal2 = CreateSignalFunction(nil)
				t[Text] = { getter = Signal, setter = Signal2 }
			end
			return t[Text].getter
		end,
		handleAdorneeAdded = function(p1, p2, Humanoid)
			-- upvalues: findFirstChildByNameAndClass (upval), t (copy), CreateSignalFunction (upval)
			local Text = tostring(p1)
			local Head = findFirstChildByNameAndClass(p2, "Head", "BasePart")
			local Head1 = if Humanoid.Health == 0 then Head else p2
			
			if not t[Text] then
				local Text1 = tostring(p1)
				
				if not t[Text1] then
					local Signal, Signal2 = CreateSignalFunction(nil)
					t[Text1] = { getter = Signal, setter = Signal2 }
				end
				local _ = t[Text1].getter
			end
			t[Text].setter(Head1)
		end,
		handleHumanoidDied = function(p1)
			-- upvalues: t (copy), findFirstChildByNameAndClass (upval)
			local Text = tostring(p1)
			
			if t[Text] then
				local Ter = t[Text].getter(false)
				t[Text].setter(if Ter then findFirstChildByNameAndClass(Ter, "Head", "BasePart") or Ter else nil)
			end
		end,
		handlePlayerRemoved = function(p1)
			-- upvalues: t (copy)
			local Text = tostring(p1)
			
			if t[Text] then
				t[Text].setter(nil)
			end
			t[Text] = nil
		end
	}
end