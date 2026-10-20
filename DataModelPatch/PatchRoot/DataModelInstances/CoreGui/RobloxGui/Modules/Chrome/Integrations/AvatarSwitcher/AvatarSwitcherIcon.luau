local Chrome = script:FindFirstAncestor("Chrome")
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local FoundationModule = require(CorePackages.Packages.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local IconVariant = FoundationModule.Enums.IconVariant
local _ = require(Chrome.ChromeShared.Service.ChromeUtils)
local UseMappedSignalFunction = require(CorePackages.Workspace.Packages.Chrome).Hooks.useMappedSignal
local SubMenuContextModule = require(Chrome.ChromeShared.Unibar.SubMenuContext)

return function(p1)
	-- upvalues: UseMappedSignalFunction (copy), ReactModule (copy), SubMenuContextModule (copy), UseTokensFunction (copy), FoundationModule (copy), IconName (copy), IconSize (copy), IconVariant (copy)
	local UseMappedSignalResult = UseMappedSignalFunction(p1.isActive)
	local UseContextResult = ReactModule.useContext(SubMenuContextModule)
	local UseTokensResult = UseTokensFunction()
	
	return ReactModule.createElement(FoundationModule.Icon, {
		name = IconName.CirclePerson,
		size = IconSize.Large,
		variant = if UseMappedSignalResult then IconVariant.Filled else IconVariant.Regular,
		style = if UseContextResult then UseContextResult:map(function(Alpha: number)
			-- upvalues: UseTokensResult (copy)
			return {
				Color3 = UseTokensResult.Color.Content.Default.Color3,
				Transparency = math.lerp(1, UseTokensResult.Color.Content.Default.Transparency, Alpha)
			}
		end) else UseTokensResult.Color.Content.Default
	})
end