local GetPresetIconSizeModule = require(script.Parent.getPresetIconSize)

return function(p1): string
	-- upvalues: GetPresetIconSizeModule (copy)
	return `<font size='{GetPresetIconSizeModule(p0)}' weight='700' family='rbxasset://LuaPackages/Packages/_Index/BuilderIcons/BuilderIcons/BuilderIcons.json'>lightning-bolt</font>`
end