local parent = script.Parent.Parent

return require(game:GetService("CorePackages").Packages.Rodux).createReducer({ overlay = nil, overlayProps = {} }, {
	[require(parent.Actions.OpenOverlay).name] = function(_, p0) --[[ line: 25 ]]
		return { overlay = p0.overlay, overlayProps = p0.overlayProps }
	end,
	[require(parent.Actions.CloseOverlay).name] = function(_, _) --[[ line: 33 ]]
		return { overlay = nil, overlayProps = {} }
	end
})