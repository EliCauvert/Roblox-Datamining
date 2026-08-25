local localizationService = game:GetService("LocalizationService")
local playersService = game:GetService("Players")
local var2 = nil
local var3 = nil
local var4 = nil
local var5 = nil
local bindableEvent = Instance.new("BindableEvent")

local function handlePlayerOrLocaleChanged()
	-- upvalues: var3 (write), var4 (write), bindableEvent (ref)
	if var3 and var3.LocaleId ~= var4 then
		var4 = var3.LocaleId
		bindableEvent:Fire(var4)
	end
end

local function _()
	-- upvalues: var2 (write), var3 (write), var5 (write)
	var2 = nil
	var3 = nil
	
	if var5 then
		var5:Disconnect()
		var5 = nil
	end
end

local _ = function()
	-- upvalues: var2 (write), var3 (write), playersService (ref), localizationService (ref), var4 (write), bindableEvent (ref), var5 (write), handlePlayerOrLocaleChanged (ref)
	if not var2 then
		var3 = playersService.LocalPlayer
		
		if var3 then
			var2 = localizationService:GetTranslatorForPlayer(var3)
			
			if var3 and var3.LocaleId ~= var4 then
				var4 = var3.LocaleId
				bindableEvent:Fire(var4)
			end
			var5 = var3:GetPropertyChangedSignal("LocaleId"):Connect(handlePlayerOrLocaleChanged)
		end
	end
	return var2
end

local t = {}

local _ = function(p0)
	-- upvalues: t (ref)
	local var11 = t[p0]
	
	if var11 then
		var11.connection:Disconnect()
		t[p0] = nil
		
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
		local var12 = p1
		local var13 = t[var12]
		
		if var13 then
			var13.connection:Disconnect()
			t[var12] = nil
			
			return
		end
		return
	end
end

local _ = function(p3, p4, p5)
	p3.context = p4
	p3.text = p5
end

local function makeRegistryInfo(p6, p7, p8)
	-- upvalues: t (ref)
	local t_1 = {
		hasBeenAdded = game:IsAncestorOf(p6),
		context = p7,
		text = p8
	}
	t_1.connection = p6.AncestryChanged:Connect(function(_, _)
		-- upvalues: p6 (ref), t_1 (ref), t (copy)
		if game:IsAncestorOf(p6) then
			t_1.hasBeenAdded = true
		elseif not t_1.hasBeenAdded then return end
		local var12 = p6
		local var13 = t[var12]
		
		if var13 then
			var13.connection:Disconnect()
			t[var12] = nil
			
			return
		end
		return
	end)
	
	return t_1
end

local _ = function(p9, p10, p11)
	-- upvalues: t (ref), makeRegistryInfo (ref)
	if t[p9] == nil then
		t[p9] = makeRegistryInfo(p9, p10, p11)
		
		return
	end
	local var15 = t[p9]
	var15.context = p10
	var15.text = p11
end

playersService:GetPropertyChangedSignal("LocalPlayer"):Connect(function()
	-- upvalues: var2 (write), var3 (write), var5 (write), playersService (ref), localizationService (ref), var4 (write), bindableEvent (ref), handlePlayerOrLocaleChanged (ref)
	var2 = nil
	var3 = nil
	
	if var5 then
		var5:Disconnect()
		var5 = nil
	end
	var3 = playersService.LocalPlayer
	
	if var3 then
		var2 = localizationService:GetTranslatorForPlayer(var3)
		
		if var3 and var3.LocaleId ~= var4 then
			var4 = var3.LocaleId
			bindableEvent:Fire(var4)
		end
		var5 = var3:GetPropertyChangedSignal("LocaleId"):Connect(handlePlayerOrLocaleChanged)
	end
end)
local t_1 = {
	LocaleChanged = bindableEvent.Event,
	TranslateGameText = function(_, p12, p13)
		-- upvalues: var2 (write), var3 (write), playersService (ref), localizationService (ref), var4 (write), bindableEvent (ref), var5 (write), handlePlayerOrLocaleChanged (ref)
		if not var2 then
			var3 = playersService.LocalPlayer
			
			if var3 then
				var2 = localizationService:GetTranslatorForPlayer(var3)
				
				if var3 and var3.LocaleId ~= var4 then
					var4 = var3.LocaleId
					bindableEvent:Fire(var4)
				end
				var5 = var3:GetPropertyChangedSignal("LocaleId"):Connect(handlePlayerOrLocaleChanged)
			end
		end
		local var16 = var2
		
		return if var16 then var16:RobloxOnlyTranslate(p12, p13) else p13
	end
}
localizationService.AutoTranslateWillRun:Connect(function()
	-- upvalues: t (ref), t_1 (ref)
	for i, v in pairs(t) do
		i.Text = t_1:TranslateGameText(v.context, v.text)
	end
end)

function t_1.TranslateAndRegister(p14, p15, p16, p17)
	-- upvalues: t (ref), makeRegistryInfo (ref)
	p15.Text = p14:TranslateGameText(p16, p17)
	
	if t[p15] == nil then
		t[p15] = makeRegistryInfo(p15, p16, p17)
		
		return p17
	end
	local var17 = t[p15]
	var17.context = p16
	var17.text = p17
	
	return p17
end

return t_1