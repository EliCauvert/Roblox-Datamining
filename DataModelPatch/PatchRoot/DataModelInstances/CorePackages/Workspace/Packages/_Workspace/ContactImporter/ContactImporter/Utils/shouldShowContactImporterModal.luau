local ContactImporterModalInfoModule = require(script.Parent.contactImporterModalInfo)

return function(p1)
	-- upvalues: ContactImporterModalInfoModule (copy)
	local AppStorageService = p1.appStorageService
	local Userid = p1.userid
	
	return not ContactImporterModalInfoModule:isUserOptedInLocalStorage(AppStorageService, Userid) and ContactImporterModalInfoModule:shouldUserSeeModalPotentiallyAgain(AppStorageService, Userid)
end