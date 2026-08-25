local getPresetIconSizeModule = require(script.Parent.getPresetIconSize)

return function(value)
	-- upvalues: getPresetIconSizeModule (ref)
	return `<font size='{getPresetIconSizeModule(value)}' weight='700' family='rbxasset://LuaPackages/Packages/_Index/BuilderIcons/BuilderIcons/BuilderIcons.json'>lightning-bolt</font>`
end