return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(ToastTitle, ToastSubtitle) --[[ Line: 5 ]]
	return { toastTitle = ToastTitle, toastSubtitle = ToastSubtitle }
end)