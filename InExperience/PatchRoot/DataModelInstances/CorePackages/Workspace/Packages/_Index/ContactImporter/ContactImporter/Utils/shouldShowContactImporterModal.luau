local contactImporterModalInfoModule = require(script.Parent.contactImporterModalInfo)

return function(p0) --[[ line: 14 ]]
	-- upvalues: contactImporterModalInfoModule (ref)
	local appStorageService = p0.appStorageService
	local userid = p0.userid
	
	return if contactImporterModalInfoModule:isUserOptedInLocalStorage(appStorageService, userid) then false else contactImporterModalInfoModule:shouldUserSeeModalPotentiallyAgain(appStorageService, userid)
end