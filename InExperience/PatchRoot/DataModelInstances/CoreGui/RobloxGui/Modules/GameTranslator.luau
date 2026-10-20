local LocalizationService = game:GetService("LocalizationService")
local Players = game:GetService("Players")
local TranslatorForPlayer = nil
local LocalPlayer = nil
local LocaleId = nil
local Connection = nil
local BindableEvent = Instance.new("BindableEvent")

local function handlePlayerOrLocaleChanged()
	-- upvalues: LocalPlayer (ref), LocaleId (ref), BindableEvent (copy)
	if LocalPlayer and LocalPlayer.LocaleId ~= LocaleId then
		LocaleId = LocalPlayer.LocaleId
		BindableEvent:Fire(LocaleId)
	end
end

local function _()
	-- upvalues: TranslatorForPlayer (ref), LocalPlayer (ref), Connection (ref)
	TranslatorForPlayer = nil
	LocalPlayer = nil
	
	if Connection then
		Connection:Disconnect()
		Connection = nil
	end
end

local _ = function()
	-- upvalues: TranslatorForPlayer (ref), LocalPlayer (ref), Players (copy), LocalizationService (copy), LocaleId (ref), BindableEvent (copy), Connection (ref), handlePlayerOrLocaleChanged (copy)
	if not TranslatorForPlayer then
		LocalPlayer = Players.LocalPlayer
		
		if LocalPlayer then
			TranslatorForPlayer = LocalizationService:GetTranslatorForPlayer(LocalPlayer)
			
			if LocalPlayer and LocalPlayer.LocaleId ~= LocaleId then
				LocaleId = LocalPlayer.LocaleId
				BindableEvent:Fire(LocaleId)
			end
			Connection = LocalPlayer:GetPropertyChangedSignal("LocaleId"):Connect(handlePlayerOrLocaleChanged)
		end
	end
	return TranslatorForPlayer
end

local t = {}

local _ = function(Key)
	-- upvalues: t (copy)
	local Entry = t[Key]
	
	if Entry then
		Entry.connection:Disconnect()
		t[Key] = nil
		
		return
	end
end

local _ = function(p1, p2)
	-- upvalues: t (copy)
	return function(_, _)
		-- upvalues: p1 (copy), p2 (copy), t (upval)
		if game:IsAncestorOf(p1) then
			p2.hasBeenAdded = true
		elseif p2.hasBeenAdded then
			local v1 = t[p1]
			
			if v1 then
				v1.connection:Disconnect()
				t[p1] = nil
				
				return
			end
			return
		end
	end
end

local _ = function(p1, Context, Text)
	p1.context = Context
	p1.text = Text
end

local function makeRegistryInfo(Key, Context, Text)
	-- upvalues: t (copy)
	local config = {
		hasBeenAdded = game:IsAncestorOf(Key),
		context = Context,
		text = Text
	}
	config.connection = Key.AncestryChanged:Connect(function(_, _)
		-- upvalues: Key (copy), config (copy), t (upval)
		if game:IsAncestorOf(Key) then
			config.hasBeenAdded = true
		elseif config.hasBeenAdded then
			local v1 = t[Key]
			
			if v1 then
				v1.connection:Disconnect()
				t[Key] = nil
				
				return
			end
			return
		end
	end)
	
	return config
end

local _ = function(Key, Context, Text)
	-- upvalues: t (copy), makeRegistryInfo (copy)
	if t[Key] == nil then
		t[Key] = makeRegistryInfo(Key, Context, Text)
		
		return
	else
		local Entry = t[Key]
		Entry.context = Context
		Entry.text = Text
	end
end

Players:GetPropertyChangedSignal("LocalPlayer"):Connect(function()
	-- upvalues: TranslatorForPlayer (ref), LocalPlayer (ref), Connection (ref), Players (copy), LocalizationService (copy), LocaleId (ref), BindableEvent (copy), handlePlayerOrLocaleChanged (copy)
	TranslatorForPlayer = nil
	LocalPlayer = nil
	
	if Connection then
		Connection:Disconnect()
		Connection = nil
	end
	if not TranslatorForPlayer then
		LocalPlayer = Players.LocalPlayer
		
		if LocalPlayer then
			TranslatorForPlayer = LocalizationService:GetTranslatorForPlayer(LocalPlayer)
			
			if LocalPlayer and LocalPlayer.LocaleId ~= LocaleId then
				LocaleId = LocalPlayer.LocaleId
				BindableEvent:Fire(LocaleId)
			end
			Connection = LocalPlayer:GetPropertyChangedSignal("LocaleId"):Connect(handlePlayerOrLocaleChanged)
		end
	end
end)
local GameTranslatorModule = {
	LocaleChanged = BindableEvent.Event,
	TranslateGameText = function(_, Context, p1)
		-- upvalues: TranslatorForPlayer (ref), LocalPlayer (ref), Players (copy), LocalizationService (copy), LocaleId (ref), BindableEvent (copy), Connection (ref), handlePlayerOrLocaleChanged (copy)
		if not TranslatorForPlayer then
			LocalPlayer = Players.LocalPlayer
			
			if LocalPlayer then
				TranslatorForPlayer = LocalizationService:GetTranslatorForPlayer(LocalPlayer)
				
				if LocalPlayer and LocalPlayer.LocaleId ~= LocaleId then
					LocaleId = LocalPlayer.LocaleId
					BindableEvent:Fire(LocaleId)
				end
				Connection = LocalPlayer:GetPropertyChangedSignal("LocaleId"):Connect(handlePlayerOrLocaleChanged)
			end
		end
		local TranslatorForPlayer1 = TranslatorForPlayer
		
		return if TranslatorForPlayer1 then TranslatorForPlayer1:RobloxOnlyTranslate(Context, p1) else p1
	end
}
LocalizationService.AutoTranslateWillRun:Connect(function()
	-- upvalues: t (copy), GameTranslatorModule (copy)
	for i, value in pairs(t) do
		i.Text = GameTranslatorModule:TranslateGameText(value.context, value.text)
	end
end)

function GameTranslatorModule.TranslateAndRegister(p1, Key, Context, Text)
	-- upvalues: t (copy), makeRegistryInfo (copy)
	Key.Text = p1:TranslateGameText(Context, Text)
	
	if t[Key] == nil then
		t[Key] = makeRegistryInfo(Key, Context, Text)
		
		return Text
	else
		local Entry = t[Key]
		Entry.context = Context
		Entry.text = Text
		
		return Text
	end
end

return GameTranslatorModule