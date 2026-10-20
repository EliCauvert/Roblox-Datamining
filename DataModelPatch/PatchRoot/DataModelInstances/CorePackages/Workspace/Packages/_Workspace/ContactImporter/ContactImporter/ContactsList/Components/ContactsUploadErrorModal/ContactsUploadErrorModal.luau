local Parent = script.Parent.Parent.Parent.Parent
local DependenciesModule = require(Parent.dependencies)
local Roact = DependenciesModule.Roact
local WithLocalizationFunction = DependenciesModule.withLocalization
local Images = DependenciesModule.UIBlox.App.ImageSet.Images
local TextKeysModule = require(Parent.Common.TextKeys)
local ContactsInformationModalModule = require(Parent.ContactsList.Components.ContactsInformationModal)
local ContactsUploadErrorModal = Roact.PureComponent:extend("ContactsUploadErrorModal")

function ContactsUploadErrorModal:render()
	-- upvalues: WithLocalizationFunction (copy), TextKeysModule (copy), Roact (copy), ContactsInformationModalModule (copy), Images (copy)
	return WithLocalizationFunction({ hasUploadError = TextKeysModule.UPLOAD_CONTACTS_FAILURE })(function(p1)
		-- upvalues: Roact (upval), ContactsInformationModalModule (upval), Images (upval)
		return Roact.createElement(ContactsInformationModalModule, {
			image = Images["icons/status/error_large"],
			text = p1.hasUploadError
		})
	end)
end

return ContactsUploadErrorModal