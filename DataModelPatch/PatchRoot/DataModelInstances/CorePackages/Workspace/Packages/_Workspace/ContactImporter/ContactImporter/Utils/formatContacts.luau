local ContactImporter = script:FindFirstAncestor("ContactImporter")
local ConstantsModule = require(ContactImporter.Common.Constants)
local GetFIntContactImporterUploadContactsMaxModule = require(ContactImporter.Flags.getFIntContactImporterUploadContactsMax)
local GetFIntContactImporterUploadContactsMinModule = require(ContactImporter.Flags.getFIntContactImporterUploadContactsMin)
local DeviceContact = require(ContactImporter.dependencies).RoduxContacts.Models.DeviceContact

return function(p1)
	-- upvalues: GetFIntContactImporterUploadContactsMaxModule (copy), GetFIntContactImporterUploadContactsMinModule (copy), DeviceContact (copy), ConstantsModule (copy)
	local Contacts = {}
	local FIntContactImporterUploadContactsMaxModule = GetFIntContactImporterUploadContactsMaxModule()
	local FIntContactImporterUploadContactsMinModule = GetFIntContactImporterUploadContactsMinModule()
	
	for _, contact in pairs(p1.contacts) do
		for _, value in pairs(contact.phonenumber) do
			if FIntContactImporterUploadContactsMaxModule <= #Contacts then break end
			table.insert(Contacts, {
				idAssignedByFE = DeviceContact.generateId(contact),
				fields = {
					{
						name = ConstantsModule.LAST_NAME,
						value = if contact.lastname == nil then "" else tostring(contact.lastname)
					},
					{
						name = ConstantsModule.FIRST_NAME,
						value = if contact.firstname == nil then "" else tostring(contact.firstname)
					},
					{
						name = ConstantsModule.PHONE_NUMBER,
						value = tostring(value):gsub("%s+", "")
					}
				}
			})
		end
	end
	local CountContacts = #Contacts
	
	return if FIntContactImporterUploadContactsMinModule <= CountContacts then {
		countryCode = p1.countryCode,
		contacts = Contacts,
		contactsCount = CountContacts,
		source = p1.source
	} elseif CountContacts < FIntContactImporterUploadContactsMinModule then {
		countryCode = p1.countryCode,
		contacts = {},
		contactsCount = CountContacts,
		source = p1.source
	} else {
		countryCode = p1.countryCode,
		contacts = Contacts,
		contactsCount = CountContacts,
		source = p1.source
	}
end