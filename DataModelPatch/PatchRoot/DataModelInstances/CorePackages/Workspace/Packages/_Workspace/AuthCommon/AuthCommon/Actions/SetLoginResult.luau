return require(script:FindFirstAncestor("AuthCommon").Parent.Rodux).makeActionCreator(script.Name, function(LoginResult)
	return { loginResult = LoginResult }
end)