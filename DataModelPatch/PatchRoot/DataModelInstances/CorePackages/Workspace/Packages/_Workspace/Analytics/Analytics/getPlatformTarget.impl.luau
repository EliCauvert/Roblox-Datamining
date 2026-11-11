return function(UserInputService)
	return function(): string
		-- upvalues: UserInputService (copy)
		local v1 = "unknownLua"
		local None = Enum.Platform.None
		pcall(function()
			-- upvalues: None (ref), UserInputService (upval)
			None = UserInputService:GetPlatform()
		end)
		local IsNoneMatch: boolean = None == Enum.Platform.Windows or None == Enum.Platform.OSX
		local IsNoneMatch1: boolean = None == Enum.Platform.IOS or None == Enum.Platform.Android or None == Enum.Platform.UWP
		local IsNoneMatch2: boolean = None == Enum.Platform.XBox360 or None == Enum.Platform.XBoxOne or (None == Enum.Platform.PS3 or (None == Enum.Platform.PS4 or game:GetEngineFeature("PlatformEnumPS5") and None == Enum.Platform.PS5)) or None == Enum.Platform.WiiU
		
		return if IsNoneMatch then "client" elseif IsNoneMatch1 then "mobile" elseif IsNoneMatch2 then "console" else v1 .. tostring(None)
	end
end