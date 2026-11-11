local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactModule = require(CorePackages.Packages.Roact)
local RoactLocalizationModule = require(Modules.LuaApp.Services.RoactLocalization)
local WithLocalizationModule = require(Modules.LuaApp.withLocalization)

return if require(Modules.LuaApp.Flags.GetFFlagLuaAppUseWithLocalization)() then function(p1)
	-- upvalues: WithLocalizationModule (copy), RoactModule (copy), CryoModule (copy)
	return WithLocalizationModule({ localizedText = p1.Text })(function(p2)
		-- upvalues: RoactModule (upval), CryoModule (upval), p1 (copy)
		return RoactModule.createElement("TextLabel", CryoModule.Dictionary.join(p1, { Text = p2.localizedText }))
	end)
end else RoactLocalizationModule.connect({ "Text" })("TextLabel")