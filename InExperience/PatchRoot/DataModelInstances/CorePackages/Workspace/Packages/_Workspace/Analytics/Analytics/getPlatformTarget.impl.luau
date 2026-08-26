return function(p1)
	return function()
		-- upvalues: p1 (ref)
		local var1 = "unknownLua"
		local none = Enum.Platform.None
		pcall(function()
			-- upvalues: none (write), p1 (copy)
			none = p1:GetPlatform()
		end)
		local var2 = if none ~= Enum.Platform.XBox360 then none == Enum.Platform.XBoxOne else true
		
		return if if none ~= Enum.Platform.Windows then none == Enum.Platform.OSX else true then "client" elseif (if none ~= Enum.Platform.IOS then none == Enum.Platform.Android else true) or none == Enum.Platform.UWP then "mobile" elseif (var2 or (if none ~= Enum.Platform.PS3 then if none ~= Enum.Platform.PS4 then game:GetEngineFeature("PlatformEnumPS5") and none == Enum.Platform.PS5 else true else true)) or none == Enum.Platform.WiiU then "console" else var1 .. tostring(none)
	end
end