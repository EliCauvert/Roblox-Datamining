return require(script:FindFirstAncestor("AppChat").Parent.Rodux).makeActionCreator(script.Name, function(RequestId)
	return { requestId = RequestId }
end)