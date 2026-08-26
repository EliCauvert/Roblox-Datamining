local contactImporterModalInfoModule = require(script.Parent.contactImporterModalInfo)

return function(p1)
	-- upvalues: contactImporterModalInfoModule (ref)
	local appStorageService = p1.appStorageService
	local userid = p1.userid
	
	return if contactImporterModalInfoModule:isUserOptedInLocalStorage(appStorageService, userid) then false else contactImporterModalInfoModule:shouldUserSeeModalPotentiallyAgain(appStorageService, userid)
end