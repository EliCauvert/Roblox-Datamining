local SocialContextToasts = script:FindFirstAncestor("SocialContextToasts")
local _ = require(SocialContextToasts.ToastRoot)

return require(SocialContextToasts.Parent.Rodux).makeActionCreator(script.Name, function(ToastContent)
	return { toastContent = ToastContent }
end)