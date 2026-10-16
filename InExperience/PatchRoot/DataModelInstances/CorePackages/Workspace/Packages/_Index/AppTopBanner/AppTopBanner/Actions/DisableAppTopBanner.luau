return require(script:FindFirstAncestor("AppTopBanner").Parent.Rodux).makeActionCreator(script.Name, function(IsDisabled) --[[ Line: 5 ]]
	return { isDisabled = IsDisabled }
end)