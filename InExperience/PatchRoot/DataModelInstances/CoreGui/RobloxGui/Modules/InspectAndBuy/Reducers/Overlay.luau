local parent = script.Parent.Parent

return require(game:GetService("CorePackages").Packages.Rodux).createReducer({ overlay = nil, overlayProps = {} }, {
	[require(parent.Actions.OpenOverlay).name] = function(_, p1)
		return { overlay = p1.overlay, overlayProps = p1.overlayProps }
	end,
	[require(parent.Actions.CloseOverlay).name] = function(_, _)
		return { overlay = nil, overlayProps = {} }
	end
})