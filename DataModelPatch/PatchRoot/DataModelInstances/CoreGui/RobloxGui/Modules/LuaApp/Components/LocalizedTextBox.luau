local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactModule = require(CorePackages.Packages.Roact)
local RoactLocalizationModule = require(Modules.LuaApp.Services.RoactLocalization)
local WithLocalizationModule = require(Modules.LuaApp.withLocalization)

return if require(Modules.LuaApp.Flags.GetFFlagLuaAppUseWithLocalization)() then RoactModule.forwardRef(function(TextBox, p1)
	-- upvalues: WithLocalizationModule (copy), RoactModule (copy), CryoModule (copy)
	return WithLocalizationModule({ localizedText = TextBox.PlaceholderText })(function(p2)
		-- upvalues: RoactModule (upval), CryoModule (upval), TextBox (copy), p1 (copy)
		return RoactModule.createElement("TextBox", CryoModule.Dictionary.join(TextBox, {
			PlaceholderText = p2.localizedText,
			[RoactModule.Ref] = p1
		}))
	end)
end) else RoactLocalizationModule.connect({ "PlaceholderText" })("TextBox")