return require(script.Parent.Parent.Parent.Rodux).makeActionCreator(require(script.Parent.ActionDomain) .. script.Name, function(p1)
	return { payload = p1 }
end)