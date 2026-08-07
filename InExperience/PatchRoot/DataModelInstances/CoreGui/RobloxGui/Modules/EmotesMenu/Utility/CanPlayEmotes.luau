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

local function _(p0) --[[ line: 15 | named "getAnimateScript" ]]
	if not p0 then
		return nil
	end
	local animate = p0:FindFirstChild("Animate")
	
	return if animate and animate:IsA("LocalScript") then animate elseif animate and animate:IsA("Script") and animate.RunContext == Enum.RunContext.Client then animate else nil
end

local _ = function(p1) --[[ line: 31 | named "getPlayEmoteBindable" ]]
	local var11, animate
	if p1 then
		animate = p1:FindFirstChild("Animate")
		var11 = if animate and animate:IsA("LocalScript") then animate elseif animate and animate:IsA("Script") and animate.RunContext == Enum.RunContext.Client then animate else nil
	else
		var11 = nil
	end
	if not var11 then
		return nil
	end
	animate = var11:FindFirstChild("PlayEmote")
	
	return if animate and animate:IsA("BindableFunction") then animate else nil
end

local _ = function(p2) --[[ line: 45 | named "getCanPlayEmotes" ]]
	local var13, animate
	if p2 then
		animate = p2:FindFirstChild("Animate")
		var13 = if animate and animate:IsA("LocalScript") then animate elseif animate and animate:IsA("Script") and animate.RunContext == Enum.RunContext.Client then animate else nil
	else
		var13 = nil
	end
	local var15
	if var13 then
		animate = var13:FindFirstChild("PlayEmote")
		var15 = if animate and animate:IsA("BindableFunction") then animate else nil
	else
		var15 = nil
	end
	return var15 ~= nil
end

local var2 = nil
local var3 = nil
local var4 = nil

local _ = function() --[[ line: 52 | named "disconnectListeners" ]]
	-- upvalues: var2 (write), var3 (write), var4 (write)
	if var2 then
		var2:Disconnect()
		var2 = nil
	end
	if var3 then
		var3:Disconnect()
		var3 = nil
	end
	if var4 then
		var4:Disconnect()
		var4 = nil
	end
end

local var5 = nil

local _ = function(p3) --[[ line: 71 | named "checkUpdate" ]]
	-- upvalues: t (ref), var5 (write)
	local var16, animate
	if p3 then
		animate = p3:FindFirstChild("Animate")
		var16 = if animate and animate:IsA("LocalScript") then animate elseif animate and animate:IsA("Script") and animate.RunContext == Enum.RunContext.Client then animate else nil
	else
		var16 = nil
	end
	local var18
	if var16 then
		animate = var16:FindFirstChild("PlayEmote")
		var18 = if animate and animate:IsA("BindableFunction") then animate else nil
	else
		var18 = nil
	end
	local var19 = var18 ~= nil
	
	if t.Value ~= var19 then
		t.Value = var19
		t.ChangedEvent:Fire(var19)
	end
	var5(var19, p3)
end

local _ = function(p4) --[[ line: 82 | named "connectAnimateAddedListener" ]]
	-- upvalues: t (ref), var5 (write), var2 (write)
	local var20, animate
	if p4 then
		animate = p4:FindFirstChild("Animate")
		var20 = if animate and animate:IsA("LocalScript") then animate elseif animate and animate:IsA("Script") and animate.RunContext == Enum.RunContext.Client then animate else nil
	else
		var20 = nil
	end
	local var22, animate_1
	if not var20 then
		var2 = p4.ChildAdded:Connect(function(p5) --[[ line: 89 ]]
			-- upvalues: p4 (ref), t (copy), var5 (copy)
			if (p5:IsA("LocalScript") or p5:IsA("Script") and p5.RunContext == Enum.RunContext.Client) and p5.Name == "Animate" then
				local var26, animate
				local var25 = p4
				
				if var25 then
					animate = var25:FindFirstChild("Animate")
					var26 = if animate and animate:IsA("LocalScript") then animate elseif animate and animate:IsA("Script") and animate.RunContext == Enum.RunContext.Client then animate else nil
				else
					var26 = nil
				end
				local var28
				if var26 then
					animate = var26:FindFirstChild("PlayEmote")
					var28 = if animate and animate:IsA("BindableFunction") then animate else nil
				else
					var28 = nil
				end
				local var29 = var28 ~= nil
				
				if t.Value ~= var29 then
					t.Value = var29
					t.ChangedEvent:Fire(var29)
				end
				var5(var29, var25)
			end
		end)
		
		return
	elseif p4 then
		animate_1 = p4:FindFirstChild("Animate")
		var22 = if animate_1 and animate_1:IsA("LocalScript") then animate_1 elseif animate_1 and animate_1:IsA("Script") and animate_1.RunContext == Enum.RunContext.Client then animate_1 else nil
	else
		var22 = nil
	end
	local var24
	if var22 then
		animate_1 = var22:FindFirstChild("PlayEmote")
		var24 = if animate_1 and animate_1:IsA("BindableFunction") then animate_1 else nil
	else
		var24 = nil
	end
	animate = var24 ~= nil
	
	if t.Value ~= animate then
		t.Value = animate
		t.ChangedEvent:Fire(animate)
	end
	var5(animate, p4)
end

local _ = function(p6, p7) --[[ line: 98 | named "connectPlayEmoteAddedListener" ]]
	-- upvalues: t (ref), var5 (write), var3 (write)
	local var30, animate
	if p6 then
		animate = p6:FindFirstChild("Animate")
		var30 = if animate and animate:IsA("LocalScript") then animate elseif animate and animate:IsA("Script") and animate.RunContext == Enum.RunContext.Client then animate else nil
	else
		var30 = nil
	end
	local var32
	if var30 then
		animate = var30:FindFirstChild("PlayEmote")
		var32 = if animate and animate:IsA("BindableFunction") then animate else nil
	else
		var32 = nil
	end
	local var33, animate_1
	if not var32 then
		var3 = p7.ChildAdded:Connect(function(p8) --[[ line: 105 ]]
			-- upvalues: p6 (ref), t (copy), var5 (copy)
			if p8:IsA("BindableFunction") and p8.Name == "PlayEmote" then
				local var37, animate
				local var36 = p6
				
				if var36 then
					animate = var36:FindFirstChild("Animate")
					var37 = if animate and animate:IsA("LocalScript") then animate elseif animate and animate:IsA("Script") and animate.RunContext == Enum.RunContext.Client then animate else nil
				else
					var37 = nil
				end
				local var39
				if var37 then
					animate = var37:FindFirstChild("PlayEmote")
					var39 = if animate and animate:IsA("BindableFunction") then animate else nil
				else
					var39 = nil
				end
				local var40 = var39 ~= nil
				
				if t.Value ~= var40 then
					t.Value = var40
					t.ChangedEvent:Fire(var40)
				end
				var5(var40, var36)
			end
		end)
		
		return
	elseif p6 then
		animate_1 = p6:FindFirstChild("Animate")
		var33 = if animate_1 and animate_1:IsA("LocalScript") then animate_1 elseif animate_1 and animate_1:IsA("Script") and animate_1.RunContext == Enum.RunContext.Client then animate_1 else nil
	else
		var33 = nil
	end
	if var33 then
		animate_1 = var33:FindFirstChild("PlayEmote")
		animate = if animate_1 and animate_1:IsA("BindableFunction") then animate_1 else nil
	else
		animate = nil
	end
	local var35 = animate ~= nil
	
	if t.Value ~= var35 then
		t.Value = var35
		t.ChangedEvent:Fire(var35)
	end
	var5(var35, p6)
end

local _ = function(p9) --[[ line: 112 | named "connectPlayEmoteRemovedListener" ]]
	-- upvalues: t (ref), var5 (write), var4 (write)
	local var41, animate
	if p9 then
		animate = p9:FindFirstChild("Animate")
		var41 = if animate and animate:IsA("LocalScript") then animate elseif animate and animate:IsA("Script") and animate.RunContext == Enum.RunContext.Client then animate else nil
	else
		var41 = nil
	end
	local var43
	if var41 then
		animate = var41:FindFirstChild("PlayEmote")
		var43 = if animate and animate:IsA("BindableFunction") then animate else nil
	else
		var43 = nil
	end
	local var44, animate_1
	if var43 then
		var4 = var43.AncestryChanged:Connect(function(_, p10) --[[ line: 119 ]]
			-- upvalues: var43 (ref), p9 (ref), t (copy), var5 (copy)
			if not p10 or not var43:IsDescendantOf(p9) then
				local var48, animate
				local var47 = p9
				
				if var47 then
					animate = var47:FindFirstChild("Animate")
					var48 = if animate and animate:IsA("LocalScript") then animate elseif animate and animate:IsA("Script") and animate.RunContext == Enum.RunContext.Client then animate else nil
				else
					var48 = nil
				end
				local var50
				if var48 then
					animate = var48:FindFirstChild("PlayEmote")
					var50 = if animate and animate:IsA("BindableFunction") then animate else nil
				else
					var50 = nil
				end
				local var51 = var50 ~= nil
				
				if t.Value ~= var51 then
					t.Value = var51
					t.ChangedEvent:Fire(var51)
				end
				var5(var51, var47)
			end
		end)
		
		return
	elseif p9 then
		animate_1 = p9:FindFirstChild("Animate")
		var44 = if animate_1 and animate_1:IsA("LocalScript") then animate_1 elseif animate_1 and animate_1:IsA("Script") and animate_1.RunContext == Enum.RunContext.Client then animate_1 else nil
	else
		var44 = nil
	end
	if var44 then
		animate_1 = var44:FindFirstChild("PlayEmote")
		animate = if animate_1 and animate_1:IsA("BindableFunction") then animate_1 else nil
	else
		animate = nil
	end
	local var46 = animate ~= nil
	
	if t.Value ~= var46 then
		t.Value = var46
		t.ChangedEvent:Fire(var46)
	end
	var5(var46, p9)
end

var5 = function(p11, p12) --[[ line: 126 ]]
	-- upvalues: var2 (write), var3 (write), var4 (write), t (ref), var5 (write)
	local animate, animate_1, var58, animate_2
	if var2 then
		var2:Disconnect()
		var2 = nil
	end
	if var3 then
		var3:Disconnect()
		var3 = nil
	end
	if var4 then
		var4:Disconnect()
		var4 = nil
	end
	if not p12 then return end
	if p11 then
		local var52
		if p12 then
			animate = p12:FindFirstChild("Animate")
			var52 = if animate and animate:IsA("LocalScript") then animate elseif animate and animate:IsA("Script") and animate.RunContext == Enum.RunContext.Client then animate else nil
		else
			var52 = nil
		end
		local var54
		if var52 then
			animate = var52:FindFirstChild("PlayEmote")
			var54 = if animate and animate:IsA("BindableFunction") then animate else nil
		else
			var54 = nil
		end
		local var55
		if var54 then
			var4 = var54.AncestryChanged:Connect(function(_, p13) --[[ line: 119 ]]
				-- upvalues: var54 (ref), p12 (ref), t (copy), var5 (copy)
				if not p13 or not var54:IsDescendantOf(p12) then
					local var48
					local var47 = p12
					
					if var47 then
						local animate = var47:FindFirstChild("Animate")
						var48 = if animate and animate:IsA("LocalScript") then animate elseif animate and animate:IsA("Script") and animate.RunContext == Enum.RunContext.Client then animate else nil
					else
						var48 = nil
					end
					local var50
					if var48 then
						local animate = var48:FindFirstChild("PlayEmote")
						var50 = if animate and animate:IsA("BindableFunction") then animate else nil
					else
						var50 = nil
					end
					local var51 = var50 ~= nil
					
					if t.Value ~= var51 then
						t.Value = var51
						t.ChangedEvent:Fire(var51)
					end
					var5(var51, var47)
				end
			end)
			
			return
		elseif p12 then
			animate_1 = p12:FindFirstChild("Animate")
			var55 = if animate_1 and animate_1:IsA("LocalScript") then animate_1 elseif animate_1 and animate_1:IsA("Script") and animate_1.RunContext == Enum.RunContext.Client then animate_1 else nil
		else
			var55 = nil
		end
		if var55 then
			animate_1 = var55:FindFirstChild("PlayEmote")
			animate = if animate_1 and animate_1:IsA("BindableFunction") then animate_1 else nil
		else
			animate = nil
		end
		local var57 = animate ~= nil
		
		if t.Value ~= var57 then
			t.Value = var57
			t.ChangedEvent:Fire(var57)
		end
		var5(var57, p12)
		
		return
	elseif p12 then
		animate_2 = p12:FindFirstChild("Animate")
		var58 = if animate_2 and animate_2:IsA("LocalScript") then animate_2 elseif animate_2 and animate_2:IsA("Script") and animate_2.RunContext == Enum.RunContext.Client then animate_2 else nil
	else
		var58 = nil
	end
	local animate_3, animate_4
	if var58 then
		if p12 then
			animate_3 = p12:FindFirstChild("Animate")
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
			if p12 then
				animate_4 = p12:FindFirstChild("Animate")
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
			var5(animate, p12)
			
			return
		else
			var3 = var58.ChildAdded:Connect(function(p14) --[[ line: 105 ]]
				-- upvalues: p12 (ref), t (copy), var5 (copy)
				if p14:IsA("BindableFunction") and p14.Name == "PlayEmote" then
					local var37
					local var36 = p12
					
					if var36 then
						local animate = var36:FindFirstChild("Animate")
						var37 = if animate and animate:IsA("LocalScript") then animate elseif animate and animate:IsA("Script") and animate.RunContext == Enum.RunContext.Client then animate else nil
					else
						var37 = nil
					end
					local var39
					if var37 then
						local animate = var37:FindFirstChild("PlayEmote")
						var39 = if animate and animate:IsA("BindableFunction") then animate else nil
					else
						var39 = nil
					end
					local var40 = var39 ~= nil
					
					if t.Value ~= var40 then
						t.Value = var40
						t.ChangedEvent:Fire(var40)
					end
					var5(var40, var36)
				end
			end)
			
			return
		end
	elseif p12 then
		animate = p12:FindFirstChild("Animate")
		animate_2 = if animate and animate:IsA("LocalScript") then animate elseif animate and animate:IsA("Script") and animate.RunContext == Enum.RunContext.Client then animate else nil
	else
		animate_2 = nil
	end
	if not animate_2 then
		var2 = p12.ChildAdded:Connect(function(p15) --[[ line: 89 ]]
			-- upvalues: p12 (ref), t (copy), var5 (copy)
			if (p15:IsA("LocalScript") or p15:IsA("Script") and p15.RunContext == Enum.RunContext.Client) and p15.Name == "Animate" then
				local var26
				local var25 = p12
				
				if var25 then
					local animate = var25:FindFirstChild("Animate")
					var26 = if animate and animate:IsA("LocalScript") then animate elseif animate and animate:IsA("Script") and animate.RunContext == Enum.RunContext.Client then animate else nil
				else
					var26 = nil
				end
				local var28
				if var26 then
					local animate = var26:FindFirstChild("PlayEmote")
					var28 = if animate and animate:IsA("BindableFunction") then animate else nil
				else
					var28 = nil
				end
				local var29 = var28 ~= nil
				
				if t.Value ~= var29 then
					t.Value = var29
					t.ChangedEvent:Fire(var29)
				end
				var5(var29, var25)
			end
		end)
		
		return
	elseif p12 then
		animate_4 = p12:FindFirstChild("Animate")
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
	var5(animate, p12)
end

local _ = function(p16) --[[ line: 146 | named "onCharacterChanged" ]]
	-- upvalues: var2 (write), var3 (write), var4 (write), t (ref), var5 (write)
	local var62, animate
	if var2 then
		var2:Disconnect()
		var2 = nil
	end
	if var3 then
		var3:Disconnect()
		var3 = nil
	end
	if var4 then
		var4:Disconnect()
		var4 = nil
	end
	if p16 then
		animate = p16:FindFirstChild("Animate")
		var62 = if animate and animate:IsA("LocalScript") then animate elseif animate and animate:IsA("Script") and animate.RunContext == Enum.RunContext.Client then animate else nil
	else
		var62 = nil
	end
	local var64
	if var62 then
		animate = var62:FindFirstChild("PlayEmote")
		var64 = if animate and animate:IsA("BindableFunction") then animate else nil
	else
		var64 = nil
	end
	local var65 = var64 ~= nil
	
	if t.Value ~= var65 then
		t.Value = var65
		t.ChangedEvent:Fire(var65)
	end
	var5(var65, p16)
end

localPlayer:GetPropertyChangedSignal("Character"):Connect(function() --[[ line: 151 ]]
	-- upvalues: localPlayer (write), var2 (write), var3 (write), var4 (write), t (ref), var5 (write)
	local var66, animate
	local character = localPlayer.Character
	
	if var2 then
		var2:Disconnect()
		var2 = nil
	end
	if var3 then
		var3:Disconnect()
		var3 = nil
	end
	if var4 then
		var4:Disconnect()
		var4 = nil
	end
	if character then
		animate = character:FindFirstChild("Animate")
		var66 = if animate and animate:IsA("LocalScript") then animate elseif animate and animate:IsA("Script") and animate.RunContext == Enum.RunContext.Client then animate else nil
	else
		var66 = nil
	end
	local var68
	if var66 then
		animate = var66:FindFirstChild("PlayEmote")
		var68 = if animate and animate:IsA("BindableFunction") then animate else nil
	else
		var68 = nil
	end
	local var69 = var68 ~= nil
	
	if t.Value ~= var69 then
		t.Value = var69
		t.ChangedEvent:Fire(var69)
	end
	var5(var69, character)
end)
local character = localPlayer.Character
local var6, animate
if character then
	animate = character:FindFirstChild("Animate")
	var6 = if animate and animate:IsA("LocalScript") then animate elseif animate and animate:IsA("Script") and animate.RunContext == Enum.RunContext.Client then animate else nil
else
	var6 = nil
end
local var8
if var6 then
	animate = var6:FindFirstChild("PlayEmote")
	var8 = if animate and animate:IsA("BindableFunction") then animate else nil
else
	var8 = nil
end
local var9 = var8 ~= nil

if t.Value ~= var9 then
	t.Value = var9
	t.ChangedEvent:Fire(var9)
end
var5(var9, character)

return t