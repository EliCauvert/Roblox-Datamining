local Chrome = script:FindFirstAncestor("Chrome")
local CorePackages = game:GetService("CorePackages")
local ConstantsModule = require(Chrome.ChromeShared.Unibar.Constants)
local FoundationModule = require(CorePackages.Packages.Foundation)
local ReactModule = require(CorePackages.Packages.React)
local UseMappedSignalFunction = require(CorePackages.Workspace.Packages.Chrome).Hooks.useMappedSignal
local UsePartyIconModule = require(Chrome.Integrations.Party.usePartyIcon)
local MappedSignal = require(Chrome.ChromeShared.Service.ChromeUtils).MappedSignal
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UnibarStyle = require(CorePackages.Workspace.Packages.Chrome).UnibarStyle
local SubMenuContextModule = require(Chrome.ChromeShared.Unibar.SubMenuContext)
local InExperienceAppChatModalModule = require(CorePackages.Workspace.Packages.AppChat.InExperienceAppChatModal)
local FFlagTokenizeUnibarConstantsWithStyleProvider = require(Chrome.ChromeShared.Flags).FFlagTokenizeUnibarConstantsWithStyleProvider

return function()
	-- upvalues: UseTokensFunction (copy), FFlagTokenizeUnibarConstantsWithStyleProvider (copy), UnibarStyle (copy), ConstantsModule (copy), MappedSignal (copy), InExperienceAppChatModalModule (copy), UseMappedSignalFunction (copy), UsePartyIconModule (copy), ReactModule (copy), SubMenuContextModule (copy), FoundationModule (copy)
	local UseTokensResult = UseTokensFunction()
	local ICONSIZE = if FFlagTokenizeUnibarConstantsWithStyleProvider then UnibarStyle.use().ICON_SIZE else ConstantsModule.ICON_SIZE
	local UsePartyIconModuleResult = UsePartyIconModule(ICONSIZE, 24, if UseMappedSignalFunction((MappedSignal.new(InExperienceAppChatModalModule.default.visibilitySignal.Event, function(_)
		-- upvalues: InExperienceAppChatModalModule (upval)
		return InExperienceAppChatModalModule:getVisible()
	end))) then "icons/menu/2-person-with-bubble-on" else "icons/menu/2-person-with-bubble")
	local UseContextResult = ReactModule.useContext(SubMenuContextModule)
	
	local function _(p1)
		-- upvalues: UseContextResult (copy)
		return if UseContextResult then UseContextResult:map(function(p2: number): number
			-- upvalues: p1 (copy)
			return p1 + (1 - p1) * (1 - p2)
		end) else p1
	end
	
	local CreateElementFunction1 = ReactModule.createElement
	local View = FoundationModule.View
	local config = { Size = UDim2.new(0, ICONSIZE, 0, ICONSIZE) }
	local t = {}
	local CreateElementFunction = ReactModule.createElement
	local Image = FoundationModule.Image
	local config1 = {
		tag = "anchor-center-center position-center-center radius-circle",
		Size = UsePartyIconModuleResult.size:map(function(XOffset): UDim2
			return UDim2.fromOffset(XOffset, XOffset)
		end)
	}
	local None = nil
	
	if UsePartyIconModuleResult.image.backgroundColor then
		None = { Color3 = UsePartyIconModuleResult.image.backgroundColor }
		local MapResult = nil
		
		if UseContextResult then
			local v1 = 0
			MapResult = UseContextResult:map(function(p1: number): number
				-- upvalues: v1 (copy)
				return v1 + (1 - v1) * (1 - p1)
			end)
		else
			MapResult = 0
		end
		None.Transparency = MapResult
	else
		None = UseTokensResult.Color.None
	end
	config1.backgroundStyle = None
	config1.Image = UsePartyIconModuleResult.image.thumbnail
	local Transparency = UseTokensResult.Color.Content.Emphasis.Transparency
	config1.imageStyle = {
		Color3 = UseTokensResult.Color.Content.Emphasis.Color3,
		Transparency = if UseContextResult then UseContextResult:map(function(p1: number): number
			-- upvalues: Transparency (copy)
			return Transparency + (1 - Transparency) * (1 - p1)
		end) else Transparency
	}
	t.Icon = CreateElementFunction(Image, config1)
	local Transparency1 = UseTokensResult.Color.System.Success.Transparency
	local BackgroundStyle = {
		Color3 = UseTokensResult.Color.System.Success.Color3,
		Transparency = if UseContextResult then UseContextResult:map(function(p1: number): number
			-- upvalues: Transparency1 (copy)
			return Transparency1 + (1 - Transparency1) * (1 - p1)
		end) else Transparency1
	}
	local Transparency2 = UseTokensResult.Color.Surface.Surface_0.Transparency
	t.Badge = ReactModule.createElement(FoundationModule.View, {
		tag = "anchor-top-right radius-circle size-200 stroke-thicker",
		ZIndex = 2,
		Position = UDim2.new(1, -UseTokensResult.Stroke.Thicker, 0, UseTokensResult.Stroke.Thicker),
		backgroundStyle = BackgroundStyle,
		stroke = {
			Color = UseTokensResult.Color.Surface.Surface_0.Color3,
			Transparency = if UseContextResult then UseContextResult:map(function(p1: number): number
				-- upvalues: Transparency2 (copy)
				return Transparency2 + (1 - Transparency2) * (1 - p1)
			end) else Transparency2,
			Thickness = UseTokensResult.Stroke.Thicker
		}
	})
	
	return CreateElementFunction1(View, config, t)
end