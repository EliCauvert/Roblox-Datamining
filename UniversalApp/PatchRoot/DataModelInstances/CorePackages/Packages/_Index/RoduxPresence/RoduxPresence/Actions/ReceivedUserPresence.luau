return require(script.Parent.Parent.Parent.Rodux).makeActionCreator(require(script.Parent.ActionDomain) .. script.Name, function(Payload)
	return { payload = Payload }
end)