return require(script:FindFirstAncestor("SocialChatToast").Parent.Rodux).makeActionCreator(script.Name, function(Toast)
	return { toast = Toast }
end)