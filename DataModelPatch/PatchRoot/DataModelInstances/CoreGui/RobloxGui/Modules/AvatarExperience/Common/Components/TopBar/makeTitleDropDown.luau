local CorePackages = game:GetService("CorePackages")
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)
local DashModule = require(CorePackages.Packages.Dash)
local TModule = require(CorePackages.Packages.t)
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local RoactNavigationModule = require(CorePackages.Packages.RoactNavigation)
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local TitleDropDownModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Components.TitleDropDown)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local NavigateWithLockFunction = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Thunks.NavigateWithLock
local StrictInterfaceResult = TModule.strictInterface({
	formFactor = TModule.string,
	isCompactView = TModule.boolean,
	isSearching = TModule.boolean,
	setVisible = DashModule.isCallable,
	cancelSearch = DashModule.isCallable,
	activateSearch = DashModule.isCallable,
	buttonRef = TModule.optional(TModule.table),
	navigateWithLock = TModule.callback,
	navigation = TModule.table
})

return function(Title, OnOverlayClosed)
	-- upvalues: ArgCheckModule (copy), StrictInterfaceResult (copy), WithLocalizationFunction (copy), RoactModule (copy), TitleDropDownModule (copy), AvatarScreen (copy), RoactRoduxModule (copy), NavigateWithLockFunction (copy), RoactNavigationModule (copy)
	return (RoactNavigationModule.withNavigation((RoactRoduxModule.connect(nil, function(Callback)
		-- upvalues: NavigateWithLockFunction (upval)
		return {
			navigateWithLock = function(p1)
				-- upvalues: Callback (copy), NavigateWithLockFunction (upval)
				Callback(NavigateWithLockFunction(p1))
			end
		}
	end)(function(p1)
		-- upvalues: ArgCheckModule (upval), StrictInterfaceResult (upval), WithLocalizationFunction (upval), Title (copy), RoactModule (upval), TitleDropDownModule (upval), AvatarScreen (upval), OnOverlayClosed (copy)
		ArgCheckModule.assert(StrictInterfaceResult(p1))
		
		return WithLocalizationFunction({ title = Title })(function(p2)
			-- upvalues: RoactModule (upval), TitleDropDownModule (upval), p1 (copy), AvatarScreen (upval), OnOverlayClosed (upval)
			return RoactModule.createElement(TitleDropDownModule, {
				Text = p2.title or "",
				onActivated = function()
					-- upvalues: p1 (upval), AvatarScreen (upval), OnOverlayClosed (upval)
					p1.navigateWithLock(function()
						-- upvalues: p1 (upval), AvatarScreen (upval), OnOverlayClosed (upval)
						p1.navigation.navigate(AvatarScreen.AXTransitionContextualMenu, { onOverlayClosed = OnOverlayClosed })
					end)
				end,
				[RoactModule.Ref] = p1.buttonRef
			})
		end)
	end))))
end