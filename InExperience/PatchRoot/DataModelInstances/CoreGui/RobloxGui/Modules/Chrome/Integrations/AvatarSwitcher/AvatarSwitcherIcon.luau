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

return function(p0)
	-- upvalues: useMappedSignal (ref), reactModule (ref), subMenuContextModule (ref), useTokens (ref), foundationModule (ref), iconName (ref), iconSize (ref), iconVariant (ref)
	local var5 = useMappedSignal(p0.isActive)
	local var6 = reactModule.useContext(subMenuContextModule)
	local var7 = useTokens()
	
	return reactModule.createElement(foundationModule.Icon, {
		name = iconName.CirclePerson,
		size = iconSize.Large,
		variant = if var5 then iconVariant.Filled else iconVariant.Regular,
		style = if var6 then var6:map(function(p1)
			-- upvalues: var7 (ref)
			return {
				Color3 = var7.Color.Content.Default.Color3,
				Transparency = math.lerp(1, var7.Color.Content.Default.Transparency, p1)
			}
		end) else var7.Color.Content.Default
	})
end