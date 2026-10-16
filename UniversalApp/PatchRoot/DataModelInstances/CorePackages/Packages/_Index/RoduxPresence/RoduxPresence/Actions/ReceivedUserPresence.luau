return require(script.Parent.Parent.Parent.Rodux).makeActionCreator(require(script.Parent.ActionDomain) .. script.Name, function(Payload) --[[ Line: 6 ]]
	return { payload = Payload }
end)