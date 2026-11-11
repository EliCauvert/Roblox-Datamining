local CorePackages = game:GetService("CorePackages")
local DashModule = require(CorePackages.Packages.Dash)
local TModule = require(CorePackages.Packages.t)
local RoactModule = require(CorePackages.Packages.Roact)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local UtilityActionIcon = UIBloxModule.App.Button.UtilityActionIcon
local FoundationModule = require(CorePackages.Packages.Foundation)
local RoactAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy
local FFlagEnableHeaderBarButtonsUpdate = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableHeaderBarButtonsUpdate
local IconsCommonSearch = UIBloxModule.App.ImageSet.Images["icons/common/search"]
local SearchButton = RoactModule.PureComponent:extend("SearchButton")
SearchButton.validateProps = TModule.strictInterface({
	formFactor = TModule.string,
	isCompactView = TModule.boolean,
	isSearching = TModule.boolean,
	isSecondary = TModule.optional(TModule.boolean),
	setVisible = DashModule.isCallable,
	cancelSearch = DashModule.isCallable,
	activateSearch = DashModule.isCallable,
	buttonRef = TModule.optional(TModule.table),
	enableSearch = TModule.boolean
})

local function _(p1)
	return p1.enableSearch and p1.isCompactView
end

function SearchButton.updateVisibility(p1, IsCompactView)
	local Props = p1.props
	local IsCompactView1 = Props.enableSearch and Props.isCompactView
	
	if IsCompactView1 ~= IsCompactView then
		p1.props.setVisible(IsCompactView1)
	end
end

function SearchButton.didMount(p1)
	p1:updateVisibility(nil)
end

function SearchButton.didUpdate(p1, p2, _)
	p1:updateVisibility(p2.enableSearch and p2.isCompactView)
end

function SearchButton.render(p1)
	-- upvalues: FFlagEnableHeaderBarButtonsUpdate (copy), RoactModule (copy), FoundationModule (copy), UtilityActionIcon (copy), IconsCommonSearch (copy)
	return if FFlagEnableHeaderBarButtonsUpdate then RoactModule.createElement(FoundationModule.IconButton, {
		isCircular = true,
		icon = FoundationModule.Enums.IconName.MagnifyingGlass,
		onActivated = p1.props.activateSearch,
		ref = p1.props.buttonRef
	}) else RoactModule.createElement(UtilityActionIcon, {
		icon = IconsCommonSearch,
		onActivated = p1.props.activateSearch,
		ref = p1.props.buttonRef
	})
end

return (RoactAppPolicy.connect(function(p1, _)
	return { enableSearch = p1.getSearchBar() }
end)(SearchButton))