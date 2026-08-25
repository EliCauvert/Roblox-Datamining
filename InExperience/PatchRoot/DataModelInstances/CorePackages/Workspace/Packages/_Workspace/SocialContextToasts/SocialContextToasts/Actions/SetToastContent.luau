local socialContextToasts = script:FindFirstAncestor("SocialContextToasts")
local _ = require(socialContextToasts.ToastRoot)

return require(socialContextToasts.Parent.Rodux).makeActionCreator(script.Name, function(p0)
	return { toastContent = p0 }
end)