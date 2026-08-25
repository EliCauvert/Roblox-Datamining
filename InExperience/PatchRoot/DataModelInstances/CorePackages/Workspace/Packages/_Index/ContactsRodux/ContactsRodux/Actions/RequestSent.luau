return require(script.Parent.Parent.Parent.Rodux).makeActionCreator(require(script.Parent.ActionDomain) .. script.Name, function(p0)
	return { payload = p0 }
end)