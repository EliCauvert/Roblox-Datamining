local parent = script.Parent.Parent.Parent.Parent
local dependenciesModule = require(parent.dependencies)
local roact = dependenciesModule.Roact
local withLocalization = dependenciesModule.withLocalization
local images = dependenciesModule.UIBlox.App.ImageSet.Images
local textKeysModule = require(parent.Common.TextKeys)
local contactsInformationModalModule = require(parent.ContactsList.Components.ContactsInformationModal)
local contactsEmptyList = roact.PureComponent:extend("ContactsEmptyList")
contactsEmptyList.defaultProps = { errorTextKey = textKeysModule.EMPTY_STATE }

function contactsEmptyList.render(p1)
	-- upvalues: withLocalization (ref), roact (ref), contactsInformationModalModule (ref), images (ref)
	local props = p1.props
	
	return withLocalization({ emptyState = props.errorTextKey })(function(p2)
		-- upvalues: roact (copy), contactsInformationModalModule (copy), images (copy), props (ref)
		return roact.createElement(contactsInformationModalModule, {
			image = images["icons/status/oof_xlarge"],
			layoutOrder = props.layoutOrder,
			text = p2.emptyState
		})
	end)
end

return contactsEmptyList