local parent = script.Parent.Parent

return require(game:GetService("CorePackages").Packages.Rodux).createReducer({ overlay = nil, overlayProps = {} }, {
	[require(parent.Actions.OpenOverlay).name] = function(_, p0)
		return { overlay = p0.overlay, overlayProps = p0.overlayProps }
	end,
	[require(parent.Actions.CloseOverlay).name] = function(_, _)
		return { overlay = nil, overlayProps = {} }
	end
})