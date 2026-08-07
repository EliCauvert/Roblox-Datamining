local parent = script.Parent.Parent.Parent.Parent
local dependenciesModule = require(parent.dependencies)
local t = dependenciesModule.t
local roact = dependenciesModule.Roact
local UIBlox = dependenciesModule.UIBlox
local withLocalization = dependenciesModule.withLocalization
local fullPageModal = UIBlox.App.Dialog.Modal.FullPageModal
local withStyle = UIBlox.Style.withStyle
local textKeysModule = require(parent.Common.TextKeys)
local contactsGlimmerModule = require(parent.ContactsList.Components.ContactsGlimmer)
local contactsListLoadingView = roact.PureComponent:extend("ContactsListLoadingView")
contactsListLoadingView.validateProps = t.strictInterface({ screenSize = t.Vector2 })

function contactsListLoadingView.render(p0) --[[ line: 29 ]]
	-- upvalues: withLocalization (ref), textKeysModule (ref), withStyle (ref), roact (ref), fullPageModal (ref), contactsGlimmerModule (ref)
	local screenSize = p0.props.screenSize
	
	return withLocalization({ titleText = textKeysModule.CONTACTS_LIST_TITLE })(function(p1) --[[ line: 34 ]]
		-- upvalues: withStyle (copy), roact (copy), fullPageModal (copy), screenSize (ref), contactsGlimmerModule (copy)
		return withStyle(function(_) --[[ line: 35 ]]
			-- upvalues: roact (copy), fullPageModal (copy), p1 (ref), screenSize (copy), contactsGlimmerModule (copy)
			return roact.createElement(fullPageModal, { title = p1.titleText, screenSize = screenSize }, {
				LoadingViewContainer = roact.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					AutomaticSize = Enum.AutomaticSize.Y,
					Size = UDim2.new(1, 0, 1, 0)
				}, {
					UIListLayout = roact.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Vertical,
						SortOrder = Enum.SortOrder.LayoutOrder,
						Padding = UDim.new(0, 12),
						HorizontalAlignment = Enum.HorizontalAlignment.Left
					}),
					UIPadding = roact.createElement("UIPadding", {
						PaddingTop = UDim.new(0, 24),
						PaddingBottom = UDim.new(0, 36)
					}),
					Glimmer1 = roact.createElement(contactsGlimmerModule, { layoutOrder = 1 }),
					Glimmer2 = roact.createElement(contactsGlimmerModule, { layoutOrder = 2 }),
					Glimmer3 = roact.createElement(contactsGlimmerModule, { layoutOrder = 3 })
				})
			})
		end)
	end)
end

return contactsListLoadingView