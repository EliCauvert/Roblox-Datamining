local contactImporter = script:FindFirstAncestor("ContactImporter")
local dependenciesModule = require(contactImporter.dependencies)
local constantsModule = require(contactImporter.Common.Constants)
local getFIntContactImporterUploadContactsMaxModule = require(contactImporter.Flags.getFIntContactImporterUploadContactsMax)
local getFIntContactImporterUploadContactsMinModule = require(contactImporter.Flags.getFIntContactImporterUploadContactsMin)
local deviceContact = dependenciesModule.RoduxContacts.Models.DeviceContact

return function(p0) --[[ line: 12 ]]
	-- upvalues: getFIntContactImporterUploadContactsMaxModule (ref), getFIntContactImporterUploadContactsMinModule (ref), deviceContact (ref), constantsModule (ref)
	local t = {}
	local var6 = getFIntContactImporterUploadContactsMaxModule()
	local var7 = getFIntContactImporterUploadContactsMinModule()
	
	for i, v in pairs(p0.contacts) do
		for i_1, v_1 in pairs(v.phonenumber) do
			if var6 <= #t then break end
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
	
	return if var7 <= tCount then {
		countryCode = p0.countryCode,
		contacts = t,
		contactsCount = tCount,
		source = p0.source
	} elseif tCount < var7 then {
		countryCode = p0.countryCode,
		contacts = {},
		contactsCount = tCount,
		source = p0.source
	} else {
		countryCode = p0.countryCode,
		contacts = t,
		contactsCount = tCount,
		source = p0.source
	}
end