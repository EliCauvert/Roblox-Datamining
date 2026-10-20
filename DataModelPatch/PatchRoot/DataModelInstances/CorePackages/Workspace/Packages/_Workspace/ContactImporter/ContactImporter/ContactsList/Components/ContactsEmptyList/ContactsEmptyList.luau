local Parent = script.Parent.Parent.Parent.Parent
local DependenciesModule = require(Parent.dependencies)
local Roact = DependenciesModule.Roact
local WithLocalizationFunction = DependenciesModule.withLocalization
local Images = DependenciesModule.UIBlox.App.ImageSet.Images
local ContactsInformationModalModule = require(Parent.ContactsList.Components.ContactsInformationModal)
local ContactsEmptyList = Roact.PureComponent:extend("ContactsEmptyList")
ContactsEmptyList.defaultProps = {
	errorTextKey = require(Parent.Common.TextKeys).EMPTY_STATE
}

function ContactsEmptyList.render(p1)
	-- upvalues: WithLocalizationFunction (copy), Roact (copy), ContactsInformationModalModule (copy), Images (copy)
	local Props = p1.props
	
	return WithLocalizationFunction({ emptyState = Props.errorTextKey })(function(p2)
		-- upvalues: Roact (upval), ContactsInformationModalModule (upval), Images (upval), Props (copy)
		return Roact.createElement(ContactsInformationModalModule, {
			image = Images["icons/status/oof_xlarge"],
			layoutOrder = Props.layoutOrder,
			text = p2.emptyState
		})
	end)
end

return ContactsEmptyList