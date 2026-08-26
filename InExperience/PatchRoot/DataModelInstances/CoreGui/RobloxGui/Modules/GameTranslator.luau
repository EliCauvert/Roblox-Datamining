local localizationService = game:GetService("LocalizationService")
local playersService = game:GetService("Players")
local var1 = nil
local var2 = nil
local var3 = nil
local var4 = nil
local bindableEvent = Instance.new("BindableEvent")

local function handlePlayerOrLocaleChanged()
	-- upvalues: var2 (write), var3 (write), bindableEvent (ref)
	if var2 and var2.LocaleId ~= var3 then
		var3 = var2.LocaleId
		bindableEvent:Fire(var3)
	end
end

local function _()
	-- upvalues: var1 (write), var2 (write), var4 (write)
	var1 = nil
	var2 = nil
	
	if var4 then
		var4:Disconnect()
		var4 = nil
	end
end

local _ = function()
	-- upvalues: var1 (write), var2 (write), playersService (ref), localizationService (ref), var3 (write), bindableEvent (ref), var4 (write), handlePlayerOrLocaleChanged (ref)
	if not var1 then
		var2 = playersService.LocalPlayer
		
		if var2 then
			var1 = localizationService:GetTranslatorForPlayer(var2)
			
			if var2 and var2.LocaleId ~= var3 then
				var3 = var2.LocaleId
				bindableEvent:Fire(var3)
			end
			var4 = var2:GetPropertyChangedSignal("LocaleId"):Connect(handlePlayerOrLocaleChanged)
		end
	end
	return var1
end

local t = {}

local _ = function(p1)
	-- upvalues: t (ref)
	local var5 = t[p1]
	
	if var5 then
		var5.connection:Disconnect()
		t[p1] = nil
		
		return
	end
end

local _ = function(p1, p2)
	-- upvalues: t (ref)
	return function(_, _)
		-- upvalues: p1 (ref), p2 (ref), t (copy)
		if game:IsAncestorOf(p1) then
			p2.hasBeenAdded = true
		elseif not p2.hasBeenAdded then return end
		local var5 = p1
		local var6 = t[var5]
		
		if var6 then
			var6.connection:Disconnect()
			t[var5] = nil
			
			return
		end
		return
	end
end

local _ = function(p1, p2, p3)
	p1.context = p2
	p1.text = p3
end

local function makeRegistryInfo(p1, p2, p3)
	-- upvalues: t (ref)
	local t_1 = {
		hasBeenAdded = game:IsAncestorOf(p1),
		context = p2,
		text = p3
	}
	t_1.connection = p1.AncestryChanged:Connect(function(_, _)
		-- upvalues: p1 (ref), t_1 (ref), t (copy)
		if game:IsAncestorOf(p1) then
			t_1.hasBeenAdded = true
		elseif not t_1.hasBeenAdded then return end
		local var5 = p1
		local var6 = t[var5]
		
		if var6 then
			var6.connection:Disconnect()
			t[var5] = nil
			
			return
		end
		return
	end)
	
	return t_1
end

local _ = function(p1, p2, p3)
	-- upvalues: t (ref), makeRegistryInfo (ref)
	if t[p1] == nil then
		t[p1] = makeRegistryInfo(p1, p2, p3)
		
		return
	end
	local var5 = t[p1]
	var5.context = p2
	var5.text = p3
end

playersService:GetPropertyChangedSignal("LocalPlayer"):Connect(function()
	-- upvalues: var1 (write), var2 (write), var4 (write), playersService (ref), localizationService (ref), var3 (write), bindableEvent (ref), handlePlayerOrLocaleChanged (ref)
	var1 = nil
	var2 = nil
	
	if var4 then
		var4:Disconnect()
		var4 = nil
	end
	var2 = playersService.LocalPlayer
	
	if var2 then
		var1 = localizationService:GetTranslatorForPlayer(var2)
		
		if var2 and var2.LocaleId ~= var3 then
			var3 = var2.LocaleId
			bindableEvent:Fire(var3)
		end
		var4 = var2:GetPropertyChangedSignal("LocaleId"):Connect(handlePlayerOrLocaleChanged)
	end
end)
local t_1 = {
	LocaleChanged = bindableEvent.Event,
	TranslateGameText = function(_, p1, p2)
		-- upvalues: var1 (write), var2 (write), playersService (ref), localizationService (ref), var3 (write), bindableEvent (ref), var4 (write), handlePlayerOrLocaleChanged (ref)
		if not var1 then
			var2 = playersService.LocalPlayer
			
			if var2 then
				var1 = localizationService:GetTranslatorForPlayer(var2)
				
				if var2 and var2.LocaleId ~= var3 then
					var3 = var2.LocaleId
					bindableEvent:Fire(var3)
				end
				var4 = var2:GetPropertyChangedSignal("LocaleId"):Connect(handlePlayerOrLocaleChanged)
			end
		end
		local var5 = var1
		
		return if var5 then var5:RobloxOnlyTranslate(p1, p2) else p2
	end
}
localizationService.AutoTranslateWillRun:Connect(function()
	-- upvalues: t (ref), t_1 (ref)
	for i, v in pairs(t) do
		i.Text = t_1:TranslateGameText(v.context, v.text)
	end
end)

function t_1.TranslateAndRegister(p1, p2, p3, p4)
	-- upvalues: t (ref), makeRegistryInfo (ref)
	p2.Text = p1:TranslateGameText(p3, p4)
	
	if t[p2] == nil then
		t[p2] = makeRegistryInfo(p2, p3, p4)
		
		return p4
	end
	local var5 = t[p2]
	var5.context = p3
	var5.text = p4
	
	return p4
end

return t_1