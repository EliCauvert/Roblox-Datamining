return require(script.Parent.Parent.Action)(script.Name, function(IsClientView)
	return { isClientView = IsClientView }
end)