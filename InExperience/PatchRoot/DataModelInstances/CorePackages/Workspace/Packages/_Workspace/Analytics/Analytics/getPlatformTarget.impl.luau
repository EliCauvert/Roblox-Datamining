return function(p0)
	return function()
		-- upvalues: p0 (ref)
		local var0 = "unknownLua"
		local none = Enum.Platform.None
		pcall(function()
			-- upvalues: none (write), p0 (copy)
			none = p0:GetPlatform()
		end)
		local var1 = if none ~= Enum.Platform.XBox360 then none == Enum.Platform.XBoxOne else true
		
		return if if none ~= Enum.Platform.Windows then none == Enum.Platform.OSX else true then "client" elseif (if none ~= Enum.Platform.IOS then none == Enum.Platform.Android else true) or none == Enum.Platform.UWP then "mobile" elseif (var1 or (if none ~= Enum.Platform.PS3 then if none ~= Enum.Platform.PS4 then game:GetEngineFeature("PlatformEnumPS5") and none == Enum.Platform.PS5 else true else true)) or none == Enum.Platform.WiiU then "console" else var0 .. tostring(none)
	end
end