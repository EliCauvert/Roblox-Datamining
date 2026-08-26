local playersService = game:GetService("Players")
local localPlayer = playersService.LocalPlayer

if not localPlayer then
	playersService:GetPropertyChangedSignal("LocalPlayer"):Wait()
	localPlayer = playersService.LocalPlayer
end
local t = {
	Value = false,
	ChangedEvent = Instance.new("BindableEvent")
}

local function _(p1)
	if not p1 then
		return nil
	end
	local animate = p1:FindFirstChild("Animate")
	
	return if animate and animate:IsA("LocalScript") then animate elseif animate and animate:IsA("Script") and animate.RunContext == Enum.RunContext.Client then animate else nil
end

local _ = function(p1)
	local var1, animate
	if p1 then
		animate = p1:FindFirstChild("Animate")
		var1 = if animate and animate:IsA("LocalScript") then animate elseif animate and animate:IsA("Script") and animate.RunContext == Enum.RunContext.Client then animate else nil
	else
		var1 = nil
	end
	if not var1 then
		return nil
	end
	animate = var1:FindFirstChild("PlayEmote")
	
	return if animate and animate:IsA("BindableFunction") then animate else nil
end

local _ = function(p1)
	local var1, animate
	if p1 then
		animate = p1:FindFirstChild("Animate")
		var1 = if animate and animate:IsA("LocalScript") then animate elseif animate and animate:IsA("Script") and animate.RunContext == Enum.RunContext.Client then animate else nil
	else
		var1 = nil
	end
	local var2
	if var1 then
		animate = var1:FindFirstChild("PlayEmote")
		var2 = if animate and animate:IsA("BindableFunction") then animate else nil
	else
		var2 = nil
	end
	return var2 ~= nil
end

local var1 = nil
local var2 = nil
local var3 = nil

local _ = function()
	-- upvalues: var1 (write), var2 (write), var3 (write)
	if var1 then
		var1:Disconnect()
		var1 = nil
	end
	if var2 then
		var2:Disconnect()
		var2 = nil
	end
	if var3 then
		var3:Disconnect()
		var3 = nil
	end
end

local var4 = nil

local _ = function(p1)
	-- upvalues: t (ref), var4 (write)
	local var5, animate
	if p1 then
		animate = p1:FindFirstChild("Animate")
		var5 = if animate and animate:IsA("LocalScript") then animate elseif animate and animate:IsA("Script") and animate.RunContext == Enum.RunContext.Client then animate else nil
	else
		var5 = nil
	end
	local var6
	if var5 then
		animate = var5:FindFirstChild("PlayEmote")
		var6 = if animate and animate:IsA("BindableFunction") then animate else nil
	else
		var6 = nil
	end
	local var7 = var6 ~= nil
	
	if t.Value ~= var7 then
		t.Value = var7
		t.ChangedEvent:Fire(var7)
	end
	var4(var7, p1)
end

local _ = function(p1)
	-- upvalues: t (ref), var4 (write), var1 (write)
	local var5, animate
	if p1 then
		animate = p1:FindFirstChild("Animate")
		var5 = if animate and animate:IsA("LocalScript") then animate elseif animate and animate:IsA("Script") and animate.RunContext == Enum.RunContext.Client then animate else nil
	else
		var5 = nil
	end
	local var6, animate_1
	if not var5 then
		var1 = p1.ChildAdded:Connect(function(p2)
			-- upvalues: p1 (ref), t (copy), var4 (copy)
			if (p2:IsA("LocalScript") or p2:IsA("Script") and p2.RunContext == Enum.RunContext.Client) and p2.Name == "Animate" then
				local var7, animate
				local var8 = p1
				
				if var8 then
					animate = var8:FindFirstChild("Animate")
					var7 = if animate and animate:IsA("LocalScript") then animate elseif animate and animate:IsA("Script") and animate.RunContext == Enum.RunContext.Client then animate else nil
				else
					var7 = nil
				end
				local var9
				if var7 then
					animate = var7:FindFirstChild("PlayEmote")
					var9 = if animate and animate:IsA("BindableFunction") then animate else nil
				else
					var9 = nil
				end
				local var10 = var9 ~= nil
				
				if t.Value ~= var10 then
					t.Value = var10
					t.ChangedEvent:Fire(var10)
				end
				var4(var10, var8)
			end
		end)
		
		return
	elseif p1 then
		animate_1 = p1:FindFirstChild("Animate")
		var6 = if animate_1 and animate_1:IsA("LocalScript") then animate_1 elseif animate_1 and animate_1:IsA("Script") and animate_1.RunContext == Enum.RunContext.Client then animate_1 else nil
	else
		var6 = nil
	end
	local var7
	if var6 then
		animate_1 = var6:FindFirstChild("PlayEmote")
		var7 = if animate_1 and animate_1:IsA("BindableFunction") then animate_1 else nil
	else
		var7 = nil
	end
	animate = var7 ~= nil
	
	if t.Value ~= animate then
		t.Value = animate
		t.ChangedEvent:Fire(animate)
	end
	var4(animate, p1)
end

local _ = function(p1, p2)
	-- upvalues: t (ref), var4 (write), var2 (write)
	local var5, animate
	if p1 then
		animate = p1:FindFirstChild("Animate")
		var5 = if animate and animate:IsA("LocalScript") then animate elseif animate and animate:IsA("Script") and animate.RunContext == Enum.RunContext.Client then animate else nil
	else
		var5 = nil
	end
	local var6
	if var5 then
		animate = var5:FindFirstChild("PlayEmote")
		var6 = if animate and animate:IsA("BindableFunction") then animate else nil
	else
		var6 = nil
	end
	local var7, animate_1
	if not var6 then
		var2 = p2.ChildAdded:Connect(function(p3)
			-- upvalues: p1 (ref), t (copy), var4 (copy)
			if p3:IsA("BindableFunction") and p3.Name == "PlayEmote" then
				local var8, animate
				local var9 = p1
				
				if var9 then
					animate = var9:FindFirstChild("Animate")
					var8 = if animate and animate:IsA("LocalScript") then animate elseif animate and animate:IsA("Script") and animate.RunContext == Enum.RunContext.Client then animate else nil
				else
					var8 = nil
				end
				local var10
				if var8 then
					animate = var8:FindFirstChild("PlayEmote")
					var10 = if animate and animate:IsA("BindableFunction") then animate else nil
				else
					var10 = nil
				end
				local var11 = var10 ~= nil
				
				if t.Value ~= var11 then
					t.Value = var11
					t.ChangedEvent:Fire(var11)
				end
				var4(var11, var9)
			end
		end)
		
		return
	elseif p1 then
		animate_1 = p1:FindFirstChild("Animate")
		var7 = if animate_1 and animate_1:IsA("LocalScript") then animate_1 elseif animate_1 and animate_1:IsA("Script") and animate_1.RunContext == Enum.RunContext.Client then animate_1 else nil
	else
		var7 = nil
	end
	if var7 then
		animate_1 = var7:FindFirstChild("PlayEmote")
		animate = if animate_1 and animate_1:IsA("BindableFunction") then animate_1 else nil
	else
		animate = nil
	end
	local var8 = animate ~= nil
	
	if t.Value ~= var8 then
		t.Value = var8
		t.ChangedEvent:Fire(var8)
	end
	var4(var8, p1)
end

local _ = function(p1)
	-- upvalues: t (ref), var4 (write), var3 (write)
	local var5, animate
	if p1 then
		animate = p1:FindFirstChild("Animate")
		var5 = if animate and animate:IsA("LocalScript") then animate elseif animate and animate:IsA("Script") and animate.RunContext == Enum.RunContext.Client then animate else nil
	else
		var5 = nil
	end
	local var6
	if var5 then
		animate = var5:FindFirstChild("PlayEmote")
		var6 = if animate and animate:IsA("BindableFunction") then animate else nil
	else
		var6 = nil
	end
	local var7, animate_1
	if var6 then
		var3 = var6.AncestryChanged:Connect(function(_, p2)
			-- upvalues: var6 (ref), p1 (ref), t (copy), var4 (copy)
			if not p2 or not var6:IsDescendantOf(p1) then
				local var8, animate
				local var9 = p1
				
				if var9 then
					animate = var9:FindFirstChild("Animate")
					var8 = if animate and animate:IsA("LocalScript") then animate elseif animate and animate:IsA("Script") and animate.RunContext == Enum.RunContext.Client then animate else nil
				else
					var8 = nil
				end
				local var10
				if var8 then
					animate = var8:FindFirstChild("PlayEmote")
					var10 = if animate and animate:IsA("BindableFunction") then animate else nil
				else
					var10 = nil
				end
				local var11 = var10 ~= nil
				
				if t.Value ~= var11 then
					t.Value = var11
					t.ChangedEvent:Fire(var11)
				end
				var4(var11, var9)
			end
		end)
		
		return
	elseif p1 then
		animate_1 = p1:FindFirstChild("Animate")
		var7 = if animate_1 and animate_1:IsA("LocalScript") then animate_1 elseif animate_1 and animate_1:IsA("Script") and animate_1.RunContext == Enum.RunContext.Client then animate_1 else nil
	else
		var7 = nil
	end
	if var7 then
		animate_1 = var7:FindFirstChild("PlayEmote")
		animate = if animate_1 and animate_1:IsA("BindableFunction") then animate_1 else nil
	else
		animate = nil
	end
	local var8 = animate ~= nil
	
	if t.Value ~= var8 then
		t.Value = var8
		t.ChangedEvent:Fire(var8)
	end
	var4(var8, p1)
end

var4 = function(p1, p2)
	-- upvalues: var1 (write), var2 (write), var3 (write), t (ref), var4 (write)
	local animate, animate_1, var5, animate_2
	if var1 then
		var1:Disconnect()
		var1 = nil
	end
	if var2 then
		var2:Disconnect()
		var2 = nil
	end
	if var3 then
		var3:Disconnect()
		var3 = nil
	end
	if not p2 then return end
	if p1 then
		local var6
		if p2 then
			animate = p2:FindFirstChild("Animate")
			var6 = if animate and animate:IsA("LocalScript") then animate elseif animate and animate:IsA("Script") and animate.RunContext == Enum.RunContext.Client then animate else nil
		else
			var6 = nil
		end
		local var7
		if var6 then
			animate = var6:FindFirstChild("PlayEmote")
			var7 = if animate and animate:IsA("BindableFunction") then animate else nil
		else
			var7 = nil
		end
		local var8
		if var7 then
			var3 = var7.AncestryChanged:Connect(function(_, p3)
				-- upvalues: var7 (ref), p2 (ref), t (copy), var4 (copy)
				if not p3 or not var7:IsDescendantOf(p2) then
					local var9
					local var10 = p2
					
					if var10 then
						local animate = var10:FindFirstChild("Animate")
						var9 = if animate and animate:IsA("LocalScript") then animate elseif animate and animate:IsA("Script") and animate.RunContext == Enum.RunContext.Client then animate else nil
					else
						var9 = nil
					end
					local var11
					if var9 then
						local animate = var9:FindFirstChild("PlayEmote")
						var11 = if animate and animate:IsA("BindableFunction") then animate else nil
					else
						var11 = nil
					end
					local var12 = var11 ~= nil
					
					if t.Value ~= var12 then
						t.Value = var12
						t.ChangedEvent:Fire(var12)
					end
					var4(var12, var10)
				end
			end)
			
			return
		elseif p2 then
			animate_1 = p2:FindFirstChild("Animate")
			var8 = if animate_1 and animate_1:IsA("LocalScript") then animate_1 elseif animate_1 and animate_1:IsA("Script") and animate_1.RunContext == Enum.RunContext.Client then animate_1 else nil
		else
			var8 = nil
		end
		if var8 then
			animate_1 = var8:FindFirstChild("PlayEmote")
			animate = if animate_1 and animate_1:IsA("BindableFunction") then animate_1 else nil
		else
			animate = nil
		end
		local var9 = animate ~= nil
		
		if t.Value ~= var9 then
			t.Value = var9
			t.ChangedEvent:Fire(var9)
		end
		var4(var9, p2)
		
		return
	elseif p2 then
		animate_2 = p2:FindFirstChild("Animate")
		var5 = if animate_2 and animate_2:IsA("LocalScript") then animate_2 elseif animate_2 and animate_2:IsA("Script") and animate_2.RunContext == Enum.RunContext.Client then animate_2 else nil
	else
		var5 = nil
	end
	local animate_3, animate_4
	if var5 then
		if p2 then
			animate_3 = p2:FindFirstChild("Animate")
			animate = if animate_3 and animate_3:IsA("LocalScript") then animate_3 elseif animate_3 and animate_3:IsA("Script") and animate_3.RunContext == Enum.RunContext.Client then animate_3 else nil
		else
			animate = nil
		end
		if animate then
			animate_3 = animate:FindFirstChild("PlayEmote")
			animate_2 = if animate_3 and animate_3:IsA("BindableFunction") then animate_3 else nil
		else
			animate_2 = nil
		end
		if animate_2 then
			if p2 then
				animate_4 = p2:FindFirstChild("Animate")
				animate_1 = if animate_4 and animate_4:IsA("LocalScript") then animate_4 elseif animate_4 and animate_4:IsA("Script") and animate_4.RunContext == Enum.RunContext.Client then animate_4 else nil
			else
				animate_1 = nil
			end
			if animate_1 then
				animate_4 = animate_1:FindFirstChild("PlayEmote")
				animate_3 = if animate_4 and animate_4:IsA("BindableFunction") then animate_4 else nil
			else
				animate_3 = nil
			end
			animate = animate_3 ~= nil
			
			if t.Value ~= animate then
				t.Value = animate
				t.ChangedEvent:Fire(animate)
			end
			var4(animate, p2)
			
			return
		else
			var2 = var5.ChildAdded:Connect(function(p3)
				-- upvalues: p2 (ref), t (copy), var4 (copy)
				if p3:IsA("BindableFunction") and p3.Name == "PlayEmote" then
					local var10
					local var11 = p2
					
					if var11 then
						local animate = var11:FindFirstChild("Animate")
						var10 = if animate and animate:IsA("LocalScript") then animate elseif animate and animate:IsA("Script") and animate.RunContext == Enum.RunContext.Client then animate else nil
					else
						var10 = nil
					end
					local var12
					if var10 then
						local animate = var10:FindFirstChild("PlayEmote")
						var12 = if animate and animate:IsA("BindableFunction") then animate else nil
					else
						var12 = nil
					end
					local var13 = var12 ~= nil
					
					if t.Value ~= var13 then
						t.Value = var13
						t.ChangedEvent:Fire(var13)
					end
					var4(var13, var11)
				end
			end)
			
			return
		end
	elseif p2 then
		animate = p2:FindFirstChild("Animate")
		animate_2 = if animate and animate:IsA("LocalScript") then animate elseif animate and animate:IsA("Script") and animate.RunContext == Enum.RunContext.Client then animate else nil
	else
		animate_2 = nil
	end
	if not animate_2 then
		var1 = p2.ChildAdded:Connect(function(p3)
			-- upvalues: p2 (ref), t (copy), var4 (copy)
			if (p3:IsA("LocalScript") or p3:IsA("Script") and p3.RunContext == Enum.RunContext.Client) and p3.Name == "Animate" then
				local var10
				local var11 = p2
				
				if var11 then
					local animate = var11:FindFirstChild("Animate")
					var10 = if animate and animate:IsA("LocalScript") then animate elseif animate and animate:IsA("Script") and animate.RunContext == Enum.RunContext.Client then animate else nil
				else
					var10 = nil
				end
				local var12
				if var10 then
					local animate = var10:FindFirstChild("PlayEmote")
					var12 = if animate and animate:IsA("BindableFunction") then animate else nil
				else
					var12 = nil
				end
				local var13 = var12 ~= nil
				
				if t.Value ~= var13 then
					t.Value = var13
					t.ChangedEvent:Fire(var13)
				end
				var4(var13, var11)
			end
		end)
		
		return
	elseif p2 then
		animate_4 = p2:FindFirstChild("Animate")
		animate_1 = if animate_4 and animate_4:IsA("LocalScript") then animate_4 elseif animate_4 and animate_4:IsA("Script") and animate_4.RunContext == Enum.RunContext.Client then animate_4 else nil
	else
		animate_1 = nil
	end
	if animate_1 then
		animate_4 = animate_1:FindFirstChild("PlayEmote")
		animate_3 = if animate_4 and animate_4:IsA("BindableFunction") then animate_4 else nil
	else
		animate_3 = nil
	end
	animate = animate_3 ~= nil
	
	if t.Value ~= animate then
		t.Value = animate
		t.ChangedEvent:Fire(animate)
	end
	var4(animate, p2)
end

local _ = function(p1)
	-- upvalues: var1 (write), var2 (write), var3 (write), t (ref), var4 (write)
	local var5, animate
	if var1 then
		var1:Disconnect()
		var1 = nil
	end
	if var2 then
		var2:Disconnect()
		var2 = nil
	end
	if var3 then
		var3:Disconnect()
		var3 = nil
	end
	if p1 then
		animate = p1:FindFirstChild("Animate")
		var5 = if animate and animate:IsA("LocalScript") then animate elseif animate and animate:IsA("Script") and animate.RunContext == Enum.RunContext.Client then animate else nil
	else
		var5 = nil
	end
	local var6
	if var5 then
		animate = var5:FindFirstChild("PlayEmote")
		var6 = if animate and animate:IsA("BindableFunction") then animate else nil
	else
		var6 = nil
	end
	local var7 = var6 ~= nil
	
	if t.Value ~= var7 then
		t.Value = var7
		t.ChangedEvent:Fire(var7)
	end
	var4(var7, p1)
end

localPlayer:GetPropertyChangedSignal("Character"):Connect(function()
	-- upvalues: localPlayer (write), var1 (write), var2 (write), var3 (write), t (ref), var4 (write)
	local var5, animate
	local character = localPlayer.Character
	
	if var1 then
		var1:Disconnect()
		var1 = nil
	end
	if var2 then
		var2:Disconnect()
		var2 = nil
	end
	if var3 then
		var3:Disconnect()
		var3 = nil
	end
	if character then
		animate = character:FindFirstChild("Animate")
		var5 = if animate and animate:IsA("LocalScript") then animate elseif animate and animate:IsA("Script") and animate.RunContext == Enum.RunContext.Client then animate else nil
	else
		var5 = nil
	end
	local var6
	if var5 then
		animate = var5:FindFirstChild("PlayEmote")
		var6 = if animate and animate:IsA("BindableFunction") then animate else nil
	else
		var6 = nil
	end
	local var7 = var6 ~= nil
	
	if t.Value ~= var7 then
		t.Value = var7
		t.ChangedEvent:Fire(var7)
	end
	var4(var7, character)
end)
local character = localPlayer.Character
local var5, animate
if character then
	animate = character:FindFirstChild("Animate")
	var5 = if animate and animate:IsA("LocalScript") then animate elseif animate and animate:IsA("Script") and animate.RunContext == Enum.RunContext.Client then animate else nil
else
	var5 = nil
end
local var6
if var5 then
	animate = var5:FindFirstChild("PlayEmote")
	var6 = if animate and animate:IsA("BindableFunction") then animate else nil
else
	var6 = nil
end
local var7 = var6 ~= nil

if t.Value ~= var7 then
	t.Value = var7
	t.ChangedEvent:Fire(var7)
end
var4(var7, character)

return t