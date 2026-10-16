return function(p1) --[[ Line: 6 | Named "getUIScaleFromTokens" ]]
	return if p1 and p1.Config and p1.Config.UI and p1.Config.UI.Scale then p1.Config.UI.Scale else 1
end