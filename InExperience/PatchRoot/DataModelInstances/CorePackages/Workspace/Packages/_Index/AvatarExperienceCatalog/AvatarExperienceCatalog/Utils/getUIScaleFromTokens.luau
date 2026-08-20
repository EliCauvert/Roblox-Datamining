return function(p0) --[[ line: 6 | named "getUIScaleFromTokens" ]]
	return if p0 and p0.Config and (p0.Config.UI and p0.Config.UI.Scale) then p0.Config.UI.Scale else 1
end