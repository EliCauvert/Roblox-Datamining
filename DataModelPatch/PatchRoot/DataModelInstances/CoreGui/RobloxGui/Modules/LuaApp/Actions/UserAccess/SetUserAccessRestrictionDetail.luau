return require(game:GetService("CoreGui").RobloxGui.Modules.Common.Action)(script.Name, function(RestrictionDetail)
	return { restrictionDetail = RestrictionDetail }
end)