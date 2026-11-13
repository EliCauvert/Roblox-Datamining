local Parent = script.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local ReactRobloxModule = require(Parent1.ReactRoblox)
local FoundationModule = require(Parent1.Foundation)
local FoundationProvider = FoundationModule.FoundationProvider
local ColorMode = FoundationModule.Enums.ColorMode
local FFlagPlayerListContrastingTeamTextModule = require(Parent.Flags.FFlagPlayerListContrastingTeamText)
local config = {
	Default = ColorMode.Dark,
	Light = ColorMode.Light,
	Dark = ColorMode.Dark
}

return {
	name = "PlayerList",
	storyRoots = { Parent },
	roact = ReactModule,
	reactRoblox = ReactRobloxModule,
	mapStory = function(p1)
		-- upvalues: FFlagPlayerListContrastingTeamTextModule (copy), ReactModule (copy), FoundationProvider (copy), config (copy), ColorMode (copy)
		return function(p2)
			-- upvalues: FFlagPlayerListContrastingTeamTextModule (upval), ReactModule (upval), FoundationProvider (upval), config (upval), ColorMode (upval), p1 (copy)
			local Settings = p2.settings
			
			if not FFlagPlayerListContrastingTeamTextModule then
				local UserGameSettings = UserSettings():GetService("UserGameSettings")
				local PreferredTransparency = if Settings then Settings.preferredTransparency else nil
				ReactModule.useEffect(function()
					-- upvalues: UserGameSettings (copy)
					local PreferredTransparency = UserGameSettings.PreferredTransparency
					
					return function()
						-- upvalues: UserGameSettings (upval), PreferredTransparency (copy)
						UserGameSettings.PreferredTransparency = PreferredTransparency
					end
				end, {})
				ReactModule.useEffect(function()
					-- upvalues: PreferredTransparency (copy), UserGameSettings (copy)
					if PreferredTransparency ~= nil then
						UserGameSettings.PreferredTransparency = PreferredTransparency
						
						return
					end
				end, { PreferredTransparency })
			end
			return ReactModule.createElement(FoundationProvider, {
				colorMode = config[p2.theme] or ColorMode.Dark,
				preferences = Settings,
				scale = if Settings then Settings.scale else nil
			}, { Child = ReactModule.createElement(p1, p2) })
		end
	end
}