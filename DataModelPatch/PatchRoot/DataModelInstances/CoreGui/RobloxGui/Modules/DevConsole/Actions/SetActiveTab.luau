return require(script.Parent.Parent.Action)("SetActiveTab", function(NewTabIndex, IsClientView)
	return { newTabIndex = NewTabIndex, isClientView = IsClientView }
end)