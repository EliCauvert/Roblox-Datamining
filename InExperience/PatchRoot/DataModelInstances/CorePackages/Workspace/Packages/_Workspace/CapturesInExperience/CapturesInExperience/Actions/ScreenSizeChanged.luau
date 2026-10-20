return require(script.Parent.Parent.Parent.Rodux).makeActionCreator(script.Name, function(ScreenSize)
	return { screenSize = ScreenSize }
end)