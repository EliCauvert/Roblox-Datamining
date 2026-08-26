local contactImporter = script:FindFirstAncestor("ContactImporter")
local dependenciesModule = require(contactImporter.dependencies)
local constantsModule = require(contactImporter.Common.Constants)
local getFIntContactImporterUploadContactsMaxModule = require(contactImporter.Flags.getFIntContactImporterUploadContactsMax)
local getFIntContactImporterUploadContactsMinModule = require(contactImporter.Flags.getFIntContactImporterUploadContactsMin)
local deviceContact = dependenciesModule.RoduxContacts.Models.DeviceContact

return function(p1)
	-- upvalues: getFIntContactImporterUploadContactsMaxModule (ref), getFIntContactImporterUploadContactsMinModule (ref), deviceContact (ref), constantsModule (ref)
	local t = {}
	local var1 = getFIntContactImporterUploadContactsMaxModule()
	local var2 = getFIntContactImporterUploadContactsMinModule()
	
	for i, v in pairs(p1.contacts) do
		for i_1, v_1 in pairs(v.phonenumber) do
			if var1 <= #t then break end
			table.insert(t, {
				idAssignedByFE = deviceContact.generateId(v),
				fields = {
					{
						name = constantsModule.LAST_NAME,
						value = if v.lastname == nil then "" else tostring(v.lastname)
					},
					{
						name = constantsModule.FIRST_NAME,
						value = if v.firstname == nil then "" else tostring(v.firstname)
					},
					{
						name = constantsModule.PHONE_NUMBER,
						value = tostring(v_1):gsub("%s+", "")
					}
				}
			})
		end
	end
	local tCount = #t
	
	return if var2 <= tCount then {
		countryCode = p1.countryCode,
		contacts = t,
		contactsCount = tCount,
		source = p1.source
	} elseif tCount < var2 then {
		countryCode = p1.countryCode,
		contacts = {},
		contactsCount = tCount,
		source = p1.source
	} else {
		countryCode = p1.countryCode,
		contacts = t,
		contactsCount = tCount,
		source = p1.source
	}
end