local Parent = script.Parent.Parent.Parent.Parent
local DependenciesModule = require(Parent.dependencies)
local T = DependenciesModule.t
local Roact = DependenciesModule.Roact
local UIBlox = DependenciesModule.UIBlox
local WithLocalizationFunction = DependenciesModule.withLocalization
local FullPageModal = UIBlox.App.Dialog.Modal.FullPageModal
local WithStyleFunction = UIBlox.Style.withStyle
local TextKeysModule = require(Parent.Common.TextKeys)
local ContactsGlimmerModule = require(Parent.ContactsList.Components.ContactsGlimmer)
local ContactsListLoadingView = Roact.PureComponent:extend("ContactsListLoadingView")
ContactsListLoadingView.validateProps = T.strictInterface({ screenSize = T.Vector2 })

function ContactsListLoadingView.render(p1) --[[ Line: 29 ]]
	-- upvalues: WithLocalizationFunction (copy), TextKeysModule (copy), WithStyleFunction (copy), Roact (copy), FullPageModal (copy), ContactsGlimmerModule (copy)
	local ScreenSize = p1.props.screenSize
	
	return WithLocalizationFunction({ titleText = TextKeysModule.CONTACTS_LIST_TITLE })(function(p2) --[[ Line: 34 ]]
		-- upvalues: WithStyleFunction (upval), Roact (upval), FullPageModal (upval), ScreenSize (copy), ContactsGlimmerModule (upval)
		return WithStyleFunction(function(_) --[[ Line: 35 ]]
			-- upvalues: Roact (upval), FullPageModal (upval), p2 (copy), ScreenSize (upval), ContactsGlimmerModule (upval)
			return Roact.createElement(FullPageModal, { title = p2.titleText, screenSize = ScreenSize }, {
				LoadingViewContainer = Roact.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					AutomaticSize = Enum.AutomaticSize.Y,
					Size = UDim2.new(1, 0, 1, 0)
				}, {
					UIListLayout = Roact.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Vertical,
						SortOrder = Enum.SortOrder.LayoutOrder,
						Padding = UDim.new(0, 12),
						HorizontalAlignment = Enum.HorizontalAlignment.Left
					}),
					UIPadding = Roact.createElement("UIPadding", {
						PaddingTop = UDim.new(0, 24),
						PaddingBottom = UDim.new(0, 36)
					}),
					Glimmer1 = Roact.createElement(ContactsGlimmerModule, { layoutOrder = 1 }),
					Glimmer2 = Roact.createElement(ContactsGlimmerModule, { layoutOrder = 2 }),
					Glimmer3 = Roact.createElement(ContactsGlimmerModule, { layoutOrder = 3 })
				})
			})
		end)
	end)
end

return ContactsListLoadingView