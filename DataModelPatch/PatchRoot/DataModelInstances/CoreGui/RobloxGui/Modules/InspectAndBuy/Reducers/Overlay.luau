local Parent = script.Parent.Parent

return require(game:GetService("CorePackages").Packages.Rodux).createReducer({ overlay = nil, overlayProps = {} }, {
	[require(Parent.Actions.OpenOverlay).name] = function(_, p1)
		return { overlay = p1.overlay, overlayProps = p1.overlayProps }
	end,
	[require(Parent.Actions.CloseOverlay).name] = function(_, _)
		return { overlay = nil, overlayProps = {} }
	end
})