return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(Overlay, OverlayProps)
	return { overlay = Overlay, overlayProps = OverlayProps }
end)