local parent = script.Parent.Parent.Parent.Parent
local dependenciesModule = require(parent.dependencies)
local roact = dependenciesModule.Roact
local withLocalization = dependenciesModule.withLocalization
local images = dependenciesModule.UIBlox.App.ImageSet.Images
local textKeysModule = require(parent.Common.TextKeys)
local contactsInformationModalModule = require(parent.ContactsList.Components.ContactsInformationModal)
local contactsUploadErrorModal = roact.PureComponent:extend("ContactsUploadErrorModal")

function contactsUploadErrorModal.render(_)
	-- upvalues: withLocalization (ref), textKeysModule (ref), roact (ref), contactsInformationModalModule (ref), images (ref)
	return withLocalization({ hasUploadError = textKeysModule.UPLOAD_CONTACTS_FAILURE })(function(p1)
		-- upvalues: roact (copy), contactsInformationModalModule (copy), images (copy)
		return roact.createElement(contactsInformationModalModule, {
			image = images["icons/status/error_large"],
			text = p1.hasUploadError
		})
	end)
end

return contactsUploadErrorModal