local AppFontsModule = {}
AppFontsModule.__index = AppFontsModule

function AppFontsModule.new(_enableNewFont)
	-- upvalues: AppFontsModule (copy)
	local config = { _enableNewFont = _enableNewFont }
	setmetatable(config, AppFontsModule)
	
	return config
end

function AppFontsModule.getDefault(p1)
	return if p1._enableNewFont then Enum.Font.BuilderSans else Enum.Font.Gotham
end

function AppFontsModule.getMedium(p1)
	return if p1._enableNewFont then Enum.Font.BuilderSansMedium else Enum.Font.GothamMedium
end

function AppFontsModule.getBlack(p1)
	return if p1._enableNewFont then Enum.Font.BuilderSansExtraBold else Enum.Font.GothamBlack
end

function AppFontsModule.getBold(p1)
	return if p1._enableNewFont then Enum.Font.BuilderSansBold else Enum.Font.GothamBold
end

function AppFontsModule.getSemibold(p1)
	return if p1._enableNewFont then Enum.Font.BuilderSansMedium else Enum.Font.GothamMedium
end

AppFontsModule.default = AppFontsModule.new(true)

return AppFontsModule