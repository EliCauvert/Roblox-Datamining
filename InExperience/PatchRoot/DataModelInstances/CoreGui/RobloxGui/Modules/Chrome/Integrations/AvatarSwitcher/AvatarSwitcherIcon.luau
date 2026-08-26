local chrome = script:FindFirstAncestor("Chrome")
local corePackagesService = game:GetService("CorePackages")
local reactModule = require(corePackagesService.Packages.React)
local foundationModule = require(corePackagesService.Packages.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
local iconVariant = foundationModule.Enums.IconVariant
local _ = require(chrome.ChromeShared.Service.ChromeUtils)
local useMappedSignal = require(corePackagesService.Workspace.Packages.Chrome).Hooks.useMappedSignal
local subMenuContextModule = require(chrome.ChromeShared.Unibar.SubMenuContext)

return function(p1)
	-- upvalues: useMappedSignal (ref), reactModule (ref), subMenuContextModule (ref), useTokens (ref), foundationModule (ref), iconName (ref), iconSize (ref), iconVariant (ref)
	local var1 = useMappedSignal(p1.isActive)
	local var2 = reactModule.useContext(subMenuContextModule)
	local var3 = useTokens()
	
	return reactModule.createElement(foundationModule.Icon, {
		name = iconName.CirclePerson,
		size = iconSize.Large,
		variant = if var1 then iconVariant.Filled else iconVariant.Regular,
		style = if var2 then var2:map(function(p2)
			-- upvalues: var3 (ref)
			return {
				Color3 = var3.Color.Content.Default.Color3,
				Transparency = math.lerp(1, var3.Color.Content.Default.Transparency, p2)
			}
		end) else var3.Color.Content.Default
	})
end