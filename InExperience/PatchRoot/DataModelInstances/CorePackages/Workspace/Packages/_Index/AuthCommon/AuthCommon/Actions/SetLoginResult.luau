return require(script:FindFirstAncestor("AuthCommon").Parent.Rodux).makeActionCreator(script.Name, function(p0)
	return { loginResult = p0 }
end)