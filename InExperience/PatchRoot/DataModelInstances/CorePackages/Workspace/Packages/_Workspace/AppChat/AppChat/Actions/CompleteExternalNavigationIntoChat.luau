return require(script:FindFirstAncestor("AppChat").Parent.Rodux).makeActionCreator(script.Name, function(RequestId) --[[ Line: 6 ]]
	return { requestId = RequestId }
end)