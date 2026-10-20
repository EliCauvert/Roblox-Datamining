local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

if not LocalPlayer then
	Players:GetPropertyChangedSignal("LocalPlayer"):Wait()
	LocalPlayer = Players.LocalPlayer
end
local CanPlayEmotesModule = {
	Value = false,
	ChangedEvent = Instance.new("BindableEvent")
}

local function _(Object)
	if Object then
		local Animate = Object:FindFirstChild("Animate")
		
		return if Animate and Animate:IsA("LocalScript") then Animate elseif Animate and Animate:IsA("Script") and Animate.RunContext == Enum.RunContext.Client then Animate else nil
	else
		return nil
	end
end

local _ = function(Object)
	local Object1 = nil
	if Object then
		local Animate = Object:FindFirstChild("Animate")
		Object1 = if Animate and Animate:IsA("LocalScript") then Animate elseif Animate and Animate:IsA("Script") and Animate.RunContext == Enum.RunContext.Client then Animate else nil
	else
		Object1 = nil
	end
	if Object1 then
		local PlayEmote = Object1:FindFirstChild("PlayEmote")
		
		return if PlayEmote and PlayEmote:IsA("BindableFunction") then PlayEmote else nil
	else
		return nil
	end
end

local _ = function(Object): boolean
	local Object1 = nil
	if Object then
		local Animate = Object:FindFirstChild("Animate")
		Object1 = if Animate and Animate:IsA("LocalScript") then Animate elseif Animate and Animate:IsA("Script") and Animate.RunContext == Enum.RunContext.Client then Animate else nil
	else
		Object1 = nil
	end
	local v1 = nil
	if Object1 then
		local PlayEmote = Object1:FindFirstChild("PlayEmote")
		v1 = if PlayEmote and PlayEmote:IsA("BindableFunction") then PlayEmote else nil
	else
		v1 = nil
	end
	return v1 ~= nil
end

local ChildAddedConnection = nil
local ChildAddedConnection1 = nil
local AncestryChangedConnection = nil

local _ = function()
	-- upvalues: ChildAddedConnection (ref), ChildAddedConnection1 (ref), AncestryChangedConnection (ref)
	if ChildAddedConnection then
		ChildAddedConnection:Disconnect()
		ChildAddedConnection = nil
	end
	if ChildAddedConnection1 then
		ChildAddedConnection1:Disconnect()
		ChildAddedConnection1 = nil
	end
	if AncestryChangedConnection then
		AncestryChangedConnection:Disconnect()
		AncestryChangedConnection = nil
	end
end

local Callback = nil

local _ = function(Object)
	-- upvalues: CanPlayEmotesModule (copy), Callback (ref)
	local Object1 = nil
	if Object then
		local Animate = Object:FindFirstChild("Animate")
		Object1 = if Animate and Animate:IsA("LocalScript") then Animate elseif Animate and Animate:IsA("Script") and Animate.RunContext == Enum.RunContext.Client then Animate else nil
	else
		Object1 = nil
	end
	local v1 = nil
	if Object1 then
		local PlayEmote = Object1:FindFirstChild("PlayEmote")
		v1 = if PlayEmote and PlayEmote:IsA("BindableFunction") then PlayEmote else nil
	else
		v1 = nil
	end
	local Value = v1 ~= nil
	
	if CanPlayEmotesModule.Value ~= Value then
		CanPlayEmotesModule.Value = Value
		CanPlayEmotesModule.ChangedEvent:Fire(Value)
	end
	Callback(Value, Object)
end

local _ = function(Object)
	-- upvalues: CanPlayEmotesModule (copy), Callback (ref), ChildAddedConnection (ref)
	local v1 = nil
	if Object then
		local Animate = Object:FindFirstChild("Animate")
		v1 = if Animate and Animate:IsA("LocalScript") then Animate elseif Animate and Animate:IsA("Script") and Animate.RunContext == Enum.RunContext.Client then Animate else nil
	else
		v1 = nil
	end
	if not v1 then
		ChildAddedConnection = Object.ChildAdded:Connect(function(Child)
			-- upvalues: Object (copy), CanPlayEmotesModule (upval), Callback (upval)
			if (Child:IsA("LocalScript") or Child:IsA("Script") and Child.RunContext == Enum.RunContext.Client) and Child.Name == "Animate" then
				local Object = nil
				if Object then
					local Animate = Object:FindFirstChild("Animate")
					Object = if Animate and Animate:IsA("LocalScript") then Animate elseif Animate and Animate:IsA("Script") and Animate.RunContext == Enum.RunContext.Client then Animate else nil
				else
					Object = nil
				end
				local v2 = nil
				if Object then
					local PlayEmote = Object:FindFirstChild("PlayEmote")
					v2 = if PlayEmote and PlayEmote:IsA("BindableFunction") then PlayEmote else nil
				else
					v2 = nil
				end
				local Value = v2 ~= nil
				
				if CanPlayEmotesModule.Value ~= Value then
					CanPlayEmotesModule.Value = Value
					CanPlayEmotesModule.ChangedEvent:Fire(Value)
				end
				Callback(Value, Object)
			end
		end)
		
		return
	end
	local Object1 = nil
	if Object then
		local Animate = Object:FindFirstChild("Animate")
		Object1 = if Animate and Animate:IsA("LocalScript") then Animate elseif Animate and Animate:IsA("Script") and Animate.RunContext == Enum.RunContext.Client then Animate else nil
	else
		Object1 = nil
	end
	local v2 = nil
	if Object1 then
		local PlayEmote = Object1:FindFirstChild("PlayEmote")
		v2 = if PlayEmote and PlayEmote:IsA("BindableFunction") then PlayEmote else nil
	else
		v2 = nil
	end
	local Value = v2 ~= nil
	
	if CanPlayEmotesModule.Value ~= Value then
		CanPlayEmotesModule.Value = Value
		CanPlayEmotesModule.ChangedEvent:Fire(Value)
	end
	Callback(Value, Object)
end

local _ = function(Object, p1)
	-- upvalues: CanPlayEmotesModule (copy), Callback (ref), ChildAddedConnection1 (ref)
	local Object1 = nil
	if Object then
		local Animate = Object:FindFirstChild("Animate")
		Object1 = if Animate and Animate:IsA("LocalScript") then Animate elseif Animate and Animate:IsA("Script") and Animate.RunContext == Enum.RunContext.Client then Animate else nil
	else
		Object1 = nil
	end
	local v1 = nil
	if Object1 then
		local PlayEmote = Object1:FindFirstChild("PlayEmote")
		v1 = if PlayEmote and PlayEmote:IsA("BindableFunction") then PlayEmote else nil
	else
		v1 = nil
	end
	if not v1 then
		ChildAddedConnection1 = p1.ChildAdded:Connect(function(Child)
			-- upvalues: Object (copy), CanPlayEmotesModule (upval), Callback (upval)
			if Child:IsA("BindableFunction") and Child.Name == "PlayEmote" then
				local Object = nil
				if Object then
					local Animate = Object:FindFirstChild("Animate")
					Object = if Animate and Animate:IsA("LocalScript") then Animate elseif Animate and Animate:IsA("Script") and Animate.RunContext == Enum.RunContext.Client then Animate else nil
				else
					Object = nil
				end
				local v2 = nil
				if Object then
					local PlayEmote = Object:FindFirstChild("PlayEmote")
					v2 = if PlayEmote and PlayEmote:IsA("BindableFunction") then PlayEmote else nil
				else
					v2 = nil
				end
				local Value = v2 ~= nil
				
				if CanPlayEmotesModule.Value ~= Value then
					CanPlayEmotesModule.Value = Value
					CanPlayEmotesModule.ChangedEvent:Fire(Value)
				end
				Callback(Value, Object)
			end
		end)
		
		return
	end
	local Object2 = nil
	if Object then
		local Animate = Object:FindFirstChild("Animate")
		Object2 = if Animate and Animate:IsA("LocalScript") then Animate elseif Animate and Animate:IsA("Script") and Animate.RunContext == Enum.RunContext.Client then Animate else nil
	else
		Object2 = nil
	end
	local v2 = nil
	if Object2 then
		local PlayEmote = Object2:FindFirstChild("PlayEmote")
		v2 = if PlayEmote and PlayEmote:IsA("BindableFunction") then PlayEmote else nil
	else
		v2 = nil
	end
	local Value = v2 ~= nil
	
	if CanPlayEmotesModule.Value ~= Value then
		CanPlayEmotesModule.Value = Value
		CanPlayEmotesModule.ChangedEvent:Fire(Value)
	end
	Callback(Value, Object)
end

local _ = function(Object)
	-- upvalues: CanPlayEmotesModule (copy), Callback (ref), AncestryChangedConnection (ref)
	local Object1 = nil
	if Object then
		local Animate = Object:FindFirstChild("Animate")
		Object1 = if Animate and Animate:IsA("LocalScript") then Animate elseif Animate and Animate:IsA("Script") and Animate.RunContext == Enum.RunContext.Client then Animate else nil
	else
		Object1 = nil
	end
	local v1 = nil
	if Object1 then
		local PlayEmote = Object1:FindFirstChild("PlayEmote")
		v1 = if PlayEmote and PlayEmote:IsA("BindableFunction") then PlayEmote else nil
	else
		v1 = nil
	end
	if v1 then
		AncestryChangedConnection = v1.AncestryChanged:Connect(function(_, NewParent)
			-- upvalues: v1 (copy), Object (copy), CanPlayEmotesModule (upval), Callback (upval)
			if not NewParent or not v1:IsDescendantOf(Object) then
				local Object = nil
				if Object then
					local Animate = Object:FindFirstChild("Animate")
					Object = if Animate and Animate:IsA("LocalScript") then Animate elseif Animate and Animate:IsA("Script") and Animate.RunContext == Enum.RunContext.Client then Animate else nil
				else
					Object = nil
				end
				local v2 = nil
				if Object then
					local PlayEmote = Object:FindFirstChild("PlayEmote")
					v2 = if PlayEmote and PlayEmote:IsA("BindableFunction") then PlayEmote else nil
				else
					v2 = nil
				end
				local Value = v2 ~= nil
				
				if CanPlayEmotesModule.Value ~= Value then
					CanPlayEmotesModule.Value = Value
					CanPlayEmotesModule.ChangedEvent:Fire(Value)
				end
				Callback(Value, Object)
			end
		end)
		
		return
	end
	local Object2 = nil
	if Object then
		local Animate = Object:FindFirstChild("Animate")
		Object2 = if Animate and Animate:IsA("LocalScript") then Animate elseif Animate and Animate:IsA("Script") and Animate.RunContext == Enum.RunContext.Client then Animate else nil
	else
		Object2 = nil
	end
	local v2 = nil
	if Object2 then
		local PlayEmote = Object2:FindFirstChild("PlayEmote")
		v2 = if PlayEmote and PlayEmote:IsA("BindableFunction") then PlayEmote else nil
	else
		v2 = nil
	end
	local Value = v2 ~= nil
	
	if CanPlayEmotesModule.Value ~= Value then
		CanPlayEmotesModule.Value = Value
		CanPlayEmotesModule.ChangedEvent:Fire(Value)
	end
	Callback(Value, Object)
end

Callback = function(p1, Object)
	-- upvalues: ChildAddedConnection (ref), ChildAddedConnection1 (ref), AncestryChangedConnection (ref), CanPlayEmotesModule (copy), Callback (ref)
	if ChildAddedConnection then
		ChildAddedConnection:Disconnect()
		ChildAddedConnection = nil
	end
	if ChildAddedConnection1 then
		ChildAddedConnection1:Disconnect()
		ChildAddedConnection1 = nil
	end
	if AncestryChangedConnection then
		AncestryChangedConnection:Disconnect()
		AncestryChangedConnection = nil
	end
	if not Object then return end
	if p1 then
		local Object1 = nil
		if Object then
			local Animate = Object:FindFirstChild("Animate")
			Object1 = if Animate and Animate:IsA("LocalScript") then Animate elseif Animate and Animate:IsA("Script") and Animate.RunContext == Enum.RunContext.Client then Animate else nil
		else
			Object1 = nil
		end
		local Object2 = nil
		if Object1 then
			local PlayEmote = Object1:FindFirstChild("PlayEmote")
			Object2 = if PlayEmote and PlayEmote:IsA("BindableFunction") then PlayEmote else nil
		else
			Object2 = nil
		end
		if Object2 then
			AncestryChangedConnection = Object2.AncestryChanged:Connect(function(_, NewParent)
				-- upvalues: Object2 (copy), Object (copy), CanPlayEmotesModule (upval), Callback (upval)
				if not NewParent or not Object2:IsDescendantOf(Object) then
					local Object = nil
					if Object then
						local Animate = Object:FindFirstChild("Animate")
						Object = if Animate and Animate:IsA("LocalScript") then Animate elseif Animate and Animate:IsA("Script") and Animate.RunContext == Enum.RunContext.Client then Animate else nil
					else
						Object = nil
					end
					local v1 = nil
					if Object then
						local PlayEmote = Object:FindFirstChild("PlayEmote")
						v1 = if PlayEmote and PlayEmote:IsA("BindableFunction") then PlayEmote else nil
					else
						v1 = nil
					end
					local Value = v1 ~= nil
					
					if CanPlayEmotesModule.Value ~= Value then
						CanPlayEmotesModule.Value = Value
						CanPlayEmotesModule.ChangedEvent:Fire(Value)
					end
					Callback(Value, Object)
				end
			end)
			
			return
		end
		local Object3 = nil
		if Object then
			local Animate = Object:FindFirstChild("Animate")
			Object3 = if Animate and Animate:IsA("LocalScript") then Animate elseif Animate and Animate:IsA("Script") and Animate.RunContext == Enum.RunContext.Client then Animate else nil
		else
			Object3 = nil
		end
		local v1 = nil
		if Object3 then
			local PlayEmote = Object3:FindFirstChild("PlayEmote")
			v1 = if PlayEmote and PlayEmote:IsA("BindableFunction") then PlayEmote else nil
		else
			v1 = nil
		end
		local Value = v1 ~= nil
		
		if CanPlayEmotesModule.Value ~= Value then
			CanPlayEmotesModule.Value = Value
			CanPlayEmotesModule.ChangedEvent:Fire(Value)
		end
		Callback(Value, Object)
		
		return
	else
		local v2 = nil
		if Object then
			local Animate = Object:FindFirstChild("Animate")
			v2 = if Animate and Animate:IsA("LocalScript") then Animate elseif Animate and Animate:IsA("Script") and Animate.RunContext == Enum.RunContext.Client then Animate else nil
		else
			v2 = nil
		end
		if v2 then
			local Object4 = nil
			if Object then
				local Animate = Object:FindFirstChild("Animate")
				Object4 = if Animate and Animate:IsA("LocalScript") then Animate elseif Animate and Animate:IsA("Script") and Animate.RunContext == Enum.RunContext.Client then Animate else nil
			else
				Object4 = nil
			end
			local v3 = nil
			if Object4 then
				local PlayEmote = Object4:FindFirstChild("PlayEmote")
				v3 = if PlayEmote and PlayEmote:IsA("BindableFunction") then PlayEmote else nil
			else
				v3 = nil
			end
			if not v3 then
				ChildAddedConnection1 = v2.ChildAdded:Connect(function(Child)
					-- upvalues: Object (copy), CanPlayEmotesModule (upval), Callback (upval)
					if Child:IsA("BindableFunction") and Child.Name == "PlayEmote" then
						local Object = nil
						if Object then
							local Animate = Object:FindFirstChild("Animate")
							Object = if Animate and Animate:IsA("LocalScript") then Animate elseif Animate and Animate:IsA("Script") and Animate.RunContext == Enum.RunContext.Client then Animate else nil
						else
							Object = nil
						end
						local v4 = nil
						if Object then
							local PlayEmote = Object:FindFirstChild("PlayEmote")
							v4 = if PlayEmote and PlayEmote:IsA("BindableFunction") then PlayEmote else nil
						else
							v4 = nil
						end
						local Value = v4 ~= nil
						
						if CanPlayEmotesModule.Value ~= Value then
							CanPlayEmotesModule.Value = Value
							CanPlayEmotesModule.ChangedEvent:Fire(Value)
						end
						Callback(Value, Object)
					end
				end)
				
				return
			end
			local Object5 = nil
			if Object then
				local Animate = Object:FindFirstChild("Animate")
				Object5 = if Animate and Animate:IsA("LocalScript") then Animate elseif Animate and Animate:IsA("Script") and Animate.RunContext == Enum.RunContext.Client then Animate else nil
			else
				Object5 = nil
			end
			local v4 = nil
			if Object5 then
				local PlayEmote = Object5:FindFirstChild("PlayEmote")
				v4 = if PlayEmote and PlayEmote:IsA("BindableFunction") then PlayEmote else nil
			else
				v4 = nil
			end
			local Value = v4 ~= nil
			
			if CanPlayEmotesModule.Value ~= Value then
				CanPlayEmotesModule.Value = Value
				CanPlayEmotesModule.ChangedEvent:Fire(Value)
			end
			Callback(Value, Object)
			
			return
		else
			local v5 = nil
			if Object then
				local Animate = Object:FindFirstChild("Animate")
				v5 = if Animate and Animate:IsA("LocalScript") then Animate elseif Animate and Animate:IsA("Script") and Animate.RunContext == Enum.RunContext.Client then Animate else nil
			else
				v5 = nil
			end
			if not v5 then
				ChildAddedConnection = Object.ChildAdded:Connect(function(Child)
					-- upvalues: Object (copy), CanPlayEmotesModule (upval), Callback (upval)
					if (Child:IsA("LocalScript") or Child:IsA("Script") and Child.RunContext == Enum.RunContext.Client) and Child.Name == "Animate" then
						local Object = nil
						if Object then
							local Animate = Object:FindFirstChild("Animate")
							Object = if Animate and Animate:IsA("LocalScript") then Animate elseif Animate and Animate:IsA("Script") and Animate.RunContext == Enum.RunContext.Client then Animate else nil
						else
							Object = nil
						end
						local v6 = nil
						if Object then
							local PlayEmote = Object:FindFirstChild("PlayEmote")
							v6 = if PlayEmote and PlayEmote:IsA("BindableFunction") then PlayEmote else nil
						else
							v6 = nil
						end
						local Value = v6 ~= nil
						
						if CanPlayEmotesModule.Value ~= Value then
							CanPlayEmotesModule.Value = Value
							CanPlayEmotesModule.ChangedEvent:Fire(Value)
						end
						Callback(Value, Object)
					end
				end)
				
				return
			end
			local Animate1 = nil
			if Object then
				local Animate = Object:FindFirstChild("Animate")
				Animate1 = if Animate and Animate:IsA("LocalScript") then Animate elseif Animate and Animate:IsA("Script") and Animate.RunContext == Enum.RunContext.Client then Animate else nil
			else
				Animate1 = nil
			end
			local PlayEmote1 = nil
			if Animate1 then
				local PlayEmote = Animate1:FindFirstChild("PlayEmote")
				PlayEmote1 = if PlayEmote and PlayEmote:IsA("BindableFunction") then PlayEmote else nil
			else
				PlayEmote1 = nil
			end
			local HasPlayEmote = PlayEmote1 ~= nil
			
			if CanPlayEmotesModule.Value ~= HasPlayEmote then
				CanPlayEmotesModule.Value = HasPlayEmote
				CanPlayEmotesModule.ChangedEvent:Fire(HasPlayEmote)
			end
			Callback(HasPlayEmote, Object)
		end
	end
end

local _ = function(Object)
	-- upvalues: ChildAddedConnection (ref), ChildAddedConnection1 (ref), AncestryChangedConnection (ref), CanPlayEmotesModule (copy), Callback (ref)
	if ChildAddedConnection then
		ChildAddedConnection:Disconnect()
		ChildAddedConnection = nil
	end
	if ChildAddedConnection1 then
		ChildAddedConnection1:Disconnect()
		ChildAddedConnection1 = nil
	end
	if AncestryChangedConnection then
		AncestryChangedConnection:Disconnect()
		AncestryChangedConnection = nil
	end
	local Object1 = nil
	if Object then
		local Animate = Object:FindFirstChild("Animate")
		Object1 = if Animate and Animate:IsA("LocalScript") then Animate elseif Animate and Animate:IsA("Script") and Animate.RunContext == Enum.RunContext.Client then Animate else nil
	else
		Object1 = nil
	end
	local v1 = nil
	if Object1 then
		local PlayEmote = Object1:FindFirstChild("PlayEmote")
		v1 = if PlayEmote and PlayEmote:IsA("BindableFunction") then PlayEmote else nil
	else
		v1 = nil
	end
	local Value = v1 ~= nil
	
	if CanPlayEmotesModule.Value ~= Value then
		CanPlayEmotesModule.Value = Value
		CanPlayEmotesModule.ChangedEvent:Fire(Value)
	end
	Callback(Value, Object)
end

LocalPlayer:GetPropertyChangedSignal("Character"):Connect(function()
	-- upvalues: LocalPlayer (ref), ChildAddedConnection (ref), ChildAddedConnection1 (ref), AncestryChangedConnection (ref), CanPlayEmotesModule (copy), Callback (ref)
	local Character = LocalPlayer.Character
	
	if ChildAddedConnection then
		ChildAddedConnection:Disconnect()
		ChildAddedConnection = nil
	end
	if ChildAddedConnection1 then
		ChildAddedConnection1:Disconnect()
		ChildAddedConnection1 = nil
	end
	if AncestryChangedConnection then
		AncestryChangedConnection:Disconnect()
		AncestryChangedConnection = nil
	end
	local Object = nil
	if Character then
		local Animate = Character:FindFirstChild("Animate")
		Object = if Animate and Animate:IsA("LocalScript") then Animate elseif Animate and Animate:IsA("Script") and Animate.RunContext == Enum.RunContext.Client then Animate else nil
	else
		Object = nil
	end
	local v1 = nil
	if Object then
		local PlayEmote = Object:FindFirstChild("PlayEmote")
		v1 = if PlayEmote and PlayEmote:IsA("BindableFunction") then PlayEmote else nil
	else
		v1 = nil
	end
	local Value = v1 ~= nil
	
	if CanPlayEmotesModule.Value ~= Value then
		CanPlayEmotesModule.Value = Value
		CanPlayEmotesModule.ChangedEvent:Fire(Value)
	end
	Callback(Value, Character)
end)
local Character = LocalPlayer.Character

if ChildAddedConnection then
	ChildAddedConnection:Disconnect()
	ChildAddedConnection = nil
end
if ChildAddedConnection1 then
	ChildAddedConnection1:Disconnect()
	ChildAddedConnection1 = nil
end
if AncestryChangedConnection then
	AncestryChangedConnection:Disconnect()
	AncestryChangedConnection = nil
end
local Object = nil
if Character then
	local Animate = Character:FindFirstChild("Animate")
	Object = if Animate and Animate:IsA("LocalScript") then Animate elseif Animate and Animate:IsA("Script") and Animate.RunContext == Enum.RunContext.Client then Animate else nil
else
	Object = nil
end
local v1 = nil
if Object then
	local PlayEmote = Object:FindFirstChild("PlayEmote")
	v1 = if PlayEmote and PlayEmote:IsA("BindableFunction") then PlayEmote else nil
else
	v1 = nil
end
local Value = v1 ~= nil

if CanPlayEmotesModule.Value ~= Value then
	CanPlayEmotesModule.Value = Value
	CanPlayEmotesModule.ChangedEvent:Fire(Value)
end
Callback(Value, Character)

return CanPlayEmotesModule