local socialContextToasts = script:FindFirstAncestor("SocialContextToasts")
local _ = require(socialContextToasts.ToastRoot)

return require(socialContextToasts.Parent.Rodux).makeActionCreator(script.Name, function(p1)
	return { toastContent = p1 }
end)