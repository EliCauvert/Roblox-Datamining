local SocialContextToasts = script:FindFirstAncestor("SocialContextToasts")
local _ = require(SocialContextToasts.ToastRoot)

return require(SocialContextToasts.Parent.Rodux).makeActionCreator(script.Name, function(ToastContent) --[[ Line: 7 ]]
	return { toastContent = ToastContent }
end)