return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(ToastTitle, ToastSubtitle)
	return { toastTitle = ToastTitle, toastSubtitle = ToastSubtitle }
end)