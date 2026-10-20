return function(p1)
	return if type(p1) == "table" then if p1.itemLicensingInfo == nil then p1.license else p1.itemLicensingInfo else nil
end